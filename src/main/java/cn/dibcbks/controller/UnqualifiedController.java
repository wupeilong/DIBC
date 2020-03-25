package cn.dibcbks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.dibcbks.service.IUnqualifiedService;
import cn.dibcbks.util.ResponseResult;
import cn.dibcbks.entity.Unqualified;;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: UnqualifiedMapper
 * @Description: 不合格记录控制器
 * @Date: 2020-03-25 02:59
 */
@RequestMapping("/unqualified")
@Controller
public class UnqualifiedController {
	@Autowired
	private IUnqualifiedService iUnqualifiedService;
	
	/**
	 * 进入不合格信息列表页
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/list_pag")
	public String selectUnqualifiedListPag(ModelMap modelMap){
		
		return iUnqualifiedService.selectUnqualifiedListPag(modelMap);
	}
	
	
	/**
	 * 进入不合格信息详情页
	 * @param unitId
	 * @param type
	 * @return
	 */
	@RequestMapping("/detail")
	public String selectUnqualifiedDetail(Integer unitId,Integer type){
		
		return iUnqualifiedService.selectUnqualifiedList(unitId,type);
	}
}
