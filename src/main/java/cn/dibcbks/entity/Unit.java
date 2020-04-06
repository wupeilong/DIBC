package cn.dibcbks.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 单位信息表
 * @author Administrator
 *
 */
public class Unit implements Serializable {
	 /**
	  * 序列化版本ID
	  */
	 private static final long serialVersionUID = 1L;
	 private Integer unitId;//单位ID
	 private String unitName;//单位/企业/学校名称
	 private String legalPerson;//法人/校长
	 private String businessLicenseCode;//营业执照编码
	 private String businessLicense;//营业执照图片
	 private String productionLicense;//许可证图片
	 private String unitAddress;//单位地址
	 private String expirationDate;//到期时间
	 private Integer unitType;//企业类型：1-监管局 -2学校 3-餐饮业 4-其他
	 private Date createTime;//创建时间
	public Unit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Unit(Integer unitId, String unitName, String legalPerson, String businessLicenseCode, String businessLicense,
			String productionLicense, String unitAddress, String expirationDate, Integer unitType, Date createTime) {
		super();
		this.unitId = unitId;
		this.unitName = unitName;
		this.legalPerson = legalPerson;
		this.businessLicenseCode = businessLicenseCode;
		this.businessLicense = businessLicense;
		this.productionLicense = productionLicense;
		this.unitAddress = unitAddress;
		this.expirationDate = expirationDate;
		this.unitType = unitType;
		this.createTime = createTime;
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
	public String getLegalPerson() {
		return legalPerson;
	}
	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}
	public String getBusinessLicenseCode() {
		return businessLicenseCode;
	}
	public void setBusinessLicenseCode(String businessLicenseCode) {
		this.businessLicenseCode = businessLicenseCode;
	}
	public String getBusinessLicense() {
		return businessLicense;
	}
	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}
	public String getProductionLicense() {
		return productionLicense;
	}
	public void setProductionLicense(String productionLicense) {
		this.productionLicense = productionLicense;
	}
	public String getUnitAddress() {
		return unitAddress;
	}
	public void setUnitAddress(String unitAddress) {
		this.unitAddress = unitAddress;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public Integer getUnitType() {
		return unitType;
	}
	public void setUnitType(Integer unitType) {
		this.unitType = unitType;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Unit [unitId=" + unitId + ", unitName=" + unitName + ", legalPerson=" + legalPerson
				+ ", businessLicenseCode=" + businessLicenseCode + ", businessLicense=" + businessLicense
				+ ", productionLicense=" + productionLicense + ", unitAddress=" + unitAddress + ", expirationDate="
				+ expirationDate + ", unitType=" + unitType + ", createTime=" + createTime + "]";
	}
	
	
}
