package cn.dibcbks.service;

import java.util.List;
import org.springframework.ui.ModelMap;

import cn.dibcbks.entity.Check;
import cn.dibcbks.util.ResponseResult;

public interface ICheckService {
	
	/**
	 * 查询检查信息列表
	 * @param unitId
	 * @param unitType
	 * @return
	 */
	ResponseResult<List<Check>> selectCheckList(Integer unitId,Integer checkType);
	
	List<Check> getCheckList(ModelMap modelMap);
	
	List<Check> getCheckListbyid(Integer id);
	
	List<Check> getCheckListbyuserid(Integer userId);

	ResponseResult<Void> addCheckInfo(Integer unitId,String unitName,String unitType,String unitAddress,
			String unitPrincipal,String unitPhone,String resultList,String other,String inspectors,
			String dailyTime,Integer checkType,String checkPhoto);
	
	/**
	 * 进入监管采集记录列表页
	 * @param modelMap
	 * @return
	 */
	String selectCheckListPag(ModelMap modelMap, Integer unitId);

	/**
	 * 进入监管采集记录表添加页
	 * @param modelMap
	 * @param checkType
	 * @return
	 */
	String addCheckPag(ModelMap modelMap, Integer checkType);

	/**
	 * 进入监管采集检查信息详情页
	 * @param modelMap
	 * @param id
	 * @return
	 */
	String selectCheckDetailPag(ModelMap modelMap, Integer id);

	/**
	 * 新增商家自检、监管局专检、督察组专检信息
	 * @param unitId
	 * @param unitType
	 * @param unitPhone
	 * @param queryrights
	 * @param other
	 * @param checkType
	 * @return
	 */
	ResponseResult<Void> addCheck(	Integer unitId, 
									String unitType,
									String unitPhone, 
									String queryrights,
									String other,
									Integer checkType);


}
