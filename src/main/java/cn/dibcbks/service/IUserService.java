package cn.dibcbks.service;




import java.util.List;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.Hygiene;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.entity.User;
import cn.dibcbks.util.ResponseResult;

/**
 * 用户业务接口
 * @author Administrator
 *
 */
public interface IUserService {

	User queryUser(String idCard);

	ResponseResult<Void> registeradd(String uuid,String idCard, String username, String password, String phone, String duty, Integer age,
			String unitName, String legalPerson, String businessLicenseCode, String businessLicense, String productionLicense, String unitAddress, String expirationDate, Integer unitType);

	ResponseResult<User> login(String idCard, String password);

	ResponseResult<Void> userIsExist(String idCard,String phone);

	ResponseResult<List<User>> queryUnitUser(Integer unitId, String unitName);

	String queryUnitUserDetail(ModelMap modelMap,String id);
	
	List<Unit> queryUnitUserDetail(Integer unitid);
	
	String queryUserPcenter(ModelMap modelMap,String id);

	String workmens(Integer unitId, ModelMap modelMap);

	String workmensHealth(ModelMap modelMap,Integer userId);

	String workmensHealthDetal(ModelMap modelMap, Integer hygieneId);
	
	ResponseResult<Void> addHygiene(Hygiene hygiene);

	/**
	 * 修改用户密码
	 * @param password
	 * @param oldpassword
	 * @return
	 */
	ResponseResult<Void> uploadPassword(String password, String oldpassword);

	/**
	 * 分配员工账户
	 * @param duty
	 * @param idCard
	 * @param username
	 * @param password
	 * @param phone
	 * @param age
	 * @param healthCertificateCode
	 * @param file
	 * @return
	 */
	ResponseResult<Void> allocateAccount(Integer departmentId, String idCard, String username, String password, String phone,
			Integer age, String healthCertificateCode, MultipartFile file);
	
	/**
	 * 新增健康信息
	 * @param userId
	 * @param username
	 * @param dailyTime
	 * @param celsius
	 * @param fever
	 * @param diarrhea
	 * @param woundsFester
	 * @param hygiene
	 * @param remark
	 * @param file
	 * @return
	 */
	ResponseResult<Void> addHygiene(Integer userId, String username, String dailyTime, Double celsius, String fever,
			String diarrhea, String woundsFester, String hygiene, String remark, MultipartFile file);
	
	/**
	 * 修改用户信息
	 * @param id
	 * @param idCard
	 * @param username
	 * @param duty
	 * @param phone
	 * @param age
	 * @param healthCertificateCode
	 * @param healthCertificate
	 * @return
	 */
	ResponseResult<Void> updateUser(Integer id, String idCard, String username, String duty,String phone,
			Integer age, String healthCertificateCode, String healthCertificate,MultipartFile file);

	/**
	 * 进入个人中心修改页面
	 * @param modelMap
	 * @return
	 */
	String updateUserPage(ModelMap modelMap);

	/**
	 * PC端实现用户登录
	 * @param idCard
	 * @param password
	 * @return
	 */
	ResponseResult<Void> weblogin(String idCard, String password);

	/**
	 * 
	 * @param modelMap
	 * @return
	 */
	String selectUserList(ModelMap modelMap);

	/**
	 * 
	 * @param userId
	 * @param departmentId
	 * @return
	 */
	ResponseResult<Void> userBindDepartment(Integer userId, Integer departmentId);

	/**
	 * 
	 * @param modelMap
	 * @return
	 */
	String workmensAdd(ModelMap modelMap);

	/**
	 * 
	 * @param user
	 * @return
	 */
	ResponseResult<Void> webUpdateUser(User user);

	/**
	 * 
	 * @param id
	 * @return
	 */
	ResponseResult<Void> deleteUser(Integer id);

	/**
	 * 
	 * @param user
	 * @return
	 */
	ResponseResult<Void> webAddUser(User user);

	/**
	 * 
	 * @param userList
	 * @return
	 */
	ResponseResult<List<List<String>>> batchAddUser(String userList);


	
}
