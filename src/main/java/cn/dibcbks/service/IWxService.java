package cn.dibcbks.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.ModelMap;

public interface IWxService {
	
	/**
	 * 微信登录获取网页授权地址页
	 * @param modelMap
	 * @return
	 */
	String wxLogin(ModelMap modelMap);

	/**
	 * 处理网页授权回调
	 * @param code
	 * @param request
	 * @return
	 */
	String wxOauth2Redirect(String code, HttpServletRequest request,ModelMap modelMap);

	/**
	 * 绑定用户类型:大众
	 * @param request
	 * @param modelMap
	 * @return
	 */
	String wxBangdingUserType(HttpServletRequest request, ModelMap modelMap);

}
