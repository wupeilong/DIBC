package cn.dibcbks.service.impl;



import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.entity.User;
import cn.dibcbks.mapper.UnitMapper;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.GetCommonUser;
import cn.dibcbks.util.ResponseResult;

@Service
public class IUnitServiceImpl implements IUnitService {
	private static final Logger logger = LogManager.getLogger(IUnitServiceImpl.class.getName());
	@Autowired
	private UnitMapper unitMapper;
	
	
	@Override
	public ResponseResult<Void> updatUnit(Unit unit) {
		try {
			User currentUser = (User)SecurityUtils.getSubject().getSession().getAttribute("user");
			if(!currentUser.getParentId().equals(0)){
				logger.info(Constants.SUCCESSU_HEAD_INFO + "该账户不是管理员，不能修改企业信息！");
				return new ResponseResult<>(ResponseResult.ERROR, "该账户不是管理员，不能修改企业信息！");
			}else{
				if(StringUtils.isNotEmpty(unit.getBusinessLicenseCode())){
					Unit queryUnit = unitMapper.queryUnit(unit.getBusinessLicenseCode());
					if(queryUnit != null && !unit.getBusinessLicenseCode().equals(queryUnit.getBusinessLicenseCode())){
						logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因：营业执照编码已存在！");
						return new ResponseResult<>(ResponseResult.ERROR, "营业执照编码已存在！");
					}
				}
				unitMapper.updateById(unit);
				logger.info(Constants.SUCCESSU_HEAD_INFO + "企业资料修成功！");
				return new ResponseResult<>(ResponseResult.SUCCESS, "企业资料修改成功！");
			}			
		} catch (Exception e) {
			logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因：" + e.getMessage());
			return new ResponseResult<>(ResponseResult.ERROR, "企业资料修改失败！");
		}
	}


