package cn.dibcbks.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dibcbks.entity.Department;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.mapper.DepartmentMapper;
import cn.dibcbks.service.IDepartmentService;

@Service
public class IDepartmentServiceImpl implements IDepartmentService {
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public Integer addUnitDepartment(Unit unit) {
//		`department_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管辖部门ID',
//		  `unit_id` int(11) NOT NULL COMMENT '主体ID',
//		  `department_name` varchar(32) DEFAULT NULL COMMENT '管辖部门名称',
//		  `department_head` varchar(32) DEFAULT NULL COMMENT '管辖部门负责人',
//		  `department_description` varchar(255) DEFAULT NULL COMMENT '管辖部门描述',
//		  `department_parent_id` int(11) DEFAULT NULL COMMENT '上级管辖部门ID',
//		  `department_type` int(3) DEFAULT NULL COMMENT '管辖部门类型：1-市场监管局 2-市场监管分局 3-社区[街道办事处] 4-居委会 5-网格 6-主体',
//		  `authorization_id` int(11) DEFAULT NULL COMMENT '权限级别',
//		  `department_authorization` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '管辖部门授权',

		Department department = new Department();
		department.setUnitId(unit.getUnitId());//企业Id
		department.setDepartmentName(unit.getUnitName());//部门名称
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(0);//最上级
		department.setDepartmentType(6);//主体
		department.setAuthorizationId(3);//三级权限
		departmentMapper.insert(department);
		
		department.setDepartmentName("企业法人");
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(department.getDepartmentId());//父级部门ID
		departmentMapper.insert(department);
		
		Integer legalPersonDepartmentId = department.getDepartmentId();//法人部门ID
		
		department.setDepartmentName("采购员");
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(department.getDepartmentParentId());//父级部门ID
		departmentMapper.insert(department);
		
		department.setDepartmentName("配送员");
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(department.getDepartmentParentId());//父级部门ID
		departmentMapper.insert(department);
		
		department.setDepartmentName("验收员");
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(department.getDepartmentParentId());//父级部门ID
		departmentMapper.insert(department);
		
		department.setDepartmentName("从业人员");
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(department.getDepartmentParentId());//父级部门ID
		departmentMapper.insert(department);
		
		return legalPersonDepartmentId;
	}

}
