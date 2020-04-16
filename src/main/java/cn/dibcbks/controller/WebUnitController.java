package cn.dibcbks.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.util.ResponseResult;
import io.swagger.annotations.ApiOperation;

/**
 * PC端企业控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/web_unit")
public class WebUnitController {
	@Autowired
	private IUnitService iUnitService;

	
	@ApiOperation("批量添加企业页")
	@RequestMapping("/excel")
	public String batchAddUnit(){
		return "bks_web/excel/unit_excel";
	}
	
	@ApiOperation("批量添加企业实现")
	@RequestMapping("/bath_add")
	@ResponseBody
	public ResponseResult<List<List<String>>> batchAddUnit(String unitList){
		
		return iUnitService.batchAddUnit(unitList);
	}
	
	@ApiOperation("企业信息列表页")
	@RequestMapping("/list")
	public String selectUnitList(ModelMap modelMap){
		
		return iUnitService.selectWebUnitList(modelMap);	
	}
	
	@ApiOperation("企业信息修改")
	@RequestMapping("/update_unit")
	@ResponseBody
	public ResponseResult<Void> updateUnit(Unit unit){
		
		return iUnitService.updateUnit(unit);
	}
	
	@ApiOperation("新增企业信息")
	@RequestMapping("/add_unit")
	@ResponseBody
	public ResponseResult<Void> addUnit(Unit unit){
		
		return iUnitService.addUnit(unit);
	}
	
	@ApiOperation("删除企业信息")
	@RequestMapping("/del_unit")
	@ResponseBody
	public ResponseResult<Void> deleteUnit(Integer unitId){
		
		return iUnitService.deleteUnit(unitId);
	}
}
