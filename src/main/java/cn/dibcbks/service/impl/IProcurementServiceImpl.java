package cn.dibcbks.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSONArray;
import cn.dibcbks.entity.Procurement;
import cn.dibcbks.entity.ProcurementDetail;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.entity.Unqualified;
import cn.dibcbks.entity.User;
import cn.dibcbks.exception.MyRuntimeException;
import cn.dibcbks.exception.TXruntimeException;
import cn.dibcbks.mapper.ProcurementMapper;
import cn.dibcbks.mapper.UnitMapper;
import cn.dibcbks.mapper.UnqualifiedMapper;
import cn.dibcbks.service.IProcurementService;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.DateUtil;
import cn.dibcbks.util.GetCommonUser;
import cn.dibcbks.util.ResponseResult;

@Service
public class IProcurementServiceImpl implements IProcurementService {
	private static final Logger logger = LogManager.getLogger(IProcurementServiceImpl.class.getName());
	@Autowired
	private ProcurementMapper procurementMapper;
	@Autowired
	private UnitMapper unitMapper;
	@Autowired
	private IUnitService iUnitService;
	@Autowired
	private UnqualifiedMapper unqualifiedMapper;
	@Autowired
	private IDepartmentServiceImpl iDepartmentServiceImpl;

	@Override
	public ResponseResult<List<Procurement>> selectProcurementList(Integer unitId, Integer status) {
		ResponseResult<List<Procurement>> rr = null;
		try {
			String where = null;
			boolean isAnd = false;
			if (CommonUtil.getSessionUser().getType().equals(2)) {// 企业只查自家
				where = "n.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'";
				isAnd = true;
			} else {
				if (unitId != null) {
					where = "n.unit_id = '" + unitId + "'";
					isAnd = true;
				}
			}
			if (status != null) {
				if (isAnd) {
					where += " AND p.status = '" + status + "'";
				} else {
					where = " p.status = '" + status + "'";
				}
			}
			List<Procurement> list = procurementMapper.select(where, " p.purchasing_time DESC", null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS, "操作成功！", list);
		} catch (Exception e) {
			rr = new ResponseResult<>(ResponseResult.SUCCESS, "操作失败！");
		}
		return rr;
	}

