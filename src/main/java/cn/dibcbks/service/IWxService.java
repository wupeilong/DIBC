package cn.dibcbks.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import cn.dibcbks.entity.Unit;
import cn.dibcbks.util.ResponseResult;
import cn.dibcbks.util.wx.WxUserInfoOut;

public interface IWxService {
	
	/**
	 * 微信登录获取网页授权地址页
	 * @param modelMap
	 * @return
	 */
	String wxLogin(ModelMap modelMap);

	/**
	 * 处理网页授权回调
	 * @param code
	 * @param request
	 * @return
	 */
	String wxOauth2Redirect(String code, HttpServletRequest request,ModelMap modelMap);

	
	/**
	 * 绑定用户类型:大众
	 * @param request
	 * @param modelMap
	 * @return
	 */
	ResponseResult<Void> bindPublic(WxUserInfoOut wxUserInfoOut, HttpServletRequest request, ModelMap modelMap);

	/**
	 * 绑定用户类型:主体人员
	 * @param businessLicenseCode
	 * @param request
	 * @param modelMap
	 * @return
	 */
	ResponseResult<Void> bindUnit(String businessLicenseCode, Integer roleId, HttpServletRequest request, ModelMap modelMap);

	/**
	 * 绑定用户类型:监管人员
	 * @param phone
	 * @param password
	 * @param request
	 * @param modelMap
	 * @return
	 */
	ResponseResult<Void> bindSupervise(String phone, String password, HttpServletRequest request, ModelMap modelMap);

	/**
	 * 创建主体绑定用户类型:主体人员
	 * @param unitName
	 * @param businessLicenseCode
	 * @param file
	 * @param file1
	 * @param request
	 * @param modelMap
	 * @return
	 */
	ResponseResult<Void> createBindUnit(String unitName, String businessLicenseCode, MultipartFile file, MultipartFile file1,
			Integer unitType, HttpServletRequest request, ModelMap modelMap);

	/**
	 * 绑定用户类型:进入创建主体页
	 * @param request
	 * @param modelMap
	 * @return
	 */
	String createUnitPage(HttpServletRequest request, ModelMap modelMap);
	
	/**
	 * 获取企业列表信息
	 * @param modelMap
	 * @return
	 */
	String getUnitList(ModelMap modelMap);
	
	/**
	 * 根据企业id查询企业详细信息
	 * @param modelMap
	 * @param unitId
	 * @return
	 */
	String selectUnitDetail(ModelMap modelMap,Integer unitId);

	

	

}