	@Override
	public ResponseResult<List<Unit>> getAllUnit() {
		ResponseResult<List<Unit>> rr = null;
		try {
			List<Unit> unitList = unitMapper.select(" n.unit_type BETWEEN 2 AND 4 ", null, null, null);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "企业列表查询成功！");
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！",unitList);
		} catch (Exception e) {
			logger.error(Constants.ERROR_HEAD_INFO + "企业列表查询失败，原因：" + e.getMessage());
			rr = new ResponseResult<>(ResponseResult.ERROR, "企业列表查询失败！");
		}
		return rr;
	}


	@Override
	public ResponseResult<Unit> unitDetail(Integer unitId) {
		ResponseResult<Unit> rr = null;
		try {
			Unit unit = null;
			List<Unit> list = unitMapper.select(" unit_id = '" + unitId + "'", null, null, null);
			if (!list.isEmpty()) {
				unit = list.get(0);
			}
			logger.info(Constants.SUCCESSU_HEAD_INFO + "企业详情查询成功！");
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！", unit);
		} catch (Exception e) {
			logger.error(Constants.ERROR_HEAD_INFO + "企业详情查询失败，原因：" + e.getMessage());
			rr = new ResponseResult<>(ResponseResult.ERROR, "企业详情查询失败！");
		}
		return rr;
	}


	@Override
	public String updateUnitPage(ModelMap modelMap) {
		try {
			List<Unit> detailUnit = unitMapper.select(" n.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'", null, null, null);
			modelMap.addAttribute("detailUnit", detailUnit.isEmpty() ? null : detailUnit.get(0));
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户进入企业编辑页面成功！");
			return "bks_wap/coopration_update";
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Constants.ERROR_HEAD_INFO + "用户进入企业编辑页面失败，原因：" + e.getMessage());
		}
		return "bks_wap/coopration_update";
	}


	@Override
	public ResponseResult<List<Unit>> queryUnitList(Integer unitId, String unitName) {
		ResponseResult<List<Unit>> rr = null;
		try {
			String where = null;
			boolean addAnd = false;
			if(unitId != null){
				where = " n.unit_id = '" + unitId + "'";
				addAnd = true;
			}
			if(StringUtils.isNotEmpty(unitName)){
				if (addAnd) {
					where += " AND n.unit_name = '" + unitName + "'";
				}else {
					where = " n.unit_name = '" + unitName + "'";
				}				
 			}
			/*if (CommonUtil.getSessionUser().getType() != 1 && StringUtils.isEmpty(where)) {
				where = " n.unit_type BETWEEN 2 AND 4 ";
			}*/
			List<Unit> unitList = unitMapper.select(where, null, null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功",unitList);
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败");
		}
		return rr;
	}


	@Override
	public String CooprationList(ModelMap modelMap) {
		try {			
			Session session = SecurityUtils.getSubject().getSession();
			User user = (User)session.getAttribute("user");
			if(user.getType().equals(1)){//市场监管局账户
				List<Unit> unitList = unitMapper.select(" n.unit_type BETWEEN 2 AND 4 ", " n.create_time DESC", null, null);
				modelMap.addAttribute("unitList", unitList);
				logger.info(Constants.SUCCESSU_HEAD_INFO + "用户进入企业信息列表页面成功！");
				return "bks_wap/coopration_list";
			}else{//企业用户
				List<Unit> unitList = unitMapper.select(" n.unit_id = '" + user.getUnitId() + "'", " n.create_time DESC", null, null);
				modelMap.addAttribute("unitDetail", unitList.get(0));
				logger.info(Constants.SUCCESSU_HEAD_INFO + "用户进入企业信息详情页面成功！");
				return "bks_wap/coopration_detal";
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Constants.ERROR_HEAD_INFO + "用户进入企业信息页面失败，原因：" + e.getMessage());
		}
		return "bks_wap/coopration_list";
		//return "error/404";
	}


	@Override
	public String CooprationDetal(ModelMap modelMap, Integer unitId) {
		Unit unitDetail = null;
		List<Unit> list = unitMapper.select(" unit_id = '" + unitId + "'", null, null, null);
		if (!list.isEmpty()) {
			unitDetail = list.get(0);
		}
		modelMap.addAttribute("unitDetail", unitDetail);
		return "bks_wap/coopration_detal";
	}


	@Override
	public List<Unit> CooprationList() {				
		return unitMapper.select(" n.unit_type BETWEEN 2 AND 4 ", " n.create_time DESC", null, null);
	}

	
	@Override
	public void addUnitListToModelMap(ModelMap modelMap) {
		List<Unit> unitList = unitMapper.select(" n.unit_type BETWEEN 2 AND 4 ", " n.create_time DESC", null, null);
		modelMap.addAttribute("unitList", unitList);
	}


	@Override
	public ResponseResult<Void> updateUnit(	String unitName, 
											String businessLicenseCode, 
											MultipartFile file,
											MultipartFile file1, 
											String unitAddress, 
											Integer unitType, 
											String legalPerson) {
		
		GetCommonUser get = new GetCommonUser();
		User user = CommonUtil.getSessionUser();
		List<Unit> unitList = unitMapper.select(" n.unit_id = '" + user.getUnitId() + "'", null, null, null);
		if(unitList.isEmpty()){
			return new ResponseResult<Void>(ResponseResult.ERROR,"企业信息异常，操作失败！");
		}else if(!user.getParentId().equals(0)){
			return new ResponseResult<>(ResponseResult.ERROR, "该账户不是管理员，不能修改企业信息！");
		}else{
			Unit update = unitList.get(0);
			update.setUnitName(unitName);
			if(StringUtils.isNotEmpty(businessLicenseCode)){
				Unit unit = unitMapper.queryUnit(businessLicenseCode);
				if(unit != null && !unit.getBusinessLicenseCode().equals(update.getBusinessLicenseCode())){
					logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因：营业执照编码已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "营业执照编码已存在！");
				}
			}
			update.setBusinessLicenseCode(businessLicenseCode);
			update.setUnitAddress(unitAddress);
			update.setUnitType(unitType);
			update.setLegalPerson(legalPerson);
			if(file != null){
				get.deluoladimg(update.getBusinessLicense());
				String businessLicense = get.uoladimg(file, user.getUuid());
				if(businessLicense == null){
					return new ResponseResult<Void>(ResponseResult.ERROR,"营业执照上传异常,人员信息添加失败");
				}
				update.setBusinessLicense(businessLicense);
			}
			if(file1 != null){
				get.deluoladimg(update.getProductionLicense());
				String productionLicense = get.uoladimg(file1, user.getUuid());
				if(productionLicense == null){
					return new ResponseResult<Void>(ResponseResult.ERROR,"许可证上传异常,人员信息添加失败");
				}
				update.setProductionLicense(productionLicense);		
			}			
			unitMapper.updateById(update);
			return new ResponseResult<Void>(ResponseResult.SUCCESS,"操作成功！");
		}
	}


	@Override
	public String selectUnit(ModelMap modelMap) {
		// 查询企业列表 企业类型不包括1
		
				String view=null;
				try {
					List<Unit> unitList = unitMapper.select(" n.unit_type BETWEEN 2 AND 4 ", " n.create_time DESC", null, null);
					modelMap.addAttribute("unitList", unitList);
					logger.info(Constants.SUCCESSU_HEAD_INFO + "用户进入企业信息列表页面成功！");
					view="bks_wap/indexcs";
				} catch (Exception e) {
					e.printStackTrace();
					logger.info(Constants.ERROR_HEAD_INFO+ "用户进入企业信息列表页面失败！原因："+e.getMessage());
				}
				
				return view;
	}

}
