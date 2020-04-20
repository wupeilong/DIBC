package cn.dibcbks.entity;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
/**
 * 管辖部门信息实体类
 * @author wupeilong
 *
 */
@ApiModel(value="Department",description="管辖部门信息实体类")
public class Department implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5721033626329186017L;
	private Integer unitId;//主体ID
	private String unitName;//主体名称
	private Integer departmentId;//管辖部门ID
	private String departmentName;//管辖部门名称
	private String departmentHead;//管辖部门负责人
	private String departmentDescription;//管辖部门描述
	private Integer departmentParentId;//上级管辖部门ID
	private Integer departmentType;//管辖部门类型：1-市场监管局 2-市场监管分局 3-社区 4-居委会 5-网格
	private String departmentAuthorization;//管辖部门授权
	private Integer authorizationId;//权限 ID
	private String authorizationName;//权限名称
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Department(Integer unitId, String unitName, Integer departmentId, String departmentName,
			String departmentHead, String departmentDescription, Integer departmentParentId, Integer departmentType,
			String departmentAuthorization, Integer authorizationId, String authorizationName) {
		super();
		this.unitId = unitId;
		this.unitName = unitName;
		this.departmentId = departmentId;
		this.departmentName = departmentName;
		this.departmentHead = departmentHead;
		this.departmentDescription = departmentDescription;
		this.departmentParentId = departmentParentId;
		this.departmentType = departmentType;
		this.departmentAuthorization = departmentAuthorization;
		this.authorizationId = authorizationId;
		this.authorizationName = authorizationName;
	}
	public Integer getUnitId() {
		return unitId;
	}
	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
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
	public String getDepartmentHead() {
		return departmentHead;
	}
	public void setDepartmentHead(String departmentHead) {
		this.departmentHead = departmentHead;
	}
	public String getDepartmentDescription() {
		return departmentDescription;
	}
	public void setDepartmentDescription(String departmentDescription) {
		this.departmentDescription = departmentDescription;
	}
	public Integer getDepartmentParentId() {
		return departmentParentId;
	}
	public void setDepartmentParentId(Integer departmentParentId) {
		this.departmentParentId = departmentParentId;
	}
	public Integer getDepartmentType() {
		return departmentType;
	}
	public void setDepartmentType(Integer departmentType) {
		this.departmentType = departmentType;
	}
	public String getDepartmentAuthorization() {
		return departmentAuthorization;
	}
	public void setDepartmentAuthorization(String departmentAuthorization) {
		this.departmentAuthorization = departmentAuthorization;
	}
	public Integer getAuthorizationId() {
		return authorizationId;
	}
	public void setAuthorizationId(Integer authorizationId) {
		this.authorizationId = authorizationId;
	}
	public String getAuthorizationName() {
		return authorizationName;
	}
	public void setAuthorizationName(String authorizationName) {
		this.authorizationName = authorizationName;
	}
	@Override
	public String toString() {
		return "Department [unitId=" + unitId + ", unitName=" + unitName + ", departmentId=" + departmentId
				+ ", departmentName=" + departmentName + ", departmentHead=" + departmentHead
				+ ", departmentDescription=" + departmentDescription + ", departmentParentId=" + departmentParentId
				+ ", departmentType=" + departmentType + ", departmentAuthorization=" + departmentAuthorization
				+ ", authorizationId=" + authorizationId + ", authorizationName=" + authorizationName + "]";
	}
	
}
