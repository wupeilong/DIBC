package cn.dibcbks.service;

import org.springframework.ui.ModelMap;

public interface IAuthorizationService {
	
	/**
	 * 进入添加部门信息页
	 * @param modelMap
	 * @return
	 */
	String addDepartmentPag(ModelMap modelMap);

}
