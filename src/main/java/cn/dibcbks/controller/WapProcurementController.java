package cn.dibcbks.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.text.ParseException;
import cn.dibcbks.entity.Procurement;
import cn.dibcbks.service.IProcurementService;
import cn.dibcbks.util.ResponseResult;

/**
 * H5采购控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/wap_pro")
public class WapProcurementController {
	@Autowired
	private IProcurementService iProcurementService;
	
	/**
	 * 进入采购列表页
	 * @return
	 */
	@RequestMapping("/buy_list")
	public String buyList(ModelMap modelMap){
		
		return iProcurementService.selectProcurementListPag(modelMap);
	}
	  
	
	/**
	 * 进入采购信息明细页
	 * @param modelMap
	 * @param id
	 * @return
	 */
	@RequestMapping("/buy_detal")
	public String buyDetal(ModelMap modelMap,Integer id){
		
		return iProcurementService.selectProcurementDetailPag(modelMap,id);
	}
	
	
	/**
	 * 进入采购信息添加页
	 * @return
	 */
	@RequestMapping("/buy_add")
	public String buyAdd(ModelMap modelMap){
		
		return iProcurementService.addProcurementPag(modelMap);
	}
	

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
	 * @throws ParseException 
	 */
	@RequestMapping("/add")
	@ResponseBody
	public ResponseResult<Void> addProcurement(	
									String supplier,
									Integer supplierUnitId,
									MultipartFile supplierBusinessLicense,
									MultipartFile supplierproductionLicense,
									MultipartFile supplierQualification,
									MultipartFile invoice,
									String supplierPerson,
									String supplierPhone,
									String detailList) throws ParseException{
		try {
			return iProcurementService.addProcurement(supplier,supplierUnitId,supplierBusinessLicense,supplierproductionLicense,supplierQualification,invoice,supplierPerson,supplierPhone,detailList);
		} catch (Exception e) {
			return new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		
	}
	

	
	/**
	 * 采购信息列表
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResponseResult<List<Procurement>> selectProcurementList(Integer unitId,Integer status){
		
		return iProcurementService.selectProcurementList(unitId,status);
	}
	
	
	/**
	 * 验收采购信息
	 * @return
	 */
	@RequestMapping("/acceptance")
	@ResponseBody
	public ResponseResult<Void> acceptanceProcurementList(@RequestParam("result")String result, @RequestParam("id")Integer id){
		
		return iProcurementService.acceptanceProcurementList(result,id);
	}
}