	@Override
	public String selectProcurementListPag(ModelMap modelMap) {
		try {
			User user = CommonUtil.getSessionUser();
			List<Procurement> procurementList = new ArrayList<>();
			String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(p.purchasing_time)";
			if (user.getType().equals(1)) {// 市场监管局账户
				iUnitService.addUnitListToModelMap(modelMap);
				procurementList = procurementMapper.select(where, " p.purchasing_time DESC", null, null);
			} else {
				procurementList = procurementMapper.select(where + " AND p.unit_id = '" + user.getUnitId() + "'",
						" p.purchasing_time DESC", null, null);
			}
			modelMap.addAttribute("procurementList", procurementList);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户进入采购报送列表页成功！");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户进入采购报送列表页失败！");
		}
		return "bks_wap/buy_list";
	}

	@Override
	public String selectProcurementDetailPag(ModelMap modelMap, Integer id) {

		modelMap.addAttribute("procurementDetail", procurementMapper.queryProcurement(id));
		return "bks_wap/buy_detal";
	}

	@Override
	@Transactional
	public ResponseResult<Void> acceptanceProcurementList(String result, Integer id) {
		ResponseResult<Void> rr = null;
		try {
			User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
			Procurement procurement = procurementMapper.queryProcurement(id);
			if (procurement.getStatus().equals(1)) {// 已验收
				rr = new ResponseResult<>(ResponseResult.ERROR, "操作失败！");
			}
			JSONArray array = JSONArray.parseArray(result);
			JSONArray array2 = null;
			ProcurementDetail update = null;
			boolean qualified = false;
			for (int i = 0; i < array.size(); i++) {
				array2 = JSONArray.parseArray(array.getString(i));
				update = new ProcurementDetail();
				update.setProcurementDetailId(array2.getInteger(0));
				update.setQualified(array2.getIntValue(1));
				Integer row = procurementMapper.updateProcurementDetailById(update);
				System.err.println("ProcurementDetailId：" + array2.getInteger(0) + "  修改条数：" + row);
				if (array2.getIntValue(1) == 0) {
					qualified = true;
					logger.info(Constants.SUCCESSU_HEAD_INFO + "采购原材料详情单号:" + array2.getInteger(0) + "  验收不合格！");
				}
			}
			// 存在不合格检查项生成不合格信息记录
			if (qualified) {
				Unqualified unqualified = new Unqualified();
				unqualified.setUnitId(procurement.getUnitId());
				unqualified.setUnitName(procurement.getUnitName());
				unqualified.setOrderId(procurement.getId().toString());
				unqualified.setType(1);// 原材料采购
				unqualified.setCause("原材料验收不合格！");
				unqualified.setStatus(0);
				unqualified.setCreateTime(new Date());
				unqualifiedMapper.insert(unqualified);
				logger.info(Constants.SUCCESSU_HEAD_INFO + "采购单号:" + id + " 原材料验收不合格，生成不合格信息记录！");
			}
			// 修改采购订单状态
			procurement.setStatus(1);
			procurement.setAcceptanceUsername(user.getUsername());
			procurement.setAcceptanceTime(new Date());
			procurementMapper.updateProcurementById(procurement);
			rr = new ResponseResult<>(ResponseResult.SUCCESS, "操作成功！");
		} catch (Exception e) {
			rr = new ResponseResult<>(ResponseResult.ERROR, "操作失败！");
		}
		return rr;
	}

	@Override
	public String addProcurementPag(ModelMap modelMap) {
		List<Unit> unitList = unitMapper.select(" n.unit_type BETWEEN 2 AND 4", " n.create_time DESC", null, null);
		modelMap.addAttribute("unitList", unitList);
		return "bks_wap/buy_add";
	}

	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public ResponseResult<Void> addProcurement(	String supplier, Integer supplierUnitId,
												MultipartFile supplierBusinessLicense, MultipartFile supplierproductionLicense,
												MultipartFile supplierQualification, MultipartFile invoice, String supplierPerson, String supplierPhone,
												String detailList) {
//		User user = CommonUtil.getSessionUser();
//		GetCommonUser get = new GetCommonUser();
//		String supplierBusinessLicensePath = null; //营业执照图片
//		String supplierproductionLicensePath = null;//许可证图片
//		String supplierQualificationPath = null;//检验合格报告
//		String invoicePath = null;//发票
//		Unit unit = new Unit();		
//		try {
//			if (supplierBusinessLicense != null) { //营业执照图片
//				supplierBusinessLicensePath = get.uoladimg(supplierBusinessLicense, user.getUuid());							
//			}
//			if (supplierproductionLicense != null) { //许可证图片
//				supplierproductionLicensePath = get.uoladimg(supplierproductionLicense, user.getUuid());// 许可证					
//			}			
//			if (supplierQualification != null) { //检验合格报告
//				supplierQualificationPath = get.uoladimg(supplierQualification, user.getUuid());				
//			}				
//			if (invoice != null) {//上传发票
//				invoicePath = get.uoladimg(invoice, user.getUuid());
//			}
//			if (supplierUnitId != null) { //供应商存在
//				logger.info("供应商存在============================");
//				List<Unit> unitList = unitMapper.select(" n.unit_id = '" + supplierUnitId + "'", null, null, null);
//				if (!unitList.isEmpty()) {
//					unit = unitList.get(0);
//					boolean update = false;
//					if(StringUtils.isEmpty(supplierBusinessLicensePath)){ //未上传营业执照图片
//						supplierBusinessLicensePath = unit.getBusinessLicense();
//					}else{
//						unit.setBusinessLicense(supplierBusinessLicensePath);//已上传营业执照图片
//						update = true;
//					}
//					if(StringUtils.isEmpty(supplierproductionLicensePath)){ //未上传许可证图片			
//						supplierproductionLicensePath = unit.getProductionLicense();					
//					}else{
//						unit.setProductionLicense(supplierproductionLicensePath);//已上传许可证图片
//						update = true;
//					}
//					if (update) {
//						unitMapper.updateById(unit);//更新供应商信息
//					}							
//				}else {
//					return new ResponseResult<>(ResponseResult.ERROR, "供应商信息异常！");
//				}			
//			} else {//供应商不存在
//				logger.info("新增供应商============================");
//				unit.setUnitName(supplier);//供应商名字
//				unit.setBusinessLicense(supplierBusinessLicensePath);//供应商营业执照
//				unit.setProductionLicense(supplierproductionLicensePath);//供应商
//				unit.setUnitType(4);//企业类型：1-监管局 -2学校 3-餐饮业 4-其他
//				unit.setLegalPerson(supplierPerson);//法人默认为联系人
//				unit.setCreateTime(new Date());
//				unitMapper.insert(unit);
//				// 添加部门信息					
//				iDepartmentServiceImpl.addUnitDepartment(unit);
//			}
//			// 上传采购信息		
//			Procurement procurement = new Procurement();
//			procurement.setUnitId(user.getUnitId());
//			procurement.setUserId(user.getId());
//			procurement.setUnitName(user.getUnitName());
//			// procurement.setSupplier(unit.getUnitName());
//			procurement.setSupplier(supplier);
//			procurement.setSupplierBusinessLicense(supplierBusinessLicensePath);
//			procurement.setSupplierProductionLicense(supplierproductionLicensePath);
//			procurement.setSupplierQualification(supplierQualificationPath);
//			procurement.setInvoice(invoicePath);
//			procurement.setSupplierPerson(supplierPerson);
//			procurement.setSupplierPhone(supplierPhone);
//			procurement.setPurchasingTime(new Date());
//			procurement.setStatus(0);
//			Integer row = procurementMapper.insertProcurement(procurement);
//			logger.info("新增采购信息【单号：" + procurement.getId() + " " + row + "条】");
//			//增加采购详情
//			ProcurementDetail procurementDetail = null;
//			Date productionDate = null;
//			JSONArray parseArray = JSONArray.parseArray(detailList);
//			JSONArray array = null;
//			for (int i = 0; i < parseArray.size(); i++) {
//				array = JSONArray.parseArray(parseArray.getString(i));
//				productionDate = DateUtil.dateParse(array.getString(2), DateUtil.DATE_PATTERN);
//				procurementDetail = new ProcurementDetail();
//				procurementDetail.setProcurementId(procurement.getId());
//				procurementDetail.setProductName(array.getString(0));
//				procurementDetail.setCount(array.getString(1));
//				procurementDetail.setProductionDate(productionDate);
//				row = procurementMapper.insertProcurementDetail(procurementDetail);
//				logger.info("新增采购详情信息【单号：" + procurementDetail.getProcurementDetailId() + " " + row + "条】");
//			}
//
//			return new ResponseResult<>(ResponseResult.SUCCESS, "操作成功！");
//		} catch (Exception e) {
//			//get.deluoladimg(supplierBusinessLicensePath);
//			//get.deluoladimg(supplierproductionLicensePath);
//			get.deluoladimg(supplierQualificationPath);
//			get.deluoladimg(invoicePath);
//			e.printStackTrace();
//			logger.info("操作失败！错误信息:"+e.getMessage());
//			throw new TXruntimeException("操作失败",e.getMessage());
//		}

		System.out.println("营业执照：="+supplierBusinessLicense+"许可证：="
				+supplierproductionLicense+"资质报告=："+supplierproductionLicense+"法票="+invoice);
			
		ResponseResult<Void> rr = null;
		User user = CommonUtil.getSessionUser();
		GetCommonUser get = new GetCommonUser();
		String supplierBusinessLicensePath = null;
		String supplierproductionLicensePath = null;
		String supplierQualificationPath = null;
		Unit u = new Unit();
		List<Unit> supplierUnit=null;
		String invoicePath =null;
		try {
			
			//企业存在
			if (supplierUnitId != null) {
				logger.info("处理已有企业============================");
				supplierUnit = unitMapper.select(" n.unit_id = '" + supplierUnitId + "'", null, null, null);
				//该企业没上传证件则从企业信息中取
				if(supplierBusinessLicense==null){
					
					supplierBusinessLicensePath=supplierUnit.get(0).getBusinessLicense();
				}
				if(supplierproductionLicense==null){
					
					supplierproductionLicensePath=supplierUnit.get(0).getProductionLicense();
					
				}
				/*if(supplierQualification==null){
					
					supplierQualificationPath=supplierUnit.get(0).getQualificationPath();
				}*/
	
			
			}
				//保存并上传最新营业执照
			if (supplierBusinessLicense != null) {
				supplierBusinessLicensePath = get.uoladimg(supplierBusinessLicense, user.getUuid());
				
					// 保存证件
				if(supplierUnitId!=null){
					u.setUnitId(supplierUnitId);
					u.setBusinessLicense(supplierBusinessLicensePath);
					unitMapper.updateById(u);
				}
					
				} 
			//上传许可证
			if(supplierproductionLicense != null){
				supplierproductionLicensePath = get.uoladimg(supplierproductionLicense, user.getUuid());// 许可证
				if(supplierUnitId!=null){
					u.setUnitId(supplierUnitId);
					u.setProductionLicense(supplierproductionLicensePath);
					unitMapper.updateById(u);
				}
				
			
			}
			// 检验合格报告
			if (supplierQualification != null) {
				supplierQualificationPath = get.uoladimg(supplierQualification, user.getUuid());
				/*if(supplierUnitId!=null){
					u.setUnitId(supplierUnitId);
					u.setQualificationPath(supplierQualificationPath);
					unitMapper.updateById(u);
				}*/
			}
			//上传发票	
			if(invoice!=null){
				invoicePath=get.uoladimg(invoice, user.getUuid());// 发票
			}
			
			if (supplierUnitId == null) {
				logger.info("新增企业============================");
					u.setBusinessLicense(supplierBusinessLicensePath);
					u.setCreateTime(new Date());
					u.setLegalPerson(supplierPerson);
					u.setProductionLicense(supplierproductionLicensePath);
					u.setUnitName(supplier);
					u.setUnitType(4);
					/*u.setQualification(supplierQualificationPath);*/

					// 添加企业信息 默认企业类型为4

					unitMapper.insert(u);

					// 添加部门信息
					
					iDepartmentServiceImpl.addUnitDepartment(u);
				}
				// 上传采购信息
				Procurement procurement = new Procurement();
				procurement.setUnitId(user.getUnitId());
				procurement.setUserId(user.getId());
				procurement.setUnitName(user.getUnitName());
				// procurement.setSupplier(supplierUnit.get(0).getUnitName());
				procurement.setSupplier(supplier);
				procurement.setSupplierBusinessLicense(supplierBusinessLicensePath);
				procurement.setSupplierProductionLicense(supplierproductionLicensePath);
				procurement.setSupplierQualification(supplierQualificationPath);
				procurement.setInvoice(invoicePath);
				procurement.setSupplierPerson(supplierPerson);
				procurement.setSupplierPhone(supplierPhone);
				procurement.setPurchasingTime(new Date());
				procurement.setStatus(0);
				Integer row = null;

				row = procurementMapper.insertProcurement(procurement);
				logger.info("新增采购信息【单号：" + procurement.getId() + " " + row + "条】");
				//增加采购详情
				ProcurementDetail procurementDetail = null;
				Date productionDate = null;
				JSONArray parseArray = JSONArray.parseArray(detailList);
				JSONArray array = null;
				for (int i = 0; i < parseArray.size(); i++) {
					array = JSONArray.parseArray(parseArray.getString(i));
					productionDate = DateUtil.dateParse(array.getString(2), DateUtil.DATE_PATTERN);
					procurementDetail = new ProcurementDetail();
					procurementDetail.setProcurementId(procurement.getId());
					procurementDetail.setProductName(array.getString(0));
					procurementDetail.setCount(array.getString(1));
					procurementDetail.setProductionDate(productionDate);
					row = procurementMapper.insertProcurementDetail(procurementDetail);
					logger.info("新增采购详情信息【单号：" + procurementDetail.getProcurementDetailId() + " " + row + "条】");
				}
				
				rr=new ResponseResult<>(ResponseResult.SUCCESS, "操作成功！");
				return rr;
				
				
				
		} catch (Exception e) {
			
			e.printStackTrace();
			logger.info("操作失败！错误信息:"+e.getMessage());
			throw new TXruntimeException("操作失败",e.getMessage());
				
				
		}
	}

	/**
	 * 添加企业信息
	 */
	public void UnitIncrease(Integer unitId, String unitName, String legalPerson, String businessLicenseCode,
			String businessLicense, String productionLicense, String unitAddress, String expirationDate,
			Integer unitType, Date createTime) {

		Unit unit = new Unit(unitId, unitName, legalPerson, businessLicenseCode, businessLicense, productionLicense,
				unitAddress, expirationDate, unitType, null,createTime);

		unitMapper.insert(unit);
	}
}
