package cn.dibcbks.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.User;
import cn.dibcbks.service.IUserService;
import cn.dibcbks.util.ResponseResult;


/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: UnqualifiedMapper
 * @Description: H5用户控制器
 * @Date: 2020-03-25 02:59
 */
@Controller
@RequestMapping("/wap_user")
public class WapUserController {
	@Autowired
	private IUserService iUserService;
	
	
	/**
	 * 进入个人信息页
	 * @return
	 */
	@RequestMapping("/user_pcenter")
	public String userPcenter(ModelMap modelMap,String id){		
		return iUserService.queryUserPcenter(modelMap, id);	
	}
	/**
	 * 进入个人中心页
	 * @return
	 */
	@RequestMapping("/user_home")
	public String userHome(ModelMap modelMap){		
		return "bks_wap/user_home";	
	}
	
	/**
	 * 进入从业人员信息列表页
	 * @return
	 */
	@RequestMapping("/workmens")
	public String workmens(Integer unitId, ModelMap modelMap){	
		
		return iUserService.workmens(unitId, modelMap);
	}
	
	
	/**
	 * 进入密码修改页
	 * @return
	 */
	@RequestMapping("/reset_password")
	public String resetPassword(ModelMap modelMap){		
		
		return "bks_wap/reset_password";
	}
	
	

	/**
	 * 修改用户密码
	 * @param password
	 * @param oldpassword
	 * @return
	 */
	@PostMapping("/password_update")
	@ResponseBody
	public ResponseResult<Void> uploadPassword(String password,String oldpassword){		
		
		return iUserService.uploadPassword(password,oldpassword);
	}
	
	
	/**
	 * 进入从业人员信息添加页
	 * @return
	 */
	@RequestMapping("/workmens_add")
	public String workmensAdd(ModelMap modelMap){	
		
		return iUserService.workmensAdd(modelMap);		
	}
	
	

	/**
	 * 分配员工账户
	 * @param file
	 * @param duty
	 * @param username
	 * @param password
	 * @param phone
	 * @param idCard
	 * @param age
	 * @param healthCertificateCode
	 * @return
	 */	
	@PostMapping("/workmens_reg")
	@ResponseBody
	public ResponseResult<Void> allocateAccount(@RequestParam(value="unimg",required=false)MultipartFile file,
												Integer departmentId,
												String username,
												String password,
												String phone, 
												String idCard,
												Integer age,
												String healthCertificateCode){
		
		return 	iUserService.allocateAccount(departmentId, idCard, username, password, phone, age, healthCertificateCode, file);	
	}
	
	
	/**
	 * 进入从业人员信息详情页
	 * @return
	 *art=
	 */
	@RequestMapping("/workmens_detal")
	public String workmensDetal(ModelMap modelMap,String id){
		
		return iUserService.queryUnitUserDetail(modelMap,id);
	}

	
	/**
	 * 进入从业人员信息健康列表页
	 * @return
	 */
	@RequestMapping("/workmens_health")
	public String workmensHealth(ModelMap modelMap,Integer userId){
		
		return iUserService.workmensHealth(modelMap,userId);
	}
	/**
	 * 进入从业人员信息健康信息添加页
	 * @return
	 */
	@RequestMapping("/workmens_health_add")
	public String workmensHealthAdd(){		
		return "bks_wap/workmens_health_add";
	}
	
	
	/**
	 * 新增健康信息
	 * @param file
	 * @param userId
	 * @param username
	 * @param dailyTime
	 * @param celsius
	 * @param fever
	 * @param diarrhea
	 * @param woundsFester
	 * @param hygiene
	 * @param remark
	 * @return
	 */
	@RequestMapping("/workmens_health_regadd")
	@ResponseBody
	public ResponseResult<Void> addHygiene(	@RequestParam(value="healthCodePhoto",required=false)MultipartFile file,
											Integer userId,
											String username,
											String dailyTime,
											Double celsius,
											String fever,
											String diarrhea,
											String woundsFester,
											String hygiene,
											String remark){
		
		return iUserService.addHygiene(userId,username,dailyTime,celsius,fever,diarrhea,woundsFester,hygiene,remark,file);
	}
	
	
	/**
	 * 进入从业人员信息健康信息添加页
	 * @return
	 */
	@RequestMapping("/workmens_health_detal")
	public String workmensHealthDetal(ModelMap modelMap,Integer hygieneId){
		
		return iUserService.workmensHealthDetal(modelMap,hygieneId);
	}
		
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public ResponseResult<Void> updateUser(	@RequestParam(value="unimg",required=false)MultipartFile file,
											Integer id,	
											String duty,
											String username,											
											String phone,
											String idCard,
											Integer age,
											String healthCertificateCode,
											String healthCertificate){
		
		return iUserService.updateUser(id,idCard,username,duty,phone,age,healthCertificateCode,healthCertificate,file);
	}
	
	
	/**
	 * 进入个人中心修改页面
	 * @return
	 */
	@RequestMapping("/workmens_update")
	public String updateUserPage(ModelMap modelMap){
		
		return iUserService.updateUserPage(modelMap);
	}
	
	
	
	/**
	 * 查询企业从业人员信息
	 * @param unitId
	 * @param unitName
	 * @return
	 */
	@RequestMapping("/unitUserList")
	@ResponseBody
	public ResponseResult<List<User>> queryUnitUser(Integer unitId,String unitName){
		
		return iUserService.queryUnitUser(unitId,unitName);
	}
	
	
}
