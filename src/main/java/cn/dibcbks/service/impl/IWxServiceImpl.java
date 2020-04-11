package cn.dibcbks.service.impl;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSONArray;
import cn.dibcbks.entity.Role;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.entity.User;
import cn.dibcbks.entity.WxAccessToken;
import cn.dibcbks.filter.LoginType;
import cn.dibcbks.filter.MyUsernamePasswordToken;
import cn.dibcbks.mapper.RoleMapper;
import cn.dibcbks.mapper.UnitMapper;
import cn.dibcbks.mapper.UserMapper;
import cn.dibcbks.mapper.WxAccessTokenMapper;
import cn.dibcbks.service.IWxService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.DateUtil;
import cn.dibcbks.util.GetCommonUser;
import cn.dibcbks.util.ResponseResult;
import cn.dibcbks.util.wx.AccessTokenOut;
import cn.dibcbks.util.wx.WxApi;
import cn.dibcbks.util.wx.WxApiAddressUtil;
import cn.dibcbks.util.wx.WxUserInfoOut;
import net.sf.json.JSONObject;

@Service
public class IWxServiceImpl implements IWxService {
	private static final Logger logger = LogManager.getLogger(IWxServiceImpl.class.getName());
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private WxAccessTokenMapper wxAccessTokenMapper;
	@Autowired
	private UnitMapper unitMapper;
	@Autowired
	private RoleMapper roleMapper;
	
	
	@Override
	public String wxLogin(ModelMap modelMap) {
//		WxAccessToken token = wxAccessTokenMapper.selectById("1");
//		if(token == null){
//            //首次获取微信token存入数据库
//             AccessTokenOut accessTokenOut = WxApi.getWxAccessToken();
//             WxAccessToken insert = new WxAccessToken();
//             insert.setId("1");
//             insert.setAccessToken(accessTokenOut.getAccessToken());
//             insert.setExpiresIn(accessTokenOut.getExpiresIn());
//             insert.setCreateTime(new Date());
//             wxAccessTokenMapper.insert(insert);
//             token = insert;
//             logger.info("首次获取微信access_token信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
//         } else {
//             //当前时间
//             if(DateUtil.dateCompare(DateUtil.dateAddMinutes(token.getCreateTime(),110),new Date()) < 0) {
//                 //超过有效期，重新获取
//                 AccessTokenOut accessTokenOut = WxApi.getWxAccessToken();
//                 token.setAccessToken(accessTokenOut.getAccessToken());
//                 token.setExpiresIn(accessTokenOut.getExpiresIn());
//                 token.setCreateTime(new Date());
//                 wxAccessTokenMapper.updateById(token);
//                 System.out.println("token : " + token);
//                 logger.info("更新微信access_token信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
//             }
//         }
//		
//		String shortUrl = WxApi.getOAuth2Url(token.getAccessToken());
		String shortUrl = WxApi.getOAuth2Url(null);		
	    modelMap.addAttribute("wechat_login_url", shortUrl);
	    return "bks_wap/login";
	}

	@Override
	public String wxOauth2Redirect(String code, HttpServletRequest request ,ModelMap modelMap) {
		try {
			WxUserInfoOut wxUserInfo = null;
			if(CommonUtil.containsCode(code)){
				wxUserInfo = CommonUtil.getAttributeToCodeHashMap(code);
				logger.info("微信二次回调，从CodeHashMap中获取微信用户信息：" + wxUserInfo);
			}else{
				wxUserInfo = WxApi.getWxUserInfo(WxApi.getOauth2Token(code));
			}
			if(wxUserInfo == null ){	        	
	        	logger.error(Constants.ERROR_HEAD_INFO + "获取微信用户信息失败");
	        	return wxLogin(modelMap);//重定向登陆页	        	
	        }      
			CommonUtil.setAttributeCodeHashMap(code, wxUserInfo);
			CommonUtil.setAttribute("wx_user_info", wxUserInfo);
	        User user  = userMapper.queryUserByOpenid( wxUserInfo.getOpenId());
	        if (user == null || user.getType() == null) {
	        	modelMap.addAttribute("isbind", 1);
	        	modelMap.addAttribute("wx_user", JSONObject.fromObject(wxUserInfo));
	        	return "bks_wap/roles_choose";
	        }
	        CommonUtil.login(new MyUsernamePasswordToken(user.getOpenid()));
	        JSONObject userJson = JSONObject.fromObject(user);				
	        CommonUtil.setAttribute("userJson", userJson);
	        CommonUtil.setAttribute("user", user);
	        if(user.getType() == 3){
	        	return "bks_wap/public_list";
	        }else{
	        	return "bks_wap/home";
	        }   
		} catch (IncorrectCredentialsException e) {
			e.printStackTrace();
			return "error/404";
	    }
	}

