package cn.dibcbks.util;


import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.Socket;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import cn.dibcbks.entity.User;
import cn.dibcbks.util.wx.MyX509TrustManager;
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
	 * 默认主机名验证程序
	 */
	public static HostnameVerifier hv = new HostnameVerifier() { public boolean verify(String urlHostName, SSLSession session) { return true; } }; 
	
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
	
	/**
	 * 获取Cookie中值
	 * @param request 
	 * @param cookieName
	 * @return
	 */
	public static String getCookieValue(HttpServletRequest request,String cookieName){
		String cookieValue = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null ) {
			for (Cookie cookie: cookies) {
				if (cookie.getName().equals(cookieName)) {
					cookieValue = cookie.getValue();
					break;
				}
				
			}
		}	
		return cookieValue;
	}
	
	
	/**
	 * 获取远程服务器  域名+端口+上下文
	 * @param request
	 * @return
	 */
	public static String getServerPathPrefix(HttpServletRequest request){
		
		return "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	}
	
	
	
	 /**
	  * 网络IP状态测试
	  * @param remoteInetAddr IP地址
	  * @param port 端口
	  * @return
	  */
	public static boolean isConnect(String remoteInetAddr, Integer port){
		boolean flag = false;
		String tempUrl = remoteInetAddr.substring(0, 5);//取出地址前5位
		if(tempUrl.contains("http")){//判断传过来的地址中是否有http
			if(tempUrl.equals("https")){//判断服务器是否是https协议
				try {
					TrustManager[] tm = { new MyX509TrustManager() };//添加SSL 信任所有Https证书
					SSLContext sc = SSLContext.getInstance("SSL", "SunJSSE");
					sc.init(null, tm, null);
					HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
				} catch (Exception e) {
					e.printStackTrace();
				}
				HttpsURLConnection.setDefaultHostnameVerifier(hv);//设置默认主机名验证程序  
			}
			flag = isConnectServer(remoteInetAddr);
		}else{//传过来的是IP地址
			flag = isReachable(remoteInetAddr,port == null ? Constants.DEFAULT_PORT : port);
		}		
		return flag;
	}
	
	/**
	 * 网络地址状态测试
	 * @param remoteInetAddr 网络地址
	 * @return
	 */
	public static boolean isConnect(String remoteInetAddr){
		return isConnect(remoteInetAddr,null);
	}
	/**
	 * 传入需要连接的IP，返回是否连接成功
	 * @param remoteInetAddr IP地址
	 * @return
	 */
	public static boolean isReachable(String remoteInetAddr,Integer port) {// IP地址是否可达，相当于Ping命令
//		boolean reachable = false;
//		try {
//			InetAddress address = InetAddress.getByName(remoteInetAddr);
//			reachable = address.isReachable(1500);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return reachable;
        Socket connect = new Socket();
        try {            
            connect.connect(new InetSocketAddress(remoteInetAddr, port));//建立连接
            connect.setSoTimeout(2 * 1000);//设置超时2秒            
            boolean res = connect.isConnected();//通过现有方法查看连通状态
            return res;
        } catch (IOException e) {
            return false;
        } finally {
            try {
                connect.close();
            } catch (IOException e) {
            	System.out.println("关闭socket异常" + remoteInetAddr + ":" + port);
            }
        }
	}


	/**
	 * 传入需要测试的服务器，返回是否连接成功
	 * @param serverUrl 服务器路径
	 * @return
	 */
	public static boolean isConnectServer(String serverUrl) {
		boolean connFlag = false;
		URL url;
		HttpURLConnection conn = null;
		try {
			url = new URL(serverUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(2 * 1000);
			if (conn.getResponseCode() == 200) {// 如果连接成功则设置为true
			connFlag = true;
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			conn.disconnect();
		}
		return connFlag;
	}

	
	public static void main(String[] args) {
		String uuid = "1";
		System.out.println("uuid: " + uuid);
		System.out.println("密码: " + getEncrpytedPassword(Constants.MD5,"123456", uuid, 1024));		
		System.out.println("3HKCC14081YFKKQ ： " + isConnect("http://wx19.sdvideo.cn:9999/3HKCC14081YFKKQ_0.m3u8?key=15dccdba2aa8b1c01d9d743d10285c0c"));
		System.out.println("3HKCA33014TVFE3 ： " + isConnect("http://wx19.sdvideo.cn:9999/3HKCA33014TVFE3_0.m3u8?key=0edb937d1aeac50dd9f4162f2727d810"));
		String url = "113.125.164.212";
		System.out.println(url + " : " + isConnect(url));
		url = "https://www.baidu.com";
		System.out.println(url + " : " + isConnect(url));
	}
}
