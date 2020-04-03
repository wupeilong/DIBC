package cn.dibcbks.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IDistributionService;



/**
 * PC端配送控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/web_dry")
public class WebDeliveryController {
	
	@Autowired
	private IDistributionService iDistributionService;


}
