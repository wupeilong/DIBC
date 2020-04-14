package cn.dibcbks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.dibcbks.entity.TimeInterval;
import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.service.IVideoAddressService;
import cn.dibcbks.util.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
@Api(value="管理端监控视频维护controller",tags="监控视频维护接口")
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
		@ApiOperation(value="查询企业列表",tags="根据企业列表进入对应企业监控视频列表")
		@RequestMapping("/web_unitList")
		public String VideoCRUD(){
			
			return "bks_web/video/unitList";
		}
		
		/**
		 * 进入视频地址列表页
		 * @return
		 */
		@ApiOperation(value="根据企业id跳转视频列表页面",tags="企业id必传")
		@RequestMapping("/web_showaddresslist")
		public String SHowVdieAddressList(ModelMap modelMap,@RequestParam(value="unitId",required=true)Integer unitId){
			
			
			//根据id查询视频流地址
			iVideoAddressService.SelectVideoAddress(modelMap, unitId);
			
			//跳转视频维护界面
			return  "bks_web/video/video_CRUD";
		}
		
		/**
		 * 控制视频流地址修改的跳转
		 * 
		 */
		@ApiOperation(value="跳转监控视频信息修改界面",tags="需要传入企业id和选中的监控视频id")
		@RequestMapping("/updateVideoInfo")
		public  String updateVideoAddress(ModelMap modelMap,@RequestParam(value="unitId",required=true)Integer unitId,@RequestParam(value="videoId",required=true)Integer videoId){
			
			iVideoAddressService.getVideoAddressBeanById(modelMap,unitId, videoId);
			
			return "bks_web/video/videoInfoUpdate";
		}
		
		
		/**
		 * 保存或者修改视频流地址
		 * @return
		 */
		@ApiOperation(value="修改或者保存监控视频信息接口",tags="监控视频信息存在则修改不存在则保存",response=ResponseResult.class)
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
		@ApiOperation(value="根据选中监控视频id删除该监控视频",tags="必须传入监控视频id",response=ResponseResult.class)
		@RequestMapping("/web_videodelete")
		@ResponseBody
		public ResponseResult<?> DeleteVideoAddress(@RequestParam(value="videoId",required=true)Integer videoId){
			return iVideoAddressService.DeleteVideoAddress(videoId);
		}
		
		
}
