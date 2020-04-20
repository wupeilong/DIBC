package cn.dibcbks.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSONArray;
import cn.dibcbks.entity.Distribution;
import cn.dibcbks.entity.Unqualified;
import cn.dibcbks.entity.User;
import cn.dibcbks.mapper.DistributionMapper;
import cn.dibcbks.mapper.UnitMapper;
import cn.dibcbks.mapper.UnqualifiedMapper;
import cn.dibcbks.service.IDistributionService;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.GetCommonUser;
import cn.dibcbks.util.IDWorkUtil;
import cn.dibcbks.util.ResponseResult;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: IDistributionServiceImpl
 * @Description: 配送业务实现类
 * @Date: 2020-03-24 14:50
 */
@Service
public class IDistributionServiceImpl implements IDistributionService {
	private static final Logger logger = LogManager.getLogger(IDistributionServiceImpl.class.getName());
	@Autowired
	private UnitMapper unitMapper;
	@Autowired
	private IUnitService iUnitService;
	@Autowired
	private DistributionMapper distributionMapper;
	@Autowired
	private UnqualifiedMapper unqualifiedMapper;
	
	@Override
	public String distributionListPag(ModelMap modelMap) {
		User user = CommonUtil.getSessionUser();
		List<Distribution> distributionList = new ArrayList<>();
		String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(d.create_time) ";
		if (user.getType().equals(1)) {//监管局用户			
			iUnitService.addUnitListToModelMap(modelMap);
			distributionList = distributionMapper.select(where, " d.create_time DESC", null, null);			
		}else {
			distributionList = distributionMapper.select(where + " AND d.meals_unit_name = '" + user.getUnitName() + "' OR d.acceptance_unit_name = '" + user.getUnitName() + "'", " d.create_time DESC", null, null);
		}
		modelMap.addAttribute("distributionList", distributionList);
		return "bks_wap/delivery";
	}

