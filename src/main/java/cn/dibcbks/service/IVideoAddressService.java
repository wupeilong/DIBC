package cn.dibcbks.service;

import org.springframework.ui.ModelMap;

import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.util.ResponseResult;

public interface IVideoAddressService {
	
		/**
		 * **
		 * 根据videoId查询一个视频流对象
		 * @param videoId
		 * @return
		 */
		void getVideoAddressBeanById(ModelMap modelMap,Integer unitId, Integer vidoeId);
	
		/**
		 * 根据videoId查询一个视频流对象
		 * @param videoId
		 * @return
		 */
	    VideoAddress getVideAddressBeanById(Integer videoId);
	    
	    /**
	     * 根据企业id查询视频流
	     * @param map
	     * @param id
	     * @return
	     */
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

		/**
		 * 
		 * @param modelMap
		 * @return
		 */
		String selectUnitVideoList(ModelMap modelMap);

		/**
		 * 
		 * @param modelMap
		 * @return
		 */
		String selectTimeInterval(ModelMap modelMap);

}
