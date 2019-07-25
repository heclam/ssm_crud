package com.luo.crud.bean;

public class Department {
    private Integer deptId;

    private String deptName;

	public Department() {
		super();
	}
	//创建有参的构造方法必须创建无参的构造方法
	public Department(Integer deptId, String deptName) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
	}

	public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }
    
}