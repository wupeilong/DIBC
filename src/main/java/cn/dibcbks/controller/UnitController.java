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
/**
 * 企业控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/unit")
public class UnitController {
	@Autowired
	private IUnitService iUnitService;
	
	/**
	 * 进入企业信息修改页
	 * @return
	 */
	@RequestMapping("/updateUnitPage.do")
	public String updateUnitPage(ModelMap modelMap){
		//TODO 企业修改页
		return iUnitService.updateUnitPage(modelMap);
	}
	
	/**
	 * 修改企业信息
	 * @param unit
	 * @return
	 */
	@RequestMapping("/updateUnit.do")
	@ResponseBody
	public ResponseResult<Void> updateUnit(Unit unit){
		
		return iUnitService.updatUunit(unit);
	}
	
	/**
	 * 查询所有企业信息
	 * @return
	 */
	@RequestMapping("/list.do")
	@ResponseBody
	public ResponseResult<List<Unit>> queryUnitList(Integer unitId,String unitName){
		
		return iUnitService.queryUnitList(unitId,unitName);
	}
	

	/**
	 * 查询单位信息详情
	 * @param unitId
	 * @return
	 */
	@RequestMapping("/detail.do")
	@ResponseBody
	public ResponseResult<Unit> unitDetail(Integer unitId){
		
		return iUnitService.unitDetail(unitId);
	}
	
	
}
