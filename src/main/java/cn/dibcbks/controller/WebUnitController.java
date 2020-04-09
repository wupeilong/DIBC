package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

	
	@ApiOperation("批量添加企业")
	@RequestMapping("/")
	public ResponseResult<Void> batchAddUnit(){
		return null;
	}
}
