package cn.dibcbks.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.User;
import cn.dibcbks.service.ILoginService;
import cn.dibcbks.service.IUserService;
import cn.dibcbks.util.ResponseResult;

/**
 * 登录控制器
 * @author Administrator
 *
 */
@Controller
public class LoginController {
	@Autowired
	private IUserService iUserService;
	@Autowired
	private ILoginService iLoginService;
	
	
	/**
	 * 进入登录页
	 * @return
	 */
	@RequestMapping("/login")
	public String loginPage(){		
		return "bks_wap/login";
	}	
	
	
	/**
	 * 进入首页
	 * @return
	 */
	@RequestMapping("/home")
	public String Home(){		
		return "bks_wap/home";
	}
	
	
	/**
	 * 进入注册页
	 * @return
	 */
	@RequestMapping("/register")
	public String register(){
		return "bks_wap/register";
	}
	
	
	/**
	 * 查询用户名是否已注册
	 * @param idCard
	 * @return
	 */
	@RequestMapping("/is_exist")
	@ResponseBody
	public ResponseResult<Void> userIsExist(String idCard,String phone){
		
		return iUserService.userIsExist(idCard,phone);
	}

	
	/**
	 * 企业+用户注册实现
	 * @param idCard 身份证号
	 * @param username 姓名
	 * @param password 密码
	 * @param duty 职务
	 * @param age 年龄
	 * @param unitName 单位名称
	 * @param legalPerson 法人名字
	 * @param businessLicenseCode 营业执照编码
	 * @param businessLicense 营业执照图片
	 * @param productionLicense 许可证图片
	 * @param unitAddress 单位地址
	 * @param expirationDate 过期时间
	 * @param unitType 单位类型
	 * @return
	 */
	@RequestMapping("/registeradd")
	@ResponseBody
	public ResponseResult<Void> registeradd(
			@RequestParam(value="idCard",required = false) String idCard,
			@RequestParam(value="username",required = false) String username,
			@RequestParam(value="password",required = false) String password,
			@RequestParam(value="phone",required = false) String phone,
			@RequestParam(value="duty",required = false) String duty,
			@RequestParam(value="age",required = false) Integer age, 
			@RequestParam(value="unitName",required = false) String unitName,			
			@RequestParam(value="businessLicenseCode",required = false) String businessLicenseCode,
			@RequestParam(value="businessLicense",required=false)MultipartFile file,
			@RequestParam(value="productionLicense",required=false)MultipartFile file1,				
			@RequestParam(value="unitAddress",required = false) String unitAddress,			
			@RequestParam(value="unitType",required = false) Integer unitType,
			@RequestParam(value="legalPerson",required = false) String legalPerson){
		
		return iLoginService.registerUnitUser(idCard,username,password,phone,duty,age,unitName,businessLicenseCode,file,file1,unitAddress,unitType,legalPerson);
	}
	
	
	/**
	 * 实现用户登录
	 * @param idCard
	 * @param password
	 * @return
	 */
	@RequestMapping("/userLogin")
	@ResponseBody
	public ResponseResult<Void> login(@RequestParam(value="idCard",required = true) String idCard,
									  @RequestParam(value="password",required = true) String password){
		
		return iUserService.login(idCard,password);
	}
	
	
	/**
	 * 错误登录页
	 * @return
	 */
	@RequestMapping("/error")
	public String error(){		
		return "error/404";
	}
	
	
	/**
	 * 进入登录页
	 * @return
	 */
	@RequestMapping("/admin_login")
	public String adminlogin(){	
		
		return "bks_wap/admin_login";
	}
	

	/**
	 * 监管人员注册
	 * @param user
	 * @return
	 */
	@RequestMapping("/admin_add")
	@ResponseBody
	public ResponseResult<Void> adminAdd(User user){		
		
		return iLoginService.registerAdminUser(user);
	}
	
}
