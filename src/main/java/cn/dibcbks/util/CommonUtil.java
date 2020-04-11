package cn.dibcbks.util;



import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import cn.dibcbks.entity.User;
import cn.dibcbks.util.wx.WxUserInfoOut;

/**
 * 通用工具类
 * @author Administrator
 *
 */
public class CommonUtil {
	
	/**
	 * 微信Code - key   微信用户信息 - value
	 */
	public static Map<String, WxOauthInfo> codeHashMap = new HashMap<String, WxOauthInfo>();
	
	
	/**
	 * 获取用户UUID
	 * @return
	 */
	public static String getUUID(){
		
		return UUID.randomUUID().toString().toUpperCase();
	}
	

	/**
	 * 哈希加密password
	 * @param hashAlgorithmName 哈希算法名称
	 * @param password 密码
	 * @param uuid 唯一识别码
	 * @param hashIterations 哈希迭代次数
	 * @return
	 */
	public static String getEncrpytedPassword(String hashAlgorithmName, String password, String uuid, Integer hashIterations) {
		
		return new SimpleHash(hashAlgorithmName,password,uuid,hashIterations).toString().toUpperCase();
	}
	
	/**
	 * 获取项目路径
	 * @return
	 */ 
	public static String getPath(){
		
		return new CommonUtil().getClass().getResource("/").getPath().replaceAll("/WEB-INF/classes/", "");
	}
	
	/**
	 * 获取当前登录用户
	 * @return
	 */
	public static User getSessionUser() {
		return (User)SecurityUtils.getSubject().getSession().getAttribute("user");
	}
	
	
	
	/**
	 * 添加 key-value 到SESSION中
	 * @param key
	 * @param value
	 */
	public static void setAttribute(Object key, Object value){
		SecurityUtils.getSubject().getSession().setAttribute(key, value);
	};
	
	/**
	 * 从SESSION中获取value
	 * @param key
	 * @param value
	 */
	public static Object getAttribute(Object key){
		return SecurityUtils.getSubject().getSession().getAttribute(key);
	};
	

	/**
	 * 用户登陆
	 * @param token
	 */
	public static void login(AuthenticationToken token){
		SecurityUtils.getSubject().login(token);
		
	};
	
	
	public static void main(String[] args) {
		String uuid = "1";
		System.out.println("uuid: " + uuid);
		System.out.println("密码: " + getEncrpytedPassword(Constants.MD5,"1",uuid,1024));
	}
	
	/**
	 * 用户是否登陆
	 * @return
	 */
	public static boolean isLogin(){
		return SecurityUtils.getSubject().isAuthenticated();
	}

	
	/**
	 * 判断存入CodeHashMap 是否存 Code
	 * @param code
	 * @param wxUserInfo
	 */
	public static boolean containsCode(String code) {
		
		return codeHashMap.containsKey(code);		
	}
	
	/**
	 *存入Code + WxUserInfoOut
	 * @param code
	 * @param wxUserInfo
	 */
	public static void setAttributeCodeHashMap(String code, WxUserInfoOut wxUserInfo) {
		if(wxUserInfo != null){
			codeHashMap.put(code, new WxOauthInfo(code,wxUserInfo));
		}
			
	}
	
	/**
	 * 查询 WxUserInfoOut
	 * @param code
	 * @return
	 */
	public static WxUserInfoOut getAttributeToCodeHashMap(String code) {	
		
		return codeHashMap.get(code).getWxUserInfoOut();
	}
	
	
}
