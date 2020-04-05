package cn.dibcbks.entity;

import java.io.Serializable;

/**
 * 角色信息实体类
 * @author wupeilong
 *
 */
public class Role implements Serializable{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -1159420077910612617L;
	private Integer departmentId;//所属管辖部门ID
	private String departmentName;//所属管辖部门名称
	private Integer roleId;//角色ID	
	private String roleName;//角色名字
	private String roleDescription;//角色名字
	private String roleAuthorization;//角色授权
	public Role() {
		super();
	}
	public Role(Integer departmentId, String departmentName, Integer roleId, String roleName, String roleDescription,
			String roleAuthorization) {
		super();
		this.departmentId = departmentId;
		this.departmentName = departmentName;
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleDescription = roleDescription;
		this.roleAuthorization = roleAuthorization;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDescription() {
		return roleDescription;
	}
	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}
	public String getRoleAuthorization() {
		return roleAuthorization;
	}
	public void setRoleAuthorization(String roleAuthorization) {
		this.roleAuthorization = roleAuthorization;
	}
	@Override
	public String toString() {
		return "Role [departmentId=" + departmentId + ", departmentName=" + departmentName + ", roleId=" + roleId
				+ ", roleName=" + roleName + ", roleDescription=" + roleDescription + ", roleAuthorization="
				+ roleAuthorization + "]";
	}
	
	
}
