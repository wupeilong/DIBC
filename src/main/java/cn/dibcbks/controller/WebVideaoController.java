package cn.dibcbks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.dibcbks.entity.TimeInterval;
import cn.dibcbks.entity.VideoAddress;
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
		
		
		/**
		 * 跳转企业列表
		 */
		@RequestMapping("/web_unitList")
		public String VideoCRUD(){
			
			return "bks_web/video/unitList";
		}
		
		/**
		 * 进入视频地址列表页
		 * @return
		 */
		@RequestMapping("/web_showaddresslist")
		public String SHowVdieAddressList(ModelMap modelMap,Integer unitId){
			
			
			//根据id查询视频流地址
			iVideoAddressService.SelectVideoAddress(modelMap, unitId);
			
			//跳转视频维护界面
			return  "bks_web/video/video_CRUD";
		}
		
		/**
		 * 控制视频流地址修改的跳转
		 * 
		 */
		@RequestMapping("/updateVideoInfo")
		public  String updateVideoAddress(ModelMap modelMap,Integer unitId,Integer videoId){
			
			iVideoAddressService.getVideoAddressBeanById(modelMap,unitId, videoId);
			
			return "bks_web/video/videoInfoUpdate";
		}
		
		
		/**
		 * 保存或者修改视频流地址
		 * @return
		 */
		@RequestMapping("/web_videosave")
		@ResponseBody
		public ResponseResult<?> VideoAdressSave(VideoAddress videoAddress){
			
			
			return iVideoAddressService.VideoAdressSave(videoAddress);
		}
		
		/**
		 * 删除视频流地址
		 * @param videoId
		 * @return
		 */
		@RequestMapping("/web_videodelete")
		@ResponseBody
		public ResponseResult<?> DeleteVideoAddress(Integer videoId){
			return iVideoAddressService.DeleteVideoAddress(videoId);
		}
		
		
}
