package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.ICheckService;

/**
 * PC端监管采集控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/web_ins")
public class WebInspectController {
	
	@Autowired
	private ICheckService iCheckService;
	

}
