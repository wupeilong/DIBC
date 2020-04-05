package cn.dibcbks.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户信息表
 * @author Administrator
 *
 */
public class User implements Serializable {
	/**
	 * 序列化版本ID
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//用户ID
	private String idCard;//身份证号
	private String username;//姓名
	private String password;//密码
	private String phone;//手机号
	private Integer unitId;//单位ID
	private String unitName;//单位名字
	private Integer departmentId;//部门ID
	private String departmentName;//部门名称
	private Integer roleId;//角色ID
	private Integer roleName;//角色名称
	private String openid;//微信用户唯一标识	
	private String deparment;//部门
	private String duty;//职务
	private Integer age;//年龄
	private String healthCertificateCode;//健康证编码
	private String healthCertificate;//健康证图片
	private String headUrl;//用户头像
	private Integer parentId;//父级ID[默认：0]
	private Integer sex;//性别：0-女 1-男 2-未知
	private Integer type;//用户类型：1-监管 2-企业
	private String uuid;//唯一识别码
	private String authorization;//用户授权
	private Date createTime;//创建时间
	public User() {
		super();
	}
	public User(Integer id, String idCard, String username, String password, String phone, Integer unitId,
			String unitName, Integer departmentId, String departmentName, Integer roleId, Integer roleName,
			String openid, String deparment, String duty, Integer age, String healthCertificateCode,
			String healthCertificate, String headUrl, Integer parentId, Integer sex, Integer type, String uuid,
			String authorization, Date createTime) {
		super();
		this.id = id;
		this.idCard = idCard;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.unitId = unitId;
		this.unitName = unitName;
		this.departmentId = departmentId;
		this.departmentName = departmentName;
		this.roleId = roleId;
		this.roleName = roleName;
		this.openid = openid;
		this.deparment = deparment;
		this.duty = duty;
		this.age = age;
		this.healthCertificateCode = healthCertificateCode;
		this.healthCertificate = healthCertificate;
		this.headUrl = headUrl;
		this.parentId = parentId;
		this.sex = sex;
		this.type = type;
		this.uuid = uuid;
		this.authorization = authorization;
		this.createTime = createTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getRoleName() {
		return roleName;
	}
	public void setRoleName(Integer roleName) {
		this.roleName = roleName;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getDeparment() {
		return deparment;
	}
	public void setDeparment(String deparment) {
		this.deparment = deparment;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getHealthCertificateCode() {
		return healthCertificateCode;
	}
	public void setHealthCertificateCode(String healthCertificateCode) {
		this.healthCertificateCode = healthCertificateCode;
	}
	public String getHealthCertificate() {
		return healthCertificate;
	}
	public void setHealthCertificate(String healthCertificate) {
		this.healthCertificate = healthCertificate;
	}
	public String getHeadUrl() {
		return headUrl;
	}
	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getAuthorization() {
		return authorization;
	}
	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", idCard=" + idCard + ", username=" + username + ", password=" + password
				+ ", phone=" + phone + ", unitId=" + unitId + ", unitName=" + unitName + ", departmentId="
				+ departmentId + ", departmentName=" + departmentName + ", roleId=" + roleId + ", roleName=" + roleName
				+ ", openid=" + openid + ", deparment=" + deparment + ", duty=" + duty + ", age=" + age
				+ ", healthCertificateCode=" + healthCertificateCode + ", healthCertificate=" + healthCertificate
				+ ", headUrl=" + headUrl + ", parentId=" + parentId + ", sex=" + sex + ", type=" + type + ", uuid="
				+ uuid + ", authorization=" + authorization + ", createTime=" + createTime + "]";
	}
	
	
}
