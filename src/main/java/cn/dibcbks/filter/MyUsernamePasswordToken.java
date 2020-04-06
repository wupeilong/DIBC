package cn.dibcbks.filter;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 自定义Token令牌
 * @author A
 *
 */
public class MyUsernamePasswordToken extends UsernamePasswordToken {

    private static final long serialVersionUID = -2564928913725078138L;
    /**
     * 登录类型
     */
    private LoginType loginType;
    public MyUsernamePasswordToken() {
        super();
    }
    public MyUsernamePasswordToken(String username, String password, LoginType loginType, boolean rememberMe,  String host) {
        super(username, password, rememberMe,  host);
        this.loginType = loginType;
    }
    /**H5免密登录*/
    public MyUsernamePasswordToken(String username) {
        super(username, "", false, null);
        this.loginType = LoginType.H5_NOPASSWD;
    }
    /**H5账号密码登录*/
    public MyUsernamePasswordToken(String username, String password) {
        super(username, password, false, null);
        this.loginType = LoginType.H5_PASSWORD;
    }
    /**账号密码登录*/
    public MyUsernamePasswordToken(String username, String password, LoginType loginType) {
        super(username, password, false, null);
        this.loginType = loginType;
    }
    public LoginType getLoginType() {
        return loginType;
    }
    public void setLoginType(LoginType loginType) {
        this.loginType = loginType;
    }


}
