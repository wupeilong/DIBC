package cn.dibcbks.service;

import java.util.List;

import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import cn.dibcbks.entity.Distribution;
import cn.dibcbks.util.ResponseResult;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: IDistributionService
 * @Description: 配送业务接口
 * @Date: 2020-03-24 14:50
 */
public interface IDistributionService {
	
	/**
	 * 进入配送信息列表页
	 * @param modelMap
	 * @return
	 */
	String distributionListPag(ModelMap modelMap);

	/**
	 * 查询配送信息列表页
	 * @param unitName
	 * @return
	 */
	ResponseResult<List<Distribution>> selectDistributionList(String unitName);

	/**
	 * 进入配送信息详情页
	 * @param modelMap
	 * @param id
	 * @return
	 */
	String distributionDetailPag(ModelMap modelMap, String id);

	/**
	 * 配送订单已送达
	 * @param id
	 * @return
	 */
	ResponseResult<Void> confirmDeliver(String id);

	/**
	 * 配送定单已验收
	 * @param id
	 * @param openedPhoto
	 * @return
	 */
	ResponseResult<Void> confirmAcceptance(String id, MultipartFile openedPhoto, String acceptanceResult); 

	/**
	 * 进入配送信息添加页
	 * @param modelMap
	 * @return
	 */
	String addDistributionlPag(ModelMap modelMap);
	
	/**
	 * 新增配送信息
	 * @param type
	 * @param mealsUnitName
	 * @param acceptanceUnitName
	 * @param mealsUserName
	 * @param packingPhoto
	 * @param sealPhoto
	 * @param carPhoto
	 * @param address
	 * @return
	 */
	ResponseResult<Void> addDistributionl(	Integer type, 
											Integer mealsUnitId,
											String mealsUnitName, 
											String acceptanceUnitName,
											String mealsUserName, 
											MultipartFile packingPhoto, 
											MultipartFile sealPhoto, 
											MultipartFile carPhoto,
											String address);
	
}
