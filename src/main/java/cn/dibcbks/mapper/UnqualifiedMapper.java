package cn.dibcbks.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.dibcbks.entity.Unqualified;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: UnqualifiedMapper
 * @Description: 不合格信息记录自定义Mapper
 * @Date: 2020-03-24 23:59
 */
public interface UnqualifiedMapper {
	
	Integer insert(Unqualified unqualified);
	
	List<Unqualified> select( @Param("where") String where,
							  @Param("orderBy") String orderBy, 
							  @Param("offset") String offset,
							  @Param("offset") String countPerPage);
	
	Unqualified selectUnqualifiedById(@Param("id")String id);
	
	Integer updateById(Unqualified unqualified);
	
	Integer deleteById(Integer id);
}
