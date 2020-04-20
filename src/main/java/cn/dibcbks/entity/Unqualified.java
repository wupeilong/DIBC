package cn.dibcbks.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: Unqualified
 * @Description: 不合格信息记录
 * @Date: 2020-03-24 23:52
 */
public class Unqualified implements Serializable{
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5555106713022814606L;
	private Integer id;//不合格记录ID
	private Integer unitId;//单位ID
	private String unitName;//单位名字
	private Integer type;//不合格记录类型：1-原材料采购  2-配餐验收  3-商家自检  4-监管局专检  5-督查组专检
	private String orderId;//不合格记录关联订单ID
	private String cause;//原因
	private Integer status;//状态：0-未处理 1-处理中 2-已处理
	private Date createTime;//创建时间
	private Integer processUserId;//处理人
	private String processUserName;//处理人
	private Date processTime;//处理时间
	private String result;//处理结果
	public Unqualified() {
		super();
	}
	public Unqualified(Integer id, Integer unitId, String unitName, Integer type, String orderId, String cause,
			Integer status, Date createTime, Integer processUserId, String processUserName, Date processTime,
			String result) {
		super();
		this.id = id;
		this.unitId = unitId;
		this.unitName = unitName;
		this.type = type;
		this.orderId = orderId;
		this.cause = cause;
		this.status = status;
		this.createTime = createTime;
		this.processUserId = processUserId;
		this.processUserName = processUserName;
		this.processTime = processTime;
		this.result = result;
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getProcessUserId() {
		return processUserId;
	}
	public void setProcessUserId(Integer processUserId) {
		this.processUserId = processUserId;
	}
	public String getProcessUserName() {
		return processUserName;
	}
	public void setProcessUserName(String processUserName) {
		this.processUserName = processUserName;
	}
	public Date getProcessTime() {
		return processTime;
	}
	public void setProcessTime(Date processTime) {
		this.processTime = processTime;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "Unqualified [id=" + id + ", unitId=" + unitId + ", unitName=" + unitName + ", type=" + type
				+ ", orderId=" + orderId + ", cause=" + cause + ", status=" + status + ", createTime=" + createTime
				+ ", processUserId=" + processUserId + ", processUserName=" + processUserName + ", processTime="
				+ processTime + ", result=" + result + "]";
	}
	
	
}
