package cn.dibcbks.filter;

import java.io.IOException;
import java.net.InetAddress;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

/**
 * Shiro 重定向登陆地址
 * @author Administrator
 *
 */
public class MyFormAuthenticationFilter  extends FormAuthenticationFilter {
	
	 /**
     * 重写登录地址
     */
    @Override
    protected void redirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        String loginUrl = getLoginUrl();
        String url = req.getRequestURI();        
//        System.out.println("请求服务器域名:" + req.getServerName());  
//        System.out.println("请求服务器端口:" + req.getServerPort());
//        System.out.println("请求远程主机（客服端）域名:" + req.getRemoteHost());          
//        System.out.println("请求的远程主机（客户端）IP:" + req.getRemoteAddr());  
//        System.out.println("===========================================");
//        System.out.println("请求的本地（服务端）域名:" + req.getLocalName());
//        System.out.println("请求的本地（服务端）域名:" + req.getLocalAddr());
//        System.out.println("请求的本地（服务端）端口:" + req.getLocalPort());
//        System.out.println("本地（服务端）IP" + InetAddress.getLocalHost().getAddress());        
//        System.out.println("===========================================");  
//        System.out.println("请求的网址全路径:" + req.getRequestURL());
//        System.out.println("请求的工程名和请求路径:" + req.getRequestURI());
//        System.out.println("请求的上下文:" + req.getContextPath());
//        System.out.println("前服务器servlet映射的路径:" + req.getServletPath());  
//        System.out.println("当前请求的协议版本:" + req.getProtocol());
//        System.out.println("当前请求的协议类型:" + req.getScheme());
        if (url.contains("web")) {
            loginUrl = "http://edt.gzws.online:8081/web_login";
            //loginUrl = "http://127.0.0.1:8080/web_login";
        }else{
        	loginUrl = "http://edt.gzws.online:8081/wx_login";
        	//loginUrl = "http://127.0.0.1:8080/wx_login";
        }
        WebUtils.issueRedirect(request, response, loginUrl);
    }

   
}
