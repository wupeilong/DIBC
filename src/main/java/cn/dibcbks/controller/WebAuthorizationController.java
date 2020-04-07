package cn.dibcbks.controller;

import cn.dibcbks.entity.Department;
import cn.dibcbks.entity.Menu;
import cn.dibcbks.entity.Role;
import cn.dibcbks.service.IAuthorizationService;
import cn.dibcbks.util.ResponseResult;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONObject;

@Api(value="WebAuthorizationController",tags="权限控制器")
@Controller
@RequestMapping("/web_auth")
public class WebAuthorizationController {
	@Autowired
	private IAuthorizationService IAuthorizationService;
	
	/*@ApiOperation(value = "菜单添加页", notes = "菜单添加页")
	@GetMapping("/menu_add_pag")
	public String  addMenuPag(ModelMap modelMap) {
		
		return IAuthorizationService.addMenuPag(modelMap);
	}*/
	
	@ApiOperation(value = "菜单添加", notes = "菜单添加")
	@ApiImplicitParam(name="menu",value="菜单实体类",dataType="Menu")
	@PostMapping("/menu_add")
	@ResponseBody
	public ResponseResult<Void> addMenu(Menu menu) {
		
		return IAuthorizationService.addMenu(menu);
	}
	
	/*@ApiOperation(value = "菜单编辑页", notes = "菜单编辑页")
	@ApiImplicitParam(name="menuId",value="菜单ID",dataType="Integer")
	@GetMapping("/menu_update_pag")
	public String updateMenuPag(Integer menuId, ModelMap modelMap) {
		
		return IAuthorizationService.updateMenuPag(menuId,modelMap);
	}*/
	
	@ApiOperation(value = "菜单编辑", notes = "菜单编辑")
	@ApiImplicitParam(name="menu",value="菜单实体类",dataType="Menu")
	@PostMapping("/menu_update")
	@ResponseBody
	public ResponseResult<Void> updateMenu(Menu menu) {
		
		return IAuthorizationService.updateMenu(menu);
	}
	
	
	
	//周修改
	@ApiOperation(value = "菜单列表页", notes = "菜单列表页")
	@GetMapping("/menu_list_pag")
	public String selectMenuListPag(ModelMap modelMap) {
		
		return "bks_web/menu/menu";
	}
	
	@RequestMapping("/getMenu")
    @ResponseBody
    public JSONObject getMenu(ModelMap modelMap){				
        return IAuthorizationService.selectMenuListPag(modelMap);
    }
	
	@RequestMapping("/menu_authority")	
	public String showMenuAuthoritylogin(ModelMap map){				
			return IAuthorizationService.selectMenuAuthority(map);		 
	}
	//周结束
	
	
	
	
	/*@ApiOperation(value = "子菜单列表", notes = "子菜单列表")
	@ApiImplicitParam(name="menuId",value="父级菜单ID")
	@PostMapping("/menu_list")
	@ResponseBody
	public ResponseResult<List<Menu>> selectMenuList(Integer menuId) {
		
		return IAuthorizationService.selectMenuList(menuId);
	}
	
	@ApiOperation(value = "菜单详情页", notes = "菜单详情页")
	@ApiImplicitParam(name="menuId",value="菜单ID")
	@GetMapping("/menu_detail")
	public String selectMenuDetail(Integer menuId, ModelMap modelMap) {
		
		return IAuthorizationService.selectMenuDetail(menuId,modelMap);
	}*/
	
	@ApiOperation(value = "删除菜单", notes = "删除菜单")
	@ApiImplicitParam(name="menuId",value="菜单ID")
	@PostMapping("/menu_delete")
	@ResponseBody
	public ResponseResult<Void> deteleMenu(Integer menuId) {
		
		return IAuthorizationService.deteleMenu(menuId);
	}
	
	
	
	
	
	/*@ApiOperation(value = "添加部门信息页", notes = "添加部门信息页")
	@GetMapping("/dep_add_pag")
	public String  addDepartmentPag(ModelMap modelMap) {
		
		return IAuthorizationService.addDepartmentPag(modelMap);
	}*/
	
	@ApiOperation(value = "添加部门信息", notes = "添加部门信息")
	@ApiImplicitParam(name="department",value="部门信息实体类",dataType="Department")
	@PostMapping("/dep_add")
	@ResponseBody
	public ResponseResult<Void>  addDepartment(Department department) {
		
		return IAuthorizationService.addDepartment(department);
	}
	
	@ApiOperation(value = "部门列表页", notes = "部门列表页")
	//@ApiImplicitParam(name="unitId",value="企业ID",dataType="Integer")
	@GetMapping("/dep_list_pag")
	public String  selectDepartmentListPag(Integer unitId,ModelMap modelMap) {
		
		return "bks_web/department/department";
		//return IAuthorizationService.selectDepartmentListPag(unitId,modelMap);
	}
	
