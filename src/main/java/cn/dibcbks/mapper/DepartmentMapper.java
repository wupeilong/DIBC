package cn.dibcbks.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.dibcbks.entity.Department;

public interface DepartmentMapper {
	
	Integer insert(Department user);
	
	List<Department> select(@Param("where") String where,
					  @Param("orderBy") String orderBy, 
					  @Param("offset") String offset,
					  @Param("offset") String countPerPage);
	
	Department selectById(@Param("departmentId")Integer departmentId);
	
	Integer updateById(Department department);
	
	Integer deleteById(Integer departmentId);
}
