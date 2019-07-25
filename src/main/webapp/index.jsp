<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过ajax访问数据</title>
<%
	pageContext.setAttribute("resource_path",request.getContextPath());
%>
<!-- 引入jquery -->
<script type="text/javascript" src="${resource_path }/static/js/jquery-1.11.1.js" ></script>
<!--引入样式  -->
<link href="${resource_path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="${resource_path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
</head>
<body>

<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >员工修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">empName</label>
		    <div class="col-sm-10">
		      <p class="form-control-static" id="empName_update_static"></p>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@luo.com">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">gender</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
				</label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">deptName</label>
		    <div class="col-sm-4">
		    	<!-- 部门提交部门id即可 -->
		      <select class="form-control" name="dId">
		      </select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
      </div>
    </div>
  </div>
</div>
<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">empName</label>
		    <div class="col-sm-10">
		      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@luo.com">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">gender</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
				</label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">deptName</label>
		    <div class="col-sm-4">
		    	<!-- 部门提交部门id即可 -->
		      <select class="form-control" name="dId">
		      </select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>

	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<!-- 使用bootstrap：row表示行，一行有十二列 ，col-md-12表示占12列-->
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 操作 -->
		<div class="row">
			<!-- col-md-offset-8表示偏移8行 -->
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="addEmp">新增</button>
				<button class="btn btn-danger" id="delete_emp_all_btn">删除</button>
			</div>
		</div>
		<!-- 数据的展现 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="build_emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<div class="col-md-6" id="pageInfoShow">
				
			</div>
			<div class="col-md-6" id="pageNav_show">
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//1.页面加载完成以后，直接发送ajax请求，要到分页数据
		//定义一个全局的总页数
		var totalpage;
		//定义一个全局的当前页;
		var currentpage;
		$(function(){
			go_page(1);
		});
		function go_page(pn){
			$.ajax({
				url:"${resource_path }/empswithJackson",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					//console.log(result);
					//1.解析并显示员工数据
					build_emp_table(result);
					//2.解析并显示分页信息
					build_page_show(result);
					//3.解析并显示分页导航条的内容
					build_page_nav(result);
				}
			});
		}
		
		//员工的数据展现
		function build_emp_table(result){
			//首先清空
			$("#build_emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			//对list进行遍历
			$.each(emps,function(index,item){
				var check_item = $("<td><input type='checkbox' class='check_item' /></td>")
				var empId= $("<td></td>").append(item.empId);
				var empName =$("<td></td>").append(item.empName);
				var gender =$("<td></td>").append(item.gender=="M"?"男":"女");
				var email = $("<td></td>").append(item.email);
				var deptName = $("<td></td>").append(item.department.deptName);
				//定义两个按钮
				var editBut = ($("<button></button>").
						addClass("btn btn-primary btn-sm btn_edit").
						append($("<span></span>").
								addClass("glyphicon glyphicon-pencil")).
								append("编辑"));
				//把员工的id放在编辑按钮的属性里
				editBut.attr("edit-id",item.empId);
				var deleteBut = ($("<button></button>").
						addClass("btn btn-danger btn-sm btn_delete").
						append($("<span></span>").
								addClass("glyphicon glyphicon-trash")).
								append("删除"));
				//把员工的id放在删除按钮的属性里
				deleteBut.attr("del-id",item.empId);
				var but = $("<td></td>").append(editBut).append(" ").append(deleteBut);
				//append方法执行完成后还是返回原来的元素
				$("<tr></tr>").append(check_item).append(empId).append(empName).append(gender).append(email).append(deptName).append(but).appendTo("#build_emps_table tbody");
			});
		}
		//分页信息的数据展现
		function build_page_show(result){
			//首先清空
			$("#pageInfoShow").empty();
			var pageInfo = result.extend.pageInfo;
			 $("#pageInfoShow").append("当前第"+pageInfo.pageNum +"页,共"+pageInfo.pages+"页，共"+pageInfo.total+"记录");
			 
			 //为全局变量赋值(总的页数)
			 totalpage = pageInfo.pages;
			 //当前页
			 currentPage = pageInfo.pageNum;
		}
		//显示分页导航条
		
		function build_page_nav(result){
			//首先清空
			$("#pageNav_show").empty();
			//构建nav
			var nav = $("<nav></nav>");
			//构建ul
			var ul = $("<ul></ul>").addClass("pagination");
			//构建首页和上一页
			var firstLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var preLi =$("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")));
			//判断当前页是否还有上一页，若有则为上一页和首页添加不可用样式
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstLi.addClass("disabled");
				preLi.addClass("disabled");
			}else{
				//绑定点击事件
				 firstLi.click(function(){
					go_page(1);
				});
				preLi.click(function(){
					go_page(result.extend.pageInfo.pageNum-1);
				}); 
			}
			//把首页和上一页添加到ul中
			ul.append(firstLi).append(preLi);
			//构建要显示的导航页码li
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var mdLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.extend.pageInfo.pageNum == item){
					mdLi.addClass("active");
				}
				mdLi.click(function(){
						go_page(item);
				});
				ul.append(mdLi);
				
			});
			//构建下一页和末页li
			var nextLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")));
			var lastLi =$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.extend.pageInfo.hasNextPage == false){
				nextLi.addClass("disabled");
				lastLi.addClass("disabled");
			}else{
				//绑定点击事件
				 nextLi.click(function(){
					 go_page(result.extend.pageInfo.pageNum+1);
				});
				lastLi.click(function(){
					go_page(result.extend.pageInfo.pages);
				}); 
				
			}
			ul.append(nextLi).append(lastLi);
			//将构建的nav展示到id为pageNav_show域中
			nav.append(ul).appendTo("#pageNav_show");
		}
		
		//一个完整清空表单的方法
		function clearForm(ps){
			$(ps)[0].reset();
			//清空表单样式
			$(ps).find("*").removeClass("has-success has-error");
			$(ps).find(".help-block").text("");
		}
		
		//点击添加员工按钮,为之绑定一个点击事件
		$("#addEmp").click(function(){
			//清空表单(重置表单)
			//$("#empAddModal form")[0].reset();
			//调用完整清空表单的方法
			clearForm("#empAddModal form");
			//通过ajax查询并显示在select中
			getDepts("#empAddModal select");
			//显示添加员工的模态框
			$("#empAddModal").modal({
				backdrop:"static"
			});
		});
		
		//获取所有部门信息的方法
		function getDepts(flag){
			//首先对将要显示的控件清空
			$(flag).empty();
			$.ajax({
				url:"${resource_path }/deptswithJson",
				tyep:"GET",
				success:function(result){
					//console.log(result);
					/**
					{"code":100,"msg":"操作成功","extend":{"depts":[{"deptId":1,"deptName":"人力资源部"},{"deptId":2,"deptName":"会计部"},{"deptId":3,"deptName":"设计部"}]}}
					*/
					
					//遍历查询出来的部门信息,并显示在select中
					$.each(result.extend.depts,function(){
						$("<option></option").append(this.deptName).attr("value",this.deptId).appendTo(flag);
					});
				}
			});
		}
		
	
		//进行员工添加表单的验证
		function validate_form_emp(){
			var empName = $("#empName_add_input").val();
			//正则表达式两个斜杠包含的正则表达式是js里面特有的
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!regName.test(empName)){
				//清除父容器的样式
				//$("#empName_add_input").parent().removeClass("has-error has-success");
				//$("#empName_add_input").parent().addClass("has-error");
				//$("#empName_add_input").next("span").text("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");
				return false;
			}else{
				//$("#empName_add_input").parent().removeClass("has-error has-success");
				//$("#empName_add_input").parent().addClass("has-success");
				//$("#empName_add_input").next("span").text("");
				validate_msg("#empName_add_input","success","");
			}
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//$("#email_add_input").parent().removeClass("has-error has-success");
				//$("#email_add_input").parent().addClass("has-error");
				//$("#email_add_input").next("span").text("emial格式不正确！");
				validate_msg("#email_add_input","error","emial格式不正确！");
				return false;
			}else{
				//$("#email_add_input").parent().removeClass("has-error has-success");
				//$("#email_add_input").parent().addClass("has-success");
				//$("#email_add_input").next("span").text("");
				validate_msg("#email_add_input","success","");
			}
			return false;
		}
		
		//对进行员工添加表单的验证方法内容的提取
		function validate_msg(eleId,status,msg){
			//对父类容器进行移除
			$(eleId).parent().removeClass("has-error has-success");
			//对提示文字进行清空
			$(eleId).next("span").text("");
			if("success" == status){
				$(eleId).parent().addClass("has-success");
				$(eleId).next("span").text("");
				return true;
			}else{
				$(eleId).parent().addClass("has-error");
				$(eleId).next("span").text(msg);
				return false;
			}
		}
		
		//一个ajax校验用户名是否存在
		$("#empName_add_input").change(function(){
			//获取文本框里面的内容
			var empName = this.value;
			$.ajax({
				url:"${resource_path }/checkUserEx",
				type:"POST",
				data:"empName="+empName,
				success:function(result){
					//console.log(result);
					//判断返回状态码
					if(result.code == 100){
						//调用自定义的方法
						validate_msg("#empName_add_input","success","用户名可用");
						//为保存按钮设置一个属性并设值
						$("#emp_save_btn").attr("ajax-status","success");
					}else{
						validate_msg("#empName_add_input","error",result.extend.var_msg);
						$("#emp_save_btn").attr("ajax-status","error");
					}
				}
			});
			
		});
		
		//添加员工表单，点击保存按钮
			//$("#empAddModal form").serialize()将返回表单中的数据
		$("#emp_save_btn").click(function(){
			$.ajax({
				url:"${resource_path }/emp",
				type:"POST",
				data:$("#empAddModal form").serialize(),
				success:function(result){
					//console.log(result);
					//在添加员工前首先要进行表单验证
					/* if(!validate_form_emp()){
						return false;
					} */
					//当所有的ajax校验完后
					if($(this).attr("ajax_status") == "error"){
						return false;
					}
					
					//判断状态码是否为100
					if(result.code == 100){
						//成功
						
						//1.隐藏添加用户的模态框
						$("#empAddModal").modal('hide');
						//2.显示刚刚插入的数据（既跳转到最后一页）通过ajax进行页面的跳转
						go_page(totalpage);
					}else{
						//失败
						//console.log(result);
						
						//哪个字段的信息错误就显示哪个信息
						if(undefined != result.extend.fieldErrors.email){
							//显示邮箱的错误信息
							validate_msg("#email_add_input","error","邮箱格式不正确！");
						}
						if(undefined != result.extend.fieldErrors.empName){
							//显示员工姓名的错误信息
							validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");
						}
						
					}
					
				}
			});
		});
		
		//为编辑按钮设置点击事件，弹出编辑模态框
		/* $(".btn_edit").click(function(){
			alert("我出来了");
		}); */
		/*以上的事件绑定无法成功，(以上的方式时按钮没有创建的时候我们就为之绑定了，所以绑不上)因为编辑按钮是页面加载后通过ajax方法查询加载的
			应改为以下方式*/
		//on的第一个参数为绑定的事件为点击，第二个参数绑定的元素，第三个参数为回调方法
		$(document).on("click",".btn_edit",function(){
			//清空表单的样式
			clearForm("#empUpdateModal form");
			//1.查询部门的信息并显示
			getDepts("#empUpdateModal select");
			//2.查询员工的信息并显示
			getUpdateEmp($(this).attr("edit-id"));
			//3、把员工的id传递给模态框的更新按钮
			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
			//显示添加员工的模态框
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		//查询要修改员工的信息
		function getUpdateEmp(id){
			$.ajax({
				url:"${resource_path }/emp/"+id,
				type:"GET",
				success:function(result){
					//console.log(result);
					var empDate = result.extend.emp;
					$("#empName_update_static").text(empDate.empName);
					$("#email_update_input").val(empDate.email);
					//注意jq的语法
					$("#empUpdateModal input[name=gender]").val([empDate.gender]);
					$("#empUpdateModal select").val([empDate.dId]);
				}
			});
		};
		
		//提交修改员工信息
		$("#emp_update_btn").click(function(){
			//1.进行email的验证
			var email = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				validate_msg("#email_update_input","error","emial格式不正确！");
				return false;
			}else{
				validate_msg("#email_add_input","success","");
			}
			//2.发送ajax请求修改用户信息
			$.ajax({
				url:"${resource_path }/emp/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#empUpdateModal form").serialize(),
				success:function(result){
					//更新完成后 1.关闭更新模态框
					$("#empUpdateModal").modal('hide');
					//2.显示修改的当前页
					go_page(currentPage);
				}
			});
		
		});
		
		//删除用户
		$(document).on("click",".btn_delete",function(){
			var empname = $(this).parents("tr").find("td:eq(2)").text();
			if(confirm("您确认要删除"+empname+"吗？")){
				$.ajax({
					url:"${resource_path }/emp/"+$(this).attr("del-id"),
					type:"DELETE",
					success:function(result){
						//回到删除的页面
						go_page(currentPage);
					}
				});
			}
		});
		
		//完成全选/全部选功能
		$(check_all).click(function(){
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		//check_item
		$(document).on("click",".check_item",function(){
			//遍历所有的check_item查看选择的是否等于他的长度
			var flag = $(".check_item:checked").length ==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		
		//批量删除
		$("#delete_emp_all_btn").click(function(){
			var del_allname = "";
			var del_allempid = "";
			$.each($(".check_item:checked"),function(){
				del_allname +=$(this).parents("tr").find("td:eq(2)").text()+",";
				del_allempid += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			del_allname = del_allname.substring(0,del_allname.length-1);
			del_allempid = del_allempid.substring(0,del_allempid.length-1);
			if(confirm("您确定要删除"+del_allname+"吗？")){
				$.ajax({
					url:"${resource_path }/emp/"+del_allempid,
					type:"DELETE",
					success:function(result){
						//回到删除的页面
						go_page(currentPage);
					}
				});
			}
		});
	</script>
</body>
</html>