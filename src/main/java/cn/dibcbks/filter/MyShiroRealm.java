package cn.dibcbks.filter;



import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import cn.dibcbks.entity.User;
import cn.dibcbks.mapper.UserMapper;
import cn.dibcbks.util.CommonUtil;




/**
* @Title: MyShiroRealm.java
* @Package cn.hqtmain.filter
* @Description:(用一句话描述该文件做什么)
* @author: ZhouLingZhang
* @date 2019年11月27日
* @Copyright:好前途教育
* @version V1.0
*/
public class MyShiroRealm extends AuthorizingRealm{
	private static final Logger logger = LogManager.getLogger(MyShiroRealm.class.getName());
	@Autowired
	private UserMapper userMapper;
	
	//每次验证权限执行
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {	
		String authorization = CommonUtil.getSessionUser().getAuthorization();
		logger.info("【" + CommonUtil.getSessionUser().getUsername() + "】用户的授权信息：" + authorization);
		if(StringUtils.isNotEmpty(authorization)){
			String[] auths = authorization.split(";");
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			if(auths.length > 0){
				for(int i=0;i<auths.length;i++){
					info.addStringPermission(auths[i]);
				}			
				return info;
			}
		}
		return null; 		
	}

	//登录执行
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {		
		String account = (String)token.getPrincipal();
		User user = userMapper.queryUser(account);
		if(user == null){
			user = userMapper.queryUserByPhone(account);
		}
		if(user == null){
			user = userMapper.queryUserByOpenid(account);
		}
		if(user != null){
			this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
			ByteSource byteSource = ByteSource.Util.bytes(user.getUuid());
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(account,user.getPassword(),getName());
			info.setCredentialsSalt(byteSource);
			return info;
		}
		return null;
	}
	
}