	@Override
	public ResponseResult<List<Distribution>> selectDistributionList(String unitName) {
		ResponseResult<List<Distribution>> rr = null;
		try {
			String where ="date_sub(curdate(), INTERVAL 30 DAY) <= date(d.create_time) ";
			if(StringUtils.isNotEmpty(unitName)){
				where += " and d.meals_unit_name = '" + unitName + "' or d.acceptance_unit_name = '" + unitName + "'";
			}
			List<Distribution> distributionList = distributionMapper.select(where, " d.create_time DESC", null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！",distributionList);
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public String distributionDetailPag(ModelMap modelMap, String id) {
		Distribution distribution = distributionMapper.queryDistribution(id);
		modelMap.addAttribute("distributionDetial", distribution);
		//modelMap.addAttribute("distributionDetialResult", JSONArray.parseArray(distribution.getAcceptanceResult()));
		return "bks_wap/delivery_detal";
	}

	@Override
	public ResponseResult<Void> confirmDeliver(String id,ModelMap modelMap) {
		ResponseResult<Void> rr = null;
		try {
			Distribution distribution = new Distribution();
			distribution.setId(id);
			distribution.setEndTime(new Date());
			distribution.setStatus(2);//已送达
			modelMap.addAttribute("distributionDetial", distribution);
			distributionMapper.updateById(distribution);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public ResponseResult<Void> confirmAcceptance(String id, MultipartFile openedPhoto,String acceptanceResult,ModelMap modelMap) {
		ResponseResult<Void> rr = null;
		try {			
			User user = CommonUtil.getSessionUser();
			GetCommonUser get = new GetCommonUser();			
			String openedPhotoPath = get.uoladimg(openedPhoto,user.getUuid());
			if (StringUtils.isNotEmpty(openedPhotoPath)) {
				Distribution distribution = distributionMapper.queryDistribution(id);
				distribution.setAcceptanceUserName(user.getUsername());
				distribution.setOpenedPhoto(openedPhotoPath);//拆封取餐图
				distribution.setAcceptanceTime(new Date());
				distribution.setAcceptanceResult(acceptanceResult);
				distribution.setStatus(3);//已验收
				distributionMapper.updateById(distribution);
				JSONArray jsonArray = JSONArray.parseArray(acceptanceResult);
				boolean qualified = false;
				for(int i=0; i<jsonArray.size(); i++){
					if(jsonArray.getInteger(i).equals(0)){
						System.out.println("第" + (i+1) + "项不符合验收要求！" );
						qualified = true;
					}
				}
				//存在不合格检查项生成不合格信息记录
				if(qualified){
					Unqualified unqualified = new Unqualified();
					unqualified.setUnitId(CommonUtil.getSessionUser().getUnitId());
					unqualified.setUnitName(CommonUtil.getSessionUser().getUnitName());
					unqualified.setOrderId(id);
					unqualified.setType(2);
					unqualified.setCause("配餐验收有项目没有达到返校食品验收标准。");
					unqualified.setStatus(0);
					unqualified.setCreateTime(new Date());
					unqualifiedMapper.insert(unqualified);
					logger.info(Constants.SUCCESSU_HEAD_INFO + "配餐单号:" + id + " 生成不合格信息记录！");
				}
				modelMap.addAttribute("distributionDetial", distribution);
				rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			}else{
				rr = new ResponseResult<>(ResponseResult.ERROR,"上传拆封取餐图失败，请重新上传！");
			}
		} catch (Exception e) {
			e.printStackTrace();			
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}

	@Override
	public String addDistributionlPag(ModelMap modelMap) {
		iUnitService.addUnitListToModelMap(modelMap);
		modelMap.addAttribute("unitDetail", unitMapper.select(" n.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'", null, null, null).get(0));
		return "bks_wap/delivery_add";
	}

	@Override
	public ResponseResult<Void> addDistributionl(	Integer type, 
													Integer mealsUnitId,
													String mealsUnitName, 
													String acceptanceUnitName,
													String mealsUserName, 
													MultipartFile packingPhoto, 
													MultipartFile sealPhoto, 
													MultipartFile carPhoto,
													String address) {
		
		ResponseResult<Void> rr = null;	
		User user = CommonUtil.getSessionUser();
		GetCommonUser get = new GetCommonUser();	
		String packingPhotoPath = get.uoladimg(packingPhoto,user.getUuid());
		String sealPhotoPath = get.uoladimg(sealPhoto,user.getUuid());
		String carPhotoPath = get.uoladimg(carPhoto,user.getUuid());		
		if(StringUtils.isEmpty(packingPhotoPath)){
			rr = new ResponseResult<>(ResponseResult.ERROR,"送餐装箱图上传失败，请重新上传！");
		}else if (StringUtils.isEmpty(sealPhotoPath)) {
			rr = new ResponseResult<>(ResponseResult.ERROR,"装箱封条图上传失败，请重新上传！");
		}else if (StringUtils.isEmpty(carPhotoPath)) {
			rr = new ResponseResult<>(ResponseResult.ERROR,"送餐车图上传失败，请重新上传！");
		}else {
			Date createTime = new Date();
			Distribution distribution = new Distribution();
			distribution.setId(IDWorkUtil.getUniqueCode());
			distribution.setDailyTime(new SimpleDateFormat("yyyy年MM月dd日").format(createTime));
			distribution.setType(type);
			//配餐类型：1-学校自主开餐 2-餐饮业配餐
			distribution.setCateringType(CommonUtil.getSessionUser().getUnitId().equals(mealsUnitId) ? 1 : 2);
			//送餐单位			
			distribution.setMealsUnitId(mealsUnitId);
			distribution.setMealsUnitName(mealsUnitName);
			//送餐人
			distribution.setMealsUserId(CommonUtil.getSessionUser().getId());
			distribution.setMealsUserName(mealsUserName);
			//收餐单位
			distribution.setAcceptanceUnitId(CommonUtil.getSessionUser().getUnitId());
			distribution.setAcceptanceUnitName(acceptanceUnitName);
			distribution.setPackingPhoto(packingPhotoPath);
			distribution.setSealPhoto(sealPhotoPath);
			distribution.setCarPhoto(carPhotoPath);
			distribution.setAddress(address);
			distribution.setStartTime(createTime);
			distribution.setStatus(1);//启送中
			distribution.setCreateTime(createTime);		
			distributionMapper.insert(distribution);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
		}
		return rr;
	}

}
