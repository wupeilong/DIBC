package cn.dibcbks.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import cn.dibcbks.mapper.UnitMapper;
import cn.dibcbks.service.IAuthorizationService;

@Service
public class IAuthorizationServiceImpl implements IAuthorizationService {
	@Autowired
	private UnitMapper unitMapper;
	@Autowired
	private MenuMa
	
	@Override
	public String addDepartmentPag(ModelMap modelMap) {
		
		return "bks_wap/department_add";
	}
	
}
