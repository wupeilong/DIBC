package cn.dibcbks.entity;

import java.io.Serializable;
import java.util.Date;

public class WxAccessToken implements Serializable{
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -2297888436167412525L;
	//主键ID
	private String id;
	//微信接口调用凭据
	private String accessToken;
	//有效时长
	private Long expiresIn;
	//获取时间
	private Date createTime;
	public WxAccessToken() {
		super();
	}
	public WxAccessToken(String id, String accessToken, Long expiresIn, Date createTime) {
		super();
		this.id = id;
		this.accessToken = accessToken;
		this.expiresIn = expiresIn;
		this.createTime = createTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public Long getExpiresIn() {
		return expiresIn;
	}
	public void setExpiresIn(Long expiresIn) {
		this.expiresIn = expiresIn;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "WxAccessToken [id=" + id + ", accessToken=" + accessToken + ", expiresIn=" + expiresIn + ", createTime="
				+ createTime + "]";
	}
	
	
	
}
