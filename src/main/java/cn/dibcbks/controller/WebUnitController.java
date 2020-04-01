package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IUnitService;
/**
 * PC端企业控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/web_unit")
public class WebUnitController {
	@Autowired
	private IUnitService iUnitService;


	
}
