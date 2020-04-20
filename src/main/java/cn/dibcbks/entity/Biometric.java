package cn.dibcbks.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 生物识别结果信息表
 * @author Administrator
 *
 */
public class Biometric implements Serializable {
	/**
	 * 序列化版本ID1111
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//主键ID
	private Integer unitId;//单位ID
	private String unitName;//单位名称
	private Date pushTime;//推送时间
	private String cameraPosition;//摄像机位
	private String problemType;//问题类型
	private Integer status;//状态： 0-待确认 1-已确认 2-非生物
	public Biometric() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Biometric(Integer id, Integer unitId, String unitName, Date pushTime, String cameraPosition,
			String problemType, Integer status) {
		super();
		this.id = id;
		this.unitId = unitId;
		this.unitName = unitName;
		this.pushTime = pushTime;
		this.cameraPosition = cameraPosition;
		this.problemType = problemType;
		this.status = status;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Date getPushTime() {
		return pushTime;
	}
	public void setPushTime(Date pushTime) {
		this.pushTime = pushTime;
	}
	public String getCameraPosition() {
		return cameraPosition;
	}
	public void setCameraPosition(String cameraPosition) {
		this.cameraPosition = cameraPosition;
	}
	public String getProblemType() {
		return problemType;
	}
	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Biometric [id=" + id + ", unitId=" + unitId + ", unitName=" + unitName + ", pushTime=" + pushTime
				+ ", cameraPosition=" + cameraPosition + ", problemType=" + problemType + ", status=" + status + "]";
	}
	
}
