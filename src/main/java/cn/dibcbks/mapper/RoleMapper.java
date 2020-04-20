package cn.dibcbks.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.dibcbks.entity.Role;

public interface RoleMapper {
	Integer insert(Role role);
	
	List<Role> select(@Param("where") String where,
					  @Param("orderBy") String orderBy, 
					  @Param("offset") String offset,
					  @Param("offset") String countPerPage);
	
	Role selectById(@Param("roleId")Integer roleId);
	
	Integer updateById(Role role);
	
	Integer deleteById(Integer roleId);
}
