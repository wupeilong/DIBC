package cn.dibcbks.filter;

import java.io.IOException;
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
        if (url.contains("web")) {
            loginUrl = "/web_login";
        }else{
        	loginUrl = "/wap_login";
        }
        WebUtils.issueRedirect(request, response, loginUrl);
    }

   
}
