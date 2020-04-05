package cn.dibcbks.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< HEAD
=======
import org.springframework.ui.ModelMap;
>>>>>>> branch 'master' of https://github.com/wupeilong/DIBC.git
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.User;
import cn.dibcbks.service.ILoginService;
import cn.dibcbks.service.IUserService;
import cn.dibcbks.service.IWxService;
import cn.dibcbks.util.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * 登录控制器
 * @author Administrator
 *
 */
@Api(value="LoginController",tags="登录控制器")
@Controller
public class LoginController {
	@Autowired
	private IUserService iUserService;
	@Autowired
	private ILoginService iLoginService;
	@Autowired
	private IWxService iWxService;
	
	/**
	 * H5进入登录页
	 * @return
	 */	
	@GetMapping("/wap_login")
	public String loginPage(){
		return "bks_wap/login";
	}	
	
	
	/**
	 * H5进入首页
	 * @return
	 */
	@RequestMapping("/wap_home")
	public String Home(){		
		return "bks_wap/home";
	}
	
	
	/**
	 * 进入H5注册页
	 * @return
	 */
	@RequestMapping("/wap_register")
	public String register(){
		return "bks_wap/register";
	}
	
	
	/**
	 * H5查询用户名是否已注册
	 * @param idCard
	 * @return
	 */
	@RequestMapping("/wap_is_exist")
	@ResponseBody
	public ResponseResult<Void> userIsExist(String idCard,String phone){
		
		return iUserService.userIsExist(idCard,phone);
	}

	
	/**
	 * H5企业+用户注册实现
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
	@RequestMapping("/wap_registeradd")
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
	 * H5实现用户登录
	 * @param idCard
	 * @param password
	 * @return
	 */
	@ApiOperation("H5实现用户登录")
	@ApiImplicitParams({
			@ApiImplicitParam(name="idCard",value="手机号/身份证号",dataType="String",example="13027837002/522601199210015432",required=true,paramType="query"),
			@ApiImplicitParam(name="password",value="密码",dataType="String",example="888888",required=true,paramType="query")
	})
	@PostMapping("/wap_user_login")
	@ResponseBody
	public ResponseResult<Void> login(@RequestParam(value="idCard",required = true) String idCard,
									  @RequestParam(value="password",required = true) String password){
		
		return iUserService.login(idCard,password);
	}
	
	
	/**
	 * H5错误登录页
	 * @return
	 */
	@RequestMapping("/wap_error")
	public String error(){		
		return "error/404";
	}
	
	
	/**
	 * H5进入监管人员注册页
	 * @return
	 */
	@RequestMapping("/wap_admin_login")
	public String adminlogin(){	
		
		return "bks_wap/admin_login";
	}
	

	/**
	 * H5监管人员注册
	 * @param user
	 * @return
	 */
	@RequestMapping("/wap_admin_add")
	@ResponseBody
	public ResponseResult<Void> adminAdd(User user){
		
		return iLoginService.registerAdminUser(user);
	}
	

	/**
	 * 进入首页
	 * @return
	 */
	@RequestMapping("/web_home")
	public String webHome(){	
		
		return "bks_web/home";
	}
	


	@ApiOperation(value = "微信登录获取网页授权地址页", notes = "微信登录获取网页授权地址页")
	@GetMapping("/wx_login")
	public String wxLogin(ModelMap modelMap) {

	   return iWxService.wxLogin(modelMap);
	}
	
	
	@ApiOperation(value = "处理网页授权回调", notes = "处理网页授权回调")
	@ApiImplicitParam(name = "code", value = "换取oauth2_token的票据")
	@GetMapping("/wx_oauth2")
	public String wxOauth2Redirect(String code,HttpServletRequest request,ModelMap modelMap) {

	   return iWxService.wxOauth2Redirect(code,request,modelMap);
	}
	
	
	@ApiOperation(value = "绑定用户类型:大众", notes = "绑定用户类型:大众")
	@GetMapping("/wx_bangd_public")
	public String wxBangdingUserType(HttpServletRequest request,ModelMap modelMap) {

	   return iWxService.wxBangdingUserType(request,modelMap);
	}
}
