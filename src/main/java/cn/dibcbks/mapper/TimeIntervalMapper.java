package cn.dibcbks.mapper;

import cn.dibcbks.entity.TimeInterval;

public interface TimeIntervalMapper {
	
	
	TimeInterval selectById(Integer id);
	
	
	Integer updateById(TimeInterval timeInterval);
}
