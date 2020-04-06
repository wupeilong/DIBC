package cn.dibcbks.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import cn.dibcbks.entity.Department;
import cn.dibcbks.entity.Menu;
import cn.dibcbks.entity.Role;
import cn.dibcbks.mapper.DepartmentMapper;
import cn.dibcbks.mapper.MenuMapper;
import cn.dibcbks.mapper.RoleMapper;
import cn.dibcbks.mapper.UserMapper;
import cn.dibcbks.service.IAuthorizationService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.ResponseResult;

@Service
public class IAuthorizationServiceImpl implements IAuthorizationService {
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public String addMenuPag(ModelMap modelMap) {
		//TODO 菜单添加页
		return "";
	}
	
	@Override
	public ResponseResult<Void> addMenu(Menu menu) {
		ResponseResult<Void> rr = null;
		try {
			if(!menuMapper.select("menu_name = '" + menu.getMenuName() + "'", null, null, null).isEmpty()){
				rr = new ResponseResult<>(ResponseResult.ERROR,"菜单名称重复，添加失败！");
			}else if(StringUtils.isNotEmpty(menu.getMenuUrl()) && !menuMapper.select("menu_url = '" + menu.getMenuUrl() + "'", null, null, null).isEmpty()){
				rr = new ResponseResult<>(ResponseResult.ERROR,"菜单路径重复，添加失败！");
			}else{
				menuMapper.insert(menu);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"菜单添加成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"菜单添加失败！");
		}		
		return rr;
	}
	
	@Override
	public String updateMenuPag(Integer menuId, ModelMap modelMap) {
		modelMap.addAttribute("menuDetail", menuMapper.selectById(menuId));
		//TODO 菜单详情页
		return "";
	}
	
	@Override
	public ResponseResult<Void> updateMenu(Menu menu) {
		ResponseResult<Void> rr = null;
		try {
			if(!menuMapper.select("menu_name = '" + menu.getMenuName() + "' AND menu_id != '" + menu.getMenuId() + "'", null, null, null).isEmpty()){
				rr = new ResponseResult<>(ResponseResult.ERROR,"菜单名称重复，添加失败！");
			}else if(StringUtils.isNotEmpty(menu.getMenuUrl()) && !menuMapper.select("menu_url = '" + menu.getMenuUrl() + "' AND menu_id != '" + menu.getMenuId() + "'", null, null, null).isEmpty()){
				rr = new ResponseResult<>(ResponseResult.ERROR,"菜单路径重复，添加失败！");
			}else{
				menuMapper.updateById(menu);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}		
		return rr;
	}
	
	@Override
	public String selectMenuListPag(ModelMap modelMap) {
		/*String where = "parent_id = '-1' ";
		if(!CommonUtil.getSessionUser().getType().equals(1)){
			//非监控人员有一些菜单没有权限
			//where += " AND menu_id NOT IN (1,2,3)";
		}
		List<Menu> menuList = menuMapper.select(where, null, null, null);*/
		List<Menu> menuList = menuMapper.select(null, null, null, null);
		modelMap.addAttribute("menuList", menuList);
		//TODO 菜单列表页
		return "";
	}
	
	
	@Override
	public ResponseResult<List<Menu>> selectMenuList(Integer menuId) {
		ResponseResult<List<Menu>> rr = null;
		try {
			List<Menu> menuList = menuMapper.select("parent_id = '" + menuId + "'", null, null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"子菜单查询成功！",menuList); 
		}catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"子菜单查询失败！");
		}
		return rr;
	}
	
	
	@Override
	public String selectMenuDetail(Integer menuId, ModelMap modelMap) {
		try {
			Menu menuDetail = menuMapper.selectById(menuId);
			modelMap.addAttribute("menuDetail", menuDetail);
		}catch (Exception e) {
			e.printStackTrace();			
		}
		//TODO 菜单详情页
		return "";
	}
	
	
	@Override
	public ResponseResult<Void> deteleMenu(Integer menuId) {
		ResponseResult<Void> rr = null;
		try {
			if ( !menuMapper.select("parent_id = '" + menuId + "'", null, null, null).isEmpty()) {
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"当前菜单拥有子菜单，删除失败！"); 
			}else {
				menuMapper.deleteById(menuId);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"菜单删除成功！");
			}			
		}catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"菜单删除失败！");
		}
		return rr;
	}
	
	@Override
	public String addDepartmentPag(ModelMap modelMap) {		
//		String where = "parent_id = '-1' ";
//		if(!CommonUtil.getSessionUser().getType().equals(1)){
//			//非监控人员有一些菜单没有权限
//			//where += " AND menu_id NOT IN (1,2,3)";
//		}
//		List<Menu> menuList = menuMapper.select(where, null, null, null);	
		List<Menu> menuList = menuMapper.select(null, null, null, null);
		modelMap.addAttribute("menuList", menuList);
		return "bks_wap/department_add";
	}

	@Override
	public ResponseResult<Void> addDepartment(Department department) {
		ResponseResult<Void> rr = null;
		try {
			if(!departmentMapper.select("p.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "' AND p.department_name = '" + department.getDepartmentName() +"'", null, null, null).isEmpty()){
				rr = new ResponseResult<>(ResponseResult.ERROR,"部门名称重复，操作失败！");
			}else {
				department.setUnitId(CommonUtil.getSessionUser().getUnitId());
				departmentMapper.insert(department);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！"); 
			}			
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public String selectDepartmentListPag(Integer unitId, ModelMap modelMap) {
		try {
			List<Department> departmentList = departmentMapper.select("unit_id = '" + unitId + "'", null, null, null);
			modelMap.addAttribute("departmentList", departmentList);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		//部门列表页
		return "";
	}

	@Override
	public ResponseResult<List<Department>> selectDepartmentList(Integer unitId) {
		ResponseResult<List<Department>> rr = null;
		try {
			List<Department> departmentList = departmentMapper.select("unit_id = '" + unitId + "'", null, null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！",departmentList); 
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public String selectDepartmentDetail(Integer departmentId, ModelMap modelMap) {
		try {
			Department departmentDetail = departmentMapper.selectById(departmentId);
			modelMap.addAttribute("departmentDetail", departmentDetail);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		//部门详情页
		return "";
	}

	@Override
	public String updateDepartmentPag(Integer departmentId, ModelMap modelMap) {
		try {
			Department departmentDetail = departmentMapper.selectById(departmentId);
			modelMap.addAttribute("departmentDetail", departmentDetail);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		//部门编辑页
		return "";
	}

	@Override
	public ResponseResult<Void> updateDepartment(Department department) {
		ResponseResult<Void> rr = null;
		try {
			if (!departmentMapper.select("d.department_name = '" + department.getDepartmentName() + "' AND d.unit_id = '" + department.getUnitId() + "'", null, null, null).isEmpty()) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"部门名称重复，操作失败！"); 
			}else{
				departmentMapper.updateById(department);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！"); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public ResponseResult<Void> deteleDepartment(Integer departmentId) {
		ResponseResult<Void> rr = null;
		try {
			List<Role> roleList = roleMapper.select("d.department_id = '" + departmentId + "'", null, null, null);
			if (!roleList.isEmpty()) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"该部门旗下有角色，操作失败！");
			}
			departmentMapper.deleteById(departmentId);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！"); 
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public String addRolePag(Integer departmentId, ModelMap modelMap) {
		try {
			Department departmentDetail = departmentMapper.selectById(departmentId);
			modelMap.addAttribute("departmentDetail", departmentDetail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//TODO 新增角色页
		return "";
	}

	@Override
	public ResponseResult<Void> addRole(Role role) {
		ResponseResult<Void> rr = null;
		try {
			List<Role> roleList = roleMapper.select("d.department_id = '" + role.getDepartmentId() + "' AND role_name = '" + role.getRoleName() + "'", null, null, null);
			if (!roleList.isEmpty()) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"该部门旗下已有该角色，操作失败！");
			}
			roleMapper.insert(role);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！"); 
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public ResponseResult<Void> deleteRole(Integer roleId) {
		ResponseResult<Void> rr = null;
		try {
			
			if (!userMapper.select("u.role_id = '" + roleId + "'", null, null, null).isEmpty()) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"该角色已有用户，操作失败！");
			}else{
				roleMapper.deleteById(roleId);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！"); 
			}			
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public ResponseResult<Void> updateRole(Role role) {
		ResponseResult<Void> rr = null;
		try {
			if (!roleMapper.select("r.department_id =" + role.getDepartmentId() + " AND r.role_name = '" + role.getRoleName() + "'", null, null, null).isEmpty()) {
				rr = new ResponseResult<>(ResponseResult.ERROR,"角色明重复，操作失败！");
			}
			roleMapper.updateById(role);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！"); 
		}catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public String updateRolePag(Integer roleId, ModelMap modelMap) {
		try {
			modelMap.addAttribute("roleDetail", roleMapper.selectById(roleId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO 编辑角色页
		return "";
	}

	@Override
	public String selectRoleListPag(Integer unitId, Integer departmentId, ModelMap modelMap) {
		try {
			String where = "";
			boolean isAnd = false;
			if(unitId != null){
				where = "r.department_id = '" + departmentId + "' "; 
				isAnd = true;
			}
			if (departmentId != null) {
				if (isAnd) {
					where += " AND d.unit_id = '" + unitId + "'";
				}
			}
			List<Role> roleList = roleMapper.select(where, null, null, null);
			modelMap.addAttribute("roleList", roleList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO 角色列表页
		return "";
	}

	@Override
	public ResponseResult<List<Role>> selectRoleList(Integer unitId, Integer departmentId) {
		ResponseResult<List<Role>> rr = null;
		try {
			String where = "";
			boolean isAnd = false;
			if(unitId != null){
				where = "r.department_id = '" + departmentId + "' "; 
				isAnd = true;
			}
			if (departmentId != null) {
				if (isAnd) {
					where += " AND d.unit_id = '" + unitId + "'";
				}
			}
			List<Role> roleList = roleMapper.select(where, null, null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！",roleList);
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作失败！");
		}		
		return rr;
	}

	
	
	

	

	

	

	

	

	



	
	
}