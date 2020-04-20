package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IProcurementService;

/**
 * PC端采购控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/web_pro")
public class WebProcurementController {
	@Autowired
	private IProcurementService iProcurementService;
	
}
