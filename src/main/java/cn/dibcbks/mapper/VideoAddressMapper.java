package cn.dibcbks.mapper;

import java.util.List;

import cn.dibcbks.entity.VideoAddress;
import cn.dibcbks.util.ResponseResult;

public interface VideoAddressMapper {
	/**
	 * 根据企业id查看监控视频
	 */
	List<VideoAddress> SelectVideoAddressById(Integer id);
	
	/**
	 * 根据videoid查询视频流地址
	 * @param videoId
	 * @return
	 */
	
	VideoAddress SelectAddressByVideoId(Integer videoId);
	
	
	/**
	 * 保存视频流地址
	 * @param videoAddress
	 * @return
	 */
	Integer InsertAddress(VideoAddress videoAddress);
	
	/**
	 * 修改视频流地址
	 * @param videoAddress
	 * @return
	 */
	
	Integer UpdateAddress(VideoAddress videoAddress);

	/**
	 * 删除视频流地址
	 * @param videoId
	 * @return
	 */
	Integer DeleteAddressById(Integer videoId);

}
