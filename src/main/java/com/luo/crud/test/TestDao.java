package com.luo.crud.test;

import java.util.UUID;

/*import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.luo.crud.bean.Department;
import com.luo.crud.bean.Emploee;
import com.luo.crud.dao.DepartmentMapper;
import com.luo.crud.dao.EmploeeMapper;*/

/**
 * 
 * 这是Dao的测试模块
 * @author hy
 *1.使用spring提供的单元测试框架@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
 *	需要导入test的jar包,locations是一个数组
 *2.@RunWith(SpringJUnit4ClassRunner.class)指定使用spring的单元测试
 *3.要使用哪个直接@Autowired即可
 */
/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})*/
public class TestDao {
	//部门的测试类
/*	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmploeeMapper emploeeMapper;*/
	
	//需要在applicationContext.xml文件中配置sessionFactory,并使用Autowired
	/*@Autowired
	SqlSession sqlSession;
	@Test
	public void testInsertSelect() {*/
//		Department d1 = new Department();
//		d1.setDeptName("人力资源部");
//		Department d2 = new Department();
//		d2.setDeptName("会计部");
//		departmentMapper.insertSelective(d1);
//		departmentMapper.insertSelective(d2);
		//通过构造方法创建内名类
//		departmentMapper.insertSelective(new Department(null,"设计部"));
		
//		emploeeMapper.insertSelective(new Emploee(null,"feifei", "M", "feifei@luo.com",1));
		
		//对员工插入进行批处理
	/*	EmploeeMapper mapper  = sqlSession.getMapper(EmploeeMapper.class);
		for(int i=0;i<100;i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insertSelective(new Emploee(null,uid ,"M",uid+"@luo.com", 1));
		}
		System.out.println("批量完成");
	
	}*/
}
