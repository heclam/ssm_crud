package com.luo.crud.bean;

import javax.validation.constraints.Pattern;


public class Emploee {
    private Integer empId;
    
    //自定义的信息校验
    //第一个参数正则表达式，第二个参数是错误信息
    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message="用户名可以是2-5位中文或者6-16位英文和数字的组合")
    private String empName;

    private String gender;
    //@Email
    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message="emial格式不正确！")
    private String email;

    private Integer dId;


	//希望查询用户的同时查询出所属部门的信息
    private Department department;
    
    public Emploee() {
		super();
	}
    //创建有参的构造方法，必须创建无参的构造方法
	public Emploee(Integer empId, String empName, String gender, String email, Integer dId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gender = gender;
		this.email = email;
		this.dId = dId;
	}

    
    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}