	@ApiOperation(value = "部门信息", notes = "部门信息")
	@RequestMapping("/get_department")
    @ResponseBody
    public JSONObject getDepartment(ModelMap modelMap){
		
        return IAuthorizationService.getDepartment(modelMap);
    }
	
	
	@ApiOperation(value = "部门列表", notes = "部门列表")
	@ApiImplicitParam(name="unitId",value="企业ID",dataType="Integer")
	@PostMapping("/dep_list")
	@ResponseBody
	public ResponseResult<List<Department>>  selectDepartmentList(Integer unitId) {
		
		return IAuthorizationService.selectDepartmentList(unitId);
	}
	
	@ApiOperation(value = "部门详情", notes = "部门详情")
	@ApiImplicitParam(name="departmentId",value="部门ID",dataType="Integer")
	@GetMapping("/dep_detail")
	public String  selectDepartmentDetail(Integer departmentId,ModelMap modelMap) {
		
		return IAuthorizationService.selectDepartmentDetail(departmentId,modelMap);
	}
	
	
	@ApiOperation(value = "部门编辑页", notes = "部门编辑页")
	@ApiImplicitParam(name="departmentId",value="部门ID",dataType="Integer")
	@GetMapping("/dep_update_pag")
	public String  updateDepartmentPag(Integer departmentId, ModelMap modelMap) {
		
		return IAuthorizationService.updateDepartmentPag(departmentId,modelMap);
	}
	
	@ApiOperation(value = "部门编辑", notes = "部门编辑")
	@ApiImplicitParam(name="department",value="部门信息实体类",dataType="Department")
	@PostMapping("/dep_update")
	@ResponseBody
	public ResponseResult<Void>  updateDepartment(Department department) {
		
		return IAuthorizationService.updateDepartment(department);
	}
	
	@ApiOperation(value = "部门删除", notes = "部门删除")
	@ApiImplicitParam(name="departmentId",value="部门Id")
	@GetMapping("/dep_delete")
	@ResponseBody
	public ResponseResult<Void> deteleDepartment(Integer departmentId) {
		
		return IAuthorizationService.deteleDepartment(departmentId);
	}
	
	@ApiOperation(value = "新增角色页", notes = "新增角色页")
	@ApiImplicitParam(name="departmentId",value="部门ID",dataType="Integer")
	@GetMapping("/role_add_pag")
	public String  addRolePag(Integer departmentId, ModelMap modelMap) {
		
		return IAuthorizationService.addRolePag(departmentId,modelMap);
	}
	
	
	@ApiOperation(value = "新增角色", notes = "新增角色")
	@ApiImplicitParam(name="role",value="角色信息实体类",dataType="Role")
	@PostMapping("/role_add_pag")
	@ResponseBody
	public ResponseResult<Void>  addRole(Role role) {
		
		return IAuthorizationService.addRole(role);
	}
	
	@ApiOperation(value = "删除角色", notes = "删除角色")
	@ApiImplicitParam(name="roleId",value="角色ID",dataType="Integer")
	@PostMapping("/role_detele")
	@ResponseBody
	public ResponseResult<Void>  deleteRole(Integer roleId) {
		
		return IAuthorizationService.deleteRole(roleId);
	}
	
	
	@ApiOperation(value = "编辑角色页", notes = "编辑角色页")
	@ApiImplicitParam(name="roleId",value="角色ID",dataType="Integer")
	@GetMapping("/role_update_pag")
	public String  updateRolePag(Integer roleId,ModelMap modelMap) {
		
		return IAuthorizationService.updateRolePag(roleId,modelMap);
	}
	
	@ApiOperation(value = "编辑角色", notes = "编辑角色")
	@ApiImplicitParam(name="role",value="角色ID",dataType="Role")
	@PostMapping("/role_update")
	@ResponseBody
	public ResponseResult<Void>  updateRole(Role role) {
		
		return IAuthorizationService.updateRole(role);
	}
	
	
	@ApiOperation(value = "角色列表页", notes = "角色列表页")	
	@ApiImplicitParams({
		@ApiImplicitParam(name="unitId",value="企业ID",dataType="Integer"),
		@ApiImplicitParam(name="departmentId",value="部门ID",dataType="Integer")
	})
	@GetMapping("/role_list_pag")
	public String  selectRoleListPag(Integer unitId, Integer departmentId, ModelMap modelMap) {
		
		return IAuthorizationService.selectRoleListPag(unitId,departmentId,modelMap);
	}
	
	
	@ApiOperation(value = "角色列表", notes = "角色列表")	
	@ApiImplicitParams({
		@ApiImplicitParam(name="unitId",value="企业ID",dataType="Integer"),
		@ApiImplicitParam(name="departmentId",value="部门ID",dataType="Integer")
	})
	@PostMapping("/role_list")
	@ResponseBody
	public ResponseResult<List<Role>>  selectRoleList(Integer unitId, Integer departmentId) {
		
		return IAuthorizationService.selectRoleList(unitId,departmentId);
	}
}
