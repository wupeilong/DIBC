package cn.dibcbks.util.wx;

import java.io.Serializable;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @className: AccessTokenOut
 * @description: 网页授权token
 * @date: 2019/03/04 14:54
 */
public class Oauth2TokenOut implements Serializable{
    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -171450573960976928L;
	// 获取到的凭证
    private String accessToken;
    // 凭证有效时间，单位：秒  有效期为7200秒
    private long expiresIn;
    //用户刷新access_token
    private String refreshToken;
    //用户唯一标识
    private String openid;
    //用户授权的作用域
    private String scope;
	public Oauth2TokenOut() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Oauth2TokenOut(String accessToken, long expiresIn, String refreshToken, String openid, String scope) {
		super();
		this.accessToken = accessToken;
		this.expiresIn = expiresIn;
		this.refreshToken = refreshToken;
		this.openid = openid;
		this.scope = scope;
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
	public String getRefreshToken() {
		return refreshToken;
	}
	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	@Override
	public String toString() {
		return "Oauth2TokenOut [accessToken=" + accessToken + ", expiresIn=" + expiresIn + ", refreshToken="
				+ refreshToken + ", openid=" + openid + ", scope=" + scope + "]";
	}
    
}
