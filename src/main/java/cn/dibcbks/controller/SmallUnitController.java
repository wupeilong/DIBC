package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IUnitService;
/**
 * 小程序端企业控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/small_unit")
public class SmallUnitController {
	@Autowired
	private IUnitService iUnitService;
	
	
}
