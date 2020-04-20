package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IUnqualifiedService;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: UnqualifiedMapper
 * @Description: PC端不合格记录控制器
 * @Date: 2020-03-25 02:59
 */
@RequestMapping("/web_unq")
@Controller
public class WebUnqualifiedController {
	@Autowired
	private IUnqualifiedService iUnqualifiedService;
	

}
