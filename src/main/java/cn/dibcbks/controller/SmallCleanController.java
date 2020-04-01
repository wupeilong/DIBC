package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IDisinfectionService;

/**
 * 小程序端清洗消毒控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/small_clean")
public class SmallCleanController {
	@Autowired
	private IDisinfectionService iDisinfectionService;

}
