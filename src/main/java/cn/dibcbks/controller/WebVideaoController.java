package cn.dibcbks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.dibcbks.entity.TimeInterval;
import cn.dibcbks.service.IVideoAddressService;
import cn.dibcbks.util.ResponseResult;
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
		
		@ApiOperation("修改视频观看时间段")
		@RequestMapping("/time_update")
		@ResponseBody
		private ResponseResult<Void> updateTimeInterval(TimeInterval timeInterval){
			
			return iVideoAddressService.updateTimeInterval(timeInterval);
		}
}
