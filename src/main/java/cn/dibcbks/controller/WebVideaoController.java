package cn.dibcbks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.dibcbks.service.IVideoAddressService;
import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/web_video")
public class WebVideaoController {
		@Autowired
		private IVideoAddressService iVideoAddressService; 
	
		@ApiOperation("视频观看时间段页")
		@RequestMapping("/time_Interval")
		private String selectTimeInterval(ModelMap modelMap){
			
			return iVideoAddressService.selectTimeInterval(modelMap);
		}
		
}
