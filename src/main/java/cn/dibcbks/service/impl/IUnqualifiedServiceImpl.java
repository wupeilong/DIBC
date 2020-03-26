package cn.dibcbks.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import com.alibaba.fastjson.JSONArray;
import cn.dibcbks.entity.Check;
import cn.dibcbks.entity.Distribution;
import cn.dibcbks.entity.Unqualified;
import cn.dibcbks.entity.User;
import cn.dibcbks.mapper.CheckMapper;
import cn.dibcbks.mapper.DistributionMapper;
import cn.dibcbks.mapper.ProcurementMapper;
import cn.dibcbks.mapper.UnqualifiedMapper;
import cn.dibcbks.service.IUnitService;
import cn.dibcbks.service.IUnqualifiedService;
import cn.dibcbks.util.CommonUtil;
import cn.dibcbks.util.ResponseResult;
/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: IUnqualifiedService
 * @Description: 不合格记录业务实现类
 * @Date: 2020-03-25 14:59
 */
@Service
public class IUnqualifiedServiceImpl implements IUnqualifiedService{
	@Autowired
	private IUnitService iUnitService;
	@Autowired
	private UnqualifiedMapper unqualifiedMapper;
	@Autowired
	private ProcurementMapper procurementMapper;
	@Autowired
	private CheckMapper checkMapper;
	@Autowired
	private DistributionMapper distributionMapper;
	
	
	
	@Override
	public String selectUnqualifiedListPag(ModelMap modelMap) {
		try {
			User user = CommonUtil.getSessionUser();
			String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(q.create_time) ";
			List<Unqualified> unqualifiedList = new ArrayList<Unqualified>();
			if (user.getType().equals(1)) {
				iUnitService.addUnitListToModelMap(modelMap);
				unqualifiedList = unqualifiedMapper.select(where, "q.create_time DESC", null, null);
			}else {
				unqualifiedList = unqualifiedMapper.select(where + " AND q.unit_id = '" + CommonUtil.getSessionUser().getUnitId() + "'", "q.create_time DESC", null, null);
			}
			System.out.println(unqualifiedList);
			modelMap.addAttribute("unqualifiedList", unqualifiedList);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "bks_wap/unqualified_list";
	}


	@Override
	public ResponseResult<List<Unqualified>> selectUnqualifiedList(Integer unitId, Integer type) {
		ResponseResult<List<Unqualified>> rr = null;
		try {
			String where = "date_sub(curdate(), INTERVAL 30 DAY) <= date(q.create_time) ";
			if(unitId != null){
				where += " AND q.unit_id = '" + unitId + "'";
			}
			if(type != null){
				where += " AND q.type = '" + type + "'";
			}
			List<Unqualified> unqualifiedList = unqualifiedMapper.select(where, "q.create_time DESC", null, null);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！",unqualifiedList);
		} catch (Exception e) {
			e.printStackTrace();
			rr  = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}


	@Override
	public String selectUnqualifiedDetailPage(ModelMap modelMap, Integer id) {
		try {
			modelMap.addAttribute("unqualifiedDetail", unqualifiedMapper.selectUnqualifiedById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "bks_wap/unqualified_detail";
	}


	@Override
	public ResponseResult<Void> updateUnqualified(Integer id, String result) {
		ResponseResult<Void> rr = null;
		try {
			Unqualified unqualified = unqualifiedMapper.selectUnqualifiedById(id);
			unqualified.setProcessUserId(CommonUtil.getSessionUser().getId());
			unqualified.setProcessUserName(CommonUtil.getSessionUser().getUsername());
			unqualified.setStatus(1);
			unqualified.setResult(result);
			unqualified.setProcessTime(new Date());
			unqualifiedMapper.updateById(unqualified);
			rr = new ResponseResult<>(ResponseResult.SUCCESS,"操作成功！");
		} catch (Exception e) {
			e.printStackTrace();
			rr = new ResponseResult<>(ResponseResult.ERROR,"操作失败！");
		}
		return rr;
	}


	@Override
	public String selectUnqualifiedOrderDetail(ModelMap modelMap, Integer id) {
		try {
			Unqualified unqualified = unqualifiedMapper.selectUnqualifiedById(id);
			if (unqualified.getType().equals(1) ) {//1-原材料采购
				modelMap.addAttribute("procurementDetail", procurementMapper.queryProcurement(Integer.valueOf(unqualified.getOrderId())));
				return "bks_wap/buy_detal";
			}
			if (unqualified.getType().equals(2)){//2-配餐验收
				Distribution distribution = distributionMapper.queryDistribution(unqualified.getOrderId());
				JSONArray acceptanceResult = JSONArray.parseArray(distribution.getAcceptanceResult());
				modelMap.addAttribute("acceptanceResult", acceptanceResult);
				modelMap.addAttribute("distributionDetial", distributionMapper.queryDistribution(unqualified.getOrderId()));
				//TODO 返校验收开餐验收信息页
				return "bks_wap/delivery_detal";
			}
			if (unqualified.getType() > 2){//3-商家自检 4-监管局专检 5-督查组专检				
				Check check = checkMapper.queryCheck(Integer.valueOf(unqualified.getOrderId()));
				JSONArray checkResult = JSONArray.parseArray(check.getResult());
				modelMap.addAttribute("InspectDetal", checkResult);
				modelMap.addAttribute("checkListbyid", check);		
				return "bks_wap/inspect_detal";
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bks_wap/404";
	}

}
