<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 数据的展现 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp" >
						<tr>
							<th>${emp.empId }</th>
							<th>${emp.empName }</th>
							<th>${emp.gender=="M"?"男":"女" }</th>
							<th>${emp.email }</th>
							<th>${emp.department.deptName }</th>
							<th>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
								</button>
							</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<div class="col-md-6">
				当前${pageInfo.pageNum }页,总${pageInfo.pages }页，总${pageInfo.total}条记录
			</div>
			<div class="col-md-6">
				<!-- 分页导航条 -->
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${resource_path }/emps?pn=1">首页</a></li>
						<!-- 判断是否还有上一页 -->
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a href="${resource_path }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
								<span aria-hidden="true"> &laquo;</span>
							</a></li>
						</c:if>
						<!-- 拿出导航页码数 -->
						<c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
							<!-- 判断是否为当前页码 -->
							<c:if test="${page_num == pageInfo.pageNum }">
								<li class="active"><a href="#">${page_num }</a></li>
							</c:if>
							<c:if test="${page_num != pageInfo.pageNum }">
								<li ><a href="${resource_path }/emps?pn=${page_num}">${page_num }</a></li>
							</c:if>
						</c:forEach>
						<!-- 判断是否还有下一页 -->
						<c:if test="${pageInfo.hasNextPage }">
							<li><a href="${resource_path }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
								<span aria-hidden="true"> &raquo;</span>
							</a></li>
						</c:if>
						
						<li><a href="${resource_path }/emps?pn=${pageInfo.pages}">末页</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>