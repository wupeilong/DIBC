package cn.dibcbks.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.dibcbks.entity.Department;
import cn.dibcbks.entity.Unit;
import cn.dibcbks.mapper.DepartmentMapper;
import cn.dibcbks.service.IDepartmentService;

public class IDepartmentServiceImpl implements IDepartmentService {
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public Integer addUnitDepartment(Unit unit) {
		
		Department department = new Department();
		department.setUnitId(unit.getUnitId());//企业Id
		department.setDepartmentName(unit.getUnitName());//部门名称
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(0);//最上级
		department.setDepartmentType(6);//主体
		department.setAuthorizationId(3);//三级权限
		departmentMapper.insert(department);
		
		department.setDepartmentName("负责人");
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(department.getDepartmentId());//父级部门ID
		departmentMapper.insert(department);
		
		Integer legalPersonDepartmentId = department.getDepartmentId();//负责人部门ID
		
		department.setDepartmentName("从业人员");
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(department.getDepartmentParentId());//父级部门ID
		departmentMapper.insert(department);
		
		return legalPersonDepartmentId;
	}

}
