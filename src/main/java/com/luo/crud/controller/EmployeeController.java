package com.luo.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luo.crud.bean.Emploee;
import com.luo.crud.bean.Msg;
import com.luo.crud.dao.EmploeeMapper;
import com.luo.crud.service.EmployeeService;

@Controller
public class EmployeeController {
	//需要注入业务层
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 查询所有的用户并带分页的显示
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {//查询出来的用户进行分页查询,传入当前是第几页默认为第一页
		//startPage(pn,5);是分页的开始传入显示的第几页，每页显示多少条记录数
		PageHelper.startPage(pn,5);
		//在startpage()之后，紧跟的是下面的查询语句
		List<Emploee> list = employeeService.getAll();
		//将插叙出来的结果集保存在PageInfo这个包装类里面，这个类里面包装了众多分页的信息
		//第一个参数为结果集，第二个参数为连续显示的页码数
		PageInfo<Emploee> pageInfo = new PageInfo<Emploee>(list,5);
		//将pageInfo放入model里面便于在页面显示数据
		model.addAttribute("pageInfo",pageInfo);
		return "list";
		
	}
	
	/**
	 * 查询查询所有的用户并带分页的显示，以json的格式返回
	 * @param pn
	 * @param model
	 * @return
	 */
	//返回json字符串
	@RequestMapping("/empswithJackson")
	@ResponseBody
	public Msg getEmpsWithJackson(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {//查询出来的用户进行分页查询,传入当前是第几页默认为第一页
		//startPage(pn,5);是分页的开始传入显示的第几页，每页显示多少条记录数
		PageHelper.startPage(pn,5);
		//在startpage()之后，紧跟的是下面的查询语句
		List<Emploee> list = employeeService.getAll();
		//将插叙出来的结果集保存在PageInfo这个包装类里面，这个类里面包装了众多分页的信息
		//第一个参数为结果集，第二个参数为连续显示的页码数
		PageInfo<Emploee> pageInfo = new PageInfo<Emploee>(list,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 添加一个新的用户
	 * 指定方法为Post
	 * @param emploee
	 * @return
	 * 这里添加后台的数据校验 
	 * 1.在参数前面添加@value
	 * 2.添加第二个惨呼BindingResult，返回的错误信息
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg save_Emps(@Valid Emploee emploee,BindingResult result) {
		if(result.hasErrors()) {
			//如果有校验后有错误，则将错误信息显示在模态框上
			//1.获取到错误的信息
				//定义一个map用于存放错误信息
			Map<String,Object> map = new HashMap<String,Object>();
			List<FieldError> allError = result.getFieldErrors();
			for(FieldError fieldError:allError) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("fieldErrors", map);
		}else {
			employeeService.save_emp(emploee);
			return Msg.success();
		}
		
		
	}
	
	/**
	 * 更具用户名检查用户是否存在
	 * @param empName
	 * @return
	 */
	@RequestMapping("/checkUserEx")
	@ResponseBody
	public Msg query_emp(String empName) {
		//对传入的参数进行正则表达式的校验
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		boolean b = empName.matches(regx);
		if(!b) {
			return Msg.fail().add("var_msg","用户名可以是2-5位中文或者6-16位英文和数字的组合");
		}
		//数据库查询用户名是否存在
		boolean flag = employeeService.query_emp(empName);
		if(flag) {
			return Msg.success();
		}else {
			return Msg.fail().add("var_msg", "用户名不可用");
		}
	}
	
	/**
	 * 根据用户id查询要修改的用户信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEditEmp(@PathVariable("id") Integer id) {
		Emploee emploee = employeeService.getEditEmp(id);
		return Msg.success().add("emp", emploee);
		
	}

	/**
	 * 更新用户信息
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Emploee emploee) {
		employeeService.updateEmp(emploee);
		return Msg.success();
	}
	
	/**
	 * 用户删除
	 *批量删除和单个删除合并在一起
	 * @param del_allempid
	 * @return
	 */
	@RequestMapping(value="/emp/{del_allempid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable("del_allempid") String del_allempid) {
		if(del_allempid.contains("-")) {
			//批量删除
			List<Integer> dellist = new ArrayList<Integer>();
			//分割字符串
			String [] str = del_allempid.split("-");
			int i ;
			for(String s :str) {
				i = Integer.parseInt(s);
				//遍历字符串，把数据存入list中
				dellist.add(i);
			}
			employeeService.deleteEmpDebatch(dellist);
		}else {
			//单个删除
			int id = Integer.parseInt(del_allempid);
			employeeService.deleteEmp(id);
		}
		return Msg.success();
	}
	
}
