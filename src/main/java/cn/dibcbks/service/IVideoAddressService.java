package cn.dibcbks.service;

import org.springframework.ui.ModelMap;

import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.util.ResponseResult;

public interface IVideoAddressService {
	
	 String SelectVideoAddress(ModelMap map,Integer id);
	 
	 
	 	/**
		 * 保存或者修改视频流地址
		 * @return
		 */
		public ResponseResult<?> VideoAdressSave( VideoAddress videoAddress);
		
		
		
		/**
		 * 删除视频流地址
		 * @param videoId
		 * @return
		 */
		public ResponseResult<?> DeleteVideoAddress(Integer videoId);

}
