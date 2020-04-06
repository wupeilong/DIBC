package cn.dibcbks.entity;

import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value="Menu",description="菜单信息实体类")
public class Menu implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 8241893991056702343L;
	@ApiModelProperty("菜单ID号")
	private Integer menuId;
	@ApiModelProperty("菜单名称")
	private String menuName;
	@ApiModelProperty("菜单响应路径")
	private String menuUrl;
	@ApiModelProperty("菜单显示图标")
	private String menuIcon;
	@ApiModelProperty("权限值")
	private String authority;
	@ApiModelProperty("菜单类型：0-目录 1-菜单 2-按钮")
	private Integer isMenu;
	@ApiModelProperty("父节点ID号：-1最顶层")
	private Integer parentId;
	@ApiModelProperty("所属企业")
	private Integer unitId;
	public Menu() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Menu(Integer menuId, String menuName, String menuUrl, String menuIcon, String authority, Integer isMenu,
			Integer parentId, Integer unitId) {
		super();
		this.menuId = menuId;
		this.menuName = menuName;
		this.menuUrl = menuUrl;
		this.menuIcon = menuIcon;
		this.authority = authority;
		this.isMenu = isMenu;
		this.parentId = parentId;
		this.unitId = unitId;
	}

	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public Integer getIsMenu() {
		return isMenu;
	}
	public void setIsMenu(Integer isMenu) {
		this.isMenu = isMenu;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}	
	public Integer getUnitId() {
		return unitId;
	}

	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}

	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", menuName=" + menuName + ", menuUrl=" + menuUrl + ", menuIcon=" + menuIcon
				+ ", authority=" + authority + ", isMenu=" + isMenu + ", parentId=" + parentId + ", unitId=" + unitId
				+ "]";
	}


}
