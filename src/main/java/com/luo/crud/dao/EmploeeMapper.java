package com.luo.crud.dao;

import com.luo.crud.bean.Emploee;
import com.luo.crud.bean.EmploeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmploeeMapper {
    long countByExample(EmploeeExample example);

    int deleteByExample(EmploeeExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Emploee record);

    int insertSelective(Emploee record);

    List<Emploee> selectByExample(EmploeeExample example);

    Emploee selectByPrimaryKey(Integer empId);
    
    //添加两个查询用户并查询出他所属的哪个部门
    List<Emploee> selectByExampleWithDept(EmploeeExample example);

    Emploee selectByPrimaryKeyWithDept(Integer empId);

    int updateByExampleSelective(@Param("record") Emploee record, @Param("example") EmploeeExample example);

    int updateByExample(@Param("record") Emploee record, @Param("example") EmploeeExample example);

    int updateByPrimaryKeySelective(Emploee record);

    int updateByPrimaryKey(Emploee record);
}