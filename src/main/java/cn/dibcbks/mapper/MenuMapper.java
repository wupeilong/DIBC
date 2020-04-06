package cn.dibcbks.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import cn.dibcbks.entity.Menu;
import cn.dibcbks.entity.Role;

public interface MenuMapper {
	
	Integer insert(Menu menu);
	
	List<Menu> select(@Param("where") String where,
					  @Param("orderBy") String orderBy, 
					  @Param("offset") String offset,
					  @Param("offset") String countPerPage);
	
	Menu selectById(@Param("menuId")Integer menuId);
	
	Integer updateById(Menu menu);
	
	Integer deleteById(Integer menuId);
}
