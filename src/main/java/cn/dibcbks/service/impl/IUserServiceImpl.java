package cn.dibcbks.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import cn.dibcbks.entity.Department;
import cn.dibcbks.entity.Hygiene;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.entity.User;
import cn.dibcbks.filter.LoginType;
import cn.dibcbks.filter.MyUsernamePasswordToken;
import cn.dibcbks.mapper.DepartmentMapper;
import cn.dibcbks.mapper.HygieneMapper;
import cn.dibcbks.mapper.UnitMapper;
import cn.dibcbks.mapper.UserMapper;
import cn.dibcbks.service.IUserService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.GetCommonUser;
import cn.dibcbks.util.ResponseResult;
import net.sf.json.JSONObject;

/**
 * 用户业务实现类
 * @author Administrator
 *
 */
@Service
public class IUserServiceImpl implements IUserService {
	private static final Logger logger = LogManager.getLogger(IUserServiceImpl.class.getName());
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UnitMapper unitMapper;
	@Autowired
	private HygieneMapper hygieneMapper;
	@Autowired
	private DepartmentMapper departmentMapper;
	
	
	@Override
	public User queryUser(String idCard) {
		User user = null;
		try {
			user = userMapper.queryUser(idCard);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户查询成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(Constants.ERROR_HEAD_INFO + "用户查询失败");
		}
		return user;
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public ResponseResult<Void> registeradd(String uuid,
											String idCard,
											String username,
											String password,
											String phone, 
											String duty,
											Integer age,
											String unitName,
											String legalPerson,
											String businessLicenseCode,
											String businessLicense,
											String productionLicense,
											String unitAddress, 
											String expirationDate,
			Integer unitType) {
			/*Unit queryUnit = unitMapper.queryUnit(businessLicenseCode);
			if(queryUnit != null){
				logger.error(Constants.ERROR_HEAD_INFO + "用户注册失败  原因：企业信息已存在");
				return new ResponseResult<>(ResponseResult.ERROR,"企业账户信息已存在");
			}*/
			List<Unit> list = unitMapper.select(" n.unit_name = '" + unitName + "'", null, null, null);
			if (!list.isEmpty()) {
				logger.error(Constants.ERROR_HEAD_INFO + "用户注册失败  原因：企业信息已存在");
				return new ResponseResult<>(ResponseResult.ERROR,"企业账户信息已存在");
			}
			Unit unit = new Unit();
			unit.setUnitName(unitName);
			unit.setLegalPerson(legalPerson);
			unit.setBusinessLicenseCode(businessLicenseCode);
			unit.setBusinessLicense(businessLicense);
			unit.setProductionLicense(productionLicense);
			unit.setUnitAddress(unitAddress);
			unit.setExpirationDate(expirationDate);
			unit.setUnitType(unitType);
			unitMapper.insert(unit);			
			String hashPassword = CommonUtil.getEncrpytedPassword(Constants.MD5, password, uuid, 1024);
			User user = new User();
			user.setIdCard(idCard);
			user.setUsername(username);
			user.setUuid(uuid);
			user.setPassword(hashPassword);
			user.setPhone(phone);
			user.setDuty(duty);
			user.setAge(age);
			user.setParentId(0);//父级ID: 默认 0
			user.setType(2);//用户类型：1-监管 2-企业
			user.setUnitId(unit.getUnitId());
			userMapper.insert(user);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户注册成功");
			return new ResponseResult<>(ResponseResult.SUCCESS,"企业账户信息注册成功!");		
	}


	@Override
	public ResponseResult<User> login(String idCard, String password) {
		ResponseResult<User> rr = null;
		try {			
			User user = userMapper.queryUser(idCard);
			System.out.println(user+"sddddddddddddddddddddddddddddddddddddddddd");
			if(user == null){
				user = userMapper.queryUserByPhone(idCard);
			}
			if (user == null) {
				rr = new ResponseResult<User>(ResponseResult.ERROR, "账户信息不存在！请重新输入...");
				logger.error(Constants.ERROR_HEAD_INFO + "账户信息不存在 ，账号：" + idCard);
			} else {
				CommonUtil.login(new MyUsernamePasswordToken(idCard, password));
				JSONObject userJson = JSONObject.fromObject(user);				
				CommonUtil.setAttribute("userJson", userJson);
				CommonUtil.setAttribute("user", user);
				rr = new ResponseResult<User>(ResponseResult.SUCCESS, "登录成功",user);
				logger.info(Constants.SUCCESSU_HEAD_INFO + "账号登录成功，账号：" + idCard);
			}
		}catch(IncorrectCredentialsException e){			
			rr = new ResponseResult<>(ResponseResult.ERROR,"密码错误！请重新输入...");
			logger.error(Constants.ERROR_HEAD_INFO + "用户注册失败 原因：" + e.getMessage());
		} catch (Exception e) {			
			rr = new ResponseResult<User>(ResponseResult.ERROR, "数据存在异常，请联系工作人员处理！");
			logger.error(Constants.ERROR_HEAD_INFO + "账户登录失败，原因： " + e.getMessage());
		}
		return rr;
	}


	/*@Override
	public ResponseResult<Void> updateUser(User user) {
		ResponseResult<Void> rr = null;
		try {
			User oldUser = (User)SecurityUtils.getSubject().getSession().getAttribute("user");
			user.setId(oldUser.getId());
			if(StringUtils.isNotEmpty(user.getIdCard())){
				User queryUser = queryUser(user.getIdCard());
				if (queryUser != null && !oldUser.getIdCard().equals(queryUser.getIdCard())) {
					logger.error(Constants.ERROR_HEAD_INFO + "用户资料修改失败，原因：身份证已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "身份证已存在！");
				}
			}
			if(StringUtils.isNotEmpty(user.getPassword())){
				user.setPassword(CommonUtil.getEncrpytedPassword(Constants.MD5, user.getPassword(), user.getUuid(), 1024));
			}
			userMapper.updateById(user);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户资料修改成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<Void>(ResponseResult.ERROR, "用户资料修改操作失败！");
			logger.error(Constants.ERROR_HEAD_INFO + "用户资料修改失败，原因：" + e.getMessage());
		}
		return rr;
	}*/

	

	@Override
	public ResponseResult<Void> userIsExist(String idCard,String phone) {
		try {
			/*User user = userMapper.queryUser(idCard);
			if(user != null){
				return new ResponseResult<>(ResponseResult.ERROR,"身份证号已存在！");
			}*/
			User user = userMapper.queryUserByPhone(phone);
			if (user != null) {
				return new ResponseResult<>(ResponseResult.ERROR,"手机号已存在！");
			}
			return new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Constants.ERROR_HEAD_INFO + "用户是否存在查询失败");
			return new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
	}

	@Override
	public ResponseResult<List<User>> queryUnitUser(Integer unitId, String unitName) {
		ResponseResult<List<User>> rr = null;
		try {
			String where = "";
			if(unitId == null && StringUtils.isEmpty(unitName)){
				where = null;
			}
			boolean addAnd = false;
			if(unitId != null){
				where += " n.unit_id = '" + unitId + "'";
				addAnd =true;
			}
			if(StringUtils.isNotEmpty(unitName)){
				if (addAnd) {
					where += " AND n.unit_name = '" + unitName + "'";
				}else {
					where += " n.unit_name = '" + unitName + "'";
				}				
			}
			System.out.println( "where: "+where);
			List<User> list = userMapper.select(where, null, null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！",list);
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}		
		return rr;
	}

	@Override
	public String queryUnitUserDetail(ModelMap modelMap,String id) {
		try {
			List<User> list = userMapper.select(" u.id = '" + id + "'", null, null, null);
			modelMap.addAttribute("userDetail", list.isEmpty() ? null : list.get(0));					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bks_wap/workmens_detal";
	}

	@Override
	public String workmens(Integer unitId, ModelMap modelMap) {
		try {
			List<User> userList = new ArrayList<>();
			User user = CommonUtil.getSessionUser();
			if(user.getType().equals(1)){//市监管
				List<Unit> unitList = unitMapper.select(" n.unit_type BETWEEN 2 AND 4 ", " n.create_time DESC", null, null);
				modelMap.addAttribute("unitList", unitList);
				userList = userMapper.select(null, " u.create_time DESC", null, null);
			}else if(user.getType().equals(2)){//主体
				userList = userMapper.select(" u.unit_id = '" + user.getUnitId() + "'", " u.create_time DESC", null, null);
			}else{//大众
				userList = userMapper.select(" u.unit_id = '" + unitId + "'", " u.create_time DESC", null, null);
			}
			modelMap.addAttribute("userList", userList);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "进入从业人员信息页面成功！");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(Constants.ERROR_HEAD_INFO + "进入从业人员信息页面失败！");
		}
		
		return "bks_wap/workmens";
	}

	@Override
	public String workmensHealth(ModelMap modelMap,Integer userId) {
		List<Hygiene> hygieneList = hygieneMapper.select(" h.user_id = '" + userId + "'", " h.upload_time DESC", null, null);
		modelMap.addAttribute("hygieneList", hygieneList);
		return "bks_wap/workmens_health";
	}

	@Override
	public String workmensHealthDetal(ModelMap modelMap, Integer hygieneId) {
		Hygiene hygieneDetail = hygieneMapper.queryHygiene(hygieneId);
		System.out.println("体温信息详情：" + hygieneDetail);
		modelMap.addAttribute("hygieneDetail", hygieneDetail);
		return "bks_wap/workmens_health_detal";
	}

	@Override
	public String queryUserPcenter(ModelMap modelMap, String id) {
		try {
			List<User> list = userMapper.select(" u.id = '" + id + "'", null, null, null);
			System.out.println("list : " + list.get(0));
			modelMap.addAttribute("userPcenter", list.isEmpty() ? null : list.get(0));	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bks_wap/user_pcenter";
	}	
	@Override
	public ResponseResult<Void> addHygiene(Hygiene hygiene) {
		ResponseResult<Void> rr = null;
		try {
			hygieneMapper.insert(hygiene);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public List<Unit> queryUnitUserDetail(Integer unitid) {
		String where="unit_id="+unitid;
		return unitMapper.select(where, null, null, null);
	}

	

	@Override
	public ResponseResult<Void> uploadPassword(String password, String oldpassword) {
		try {
			String uuid = CommonUtil.getSessionUser().getUuid();
			String hashPassword = CommonUtil.getEncrpytedPassword(Constants.MD5, oldpassword, uuid, 1024);		
			if (CommonUtil.getSessionUser().getPassword().equals(hashPassword)) {
				String newPassword = CommonUtil.getEncrpytedPassword(Constants.MD5, password, uuid, 1024);
				if (newPassword.equals(hashPassword)) {
					return new ResponseResult<Void>(ResponseResult.ERROR,"新密码不能与原密码相同！");
				}else{
					User user=new User();
					user.setId(CommonUtil.getSessionUser().getId());
					user.setPassword(newPassword);
					userMapper.updateById(user);
					logger.info(Constants.SUCCESSU_HEAD_INFO + "用户密码修改成功！");
					return new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
				}			
			}else{
				return new ResponseResult<Void>(ResponseResult.ERROR,"原密码输入有误！");
			}	
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Constants.ERROR_HEAD_INFO + "用户资料修改失败，原因：" + e.getMessage());
			return new ResponseResult<Void>(ResponseResult.ERROR, "操作失败！");			
		}
		
	}

	@Override
	public ResponseResult<Void> allocateAccount(Integer departmentId, 
												String idCard, 
												String username, 
												String password,
												String phone, 
												Integer age, 
												String healthCertificateCode, 
												MultipartFile file) {
		
		ResponseResult<Void> rr = null;		
		String healthCertificate = "";
		GetCommonUser get = new GetCommonUser();
		try {			
			Subject subject = SecurityUtils.getSubject();
			if(!subject.isAuthenticated()){
				rr = new ResponseResult<Void>(ResponseResult.ERROR, "请登录后在进行此操作！");
				logger.error(Constants.ERROR_HEAD_INFO + "分配账号失败， 原因：未登录账户!");
			}else if (userMapper.queryUserByPhone(phone) != null) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"手机号已存在！");
				logger.error(Constants.ERROR_HEAD_INFO + "分配账号失败， 原因：手机号已存在!");
			}else if(!CommonUtil.getSessionUser().getParentId().equals(0)){
				rr = new ResponseResult<Void>(ResponseResult.ERROR, "该账户不是管理员，不能分配账户！");
				logger.error(Constants.ERROR_HEAD_INFO + "分配账号失败，原因：该账户不是管理员账户");
			}else if(StringUtils.isNotEmpty(idCard) && userMapper.queryUser(idCard) != null){
				rr = new ResponseResult<Void>(ResponseResult.ERROR, "该账户不是管理员，身份证号重复！");
				logger.error(Constants.ERROR_HEAD_INFO + "分配账号失败， 原因：身份证号重复");
			}else{
				String uuid = CommonUtil.getUUID();
				if(file != null){
					healthCertificate = get.uoladimg(file, uuid);
				}				
				password = password == null ? Constants.INITIAL_PASSWORD : password;
				String hashPassword = CommonUtil.getEncrpytedPassword(Constants.MD5, password, uuid, 1024);
				User insert = new User();				
				insert.setUsername(username);
				insert.setIdCard(idCard);
				insert.setPhone(phone);
				insert.setPassword(hashPassword);
				insert.setAge(age);
				insert.setHealthCertificateCode(healthCertificateCode);
				insert.setHealthCertificate(healthCertificate);
				insert.setUuid(uuid);
				insert.setUnitId(CommonUtil.getSessionUser().getUnitId());
				insert.setParentId(CommonUtil.getSessionUser().getId());
				insert.setDepartmentId(departmentId);
				insert.setType(CommonUtil.getSessionUser().getType());
				insert.setCreateTime(new Date());
				userMapper.insert(insert);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"企业账户分配成功!");
				logger.info(Constants.SUCCESSU_HEAD_INFO + "企业账户分配成功");
			}			
		} catch (Exception e) {
			get.deluoladimg(healthCertificate);
			rr = new ResponseResult<Void>(ResponseResult.ERROR, "操作失败！");
			logger.error(Constants.ERROR_HEAD_INFO + "分配账号失败，原因：" + e.getMessage());
		}		
		return rr;
	}

	
	@Override
	public ResponseResult<Void> addHygiene(	Integer userId,
											String username,
											String dailyTime, 
											Double celsius,
											String fever, 
											String diarrhea, 
											String woundsFester, 
											String hygiene, 
											String remark, 
											MultipartFile file) {
		
		ResponseResult<Void> rr = null;
		GetCommonUser get = new GetCommonUser();
		String healthCodePhoto = ""; 
		try {
			healthCodePhoto = get.uoladimg(file,CommonUtil.getSessionUser().getUuid());
			if (healthCodePhoto == null) {
				rr = new ResponseResult<Void>(ResponseResult.ERROR,"健康码上传异常,信息添加失败");
			}else{	
				Hygiene insert = new Hygiene();
				insert.setUserId(userId);
				insert.setUsername(username);
				insert.setDailyTime(dailyTime);
				insert.setCelsius(celsius);
				insert.setFever(fever);
				insert.setDiarrhea(diarrhea);
				insert.setWoundsFester(woundsFester);
				insert.setHygiene(hygiene);
				insert.setRemark(remark);
				insert.setHealthCodePhoto(healthCodePhoto);
				insert.setUploadTime(new Date());
				hygieneMapper.insert(insert);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			}
		} catch (Exception e) {
			get.deluoladimg(healthCodePhoto);
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}	
		return rr;		
	}

	@Override
	public ResponseResult<Void> updateUser(	Integer id, 
											String idCard, 
											String username, 
											String duty,
											String phone, 
											Integer age, 
											String healthCertificateCode, 
											String healthCertificate,
											MultipartFile file) {
		ResponseResult<Void> rr = null;	
		GetCommonUser get = new GetCommonUser();
		String newHealthCertificate = "";
		try {
			if(StringUtils.isNotEmpty(idCard) && userMapper.queryUser(idCard) != null && !idCard.equals(CommonUtil.getSessionUser().getIdCard())){
				
				rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败，身省份证号重复！");
			}else if (StringUtils.isNotEmpty(phone) && userMapper.queryUserByPhone(phone) != null && !phone.equals(CommonUtil.getSessionUser().getPhone())) {
				
				rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败，手机号重复！");
			}else{
				if(file != null){
					newHealthCertificate = get.uoladimg(file,CommonUtil.getSessionUser().getUuid());
					if(StringUtils.isEmpty(newHealthCertificate)){
						return new ResponseResult<Void>(ResponseResult.ERROR,"健康证上传异常,人员信息添加失败！");
					}
					if(StringUtils.isNotEmpty(healthCertificate)){
						get.deluoladimg(healthCertificate);
					}
				}
				User update = new User();
				update.setId(id);
				update.setUsername(username);
				update.setPhone(phone);
				update.setIdCard(idCard);
				update.setAge(age);
				update.setDuty(duty);
				update.setHealthCertificateCode(healthCertificateCode);	
				update.setHealthCertificate(newHealthCertificate);
				userMapper.updateById(update);
				CommonUtil.setAttribute("user", update);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			}			
		} catch (Exception e) {
			get.deluoladimg(healthCertificate);
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public String updateUserPage(ModelMap modelMap) {
		List<User> list = userMapper.select("u.id = '" + CommonUtil.getSessionUser().getId() + "'", null, null, null);
		if(!list.isEmpty()){
			modelMap.addAttribute("userDetail", list.get(0));
		}		
		return "bks_wap/workmens_update";
	}

	@Override
	public ResponseResult<Void> weblogin(String idCard, String password) {
		ResponseResult<Void> rr = null;
		try {
			System.out.println("用户：" + idCard + " " + password);
			User user = userMapper.queryUser(idCard);
			if(user == null){
				user = userMapper.queryUserByPhone(idCard);
			}
			if (user == null) {
				rr = new ResponseResult<Void>(ResponseResult.ERROR, "账户信息不存在！请重新输入...");
				logger.error(Constants.ERROR_HEAD_INFO + "账户信息不存在 ，账号：" + idCard);
			} else if(user.getType() == 3){
				rr = new ResponseResult<Void>(ResponseResult.ERROR, "该账户信息没有权限！请重新输入...");
				logger.error(Constants.ERROR_HEAD_INFO + "该账户信息没有权限 ，账号：" + idCard);
			} else {
				CommonUtil.login(new MyUsernamePasswordToken(idCard, password));			
				CommonUtil.setAttribute("userJson", JSONObject.fromObject(user));
				CommonUtil.setAttribute("user", user);
				rr = new ResponseResult<Void>(ResponseResult.SUCCESS, "登录成功");
				logger.info(Constants.SUCCESSU_HEAD_INFO + "账号登录成功，账号：" + idCard);
			}
		}catch(IncorrectCredentialsException e){			
			rr = new ResponseResult<>(ResponseResult.ERROR,"密码错误！请重新输入...");
			logger.error(Constants.ERROR_HEAD_INFO + "用户登录失败 原因：" + e.getMessage());
		} catch (Exception e) {			
			rr = new ResponseResult<Void>(ResponseResult.ERROR, "数据存在异常，请联系工作人员处理！");
			logger.error(Constants.ERROR_HEAD_INFO + "账户登录失败，原因： " + e.getMessage());
		}
		return rr;
	}

	@Override
	public String selectUserList(ModelMap modelMap) {
		try {
			if(CommonUtil.isLogin()){
				modelMap.addAttribute("userList", userMapper.select("u.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'", "u.create_time DESC", null, null));				
			}						
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "bks_web/user/user";
	}

	@Override
	public ResponseResult<Void> userBindDepartment(Integer userId, Integer departmentId) {
		ResponseResult<Void> rr = null;
		try {
			User update = new User();
			update.setId(userId);
			update.setDepartmentId(departmentId);
			userMapper.updateById(update);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public String workmensAdd(ModelMap modelMap) {
		try {
			List<Department> departmentList = departmentMapper.select("d.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "' AND d.department_parent_id > 0", null, null, null);
			modelMap.addAttribute("departmentList", departmentList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bks_wap/workmens_add";
	}
		
	
	@Override
	public ResponseResult<Void> webUpdateUser(User user) {
		try {
			List<User> userList = userMapper.select("u.id = '" + user.getId() + "'", null, null, null);
			User oldUser = userList.get(0);
			if(StringUtils.isNotEmpty(user.getIdCard())){
				User queryUser = queryUser(user.getIdCard());
				if (queryUser != null && !oldUser.getIdCard().equals(queryUser.getIdCard())) {
					logger.error(Constants.ERROR_HEAD_INFO + "用户资料修改失败，原因：身份证已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "身份证已存在！");
				}				
			}	
			if(StringUtils.isNotEmpty(user.getPhone())){
				User queryUser = userMapper.queryUserByPhone(user.getPhone());
				if (queryUser != null && !oldUser.getPhone().equals(queryUser.getPhone())) {
					logger.error(Constants.ERROR_HEAD_INFO + "用户资料修改失败，原因：手机号已存在！");
					return new ResponseResult<>(ResponseResult.ERROR, "身份证已存在！");
				}
			}
			userMapper.updateById(user);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户资料修改成功！");
			return new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Constants.ERROR_HEAD_INFO + "用户资料修改失败，原因：" + e.getMessage());
			return new ResponseResult<Void>(ResponseResult.ERROR, "用户资料修改操作失败！");			
		}
	}

	@Override
	public ResponseResult<Void> deleteUser(Integer id) {
		try {
			userMapper.deleteById(id);
			return new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
	}

	@Override
	public ResponseResult<Void> webAddUser(User user) {
		try {
			if(userMapper.queryUserByPhone(user.getPhone()) != null){
				return new ResponseResult<>(ResponseResult.ERROR,"手机号重复，添加失败！");
			}
			String uuid = CommonUtil.getUUID();
			user.setPassword(CommonUtil.getEncrpytedPassword(Constants.MD5, user.getPhone().substring(user.getPhone().length() - 6), uuid, 1024));
			user.setUnitId(CommonUtil.getSessionUser().getUnitId());
			userMapper.insert(user);
			return new ResponseResult<>(ResponseResult.SUCCESS,"添加成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseResult<>(ResponseResult.ERROR,"添加失败！");
		}
	}
}
