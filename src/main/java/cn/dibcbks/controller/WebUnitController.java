package cn.dibcbks.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.dibcbks.service.IUnitService;
/**
 * PC端企业控制器
 * @author Administrator
 *
 */
import cn.dibcbks.util.ResponseResult;
import io.swagger.annotations.ApiOperation;
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
	
}
