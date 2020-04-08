package cn.dibcbks.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import cn.dibcbks.entity.Authorization;
import cn.dibcbks.entity.Department;
import cn.dibcbks.entity.Menu;
import cn.dibcbks.entity.Role;
import cn.dibcbks.util.ResponseResult;
import net.sf.json.JSONObject;
public interface IAuthorizationService {
	
	/**
	 * 菜单添加页
	 * @param modelMap
	 * @return
	 */
	String addMenuPag(ModelMap modelMap);
	
	/**
	 * 菜单添加
	 * @param munu
	 * @return
	 */
	ResponseResult<Void> addMenu(Menu menu);
	
	/**
	 * 菜单编辑页
	 * @param menuId
	 * @return
	 */
	String updateMenuPag(Integer menuId, ModelMap modelMap);
	
	/**
	 * 菜单编辑
	 * @param menu
	 * @return
	 */
	ResponseResult<Void> updateMenu(Menu menu);
	
	/**
	 * 菜单列表页
	 * @param modelMap
	 * @return
	 */
	JSONObject selectMenuListPag(ModelMap modelMap);
	/**
	 * 权限列表页
	 * @param modelMap
	 * @return
	 */
	String selectMenuAuthority(Integer authorizationId, ModelMap modelMap);
	
	/**
	 * 子菜单列表
	 * @param modelId
	 * @return
	 */
	ResponseResult<List<Menu>> selectMenuList(Integer menuId);
	
	/**
	 * 菜单详情页
	 * @param menuId
	 * @return
	 */
	String selectMenuDetail(Integer menuId, ModelMap modelMap);	
	
	/**
	 * 删除菜单
	 * @param modelId
	 * @return
	 */	
	ResponseResult<Void> deteleMenu(Integer menuId);
	
	/**
	 * 添加部门信息页
	 * @param modelMap
	 * @return
	 */
	String addDepartmentPag(ModelMap modelMap);

	/**
	 * 添加部门信息
	 * @param department
	 * @return
	 */
	ResponseResult<Void> addDepartment(Department department);

	/**
	 * 部门列表页
	 * @param unitId
	 * @param modelMap
	 * @return
	 */
	String selectDepartmentListPag(Integer unitId, ModelMap modelMap);

	/**
	 * 部门列表
	 * @param unitId
	 * @return
	 */
	ResponseResult<List<Department>> selectDepartmentList(Integer unitId);

	/**
	 * 部门详情
	 * @param departmentId
	 * @param modelMap
	 * @return
	 */
	String selectDepartmentDetail(Integer departmentId, ModelMap modelMap);

	/**
	 * 部门编辑页
	 * @param departmentId
	 * @return
	 */
	String updateDepartmentPag(Integer departmentId, ModelMap modelMap);

	/**
	 * 部门编辑
	 * @param department
	 * @return
	 */
	ResponseResult<Void> updateDepartment(Department department);

	/**
	 * 部门删除
	 * @param departmentId
	 * @return
	 */
	ResponseResult<Void> deteleDepartment(Integer departmentId);

	/**
	 * 新增角色页
	 * @param departmentId
	 * @param modelMap
	 * @return
	 */
	String addRolePag(Integer departmentId, ModelMap modelMap);

	/**
	 * 新增角色
	 * @param role
	 * @return
	 */
	ResponseResult<Void> addRole(Role role);

	/**
	 * 删除角色
	 * @param roleId
	 * @return
	 */
	ResponseResult<Void> deleteRole(Integer roleId);

	/**
	 * 编辑角色
	 * @param role
	 * @return
	 */
	ResponseResult<Void> updateRole(Role role);

	/**
	 * 编辑角色页
	 * @param roleId
	 * @return
	 */
	String updateRolePag(Integer roleId,ModelMap modelMap);

	/**
	 * 角色列表页
	 * @param unitId
	 * @param departmentId
	 * @param modelMap
	 * @return
	 */
	String selectRoleListPag(Integer unitId, Integer departmentId, ModelMap modelMap);

	/**
	 * 角色列表
	 * @param unitId
	 * @param departmentId
	 * @return
	 */
	ResponseResult<List<Role>> selectRoleList(Integer unitId, Integer departmentId);

	/**
	 * 部门信息
	 * @param modelMap
	 * @return
	 */
	JSONObject getDepartment(ModelMap modelMap);

	/**
	 * 
	 * @param modelMap
	 * @return
	 */
	String selectAuthorizationListPag(ModelMap modelMap);

	/**
	 * 
	 * @param authorization
	 * @return
	 */
	ResponseResult<Void> addAuthorization(Authorization authorization);

	/**
	 * 
	 * @param authorization
	 * @return
	 */
	ResponseResult<Void> updateAuthorization(Authorization authorization);

	/**
	 * 
	 * @param authorizationId
	 * @return
	 */
	String updateAuthorizationPag(Integer authorizationId, ModelMap modelMap);

	/**
	 * 删除权限信息编辑页
	 * @param authorizationId
	 * @return
	 */
	ResponseResult<Void> deteleAuthorization(Integer authorizationId);

	

	

	

	
	
	
	
	

	
	
	
	
	

}
