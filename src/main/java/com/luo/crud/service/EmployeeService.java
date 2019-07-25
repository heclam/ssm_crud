package com.luo.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.luo.crud.bean.Emploee;
import com.luo.crud.bean.EmploeeExample;
import com.luo.crud.bean.EmploeeExample.Criteria;
import com.luo.crud.dao.EmploeeMapper;

@Service
public class EmployeeService {
	@Autowired
	EmploeeMapper emploeeMapper;
	//查询所有的用户
	public List<Emploee> getAll(){
		return emploeeMapper.selectByExampleWithDept(null);
	}
	
	/**
	 * 保存一个新的用户
	 * @param emploee
	 */
	public void save_emp(Emploee emploee) {
		emploeeMapper.insertSelective(emploee);
	}

	/**
	 * 根据用户名查询用户是否存在
	 * @return
	 */
	public boolean query_emp(String empName) {
		//构建查询的条件
		EmploeeExample example = new EmploeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = emploeeMapper.countByExample(example);
		return count == 0;
	}

	
	//查询要修改的用户
	public Emploee getEditEmp(Integer id) {
		Emploee emploee =emploeeMapper.selectByPrimaryKey(id);
		return emploee;
	}

	
	//修改用户信息
	public void updateEmp(Emploee emploee) {
		emploeeMapper.updateByPrimaryKeySelective(emploee);
	}

	//用户删除
	public void deleteEmp(Integer id) {
		emploeeMapper.deleteByPrimaryKey(id);
	}

	//用户的批量删除
	public void deleteEmpDebatch(List<Integer> dellist) {
		//构造条件
		EmploeeExample example = new EmploeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(dellist);
		emploeeMapper.deleteByExample(example);
	}
	
	
}
