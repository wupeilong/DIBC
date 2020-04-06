package cn.dibcbks.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.dibcbks.entity.User;
import cn.dibcbks.mapper.UserMapper;
import cn.dibcbks.service.ILoginService;
import cn.dibcbks.service.IUserService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.GetCommonUser;
import cn.dibcbks.util.ResponseResult;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: ILoginServiceImpl
 * @Description: 多频检查控制器
 * @Date: 2020-03-24 17:01
 */
@Service
public class ILoginServiceImpl implements ILoginService {
	@Autowired
	private IUserService iUserService;
	@Autowired
	private UserMapper userMapper;

	@Override
	public ResponseResult<Void> registerUnitUser(	String idCard, 
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
													String legalPerson) {

		ResponseResult<Void> rr = null;
		try {
			GetCommonUser get=new GetCommonUser();
			String uuid = CommonUtil.getUUID();
			String businessLicensepath = get.uoladimg(file,uuid);
			if (businessLicensepath==null) {
				rr=new ResponseResult<Void>(ResponseResult.ERROR,"营业执照上传异常,人员信息添加失败");
			}else{
				String productionLicensepath=get.uoladimg(file1,uuid);
				if (productionLicensepath==null) {
					rr = new ResponseResult<Void>(ResponseResult.ERROR,"许可证上传异常,人员信息添加失败");
				}else{
					rr = iUserService.registeradd(uuid,idCard,username,password,phone,duty,age,unitName,legalPerson,businessLicenseCode,businessLicensepath,productionLicensepath,unitAddress,null,unitType);
				}			
			}
		}catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"注册失败！");
		}
		return rr;
	}


	@Override
	public ResponseResult<Void> registerAdminUser(User user) {
		ResponseResult<Void> rr = null;
		try {
			if(userMapper.queryUserByPhone(user.getPhone()) != null){
				rr =  new ResponseResult<Void>(ResponseResult.ERROR,"手机号重复！");
			}else{
				String uuid = CommonUtil.getUUID();
				String password = user.getPassword() == null ? Constants.INITIAL_PASSWORD : user.getPassword();
			 	String hashPassword = CommonUtil.getEncrpytedPassword(Constants.MD5, password, uuid, 1024);
			 	user.setUuid(uuid);
				user.setPassword(hashPassword);
				user.setParentId(0);//父级ID
				user.setType(1);//用户类型
				user.setUnitId(1);
				userMapper.insert(user);
				rr =  new ResponseResult<Void>(ResponseResult.SUCCESS,"企业账户分配成功!");			
			}						
		} catch (Exception e) {			
			rr =  new ResponseResult<Void>(ResponseResult.ERROR, "操作失败！");
		}
		return rr;		
	}

}
