package cn.dibcbks.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.dibcbks.entity.User;
import cn.dibcbks.service.IUserService;
import cn.dibcbks.util.ResponseResult;
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
	@GetMapping("/user_list")
	public String userList(ModelMap modelMap){
		
		return iUserService.selectUserList(modelMap);
	}
	
	@ApiOperation("用户绑定部门")
	@PostMapping("/bind_department")
	@ResponseBody
	public ResponseResult<Void> userBindDepartment(Integer userId,Integer departmentId){
		
		return iUserService.userBindDepartment(userId,departmentId);
	}
	
	@ApiOperation("用户更新")
	@PostMapping("/update_user")
	@ResponseBody
	public ResponseResult<Void> updateUser(User user){
		
		return iUserService.webUpdateUser(user);
	}
	
	@ApiOperation("删除用户")
	@PostMapping("/delete_user")
	@ResponseBody
	public ResponseResult<Void> deleteUser(Integer id){
		
		return iUserService.deleteUser(id);
	}
	
	@ApiOperation("新增用户")
	@PostMapping("/add_user")
	@ResponseBody
	public ResponseResult<Void> addUser(User user){
		
		return iUserService.webAddUser(user);
	}
}
