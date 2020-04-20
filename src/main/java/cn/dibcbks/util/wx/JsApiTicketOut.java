package cn.dibcbks.util.wx;

import java.io.Serializable;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @className: JsApiTicketOut
 * @description: 微信JS接口的临时票据
 * @date: 2019/03/20 11:57
 */

public class JsApiTicketOut implements Serializable{
    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5271742730359706226L;
	// 获取到的jsApi凭证
    private String jsApiTicket;
    // 凭证有效时间，单位：秒  有效期为7200秒
    private long expiresIn;
	public JsApiTicketOut() {
		super();
	}
	public JsApiTicketOut(String jsApiTicket, long expiresIn) {
		super();
		this.jsApiTicket = jsApiTicket;
		this.expiresIn = expiresIn;
	}
	public String getJsApiTicket() {
		return jsApiTicket;
	}
	public void setJsApiTicket(String jsApiTicket) {
		this.jsApiTicket = jsApiTicket;
	}
	public long getExpiresIn() {
		return expiresIn;
	}
	public void setExpiresIn(long expiresIn) {
		this.expiresIn = expiresIn;
	}
	@Override
	public String toString() {
		return "JsApiTicketOut [jsApiTicket=" + jsApiTicket + ", expiresIn=" + expiresIn + "]";
	}
    
}
