package cn.dibcbks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
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
import io.swagger.annotations.ApiOperation;
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
	public String VideoScan(ModelMap modelMap){
		return iVideoAddressService.selectUnitVideoList(modelMap);
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
	 * 根据videoid查询视频流
	 * 
	 */
	@RequestMapping("/wap_getAddresByid")
	@ResponseBody
	public VideoAddress getVideBeanByid(Integer videoId){
		return iVideoAddressService.getVideAddressBeanById(videoId);
	}
	
	
	
	@ApiOperation("公众是否可以查看监控")
	@RequestMapping("/monitoring")
	@ResponseBody
	public ResponseResult<Void> viweMonitoring(){
		
		return iVideoAddressService.viweMonitoring();
	}
}
