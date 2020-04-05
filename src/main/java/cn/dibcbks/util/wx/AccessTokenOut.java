package cn.dibcbks.util.wx;

import java.io.Serializable;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @className: AccessTokenOut
 * @description: 公众号的全局唯一接口调用凭据
 * @date: 2019/03/04 14:54
 */
public class AccessTokenOut implements Serializable{
	
    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6448836350212621806L;
	// 获取到的凭证
    private String accessToken;
    // 凭证有效时间，单位：秒  有效期为7200秒
    private long expiresIn;
    
    
	public AccessTokenOut() {
		super();
		// TODO Auto-generated constructor stub
	}


	public AccessTokenOut(String accessToken, long expiresIn) {
		super();
		this.accessToken = accessToken;
		this.expiresIn = expiresIn;
	}


	public String getAccessToken() {
		return accessToken;
	}


	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}


	public long getExpiresIn() {
		return expiresIn;
	}


	public void setExpiresIn(long expiresIn) {
		this.expiresIn = expiresIn;
	}


	@Override
	public String toString() {
		return "AccessTokenOut [accessToken=" + accessToken + ", expiresIn=" + expiresIn + "]";
	}
    
    
    
}
