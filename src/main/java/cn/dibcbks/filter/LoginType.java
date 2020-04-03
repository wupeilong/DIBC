package cn.dibcbks.filter;

/**
 * 登录类型枚举类
 * @author A
 *
 */
public enum LoginType {
	/**
	 * 密码登录
	 */
    PASSWORD("password"), 
    /**
     * 免密登录
     */
    NOPASSWD("nopassword"); 
	/**
	 * 状态值
	 */
    private String code;
    private LoginType(String code) {
        this.code = code;
    }
    public String getCode () {
        return code;
    }
}

