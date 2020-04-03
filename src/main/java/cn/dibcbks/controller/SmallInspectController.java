package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.ICheckService;

/**
 * 小程序端监管采集控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/small_ins")
public class SmallInspectController {
	
	@Autowired
	private ICheckService iCheckService;
	
	
}
