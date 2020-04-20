package cn.dibcbks.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.dibcbks.entity.User;

public interface UserMapper {
	
	Integer insert(User user);
	
	List<User> select(@Param("where") String where,
					  @Param("orderBy") String orderBy, 
					  @Param("offset") String offset,
					  @Param("offset") String countPerPage);
	
	User queryUser(@Param("idCard")String idCard);
	
	User queryUserByPhone(@Param("phone")String phone);
	
	User queryUserByOpenid(@Param("openid")String openid);
	
	Integer updateById(User user);
	
	Integer deleteById(Integer id);
}
