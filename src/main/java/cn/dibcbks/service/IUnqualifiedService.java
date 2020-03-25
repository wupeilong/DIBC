package cn.dibcbks.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import cn.dibcbks.entity.Unqualified;
import cn.dibcbks.util.ResponseResult;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: IUnqualifiedService
 * @Description: 不合格记录业务接口
 * @Date: 2020-03-25 14:59
 */
public interface IUnqualifiedService {

	/**
	 * 进入不合格信息列表页
	 * @param modelMap
	 * @return
	 */
	String selectUnqualifiedListPag(ModelMap modelMap);

	/**
	 * 不合格信息列表查询
	 * @param unitId
	 * @param type
	 * @return
	 */
	String selectUnqualifiedList(Integer unitId, Integer type);

}
