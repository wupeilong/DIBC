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
	

	@Override
	public ResponseResult<List<Procurement>> selectProcurementList(Integer unitId,Integer status) {
		ResponseResult<List<Procurement>> rr = null;
		try {
			String where = null;
			boolean isAnd = false;
			if(CommonUtil.getSessionUser().getType().equals(2)){//企业只查自家
				where = "n.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'";
				isAnd = true;
			}else{
				if (unitId != null) {
					where = "n.unit_id = '" + unitId + "'";
					isAnd = true;
				}
			}			
			if (status != null) {
				if (isAnd) {
					where += " AND p.status = '" + status + "'";
				}else {
					where = " p.status = '" + status + "'";
				}
			}
			List<Procurement> list = procurementMapper.select(where, " p.purchasing_time DESC", null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！",list);
		} catch (Exception e) {
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作失败！");
		}		
		return rr;
	}

	@Override
	public String selectProcurementListPag(ModelMap modelMap) {	
		try {
			User user = CommonUtil.getSessionUser();
			List<Procurement> procurementList = new ArrayList<>();
			String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(p.purchasing_time)";
			if(user.getType().equals(1)){//市场监管局账户
				iUnitService.addUnitListToModelMap(modelMap);
				procurementList = procurementMapper.select(where, " p.purchasing_time DESC", null, null);
			}else{
				procurementList = procurementMapper.select(where + " AND p.unit_id = '" + user.getUnitId() + "'", " p.purchasing_time DESC", null, null);
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
			User user = (User)SecurityUtils.getSubject().getSession().getAttribute("user");
			Procurement procurement = procurementMapper.queryProcurement(id);
			if(procurement.getStatus().equals(1)){//已验收
				rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
			}
			JSONArray array = JSONArray.parseArray(result);
			JSONArray array2 = null;
			ProcurementDetail update = null;
			boolean qualified = false;
			for(int i=0; i<array.size(); i++){
				array2 = JSONArray.parseArray(array.getString(i));
				update = new ProcurementDetail();
				update.setProcurementDetailId(array2.getInteger(0));
				update.setQualified(array2.getIntValue(1));				
				Integer row = procurementMapper.updateProcurementDetailById(update);		
				System.err.println("ProcurementDetailId：" + array2.getInteger(0) + "  修改条数：" + row);
				if(array2.getIntValue(1) == 0){
					qualified = true;
					logger.info(Constants.SUCCESSU_HEAD_INFO + "采购原材料详情单号:" + array2.getInteger(0) + "  验收不合格！");
				}
			}
			//存在不合格检查项生成不合格信息记录
			if(qualified){
				Unqualified unqualified = new Unqualified();
				unqualified.setUnitId(procurement.getUnitId());
				unqualified.setUnitName(procurement.getUnitName());
				unqualified.setOrderId(procurement.getId().toString());
				unqualified.setType(1);//原材料采购
				unqualified.setCause("原材料验收不合格！");
				unqualified.setStatus(0);
				unqualified.setCreateTime(new Date());
				unqualifiedMapper.insert(unqualified);
				logger.info(Constants.SUCCESSU_HEAD_INFO + "采购单号:" + id + " 原材料验收不合格，生成不合格信息记录！");
			}
			//修改采购订单状态
			procurement.setStatus(1);
			procurement.setAcceptanceUsername(user.getUsername());
			procurement.setAcceptanceTime(new Date());
			procurementMapper.updateProcurementById(procurement);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
		} catch (Exception e) {
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
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
	public ResponseResult<Void> addProcurement(	
												String supplier,
												Integer supplierUnitId, 
												MultipartFile supplierBusinessLicense,
												MultipartFile supplierproductionLicense, 
												MultipartFile supplierQualification, 
												MultipartFile invoice,
												String supplierPerson, 
												String supplierPhone, 
												String detailList) throws ParseException {
		ResponseResult<Void> rr = null;
		User user = CommonUtil.getSessionUser();
		GetCommonUser get = new GetCommonUser();
		String supplierBusinessLicensePath=null;
		String supplierproductionLicensePath=null;
		
		//如果企业id不为空 则企业存在并且存有营业执照和许可证（此时前不会传入两类文件） 查询企业营业执照等信息
		if(supplierUnitId!=null){
			
			List<Unit> supplierUnit = unitMapper.select(" n.unit_id = '" + supplierUnitId + "'", null, null, null);
				
			//存有营业执照
			if( supplierBusinessLicense==null){
				//营业执照路径
				supplierBusinessLicensePath=supplierUnit.get(0).getBusinessLicense();

			}
				
			//存有许可证路径
			if( supplierproductionLicense==null){
				//许可证路径
				supplierproductionLicensePath=supplierUnit.get(0).getProductionLicense();

			}
			
			
		}else{
			//企业id为空 企业不存在  营业执照 许可证通过前端文件获取
			 supplierBusinessLicensePath = get.uoladimg(supplierBusinessLicense,user.getUuid());//营业执照	
			 supplierproductionLicensePath = get.uoladimg(supplierproductionLicense,user.getUuid());//许可证
		}
		//List<Unit> supplierUnit = unitMapper.select(" n.unit_id = '" + supplierUnitId + "'", null, null, null);
		String supplierQualificationPath = null;
		
		//资质证明非必传
		if(supplierQualification != null){
			supplierQualificationPath = get.uoladimg(supplierQualification,user.getUuid());//资质
		}
		String invoicePath = get.uoladimg(invoice,user.getUuid());//发票
		
		/*if(supplierUnit.isEmpty()){
			rr = new ResponseResult<>(ResponseResult.ERROR,"供货商信息不存在，添加采购信息失败！");
		};*/
		if(StringUtils.isEmpty(supplierBusinessLicensePath)){
			rr = new ResponseResult<>(ResponseResult.ERROR,"营业执照上传失败，添加采购信息失败！");
		}else if(StringUtils.isEmpty(invoicePath)){
			rr = new ResponseResult<>(ResponseResult.ERROR,"发票上传失败，添加采购信息失败！");
		}else if (StringUtils.isEmpty(detailList)) {
			rr = new ResponseResult<>(ResponseResult.ERROR,"未添加采购详情，添加采购信息失败！");
		}else {
			//上传采购信息
			Procurement procurement = new Procurement();
			procurement.setUnitId(user.getUnitId());
			procurement.setUserId(user.getId());
			procurement.setUnitName(user.getUnitName());			
			//procurement.setSupplier(supplierUnit.get(0).getUnitName());
			procurement.setSupplier(supplier);
			procurement.setSupplierBusinessLicense(supplierBusinessLicensePath);
			procurement.setSupplierProductionLicense(supplierproductionLicensePath);
			procurement.setSupplierQualification(supplierQualificationPath);
			procurement.setInvoice(invoicePath);
			procurement.setSupplierPerson(supplierPerson);
			procurement.setSupplierPhone(supplierPhone);
			procurement.setPurchasingTime(new Date());
			procurement.setStatus(0);
			Integer row = procurementMapper.insertProcurement(procurement);
			System.out.println("新增采购信息【单号：" + procurement.getId() + " " + row + "条】");
			ProcurementDetail procurementDetail = null;
			Date productionDate = null;
			JSONArray parseArray = JSONArray.parseArray(detailList);
			JSONArray array = null;
			for(int i=0; i<parseArray.size(); i++){
				array = JSONArray.parseArray(parseArray.getString(i));
				productionDate  = DateUtil.dateParse(array.getString(2), DateUtil.DATE_PATTERN);
				procurementDetail = new ProcurementDetail();
				procurementDetail.setProcurementId(procurement.getId());
				procurementDetail.setProductName(array.getString(0));
				procurementDetail.setCount(array.getString(1));
				procurementDetail.setProductionDate(productionDate);
				row = procurementMapper.insertProcurementDetail(procurementDetail);
				System.out.println("新增采购详情信息【单号：" + procurementDetail.getProcurementDetailId() + " " + row + "条】");
			}
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
		}
		return rr;
	}
}
