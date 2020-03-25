package cn.dibcbks.service.impl;


import java.util.Date;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import cn.dibcbks.entity.Detection;
import cn.dibcbks.mapper.DetectionMapper;
import cn.dibcbks.service.IDetectionService;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.GetCommonUser;
import cn.dibcbks.util.ResponseResult;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: IDetectionServiceImpl
 * @Description: 多频检查业务实现类
 * @Date: 2020-03-24 15:42
 */
@Service
public class IDetectionServiceImpl implements IDetectionService{
	private static final Logger logger = LogManager.getLogger(IDetectionServiceImpl.class.getName());
	@Autowired
	private DetectionMapper detectionMapper;
	@Autowired
	private IUnitService iUnitService;
	
	@Override
	public ResponseResult<List<Detection>> selectDetectionList(ModelMap modelMap,Integer unitId) {
		ResponseResult<List<Detection>> rr = null;
		try {
			String where = null;
			if (unitId != null) {
				where = "d.unit_id = '" + unitId + "'";
			}
			List<Detection> detectionList = detectionMapper.select(where, " d.create_time DESC", null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！",detectionList);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户查询检测报送信息列表成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
			logger.error(Constants.ERROR_HEAD_INFO + "用户查询检测报送信息列表失败，原因：" + e.getMessage());
		}
		return rr;
	}

	

	@Override
	public ResponseResult<Void> addDetection(Detection detection) {
		ResponseResult<Void> rr = null;
		try {	 
			detectionMapper.insert(detection);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户新增检测报送信息列表成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
			logger.error(Constants.ERROR_HEAD_INFO + "用户新增检测报送信息列表失败，原因：" + e.getMessage());
		}
		return rr;
	}

	@Override
	public String selectDetectionDetailPag(ModelMap modelMap, Integer id) {
		try {
			modelMap.addAttribute("detectionDetail", detectionMapper.queryDetection(id));
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户进入多频次检测详情信息页！");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Constants.ERROR_HEAD_INFO + "用户进入多频次检测详情信息页失败，原因：" + e.getMessage());
		}
		return "bks_wap/detection_detal";
	}

	@Override
	public String selectDetectionListPage(ModelMap modelMap) {
		
		iUnitService.addUnitListToModelMap(modelMap);
		String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(d.create_time) ";
		List<Detection> detectionList = detectionMapper.select(where, null, null, null);
		modelMap.addAttribute("detectionList", detectionList);
		return "bks_wap/detection_list";
	}



	@Override
	public String addDetectionPag(ModelMap modelMap) {

		iUnitService.addUnitListToModelMap(modelMap);
		return "bks_wap/detection_add";
	}



	@Override
	public ResponseResult<Void> addDetection(	Integer unitId, 
												String unitName, 
												String samplName, 
												String specifications,
												String bath, 
												String item, 
												String result, 
												String remark, 
												MultipartFile file) {
		
		ResponseResult<Void> rr = null;		
		GetCommonUser get=new GetCommonUser();			
		String detectionpath=get.uoladimg(file,CommonUtil.getSessionUser().getUuid());
		if (detectionpath==null) {
			rr = new ResponseResult<Void>(ResponseResult.ERROR,"图片上传异常,人员信息添加失败");
		}else{
			Detection detection=new Detection();
			detection.setUserId(CommonUtil.getSessionUser().getId());
			detection.setUnitId(unitId);
			detection.setUnitName(unitName);
			detection.setSamplName(samplName);
			detection.setSpecifications(specifications);
			detection.setBath(bath);
			detection.setItem(item);
			detection.setResult(result);
			detection.setRemark(remark);
			detection.setDetectionPhoto(detectionpath);
			detection.setCreateTime(new Date());
			rr = addDetection(detection);						
		}		
		return rr;
	}

}
