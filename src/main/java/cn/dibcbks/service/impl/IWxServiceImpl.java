package cn.dibcbks.service.impl;


import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.catalina.security.SecurityUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import cn.dibcbks.entity.User;
import cn.dibcbks.entity.WxAccessToken;
import cn.dibcbks.filter.MyUsernamePasswordToken;
import cn.dibcbks.mapper.UserMapper;
import cn.dibcbks.mapper.WxAccessTokenMapper;
import cn.dibcbks.service.IWxService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.DateUtil;
import cn.dibcbks.util.ResponseResult;
import cn.dibcbks.util.wx.AccessTokenOut;
import cn.dibcbks.util.wx.WxApi;
import cn.dibcbks.util.wx.WxUserInfoOut;
import net.sf.json.JSONObject;

@Service
public class IWxServiceImpl implements IWxService {
	private static final Logger logger = LogManager.getLogger(IWxServiceImpl.class.getName());
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private WxAccessTokenMapper wxAccessTokenMapper;
	
	@Override
	public String wxLogin(ModelMap modelMap) {
		WxAccessToken token = wxAccessTokenMapper.selectById("1");
		if(token == null){
            //首次获取微信token存入数据库
             AccessTokenOut accessTokenOut = WxApi.getWxAccessToken();
             WxAccessToken insert = new WxAccessToken();
             insert.setId("1");
             insert.setAccessToken(accessTokenOut.getAccessToken());
             insert.setExpiresIn(accessTokenOut.getExpiresIn());
             insert.setCreateTime(new Date());
             wxAccessTokenMapper.insert(insert);
             token = insert;
             logger.info("首次获取微信access_token信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
         } else {
             //当前时间
             if(DateUtil.dateCompare(DateUtil.dateAddMinutes(token.getCreateTime(),110),new Date()) < 0) {
                 //超过有效期，重新获取
                 AccessTokenOut accessTokenOut = WxApi.getWxAccessToken();
                 token.setAccessToken(accessTokenOut.getAccessToken());
                 token.setExpiresIn(accessTokenOut.getExpiresIn());
                 token.setCreateTime(new Date());
                 wxAccessTokenMapper.updateById(token);
                 logger.info("更新微信access_token信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
             }
         }
		String shortUrl = WxApi.getOAuth2Url(token.getAccessToken());
	    modelMap.addAttribute("wechat_login_url", shortUrl);
	    return "bks_wap/login";
	}

	@Override
	public String wxOauth2Redirect(String code, HttpServletRequest request ,ModelMap modelMap) {
		try {
        	//登录写入系统
			WxUserInfoOut wxUserInfo = WxApi.getWxUserInfo(WxApi.getOauth2Token(code));
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession();
	        if (wxUserInfo == null) {
	            logger.info("获取微信用户信息失败");           
	            return "error/404";
	        }        
	        User user  = userMapper.queryUserByOpenid( wxUserInfo.getOpenId());
	        if (user == null) {
	        	session.setAttribute("wx_user_info", wxUserInfo);
	        	modelMap.addAttribute("isbind", 1);
	        	return "bks_wap/login";
	            /*Date createTime = new Date();
	            user = new User();
	            String uuid = CommonUtil.getUUID();
	            user.setOpenid(wxUserInfo.getOpenId());
	            user.setUsername(wxUserInfo.getNickname());
	            user.setSex(wxUserInfo.getSex());
	            user.setHeadUrl(wxUserInfo.getHeadimgurl());
	            user.setUuid(uuid); 
	            user.setPassword(CommonUtil.getEncrpytedPassword(Constants.MD5, Constants.INITIAL_PASSWORD, uuid, 1024));
	            user.setCreateTime(createTime);
	            userMapper.insert(user);*/
	        }
	        subject.login(new MyUsernamePasswordToken(user.getOpenid()));
	        JSONObject userJson = JSONObject.fromObject(user);				
			session.setAttribute("userJson", userJson);
			session.setAttribute("user", user);
	        if(user.getType() == 1){//进入大众端首页
	        	return "bks_wap/public_home";
	        }else{//进入主体、监管首页
	        	return "bks_wap/home";
	        }   
		} catch (IncorrectCredentialsException e) {
			e.printStackTrace();
			return "error/404";
	    }
	}

	@Override
	public String wxBangdingUserType(HttpServletRequest request, ModelMap modelMap) {
		try {
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession();
			WxUserInfoOut wxUserInfo =  (WxUserInfoOut)session.getAttribute("wx_user_info");
			Date createTime = new Date();
	        User user = new User();
	        String uuid = CommonUtil.getUUID();
	        user.setOpenid(wxUserInfo.getOpenId());
	        user.setUsername(wxUserInfo.getNickname());
	        user.setSex(wxUserInfo.getSex());
	        user.setHeadUrl(wxUserInfo.getHeadimgurl());
	        user.setUuid(uuid); 
	        user.setPassword(CommonUtil.getEncrpytedPassword(Constants.MD5, Constants.INITIAL_PASSWORD, uuid, 1024));
	        user.setType(3);
	        user.setCreateTime(createTime);
	        userMapper.insert(user);
	        subject.login(new MyUsernamePasswordToken(user.getOpenid()));
	        JSONObject userJson = JSONObject.fromObject(user);				
			session.setAttribute("userJson", userJson);
			session.setAttribute("user", user);
			//进入大众首页
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("绑定用户类型错误信息 >>>>>>> " + DateUtil.dateFormat(new Date(),DateUtil.DATE_TIME_PATTERN));
			return "error/404";
		}
		
	}

}
