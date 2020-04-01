package cn.dibcbks.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.dibcbks.entity.Disinfection;
import cn.dibcbks.service.IDisinfectionService;
import cn.dibcbks.util.ResponseResult;

/**
 * H5清洗消毒控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/wap_clean")
public class WapCleanController {
	@Autowired
	private IDisinfectionService iDisinfectionService;

	
	/**
	 * 进入清洗/消毒记录列表页
	 * @return
	 */
	@RequestMapping("/clean_list")
	public String cleanList(ModelMap map){	
		
		return iDisinfectionService.selectDisinfectionListPag(map);		
	}
	
	
	/**
	 * 查询清洗消毒记录列表
	 * @param unitId 单位ID
	 * @return
	 */
	@RequestMapping("/clean_alllist")
	@ResponseBody
	public ResponseResult<List<Disinfection>> alllist(Integer unitId){	
		
		return iDisinfectionService.selectDisinfectionList(unitId);
	}
	
	
	/**
	 * 进入清洗/消毒记录添加页
	 * @return
	 */
	@RequestMapping("/clean_add")
	public String cleanAdd(ModelMap modelMap){
		
		return "bks_wap/clean_add";
	}
	
	
	/**
	 * 新增清洗消毒记录
	 * @param queryrights
	 * @return
	 */
	@RequestMapping("/clean_regadd")
	@ResponseBody
	public ResponseResult<Void> addCleanInfo(@RequestParam(value="queryrights") String queryrights){	
		
		return iDisinfectionService.addDisinfection(queryrights);
	}
	
	/**
	 * 进入清洗/消毒记录详情页
	 * @return
	 */
	@RequestMapping("/clean_detal")
	public String cleanDetal(ModelMap map,Integer id){	
		
		return iDisinfectionService.disinfectionDetail(map,id);
		
	}
}
