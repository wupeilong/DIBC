package cn.dibcbks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.jndi.cosnaming.IiopUrl.Address;

import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.service.IVideoAddressService;
import cn.dibcbks.util.ResponseResult;
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
	 * 进入企业信息查看监控视频业页面
	 */
	@RequestMapping("/wap_videoscan")
	public String VideoScan(){
		
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
	
	/**
	 * 进入视频地址列表页
	 * @return
	 */
	@RequestMapping("/wap_showaddresslist")
	public String SHowVdieAddressList(ModelMap modelMap,Integer unitId){
		
		//调用视频详情控制层 因为业务,业务逻辑一样，前段渲染不同
		this.CooprationDetal( modelMap, unitId);
		
		return  "bks_wap/video_peration";
	}
	
	/**
	 * 保存或者修改视频流地址
	 * @return
	 */
	@RequestMapping("/wap_videosave")
	@ResponseBody
	public ResponseResult<?> VideoAdressSave( VideoAddress videoAddress){
		
		return iVideoAddressService.VideoAdressSave(videoAddress);
	}
	
	
	/**
	 * 删除视频流地址
	 * @param videoId
	 * @return
	 */
	@RequestMapping("/wap_videodelete")
	@ResponseBody
	public ResponseResult<?> DeleteVideoAddress(Integer videoId){
		return iVideoAddressService.DeleteVideoAddress(videoId);
	}
	
	/**
	 * 视频地址维护
	 */
	@RequestMapping("/wap_videoCRUD")
	public String VideoCRUD(){
		return "bks_wap/video_crud";
	}
}
