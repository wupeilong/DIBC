package cn.dibcbks.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IDistributionService;

/**
 * 小程序端配送控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/small_dry")
public class SmallDeliveryController {
	
	@Autowired
	private IDistributionService iDistributionService;


}