	@Override
	public ResponseResult<Void> bindPublic(WxUserInfoOut wxUserInfoOut, HttpServletRequest request, ModelMap modelMap) {
		ResponseResult<Void> rr = null;
		try {
			WxUserInfoOut wxUserInfo =  (WxUserInfoOut)CommonUtil.getAttribute("wx_user_info");	
			Date createTime = new Date();
	        User user = new User();
	        String uuid = CommonUtil.getUUID();
	        user.setOpenid(wxUserInfo.getOpenId());
	        user.setUsername(wxUserInfo.getNickname());
	        user.setSex(wxUserInfo.getSex());
	        user.setHeadUrl(wxUserInfo.getHeadimgurl());
	        user.setUuid(uuid);
	        user.setDepartmentId(220);//默认消费者
	        user.setPassword(CommonUtil.getEncrpytedPassword(Constants.MD5, Constants.INITIAL_PASSWORD, uuid, 1024));
	        user.setType(3);//公众
	        user.setCreateTime(createTime);
	        userMapper.insert(user);
	        CommonUtil.login(new MyUsernamePasswordToken(user.getOpenid()));
	        JSONObject userJson = JSONObject.fromObject(user);	
	        CommonUtil.setAttribute("userJson", userJson);
	        CommonUtil.setAttribute("user", user);
	        rr = new ResponseResult<>(ResponseResult.SUCCESS,"绑定成功！"); 
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("绑定用户类型:大众错误信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
			rr = new ResponseResult<>(ResponseResult.ERROR,"绑定失败！"); 
		}
		return rr;
	}

	@Override
	public ResponseResult<Void> bindUnit(String businessLicenseCode, Integer roleId, HttpServletRequest request, ModelMap modelMap) {
		ResponseResult<Void> rr	= null;
		try {
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession();
			WxUserInfoOut wxUserInfo =  (WxUserInfoOut)session.getAttribute("wx_user_info");
			Unit unit = unitMapper.queryUnit(businessLicenseCode); 
			if (unit == null) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"主体信息不存在!"); 
			}else{
				Date createTime = new Date();
		        User user = new User();
		        String uuid = CommonUtil.getUUID();
		        user.setOpenid(wxUserInfo.getOpenId());
		        user.setUsername(wxUserInfo.getNickname());
		        user.setSex(wxUserInfo.getSex());
		        user.setHeadUrl(wxUserInfo.getHeadimgurl());
		        user.setUuid(uuid); 
		        user.setPassword(CommonUtil.getEncrpytedPassword(Constants.MD5, Constants.INITIAL_PASSWORD, uuid, 1024));
		        user.setType(2);//主体人员
		        user.setUnitId(unit.getUnitId());
		        user.setCreateTime(createTime);
		        if(roleId != null){//若角色不为空则赋予相应权限
		        	Role role = roleMapper.selectById(roleId);
		        	user.setAuthorization(role.getRoleAuthorization());
		        	user.setRoleId(roleId);
		        }else{
		        	//TODO 默认授权
		        	//user.setAuthorization();
		        	//user.setRoleId();
		        }
		        userMapper.insert(user);
		        subject.login(new MyUsernamePasswordToken(user.getOpenid()));
		        JSONObject userJson = JSONObject.fromObject(user);	
				session.setAttribute("userJson", userJson);
				session.setAttribute("user", user);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"绑定成功！");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("绑定用户类型:主体人员/监管人员错误信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
			rr = new ResponseResult<>(ResponseResult.ERROR,"绑定失败!");
		}
		return rr;
	}


	
	@Override
	public String createUnitPage(HttpServletRequest request, ModelMap modelMap) {
		//进入企业注册页
		return "bks_wap/coopration_add";
	}
	
	
	@Override
	public ResponseResult<Void> createBindUnit(String unitName, String businessLicenseCode, MultipartFile file, MultipartFile file1,
			Integer unitType, HttpServletRequest request, ModelMap modelMap) {
		ResponseResult<Void> rr = null;
		try {			
			GetCommonUser get = new GetCommonUser();
			String uuid = CommonUtil.getUUID();
			String businessLicensepath = get.uoladimg(file,uuid);
			String productionLicensepath = get.uoladimg(file1,uuid);
			if (unitMapper.queryUnit(businessLicenseCode) != null) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"社会统一信用代码已重复，注册失败！");
			}else if (businessLicensepath == null) {
				rr=new ResponseResult<Void>(ResponseResult.ERROR,"营业执照上传异常,人员信息添加失败！");
			}else if (productionLicensepath == null) {
				rr = new ResponseResult<Void>(ResponseResult.ERROR,"许可证上传异常,人员信息添加失败！");
			}else{
				WxUserInfoOut wxUserInfo =  (WxUserInfoOut)CommonUtil.getAttribute("wx_user_info");				
				Date createTime = new Date();
				Unit unit = new Unit();
				unit.setUnitName(unitName);
				unit.setBusinessLicenseCode(businessLicenseCode);
				unit.setBusinessLicense(businessLicensepath);
				unit.setProductionLicense(productionLicensepath);
				unit.setUnitType(unitType);
				unit.setCreateTime(createTime);
				unitMapper.insert(unit);
				//TODO 创建部门
				//TODO 创建角色
				
		        User user = new User();		        
		        user.setOpenid(wxUserInfo.getOpenId());
		        user.setUsername(wxUserInfo.getNickname());
		        user.setSex(wxUserInfo.getSex());
		        user.setHeadUrl(wxUserInfo.getHeadimgurl());
		        user.setUuid(uuid); 
		        user.setPassword(CommonUtil.getEncrpytedPassword(Constants.MD5, Constants.INITIAL_PASSWORD, uuid, 1024));
		        user.setType(2);//主体人员
		        user.setUnitId(unit.getUnitId());
		        user.setCreateTime(createTime);
		        //TODO 默认授权
		        //user.setAuthorization();
		        //user.setRoleId();
		        userMapper.insert(user);
		        CommonUtil.login(new MyUsernamePasswordToken(user.getOpenid()));
		        JSONObject userJson = JSONObject.fromObject(user);	
				CommonUtil.setAttribute("userJson", userJson);
				CommonUtil.setAttribute("user", user);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			}
		}catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"注册失败！");
		}
		return rr;
	}

	


	@Override
	public ResponseResult<Void> bindSupervise(String phone, String password, Integer type, HttpServletRequest request, ModelMap modelMap) {
		ResponseResult<Void> rr = null;
		try {
			User user = userMapper.queryUserByPhone(phone);
			if (user == null) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"手机账户不存在，账户绑定失败！");
			}else if (!user.getPassword().equals(CommonUtil.getEncrpytedPassword(Constants.MD5, password, user.getUuid(), 1024))) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"密码错误，账户绑定失败！");
			}else if(!user.getType().equals(type)){
				if(type.equals(1)){
					rr = new ResponseResult<>(ResponseResult.ERROR,"监管账户信息不存在，账户绑定失败！");
				}else{
					rr = new ResponseResult<>(ResponseResult.ERROR,"主体账户信息不存在，账户绑定失败！");
				}
			}else if(StringUtils.isNotEmpty(user.getOpenid())){
				rr = new ResponseResult<>(ResponseResult.ERROR,"该账户已绑定过微信，操作失败！");
			}else{
				WxUserInfoOut wxUserInfo =  (WxUserInfoOut)CommonUtil.getAttribute("wx_user_info");	
				user.setHeadUrl(wxUserInfo.getHeadimgurl());
				user.setSex(wxUserInfo.getSex());
				user.setUsername(StringUtils.isEmpty(user.getUsername())? wxUserInfo.getNickname() : null);
				user.setOpenid(wxUserInfo.getOpenId());
				userMapper.updateById(user);
				CommonUtil.login(new MyUsernamePasswordToken(wxUserInfo.getOpenId()));
				CommonUtil.setAttribute("userJson", JSONObject.fromObject(user));
				CommonUtil.setAttribute("user", user);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"绑定失败！");
		}
		return rr;
	}

	@Override
	public String getUnitList(ModelMap modelMap) {
		// 查询企业列表 企业类型不包括1
		
		String view=null;
		try {
			List<Unit> unitList = unitMapper.select(" n.unit_type BETWEEN 2 AND 4 ", " n.create_time DESC", null, null);
			modelMap.addAttribute("unitList", unitList);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户进入企业信息列表页面成功！");
			view="bks_wap/public_list";
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(Constants.ERROR_HEAD_INFO+ "用户进入企业信息列表页面失败！原因："+e.getMessage());
		}
		
		return view;
	}

	@Override
	public String selectUnitDetail(ModelMap modelMap, Integer unitId) {
		// TODO Auto-generated method stub
		Unit unitDetail = null;
		List<Unit> list = unitMapper.select(" unit_id = '" + unitId + "'", null, null, null);
		try {
			
				unitDetail = list.get(0);
				modelMap.addAttribute("unitDetail", unitDetail);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Constants.ERROR_HEAD_INFO + "企业资料修改失败，原因："+e.getMessage());
		}
		return "bks_wap/public_detal";
	}
	
}
