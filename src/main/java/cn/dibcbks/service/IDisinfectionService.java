package cn.dibcbks.service;

import java.util.List;
import org.springframework.ui.ModelMap;
import cn.dibcbks.entity.Disinfection;
import cn.dibcbks.util.ResponseResult;
/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: IDisinfectionService
 * @Description: 清洗消毒业务接口
 * @Date: 2020-03-24 10:38
 */
public interface IDisinfectionService {
	
	/**
	 * 新增清洗消毒记录
	 * @param resultList
	 * @return
	 */
	ResponseResult<Void> addDisinfection(String resultList);
	
	/**
	 * 以及企业ID查询清洗消毒信息记录
	 * @return
	 */
	List<Disinfection> getDisinfection();
	
	
	
	/**
	 * 以及企业ID查询清洗消毒信息记录
	 * @param unitId
	 * @return
	 */
	ResponseResult<List<Disinfection>> selectDisinfectionList(Integer unitId);
	
	/**
	 * 进入清洗/消毒记录列表页
	 * @param map
	 * @return
	 */
	String selectDisinfectionListPag(Integer unitId, ModelMap modelMap);
	
	/**
	 * 进入清洗消毒记录详情页
	 * @param map
	 * @param id
	 * @return
	 */
	String disinfectionDetail(ModelMap modelMap, Integer id);

	

}
