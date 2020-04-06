package cn.dibcbks.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

/**
* @Title: MyShiroFilter.java
* @Package cn.hqtmain.filter
* @Description:(用一句话描述该文件做什么)
* @author: ZhouLingZhang
* @date 2019年11月28日
* @Copyright:好前途教育
* @version V1.0
*/
public class MyShiroFilter extends AuthorizationFilter {

	
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		Subject subject = getSubject(request, response);
		String[] perms = (String[]) mappedValue;

		boolean isPermitted = true;
		if (perms != null && perms.length > 0) {
			if (perms.length == 1) {
				if (!subject.isPermitted(perms[0])) {
					isPermitted = false;
				}
			} else {
				if (!subject.isPermittedAll(perms)) {
					isPermitted = false;
				}
			}
		}
		return isPermitted;
	}


}
