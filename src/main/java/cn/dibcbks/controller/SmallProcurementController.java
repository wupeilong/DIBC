package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IProcurementService;

/**
 * 小程序端采购控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/small_pro")
public class SmallProcurementController {
	@Autowired
	private IProcurementService iProcurementService;

}
