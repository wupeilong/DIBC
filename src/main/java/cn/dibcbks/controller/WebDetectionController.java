package cn.dibcbks.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IDetectionService;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: DetectionController
 * @Description: PC端多频检查控制器
 * @Date: 2020-03-24 15:39
 */
@Controller
@RequestMapping("/web_det")
public class WebDetectionController {
		
	@Autowired
	private IDetectionService iDetectionService;

}
