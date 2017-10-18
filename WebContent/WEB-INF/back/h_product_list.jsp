<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.situ.mall.pojo.*"%>    
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<title>Insert title here</title>

</head>
<body>
<%-- <%@include file="../common/product_header.jsp" %> --%>
 

<div class="container">
    <div class="row">
        <div class="col-md-10">
            
           <form action="${pageContext.request.contextPath}/student/delAll.action"id="mainForm"method="post">
	            <table class="table table-hover ">
	             <thead>
				<tr>
				    <td><input type="checkbox"  onclick="selectAll();" id="select"></td>
					<td>商品id</td>
					<td>种类</td>
					<td>商品名称</td>
					<td>商品副标题</td>
					<td>主图</td>
					<!-- <td>扩张图</td> -->
					<!-- <td>详情</td> -->
					<td>价格</td>
					<td>库存</td>
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
				<c:forEach items="${list}" var="product">
					<tr>
					    <td><input type="checkbox"name="selectIds"value="${product.id }"></td>
						<td>${product.id }</td>
						<td>${product.category.name }</td>
						<td>${product.name }</td>
						<td>${product.subtitle }</td>
						<td><img alt="" src="${product.fullUrl}" width="100" height="100"></td>
						<%-- <c:forEach items="${product.sub_images}" var="img">
						<td><img alt="" src="img" width="100" height="100"></td>
						</c:forEach> --%>
						<%-- <td>${product.detail }</td> --%>
						<td>${product.price }</td>
						<td>${product.stock }</td>
						<td>
						    <c:if test="${product.status == 1 }">上架</c:if>
						    <c:if test="${product.status == 2 }">下架</c:if>
						    <c:if test="${product.status == 3 }">删除</c:if>
							
						</td>
						<td>
						<fmt:formatDate value="${product.create_time}" pattern="yyyy-MM-dd"  />
                        </td>
						<td>
						<fmt:formatDate value="${product.update_time}" pattern="yyyy-MM-dd"  />
                        </td>
<!-- private Integer category_id;
	private String name;
	private String subtitle;
	private String main_image;
	private String sub_images;
	private String detail;
	private double price;
	private Integer stock;
	private Integer status;
	private Date create_time;
	private Date update_time; -->
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