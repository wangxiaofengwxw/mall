<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.situ.mall.pojo.*"%>    
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@ include  file="../common/head.jsp"%>
<script type="text/javascript">
	function delStudent(id){
		var isDel = confirm("您确定要删除吗");
		if(isDel) {
			location.href="${pageContext.request.contextPath}/student/deleteById.action?id="+id;
		}
	}
	
	function selectAll() {
		$("input[name=selectIds]").prop("checked",$("#select").is(":checked"));
	}
	
	function delectAll() {
		var isDel = confirm("确定要删除吗？");
		if (isDel) {
				$("#mainForm").submit();
		}
	}
</script>
</head>
<body>
<%@include file="../common/cart_header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/cart/list.action"  class="list-group-item active">购物车管理</a>
                <a href="${pageContext.request.contextPath}/product/toAdd.action" class="list-group-item">...</a>
                <a href="${pageContext.request.contextPath}/product/toCategoryList.action" class="list-group-item">...</a>
                <a href="${pageContext.request.contextPath}/product/toSearchProduct.action" class="list-group-item">...</a>
            </div>
        </div>
        <div class="col-md-10">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="${pageContext.request.contextPath}/cart/list.action" >购物车管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}//product/toAdd.action" >...</a>
                </li>
                <li>
                	<a href="${pageContext.request.contextPath}/product/toCategoryList.action">....</a>
                </li>
                <li>
                	<a href="${pageContext.request.contextPath}/product/toSearchProduct.action">...</a>
                </li>
            </ul>
            
            <form action="${pageContext.request.contextPath}/student/delAll.action"id="mainForm"method="post">
	            <table class="table table-hover ">
	             <thead>
				<tr>
				    <td><input type="checkbox"  onclick="selectAll();" id="select"></td>
					<td>id</td>
					<td>用户名</td>
					<td>商品名称</td>
					<td>数量</td>
					<td>状态</td>
					<td>创建时间</td>
					<td>更新时间</td>
					<td>删除</td>
					<td>修改</td>
				</tr>
	            </thead>
				<%-- <%
			                       for (Student stu : list) {
			               %> --%>
			    <tbody>           
				<c:forEach items="${list}" var="cart">
					<tr>
					    <td><input type="checkbox"name="selectIds"value="${cart.id }"></td>
						<td>${cart.id }</td>
						<td>${cart.user.username }</td>
						<td>${cart.product.name }</td>
						<td>${cart.quantity }</td>
						<td>${cart.checked }</td>
						<td>
						<fmt:formatDate value="${cart.create_time}" pattern="yyyy-MM-dd"  />
                        </td>
						<td>
						<fmt:formatDate value="${cart.update_time}" pattern="yyyy-MM-dd"  />
                        </td>
						<td><a
							href="javascript:delStudent('${stu.id }')">删除</a></td>
						<td><a
							href="${pageContext.request.contextPath}/student/toUpdateStudent.action?id=${stu.id }">修改</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
        </form>
            
            
        </div>   
     </div>     
 </div>         
</body>
</html>