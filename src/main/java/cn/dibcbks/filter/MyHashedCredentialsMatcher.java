package cn.dibcbks.filter;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;

/**
 * 自定义验证匹配
 * @author A
 *
 */
public class MyHashedCredentialsMatcher extends HashedCredentialsMatcher{
	 @Override
	    public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {
	        MyUsernamePasswordToken token = (MyUsernamePasswordToken) authcToken;
	        //免密登录
	        if(token.getLoginType().equals(LoginType.NOPASSWD)){
	            return true;
	        }
	       //不是免密登录，调用父类的方法
	       return super.doCredentialsMatch(authcToken, info);
	    }

}
