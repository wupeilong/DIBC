package cn.dibcbks.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.dibcbks.entity.Check;
import cn.dibcbks.service.ICheckService;
import cn.dibcbks.service.IUserService;
import cn.dibcbks.util.ResponseResult;

/**
 * 监管采集控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/inspect")
public class InspectController {
	
	@Autowired
	private ICheckService iCheckService;
	@Autowired
	private IUserService iUserService;
	
	
	/**
	 * 进入监管采集选择页
	 * @return
	 */
	@RequestMapping("/inspect_choise")
	public String InspectChoise(){		
		return "bks_wap/inspect_choise";
	}
	
	
	/**
	 * 进入监管采集记录列表页
	 * @return
	 */
	@RequestMapping("/inspect_list")
	public String InspectList(ModelMap modelMap,Integer start){
		
		return iCheckService.selectCheckListPag(modelMap);
	}
	
	
	/**
	 * 进入监管采集记录表添加页
	 * @return
	 */
	@RequestMapping("/inspect_add")
	public String InspectAdd(ModelMap modelMap,Integer checkType){	
		
		return iCheckService.addCheckPag(modelMap,checkType);
	}
	
	
	/**
	 * 进入监管采集检查信息详情页
	 * @return
	 */
	@RequestMapping("/inspect_detal")
	public String InspectDetal(ModelMap modelMap,Integer id){	
		
		return iCheckService.selectCheckDetailPag(modelMap,id);
	}
	
	
	/**
	 * 查询检查信息列表
	 * @param unitId
	 * @param unitType
	 * @return
	 */
	@RequestMapping("/queryList")
	@ResponseBody
	public ResponseResult<List<Check>> queryCheckListInfo(String unitId,Integer unitType){
		
		return iCheckService.selectCheckList(unitId,unitType);
	}
	
	
	/**
	 * 新增商家自检、监管局专检、督察组专检信息
	 * @param queryrights
	 * @param unitId
	 * @param unitType
	 * @param other
	 * @param unitPhone
	 * @param checkType
	 * @return
	 */
	@RequestMapping("/inspect_regadd")
	@ResponseBody
	public ResponseResult<Void> addCheckInfo(@RequestParam(value="queryrights") String queryrights,
											Integer unitId,
											String unitType,
											String other,
											String unitPhone,
											Integer checkType){
		
		return iCheckService.addCheck(unitId,unitType,unitPhone,queryrights,other,checkType);
	}
}
