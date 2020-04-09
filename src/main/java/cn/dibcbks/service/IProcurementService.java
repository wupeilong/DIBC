package cn.dibcbks.service;

import java.text.ParseException;
import java.util.List;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.Procurement;
import cn.dibcbks.util.ResponseResult;

public interface IProcurementService {

	
	/**
	 * 采购信息列表
	 * @param unitId
	 * @return
	 */
	ResponseResult<List<Procurement>> selectProcurementList(Integer unitId,Integer status);

	/**
	 * 进入采购列表页
	 * @param modelMap
	 * @return
	 */
	String selectProcurementListPag(ModelMap modelMap);

	/**
	 * 进入采购信息明细页
	 * @param modelMap
	 * @param id
	 * @return
	 */
	String selectProcurementDetailPag(ModelMap modelMap, Integer id);

	/**
	 * 验收采购信息
	 * @param result
	 * @param id
	 * @return
	 */
	ResponseResult<Void> acceptanceProcurementList(String result, Integer id);

	/**
	 * 进入采购信息添加页
	 * @param modelMap
	 * @return
	 */
	String addProcurementPag(ModelMap modelMap);
	
	/**
	 * 新增采购信息
	 * @param supplierUnitId
	 * @param supplierBusinessLicense
	 * @param supplierproductionLicense
	 * @param supplierQualification
	 * @param invoice
	 * @param supplierPerson
	 * @param supplierPhone
	 * @param detailList
	 * @return
	 */
	ResponseResult<Void> addProcurement(Integer supplierUnitId, 
										MultipartFile supplierBusinessLicense,
										MultipartFile supplierproductionLicense, 
										MultipartFile supplierQualification, 
										MultipartFile invoice,
										String supplierPerson, 
										String supplierPhone, 
										String detailList) throws ParseException ;

}
