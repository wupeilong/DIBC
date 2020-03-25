package cn.dibcbks.service;

import java.util.List;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.Detection;
import cn.dibcbks.util.ResponseResult;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: IDetectionService
 * @Description: 多频检查业务接口
 * @Date: 2020-03-24 15:39
 */
public interface IDetectionService {
	
	/**
	 * 查询多频次检查信息列表
	 * @param modelMap
	 * @param unitId
	 * @return
	 */
	ResponseResult<List<Detection>> selectDetectionList(ModelMap modelMap,Integer unitId);

	/**
	 * 新增多频次检查信息
	 * @param detection
	 * @return
	 */
	ResponseResult<Void> addDetection(Detection detection);

	/**
	 * 进入多频检查信息详情
	 * @param modelMap
	 * @param id
	 * @return
	 */
	String selectDetectionDetailPag(ModelMap modelMap, Integer id);

	/**
	 * 进入多频检查记录列表页
	 * @param modelMap
	 * @return
	 */
	String selectDetectionListPage(ModelMap modelMap);

	/**
	 * 进入多频检查记录表添加页
	 * @param modelMap
	 * @return
	 */
	String addDetectionPag(ModelMap modelMap);

	/**
	 * 新增多频检查信息记录
	 * @param unitId
	 * @param unitName
	 * @param samplName
	 * @param specifications
	 * @param bath
	 * @param item
	 * @param result
	 * @param remark
	 * @param file
	 * @return
	 */
	ResponseResult<Void> addDetection(	Integer unitId, 
										String unitName, 
										String samplName, 
										String specifications,
										String bath, 
										String item, 
										String result, 
										String remark, 
										MultipartFile file);

}
