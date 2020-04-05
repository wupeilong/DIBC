package cn.dibcbks.util.wx;

import java.io.Serializable;


/**
 * @author: wupeilong
 * @version: v1.0.0
 * @className: WxUserInfoOut
 * @description: 微信相关用户信息输出实体类
 * @date: 2019/03/15 9:49
 */

public class WxUserInfoOut implements Serializable{
    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -100625604135064225L;
	//用户的唯一标识
    private String openId;
    //用户昵称
    private String nickname;
    //用户的性别，值为1时是男性，值为2时是女性，值为0时是未知
    private Integer sex;
    //用户个人资料填写的省份
    private String province;
    //普通用户个人资料填写的城市
    private String city;
    //国家，如中国为CN
    private String country;
    //用户头像
    private String headimgurl;
    //用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）
    private String privilege;
    //只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。
    private String unionid;
	public WxUserInfoOut() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WxUserInfoOut(String openId, String nickname, Integer sex, String province, String city, String country,
			String headimgurl, String privilege, String unionid) {
		super();
		this.openId = openId;
		this.nickname = nickname;
		this.sex = sex;
		this.province = province;
		this.city = city;
		this.country = country;
		this.headimgurl = headimgurl;
		this.privilege = privilege;
		this.unionid = unionid;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getHeadimgurl() {
		return headimgurl;
	}
	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
	public String getPrivilege() {
		return privilege;
	}
	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
	public String getUnionid() {
		return unionid;
	}
	public void setUnionid(String unionid) {
		this.unionid = unionid;
	}
	@Override
	public String toString() {
		return "WxUserInfoOut [openId=" + openId + ", nickname=" + nickname + ", sex=" + sex + ", province=" + province
				+ ", city=" + city + ", country=" + country + ", headimgurl=" + headimgurl + ", privilege=" + privilege
				+ ", unionid=" + unionid + "]";
	}
    
}
