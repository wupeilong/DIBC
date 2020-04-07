package cn.dibcbks.entity;

import java.io.Serializable;

public class Authorization implements Serializable{
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6991632123452524770L;
	private Integer authorizationId;//权限ID
	private String authorizationName;//权限名字
	private String authorizationContent;//权限内容
	private String authorizationRemark;//权限备注
	public Authorization() {
		super();
	}
	public Authorization(Integer authorizationId, String authorizationName, String authorizationContent,
			String authorizationRemark) {
		super();
		this.authorizationId = authorizationId;
		this.authorizationName = authorizationName;
		this.authorizationContent = authorizationContent;
		this.authorizationRemark = authorizationRemark;
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
	public String getAuthorizationContent() {
		return authorizationContent;
	}
	public void setAuthorizationContent(String authorizationContent) {
		this.authorizationContent = authorizationContent;
	}
	public String getAuthorizationRemark() {
		return authorizationRemark;
	}
	public void setAuthorizationRemark(String authorizationRemark) {
		this.authorizationRemark = authorizationRemark;
	}
	@Override
	public String toString() {
		return "Authorization [authorizationId=" + authorizationId + ", authorizationName=" + authorizationName
				+ ", authorizationContent=" + authorizationContent + ", authorizationRemark=" + authorizationRemark
				+ "]";
	}
	
	
}
