package cn.dibcbks.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import cn.dibcbks.entity.Unqualified;
import cn.dibcbks.entity.User;
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
				unqualifiedList = unqualifiedMapper.select(where + " AND q.unit_id = '" + "'", "q.create_time DESC", null, null);
			}
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
		
		return "bks_wap/unqualified_detail";
	}

}
