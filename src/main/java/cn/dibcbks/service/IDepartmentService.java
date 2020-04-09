package cn.dibcbks.service;


import cn.dibcbks.entity.Unit;


public interface IDepartmentService {
	
	/**
	 * 初始企业部门信息
	 * @param unit
	 * @return 企业法人部门ID
	 */
	Integer addUnitDepartment(Unit unit); 
}
