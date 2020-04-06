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
	 * H5密码登录
	 */
    H5_PASSWORD("password","H5"),
    /**
	 * PC密码登录
	 */
    PC_PASSWORD("password","PC"),
    /**
     * 免密登录
     */
    NOPASSWD("nopassword"),
	/**
     * H5免密登录
     */
    H5_NOPASSWD("nopassword","H5");
	
	/**
	 * 状态值
	 */
    private String code;
    /**
     * 登陆类型:  PC / H5
     */
    private String type;
    private LoginType(String code) {
        this.code = code;
    }
    public String getCode () {
        return code;
    }
    private LoginType(String code,String type) {
        this.code = code;
        this.type = type;
    }
    public String getType () {
        return type;
    }
    public static void main(String[] args) {
		System.out.println(LoginType.H5_PASSWORD);
		System.out.println(LoginType.H5_PASSWORD.getCode());
		System.out.println(LoginType.H5_PASSWORD.getType());
	}
}

