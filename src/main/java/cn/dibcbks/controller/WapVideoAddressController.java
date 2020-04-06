package cn.dibcbks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.dibcbks.service.IVideoAddressService;
import io.swagger.annotations.Api;
/*
 * 视屏流控制器
 */
@Api(value="VideoController",tags="视频流控制器")
@Controller
@RequestMapping("/wap_video")
public class WapVideoAddressController {
	@Autowired
	IVideoAddressService iVideoAddressService;
	
	/**
	 * 通过视频流查看监控视频
	 */
	@RequestMapping("/wap_videoscan")
	public String VideoScan(){
		System.out.println("控制层=================================");
		return "bks_wap/video";
		//return "bks_wap/monitor";
	}
	
	/**
	 * 进入视频信息详情页
	 * @return
	 */
	@RequestMapping("/wap_videodetal")
	public String CooprationDetal(ModelMap modelMap,Integer unitId){	
		
		return  iVideoAddressService.SelectVideoAddress(modelMap, unitId);
	}
	

}
