package cn.dibcbks.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.dibcbks.service.IUserService;
import io.swagger.annotations.ApiOperation;


/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: UnqualifiedMapper
 * @Description: PC端用户控制器
 * @Date: 2020-03-25 02:59
 */
@Controller
@RequestMapping("/web_user")
public class WebUserController {
	@Autowired
	private IUserService iUserService;
	
	@ApiOperation("用户信息页")
	@RequestMapping("/user_list")
	public String userList(ModelMap modelMap){
		
		return iUserService.selectUserList(modelMap);
	}
}
