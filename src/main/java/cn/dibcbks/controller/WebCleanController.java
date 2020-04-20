package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IDisinfectionService;

/**
 * PC端清洗消毒控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/web_clean")
public class WebCleanController {
	@Autowired
	private IDisinfectionService iDisinfectionService;

}
