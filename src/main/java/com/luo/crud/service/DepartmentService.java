package com.luo.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luo.crud.bean.Department;
import com.luo.crud.dao.DepartmentMapper;

@Service
public class DepartmentService {
	
	//注入DepartmentMapper
	@Autowired
	private DepartmentMapper departmentMapper;

	public List<Department> getDepts() {
		return departmentMapper.selectByExample(null);
	}
	
}
