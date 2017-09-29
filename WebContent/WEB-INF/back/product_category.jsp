<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="../common/product_header.jsp" %>
<%@ include  file="../common/head.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/product/list.action"  class="list-group-item ">商品管理</a>
                <a href="${pageContext.request.contextPath}/product/toAdd.action" class="list-group-item ">添加商品</a>
                <a href="${pageContext.request.contextPath}/product/toCategoryList.action" class="list-group-item active" >种类管理</a>
                <a href="${pageContext.request.contextPath}/product/toSearchProduct.action" class="list-group-item" >商品查询</a>
            </div>
        </div>
        <div class="col-md-10">
            <ul class="nav nav-tabs">
                <li>
                    <a href="${pageContext.request.contextPath}/product/list.action" >商品管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/product/toAdd.action" >添加商品</a>
                </li>
                <li class="active">
                	<a href="${pageContext.request.contextPath}/product/toCategoryList.action">种类管理</a>
                </li>
                <li>
                	<a href="${pageContext.request.contextPath}/product/toSearchProduct.action">商品查询</a>
                </li>
            </ul>
            
            <form action="${pageContext.request.contextPath}/product/add.action" method="post" class="form_border">
		        <div class="form-group">
                    <label>添加一级分类</label>
                    <input type="text" name="oneId" class="form-control" placeholder="一级分类">
                </div>
                <input class="btn btn-success btn-lg" type="submit" value="添加"  />
            </form>
            <form action="${pageContext.request.contextPath}/product/add.action" method="post" class="form_border">
                 <div class="form-group">
                       <label>一级分类</label>
                       <select id="oneCategory" onchange="selectTwo(this)" class="form-control">
                            <option>请选择</option>
                       	<c:forEach items="${oneList}" var="category">
                            <option value="${category.id }">${category.name }</option>
                       	</c:forEach> 
                       </select>
                 </div>
		        <div class="form-group">
                    <label>添加二级分类</label>
                    <input type="text" name="twoId" class="form-control" placeholder="二级分类">
                </div>
                <input class="btn btn-success btn-lg" type="submit" value="添加"  />
            </form>
        </div>    
   </div>         
</div>
</body>
</html>