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
		
		Department department = new Department();
		department.setUnitId(unit.getUnitId());//企业Id
		department.setDepartmentName(unit.getUnitName());//部门名称
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(0);//最上级
		department.setDepartmentType(6);//主体
		department.setAuthorizationId(4);//三级权限
		departmentMapper.insert(department);
		Integer departmentParentId = department.getDepartmentId();//企业部门ID
		
		department = new Department();
		department.setUnitId(unit.getUnitId());//企业Id
		department.setDepartmentName("负责人");
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(departmentParentId);//父级部门ID
		department.setDepartmentType(6);//主体
		department.setAuthorizationId(5);//五级权限
		departmentMapper.insert(department);
		
		Integer legalPersonDepartmentId = department.getDepartmentId();//负责人部门ID
		
		department = new Department();
		department.setUnitId(unit.getUnitId());//企业Id
		department.setDepartmentName("从业人员");
		department.setDepartmentHead(unit.getLegalPerson());//负责人
		department.setDepartmentParentId(departmentParentId);//父级部门ID
		department.setDepartmentType(6);//主体
		department.setAuthorizationId(5);//五级权限
		departmentMapper.insert(department);
		
		return legalPersonDepartmentId;
	}

}
