package cn.dibcbks.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.dibcbks.entity.Authorization;

public interface AuthorizationMapper {
	
	Integer insert(Authorization authorization);
	
	Authorization selectById(Integer authorizationId);
	
	List<Authorization> select(@Param("where") String where,
			  @Param("orderBy") String orderBy, 
			  @Param("offset") String offset,
			  @Param("offset") String countPerPage);
	
	
	Integer updateById(Authorization authorization);
	
	
	Integer deleteById(Integer authorizationId);
}
