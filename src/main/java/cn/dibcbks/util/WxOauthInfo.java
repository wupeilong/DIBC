package cn.dibcbks.util;

import java.util.Calendar;
import java.util.Date;
import cn.dibcbks.util.wx.WxUserInfoOut;

public class WxOauthInfo{
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -7070733552202054805L;
	/**
	 * code
	 */
	private String code;
	/**
	 * 微信用户信息
	 */
	private WxUserInfoOut wxUserInfoOut;
	
	/**
	 * 有效时长 分钟
	 */
	private Integer minutes;
	
	/**
	 * 过期时间
	 */
	private Date expirationDate;


	public WxOauthInfo() {
		super();
	}

	public WxOauthInfo(String code, WxUserInfoOut wxUserInfoOut) {
		super();
		this.code = code;
		this.wxUserInfoOut = wxUserInfoOut;
		this.minutes = 5;
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.set(Calendar.MINUTE, c.get(Calendar.MINUTE) + 5);
		this.expirationDate = c.getTime();
	}

	
	public WxOauthInfo(String code, WxUserInfoOut wxUserInfoOut, Integer minutes) {
		super();
		this.code = code;
		this.wxUserInfoOut = wxUserInfoOut;
		this.minutes = minutes;
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.set(Calendar.MINUTE, c.get(Calendar.MINUTE) + minutes);
		this.expirationDate = c.getTime();
	}


	public WxOauthInfo(String code, WxUserInfoOut wxUserInfoOut, Integer minutes, Date expirationDate) {
		super();
		this.code = code;
		this.wxUserInfoOut = wxUserInfoOut;
		this.minutes = minutes;
		this.expirationDate = expirationDate;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public WxUserInfoOut getWxUserInfoOut() {
		return wxUserInfoOut;
	}


	public void setWxUserInfoOut(WxUserInfoOut wxUserInfoOut) {
		this.wxUserInfoOut = wxUserInfoOut;
	}


	public Integer getMinutes() {
		return minutes;
	}


	public void setMinutes(Integer minutes) {
		this.minutes = minutes;
	}


	public Date getExpirationDate() {
		return expirationDate;
	}


	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}


	@Override
	public String toString() {
		return "WxOauthInfo [code=" + code + ", wxUserInfoOut=" + wxUserInfoOut + ", minutes=" + minutes
				+ ", expirationDate=" + expirationDate + "]";
	}

	
}
