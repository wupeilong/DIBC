package cn.dibcbks.service;

import java.util.List;

import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.util.ResponseResult;

public interface IUnitService {

	ResponseResult<Void> updatUnit(Unit unit);

	ResponseResult<List<Unit>> getAllUnit();

	ResponseResult<Unit> unitDetail(Integer unitId);

	String updateUnitPage(ModelMap modelMap);

	ResponseResult<List<Unit>> queryUnitList(Integer unitId, String unitName);

	String CooprationList(ModelMap modelMap);
	List<Unit> CooprationList();

	String CooprationDetal(ModelMap modelMap, Integer unitId);
	String selectUnit(ModelMap modelMap);
	/**
	 * 添加企业列表到ModelMap
	 * @param modelMap
	 */
	void addUnitListToModelMap(ModelMap modelMap);
	
	/**
	 * 修改企业信息
	 * @param unitName
	 * @param businessLicenseCode
	 * @param file
	 * @param file1
	 * @param unitAddress
	 * @param unitType
	 * @param legalPerson
	 * @return
	 */
	ResponseResult<Void> updateUnit(String unitName, 
									String businessLicenseCode, 
									MultipartFile file,
									MultipartFile file1, 
									String unitAddress, 
									Integer unitType, 
									String legalPerson);

	
	ResponseResult<Void> addUnit(String unitName, String businessLicenseCode, MultipartFile file, MultipartFile file1,
			Integer unitType);

	/**
	 * 
	 * @param unitList
	 * @return
	 */
	ResponseResult<List<List<String>>> batchAddUnit(String unitList);

	/**
	 * 
	 * @param modelMap
	 * @return
	 */
	String selectWebUnitList(ModelMap modelMap);


}
