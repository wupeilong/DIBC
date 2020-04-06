package cn.dibcbks.mapper;

import java.util.List;

import cn.dibcbks.entity.VideoAddress;

public interface VideoAddressMapper {
	/**
	 * 企业监控视频地址查询
	 */
	List<VideoAddress> SelectVideoAddressById(Integer id);

}
