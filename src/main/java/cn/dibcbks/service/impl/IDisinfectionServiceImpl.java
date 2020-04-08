package cn.dibcbks.service.impl;


import java.util.Date;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import com.alibaba.fastjson.JSONArray;
import cn.dibcbks.entity.Disinfection;
import cn.dibcbks.mapper.DisinfectionMapper;
import cn.dibcbks.service.IDisinfectionService;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.DateUtil;
import cn.dibcbks.util.ResponseResult;
/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: IDisinfectionServiceImpl
 * @Description: 清洗消毒业务实现类
 * @Date: 2020-03-24 10:39
 */
@Service
public class IDisinfectionServiceImpl implements IDisinfectionService {
	private static final Logger logger = LogManager.getLogger(IDetectionServiceImpl.class.getName());
	@Autowired
	private DisinfectionMapper disinfectionMapper;
	@Autowired
	private IUnitService iUnitService;
	
	
	@Override
	public ResponseResult<Void> addDisinfection(String resultList) {
		ResponseResult<Void> rr = null;
		try {
			Disinfection disinfection = new Disinfection();
			Date currentTime =new Date();
			disinfection.setDailyTime(DateUtil.dateFormat(currentTime, DateUtil.DATE_PATTERN));
			disinfection.setUnitId(CommonUtil.getSessionUser().getUnitId());
			disinfection.setUnitName(CommonUtil.getSessionUser().getUnitName());
			disinfection.setUserId(CommonUtil.getSessionUser().getId());
			disinfection.setUsername(CommonUtil.getSessionUser().getUsername());
			disinfection.setResult(resultList);
			disinfection.setCreateTime(currentTime);
			disinfectionMapper.insert(disinfection);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户新增清洗消毒记录成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
			logger.error(Constants.ERROR_HEAD_INFO + "用户新增清洗消毒记录失败，原因：" + e.getMessage());
		}
		return rr;		
	}
	
	
	@Override
	public List<Disinfection> getDisinfection() {
		//检索30天内的清洗消毒记录
		String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(d.create_time)";
		if (CommonUtil.getSessionUser().getType() != 1){
			where += " AND d.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'";
		}		
		return disinfectionMapper.select(where, " d.create_time DESC", null, null);
	}
	
	
	@Override
	public ResponseResult<List<Disinfection>> selectDisinfectionList(Integer unitId) {
		String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(d.create_time)";
		if (unitId != null) {
			where += " AND unit_id = '" + unitId + "'";
		}		
		List<Disinfection> disinfectionList = disinfectionMapper.select(where, " d.create_time DESC", null, null);		
		return new ResponseResult<List<Disinfection>>(ResponseResult.SUCCESS,disinfectionList);	
	}
	
	
	
	
	@Override
	public String selectDisinfectionListPag(Integer unitId, ModelMap modelMap) {
		if(CommonUtil.getSessionUser().getType() == 1){
			iUnitService.addUnitListToModelMap(modelMap);			
		}
		//检索30天内的清洗消毒记录
		String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(d.create_time)";
		if(CommonUtil.getSessionUser().getType() == 2){
			where += " AND d.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'";
		}else if(CommonUtil.getSessionUser().getType() == 3){
			where += " AND d.unit_id = '" + unitId + "'";
		}			
		List<Disinfection> disinfectionList = disinfectionMapper.select(where, " d.create_time DESC", null, null);
		//清洗消毒记录列表
		modelMap.addAttribute("disinfectionlist", disinfectionList);
		return "bks_wap/clean_list";
	}


	@Override
	public String disinfectionDetail(ModelMap modelMap, Integer id) {
		Disinfection disinfection = disinfectionMapper.queryDisinfection(id);
		JSONArray jsonArray = JSONArray.parseArray(disinfection.getResult());
		modelMap.addAttribute("DisinfectionDetal", jsonArray);
		modelMap.addAttribute("disinfectionbyid", disinfection);
		return "bks_wap/clean_detal";
	}


	

}
