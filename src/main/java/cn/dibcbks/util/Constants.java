package cn.dibcbks.util;



/**
 * 设置一个成功静态常量
 * @author zhoulingzhang
 *
 */
public interface Constants{
	public static final String RESULT_MESSAGE_FAIL = "操作失败";
	public static final String RESULT_MESSAGE_SUCCESS = "操作成功";
	
	/**
	 * 初始密码
	 */
	public static final String INITIAL_PASSWORD = "888888";
	
	/**
	 * 加密方式
	 */
	public static final String HMACSHA256 = "HMAC-SHA256";
	public static final String MD5 = "MD5";
	public static final String SHA1 = "SHA1";
	/**
	 * 成功信息字符串头
	 */
	public static final String SUCCESSU_HEAD_INFO = "成功信息>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
	/**
	 * 错误信息字符串头
	 */
	public static final String ERROR_HEAD_INFO = "错误信息>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";

	/**
	 * 登录方式
	 */
	public static final String LOGIN_TYPE_WX = "wx";
	public static final String LOGIN_TYPE_ACCOUNT = "account";
	
	/**
	 * 前端缓存 cookie 名称
	 */
	public static final String COOKIE_NAME = "zhishangtong_account";
	
	public static final Integer DEFAULT_PORT = 80; //默认端口
}
