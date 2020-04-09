package cn.dibcbks.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import com.alibaba.fastjson.JSONArray;
import cn.dibcbks.entity.Check;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.entity.Unqualified;
import cn.dibcbks.entity.User;
import cn.dibcbks.mapper.CheckMapper;
import cn.dibcbks.mapper.UnitMapper;
import cn.dibcbks.mapper.UnqualifiedMapper;
import cn.dibcbks.service.ICheckService;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.Constants;
import cn.dibcbks.util.DateUtil;
import cn.dibcbks.util.ResponseResult;

@Service
public class ICheckServiceImpl implements ICheckService {
	private static final Logger logger = LogManager.getLogger(ICheckServiceImpl.class.getName());
	@Autowired
	private CheckMapper checkMapper;
	@Autowired
	private UnitMapper unitMapper;
	@Autowired
	private IUnitService iUnitService;
	@Autowired
	private UnqualifiedMapper unqualifiedMapper;
	
	
	@Override
	public ResponseResult<List<Check>> selectCheckList(Integer unitId,Integer checkType) {
		ResponseResult<List<Check>> rr = null;
		try {
			String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(c.create_time) ";
			if(CommonUtil.getSessionUser().getType().equals(2)){
				where += " AND c.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'";
			}else{
				if(unitId != null){
					where += " AND c.unit_id = '" + unitId + "'";
				}
			}			
			if (checkType != null) {				
				where += " AND c.check_type = '" + checkType + "'";		
			}
			List<Check> list = checkMapper.select(where, " c.create_time DESC", null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！",list);
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户查询检查信息列表成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
			logger.error(Constants.ERROR_HEAD_INFO + "用户查询检查信息列表失败，原因：" + e.getMessage());
		}
		return rr;
	}
	
	@Override
	public List<Check> getCheckList(ModelMap modelMap) {
		try {
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession();
			User user = (User)session.getAttribute("user");
			List<Check> checkList = new ArrayList<>();
			if (user.getType().equals(1)) {//监管局账户
				checkList = checkMapper.select(null, " c.create_time DESC", null, null);
			}else {
				checkList = checkMapper.select(" c.unit_id = '" + user.getUnitId() + "'", " c.create_time DESC", null, null);
			}
			System.out.println(checkList);			
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户进入监管采集信息查看页面成功！");
			return checkList; 
		} catch (Exception e) {			
			logger.error(Constants.ERROR_HEAD_INFO + "用户进入信息采集信息查看页面失败，原因：" + e.getMessage());
			return null;
		}		
	}
	

	@Override
	public ResponseResult<Void> addCheckInfo(Integer unitId,String unitName,String unitType,String unitAddress,
			String unitPrincipal,String unitPhone,String resultList,String other,String inspectors,
			String dailyTime,Integer checkType,String checkPhoto) {
		ResponseResult<Void> rr = null;
		try {
			Check check = new Check();
			check.setUserId(CommonUtil.getSessionUser().getId());
			check.setUnitId(unitId);
			check.setUnitName(unitName);
			check.setUnitType(unitType);
			check.setUnitAddress(unitAddress);
			check.setUnitPrincipal(unitPrincipal);
			check.setUnitPhone(unitPhone);
			check.setResult(resultList);
			check.setOther(other);
			check.setInspectors(inspectors);
			check.setDailyTime(dailyTime);
			check.setCheckType(checkType);
			check.setCheckPhoto(checkPhoto);
			check.setCreateTime(new Date());
			checkMapper.insert(check);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户新增检查信息成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
			logger.error(Constants.ERROR_HEAD_INFO + "用户进入督察组专检页面失败，原因：" + e.getMessage());
		}
		return rr;
	}

	@Override
	public List<Check> getCheckListbyid(Integer id) {
		String where="id="+id;		
		return checkMapper.select(where, null, null, null);
	}

	@Override
	public List<Check> getCheckListbyuserid(Integer userId) {
		String where="user_id="+userId;		
		return checkMapper.select(where, null, null, null);
	}

	@Override
	public String selectCheckListPag(ModelMap modelMap, Integer unitId) {
		String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(c.create_time) ";
		if (CommonUtil.getSessionUser().getType().equals(1)) {
			iUnitService.addUnitListToModelMap(modelMap);
			
		}else if(CommonUtil.getSessionUser().getType().equals(2)){
			where += " AND c.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'";		
		}else{
			where += " AND c.unit_id = '" + unitId + "'";	
		}
		modelMap.addAttribute("checkList", checkMapper.select(where, " c.create_time DESC", null, null));
		return "bks_wap/inspect_list";
	}

	@Override
	public String addCheckPag(ModelMap modelMap, Integer checkType) {
		if (checkType == 1) {			
			List<Unit> unitList = unitMapper.select(" n.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'", null, null, null);
			modelMap.addAttribute("unitDetail", unitList.get(0));
		}else{
			iUnitService.addUnitListToModelMap(modelMap);
		}
		modelMap.addAttribute("checkType", checkType);
		return "bks_wap/inspect_add";
	}

	@Override
	public String selectCheckDetailPag(ModelMap modelMap, Integer id) {
		Check check = checkMapper.queryCheck(id);
		System.out.println(check);
		JSONArray jsonArray = JSONArray.parseArray(check.getResult());
		modelMap.addAttribute("InspectDetal", jsonArray);
		modelMap.addAttribute("checkListbyid", check);		
		return "bks_wap/inspect_detal";
	}

	@Override
	public ResponseResult<Void> addCheck(	Integer unitId, 
											String unitType, 
											String unitPhone, 
											String queryrights,
											String other, 
											Integer checkType) {

		ResponseResult<Void> rr = null;
		try {
			List<Unit> unitList = unitMapper.select(" n.unit_id = '" + unitId + "'", null, null, null);			
			Date currentTime = new Date();
			Check check = new Check();
			check.setUserId(CommonUtil.getSessionUser().getId());
			check.setUnitId(unitId);
			check.setUnitName(unitList.get(0).getUnitName());
			check.setUnitType(unitType);
			check.setUnitAddress(unitList.get(0).getUnitAddress());
			check.setUnitPrincipal(unitList.get(0).getLegalPerson());
			check.setUnitPhone(unitPhone);
			check.setResult(queryrights);
			check.setOther(other);
			check.setInspectors(CommonUtil.getSessionUser().getUsername());
			check.setDailyTime(DateUtil.dateFormat(currentTime, DateUtil.DATE_PATTERN));
			check.setCheckType(checkType);
			check.setCreateTime(currentTime);
			checkMapper.insert(check);
			JSONArray jsonArray = JSONArray.parseArray(queryrights);
			boolean qualified = false;
			for(int i=0; i<jsonArray.size(); i++){
				if(jsonArray.getInteger(i).equals(0)){
					System.out.println("第" + (i+1) + "项不合格！" );
					qualified = true;
				}
			}
			//存在不合格检查项生成不合格信息记录
			if(qualified){
				Unqualified unqualified = new Unqualified();
				unqualified.setUnitId(unitId);
				unqualified.setUnitName(unitList.get(0).getUnitName());
				unqualified.setOrderId(check.getId().toString());
				unqualified.setType(checkType == 1 ? 3 : checkType == 2 ? 4 : 5);
				unqualified.setCause((checkType == 1 ? "商检自检" : checkType == 2 ? "监管局专检" : "督察组检查") + "有检查项不符合要求。");
				unqualified.setStatus(0);
				unqualified.setCreateTime(currentTime);
				unqualifiedMapper.insert(unqualified);
				logger.info(Constants.SUCCESSU_HEAD_INFO + "监督检查单号:" + check.getId() + " 生成不合格信息记录！");
			}
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
			logger.info(Constants.SUCCESSU_HEAD_INFO + "用户新增监督检查信息成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
			logger.error(Constants.ERROR_HEAD_INFO + "用户新增监督检查信息失败，原因：" + e.getMessage());
		}
		return rr;
	}


	public static void main(String[] args) {
		int a = 1;
		String abc = a == 1 ? "3" : a == 2 ? "4" : "5";
		System.out.print(abc);
	}


}
