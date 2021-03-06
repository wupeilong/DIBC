package cn.dibcbks.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.util.ResponseResult;
/**
 * H5企业控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/wap_unit")
public class WapUnitController {
	@Autowired
	private IUnitService iUnitService;

	
	/**
	 * 进入企业信息列表页
	 * @return
	 */
	@RequestMapping("/coopration_list")
	public String CooprationList(ModelMap modelMap){
		
		return iUnitService.CooprationList(modelMap);		
	}
	
	
	/**
	 * 进入企业信息详情页
	 * @return
	 */
	@RequestMapping("/coopration_detal")
	public String CooprationDetal(ModelMap modelMap,Integer unitId){	
		
		return iUnitService.CooprationDetal(modelMap,unitId);
	}
	
	
	/**
	 * 进入企业信息修改页
	 * @return
	 */
	@RequestMapping("/coopration_update")
	public String updateUnitPage(ModelMap modelMap){
		
		return iUnitService.updateUnitPage(modelMap);
	}
	
	
	/**
	 * 修改企业信息
	 * @param unit
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public ResponseResult<Void> updateUnit(
			@RequestParam(value="unitName",required = true) String unitName,			
			@RequestParam(value="businessLicenseCode",required = true) String businessLicenseCode,
			@RequestParam(value="businessLicense",required=false)MultipartFile file,
			@RequestParam(value="productionLicense",required=false)MultipartFile file1,				
			@RequestParam(value="unitAddress",required = true) String unitAddress,			
			@RequestParam(value="unitType",required = true) Integer unitType,
			@RequestParam(value="legalPerson",required = true) String legalPerson){		
		
		return iUnitService.updateUnit(unitName,businessLicenseCode,file,file1,unitAddress,unitType,legalPerson);
	}
	
	
	/**
	 * 查询企业信息列表
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResponseResult<List<Unit>> queryUnitList(Integer unitId,String unitName){
		
		return iUnitService.queryUnitList(unitId,null);
	}
	
	/**
	 * 查询企业select查询
	 * @return
	 */
	@RequestMapping("/select_unit")
	@ResponseBody
	public ResponseResult<List<Unit>> queryUnitListr(Integer unitId,String unitName){
		
		return iUnitService.queryUnitList(unitId,unitName);
	}
	/**
	 * 进入企业信息修改页
	 * @return
	 */
	@RequestMapping("/indexcs")
	public String indexcs(ModelMap modelMap){		
		return iUnitService.selectUnit(modelMap);
	}
	
	
	
	/**
	 * 查询单位信息详情
	 * @param unitId
	 * @return
	 */
	@RequestMapping("/detail")
	@ResponseBody
	public ResponseResult<Unit> unitDetail(Integer unitId){
		
		return iUnitService.unitDetail(unitId);
	}
	
	
	
	/**
	 * 新增单位信息
	 * @param unitId
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public ResponseResult<Void> addUnit(
			@RequestParam(value="unitName",required = false) String unitName,			
			@RequestParam(value="businessLicenseCode",required = false) String businessLicenseCode,
			@RequestParam(value="businessLicense",required=false)MultipartFile file,
			@RequestParam(value="productionLicense",required=false)MultipartFile file1,				
			@RequestParam(value="unitType",required = false) Integer unitType){
		
		return iUnitService.addUnit(unitName,businessLicenseCode,file,file1,unitType);
	}
}
