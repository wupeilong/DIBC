package cn.dibcbks.mapper;

import cn.dibcbks.entity.WxAccessToken;

public interface WxAccessTokenMapper {

	WxAccessToken selectById(String id);

	Integer insert(WxAccessToken insert);

	Integer updateById(WxAccessToken wxAccessToken);

	Integer deleteById(String id);
}
