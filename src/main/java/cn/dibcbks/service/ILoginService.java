package cn.dibcbks.service;

import org.springframework.web.multipart.MultipartFile;

import cn.dibcbks.entity.User;
import cn.dibcbks.util.ResponseResult;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: ILoginService
 * @Description: 多频检查控制器
 * @Date: 2020-03-24 17:00
 */
public interface ILoginService {

	/**
	 * 企业+用户注册实现
	 * @param idCard
	 * @param username
	 * @param password
	 * @param phone
	 * @param duty
	 * @param age
	 * @param unitName
	 * @param businessLicenseCode
	 * @param file
	 * @param file1
	 * @param unitAddress
	 * @param unitType
	 * @param legalPerson
	 * @return
	 */
	ResponseResult<Void> registerUnitUser(	String idCard,
											String username,
											String password,
											String phone,
											String duty,
											Integer age,
											String unitName,
											String businessLicenseCode,
											MultipartFile file,
											MultipartFile file1,
											String unitAddress,
											Integer unitType, 
											String legalPerson);

	/**
	 * 监管人员注册
	 * @param user
	 * @return
	 */
	ResponseResult<Void> registerAdminUser(User user);

	
	
}
