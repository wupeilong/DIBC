package cn.dibcbks.controller;

import cn.dibcbks.service.IAuthorizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value="WapAuthorizationController",tags="权限控制器")
@Controller
@RequestMapping("/wap_auth")
public class WapAuthorizationController {
	@Autowired
	private IAuthorizationService IAuthorizationService;
	
	@ApiOperation(value = "进入添加部门信息页", notes = "进入添加部门信息页")
	@GetMapping("/dep_add_pag")
	public String  addDepartmentPag(ModelMap modelMap) {
		
		return IAuthorizationService.addDepartmentPag(modelMap);
	}
	
}
