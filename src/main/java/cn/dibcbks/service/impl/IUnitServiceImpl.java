package cn.dibcbks.service.impl;


import java.util.ArrayList;
import java.util.Date;
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
import cn.dibcbks.mapper.UserMapper;
import cn.dibcbks.service.IDepartmentService;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.GetCommonUser;
import cn.dibcbks.util.ResponseResult;
import net.sf.json.JSONArray;

@Service
public class IUnitServiceImpl implements IUnitService {
	private static final Logger logger = LogManager.getLogger(IUnitServiceImpl.class.getName());
	@Autowired
	private UnitMapper unitMapper;
	@Autowired
	private  UserMapper userMaper;
	@Autowired
	private IDepartmentService iDepartmentService;
	
	@Override
	public ResponseResult<Void> updateUnit(Unit unit) {
		try {			
			if(StringUtils.isNotEmpty(unit.getBusinessLicenseCode())){
				Unit queryUnit = unitMapper.queryUnit(unit.getBusinessLicenseCode());
				if(queryUnit != null && !unit.getBusinessLicenseCode().equals(queryUnit.getBusinessLicenseCode())){
					logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因：营业执照编码已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "营业执照编码已存在！");
				}
			}
			if(StringUtils.isNotEmpty(unit.getUnitName())){
				List<Unit> unitList = unitMapper.select("n.unit_name = '" + unit.getUnitName() + "'", null, null, null);
				if(!unitList.isEmpty() && !unitList.get(0).getUnitId().equals(unit.getUnitId())){
					logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因：企业名称已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "企业名称已存在！");
				}
			}
			if(StringUtils.isNotEmpty(unit.getTypeName())){
				switch (unit.getTypeName()) {//企业类型
					case "市场监督管理局":
						unit.setUnitType(1); break;
					case "学校":						
					case "学校食堂":	
						unit.setUnitType(2); break;//学校
					case "餐饮业":	
					case "配餐单位":
					case "小型餐馆":
					case "中型餐馆":
					case "大型餐馆":
					case "特大型餐馆":
						unit.setUnitType(3); break;//餐饮业
					case "企业":						
					case "个体":	
					default:
						unit.setUnitType(4); break;//其他
				}	
			}
			unitMapper.updateById(unit);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "企业资料修成功！");
			return new ResponseResult<>(ResponseResult.SUCCESS, "企业资料修改成功！");
						
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
			if (CommonUtil.getSessionUser().getType() != 1 && StringUtils.isEmpty(where)) {
				where = " n.unit_type BETWEEN 2 AND 4 ";
			}
			List<Unit> unitList = unitMapper.select(where, null, null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功",unitList);
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败,原因:"+e.getMessage());
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
	}


	@Override
	public String CooprationDetal(ModelMap modelMap, Integer unitId) {
		Unit unitDetail = null;
		String where = null;
		if(unitId != null){
			where = " n.unit_id = '" + unitId + "'";
		}else{
			where = " n.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'";
			
		}		
		List<Unit> list = unitMapper.select(where, null, null, null);
		if (!list.isEmpty()) {
			unitDetail = list.get(0);
		}
		if(CommonUtil.getSessionUser().getType() == 1 && unitId != null){
			List<User> userDetail = userMaper.select(" u.unit_id = '" + unitId + "'", null, null, null);
			modelMap.addAttribute("userDetail",userDetail);
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
	public ResponseResult<Void> updateUnit(	String unitName, String businessLicenseCode, MultipartFile file,
											MultipartFile file1, String unitAddress, Integer unitType, String legalPerson) {
		
		GetCommonUser get = new GetCommonUser();
		User user = CommonUtil.getSessionUser();
		List<Unit> unitList = unitMapper.select(" n.unit_id = '" + user.getUnitId() + "'", null, null, null);
		if(unitList.isEmpty()){
			return new ResponseResult<Void>(ResponseResult.ERROR,"企业信息异常，操作失败！");
		}else{
			Unit update = unitList.get(0);			
			if(StringUtils.isNotEmpty(businessLicenseCode)){
				Unit unit = unitMapper.queryUnit(businessLicenseCode);
				if(unit != null && !unit.getBusinessLicenseCode().equals(update.getBusinessLicenseCode())){
					logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因：营业执照编码已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "营业执照编码已存在！");
				}
			}
			update.setBusinessLicenseCode(businessLicenseCode);
			update.setUnitAddress(unitAddress);			
			if(StringUtils.isNotEmpty(unitName)){
				unitList = unitMapper.select("n.unit_name = '" + unitName + "'", null, null, null);
				if(!unitList.isEmpty() && !unitList.get(0).getUnitId().equals(user.getUnitId())){
					logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因：企业名称已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "企业名称已存在！");
				}
				update.setUnitName(unitName);
			}
			update.setUnitType(unitType);
//			if(StringUtils.isNotEmpty(typeName)){
//				switch (typeName) {//企业类型
//					case "市场监督管理局":
//						update.setUnitType(1); break;
//					case "学校":						
//					case "学校食堂":	
//						update.setUnitType(2); break;//学校
//					case "餐饮业":	
//					case "配餐单位":
//					case "小型餐馆":
//					case "中型餐馆":
//					case "大型餐馆":
//					case "特大型餐馆":
//						update.setUnitType(3); break;//餐饮业
//					case "企业":						
//					case "个体":	
//					default:
//						update.setUnitType(4); break;//其他
//				}	
//			}
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


	@Override
	public ResponseResult<Void> addUnit(String unitName, String businessLicenseCode, MultipartFile file,MultipartFile file1, Integer unitType) {		
		try {
			GetCommonUser get = new GetCommonUser();
			User user = CommonUtil.getSessionUser();
			List<Unit> unitList = unitMapper.select(" n.unit_name = '" + unitName + "'", null, null, null);
			if(!unitList.isEmpty()){
				return new ResponseResult<Void>(ResponseResult.ERROR,"企业名称已存在，新增失败！");
			}else if(StringUtils.isNotEmpty(businessLicenseCode) && unitMapper.queryUnit(businessLicenseCode) != null){
				return new ResponseResult<>(ResponseResult.ERROR, "营业执照编码已存在，新增失败！");
			}else{
				Unit insert = new Unit();
				insert.setUnitName(unitName);			
				insert.setBusinessLicenseCode(businessLicenseCode);
				insert.setUnitType(unitType);
				insert.setCreateTime(new Date());
				if(file != null){				
					String businessLicense = get.uoladimg(file, user.getUuid());
					if(businessLicense == null){
						return new ResponseResult<Void>(ResponseResult.ERROR,"营业执照上传异常,新增失败！");
					}
					insert.setBusinessLicense(businessLicense);
				}
				if(file1 != null){				
					String productionLicense = get.uoladimg(file1, user.getUuid());
					if(productionLicense == null){
						return new ResponseResult<Void>(ResponseResult.ERROR,"许可证上传异常,新增失败！");
					}
					insert.setProductionLicense(productionLicense);		
				}
				unitMapper.insert(insert);
				iDepartmentService.addUnitDepartment(insert);
				return new ResponseResult<Void>(ResponseResult.SUCCESS,"操作成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseResult<Void>(ResponseResult.SUCCESS,"操作失败！");
		}		
	}


	@SuppressWarnings("unchecked")
	@Override
	public ResponseResult<List<List<String>>> batchAddUnit(String unitList) {
		ResponseResult<List<List<String>>> rr;
		List<List<String>> list=new ArrayList<List<String>>();
		JSONArray json = JSONArray.fromObject(unitList);
		String unitName = "";//企业名称		
		String businessLicenseCode = "";//统一社会信用代码
		String unitType = "";//企业类型
		String legalPerson = "";//企业法人
		String unitAddress = "";//经营地址
		String expirationDate = "";//到期时间		
		Date createTime = new Date();//创建时间
		String username = "";//联系人
		String phone = "";//联系电话
		Integer departmentId = null;//负责人部门角色ID
		String uuid = "";//
		Unit unit = null;
		User user = null;
		List<Unit> units = new ArrayList<>();
		Integer row = null;
		for(int i=0;i<json.size();i++){
			unitName = json.getJSONArray(i).get(0).toString().trim();
			businessLicenseCode = json.getJSONArray(i).get(1).toString().trim();
			unitType = json.getJSONArray(i).get(2).toString().trim();
			legalPerson = json.getJSONArray(i).get(3).toString().trim();
			unitAddress = json.getJSONArray(i).get(4).toString().trim();
			expirationDate = json.getJSONArray(i).get(5).toString().trim();
			username =  json.getJSONArray(i).get(6).toString().trim();
			phone =  json.getJSONArray(i).get(7).toString().trim();
			//依据企业名称 + 统一社会信用代码
			//units = unitMapper.select("n.unit_name = '" + unitName + "' OR n.business_license_code ='" + businessLicenseCode + "'", null, null, null);
			units = unitMapper.select("n.unit_name = '" + unitName + "'", null, null, null);			
			if(units.isEmpty()){
				unit = new Unit();
				unit.setUnitName(unitName);//企业名称
				unit.setBusinessLicenseCode(businessLicenseCode);//统一社会信用代码				
				unit.setTypeName(unitType);
				switch (unitType) {//企业类型
					case "市场监督管理局":
						unit.setUnitType(1); break;
					case "学校":						
					case "学校食堂":	
						unit.setUnitType(2); break;//学校
					case "餐饮业":	
					case "配餐单位":
					case "小型餐馆":
					case "中型餐馆":
					case "大型餐馆":
					case "特大型餐馆":
						unit.setUnitType(3); break;//餐饮业
					case "企业":						
					case "个体":	
					default:
						unit.setUnitType(4); break;//其他
				}			
				unit.setLegalPerson(legalPerson);//企业法人				
				unit.setUnitAddress(unitAddress);//经营地址
				unit.setExpirationDate(expirationDate);//到期时间
				unit.setCreateTime(createTime);//创建时间
				row = unitMapper.insert(unit);
				departmentId = iDepartmentService.addUnitDepartment(unit);
			}else{
				unit = units.get(0);				
				departmentId = iDepartmentService.selectChargePersonDepartmentId(unit.getUnitId());
			}		
			if(userMaper.queryUserByPhone(phone) != null){ //该手机账户已存在企业账户无法绑定
				logger.error(Constants.ERROR_HEAD_INFO + "手机号：" + phone + "  已存在企业账户无法绑定企业：" + unit.getUnitName());
				continue;
			}
			if(StringUtils.isNotEmpty(phone)){
				user = new User();
				user.setPhone(phone);//联系方式
				user.setUsername(username);//联系人
				user.setDepartmentId(departmentId);//负责人部门ID
				if(unit.getUnitType().equals(1)){//是否为监管企业
					user.setType(1);//监管人员
				}else{
					user.setType(2);//企业人员
				}		
				user.setUnitId(unit.getUnitId());//企业ID
				uuid = CommonUtil.getUUID();
				user.setUuid(uuid);//uuid
				user.setPassword(CommonUtil.getEncrpytedPassword(Constants.MD5, phone.substring(phone.length() - 6), uuid, 1024));//默认密码为手机后六位
				user.setCreateTime(createTime);//创建时间
				userMaper.insert(user);
			}
			if(row == 0){
				list.add(json.getJSONArray(i));			
			}	
		}		
		rr = new ResponseResult<List<List<String>>>(ResponseResult.SUCCESS,"操作成功:" + (json.size() - list.size()) + "条  失败：" + list.size() + "条 ",list);		
		return rr;
	}


	@Override
	public String selectWebUnitList(ModelMap modelMap) {
		try {
			String where = null;
			if(CommonUtil.getSessionUser().getType() != 1){
				where = " n.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'";				
			}
			modelMap.addAttribute("unitList", unitMapper.select(where, " n.create_time DESC ", null, null));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bks_web/unit/unit";
	}


	@Override
	public ResponseResult<Void> addUnit(Unit unit) {
		try {			
			if(StringUtils.isNotEmpty(unit.getBusinessLicenseCode())){
				Unit queryUnit = unitMapper.queryUnit(unit.getBusinessLicenseCode());
				if(queryUnit != null && !unit.getBusinessLicenseCode().equals(queryUnit.getBusinessLicenseCode())){
					logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因：营业执照编码已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "营业执照编码已存在！");
				}
			}
			if(StringUtils.isNotEmpty(unit.getUnitName())){
				List<Unit> unitList = unitMapper.select("n.unit_name = '" + unit.getUnitName() + "'", null, null, null);
				if(!unitList.isEmpty() && !unitList.get(0).getUnitId().equals(unit.getUnitId())){
					logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因：企业名称已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "企业名称已存在！");
				}
			}
			if(StringUtils.isNotEmpty(unit.getTypeName())){
				switch (unit.getTypeName()) {//企业类型
					case "市场监督管理局":
						unit.setUnitType(1); break;
					case "学校":						
					case "学校食堂":	
						unit.setUnitType(2); break;//学校
					case "餐饮业":	
					case "配餐单位":
					case "小型餐馆":
					case "中型餐馆":
					case "大型餐馆":
					case "特大型餐馆":
						unit.setUnitType(3); break;//餐饮业
					case "企业":						
					case "个体":	
					default:
						unit.setUnitType(4); break;//其他
				}	
			}
			unitMapper.insert(unit);
			iDepartmentService.addUnitDepartment(unit);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "企业添加成功！");
			return new ResponseResult<>(ResponseResult.SUCCESS, "企业添加成功！");
						
		} catch (Exception e) {
			logger.error(Constants.ERROR_HEAD_INFO + "企业添加失败，原因：" + e.getMessage());
			return new ResponseResult<>(ResponseResult.ERROR, "企业添加失败！");
		}
	}


	@Override
	public ResponseResult<Void> deleteUnit(Integer unitId) {
		try {
			unitMapper.deleteById(unitId);
			return new ResponseResult<>(ResponseResult.SUCCESS, "企业删除成功！");
		} catch (Exception e) {
			return new ResponseResult<>(ResponseResult.ERROR, "企业删除失败！");
		}
	}


}
