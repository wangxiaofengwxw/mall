<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>靓淘网</title>
		<%@include file="../common/head2.jsp" %>
		<link rel="stylesheet" href="${ctx}/resources/front/css/list_style.css" />
		<script type="text/javascript">
			function  toDetail(id) {
				location.href="${pageContext.request.contextPath}/index/toDetail.shtml?id="+id;
			}
		</script>
	</head>

	<body>
		<!-----------------------1.top-------------------->
		<div class="bg_color">
			<div class="top_center">
				<div class="left">
					<span class="wel">
						<a href="${ctx }/index/toIndex.shtml">欢迎来到靓淘！</a>
					</span>
				</div>
				<div class="right">
					<ul>
						<li>
						<c:if test="${isUser == null}"><a  class="login" href="${ctx}/index/login.shtml" target="_blank" >请登录</c:if>
						<c:if test="${isUser != null}">${isUser.username }</c:if>
						</a></li>
						<li><a href="register.html" target="_blank">快速注册</a></li>
						<li><a class="collect" href="">我的收藏</a></li>
						<li><a class="indent" href="">我的订单</a></li>
						<li><a class="phone" href="">手机靓淘</a></li>
						<li><a href="">我的积分</a></li>
						<li><a href="">我的评价</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-----------------------2.logo-------------------->
		<div class="logo_center">
			<div class="left">
				<img  class="logo_img" src="${ctx}/resources/front/img/LOGO.png" />
			</div> 
			<div class="center">
				<input class="btn1" type="text" value="洗面奶" />
				<input class="btn2" type="button" value="搜索" />
				<ul class="nav">
					<li><a href="" style="color: pink;">保湿 | </a></li>
					<li><a href="">面膜 | </a></li>
					<li><a href="">洗面奶 | </a></li>
					<li><a href="">补水 | </a></li>
					<li><a href="">香水 | </a></li>
					<li><a href="">眼霜 | </a></li>
					<li><a href="">口红 | </a></li>
					<li><a href="">护肤套装 | </a></li>
					<li><a href="">BB霜 | </a></li>
				</ul>
			</div>
			<div class="right">
				<div class="car">
					<a class="car_pic" href="${ctx }/index/Cart.shtml" target="_blank">去购物车结算</a>
				</div>
				<div class="narrow"></div>
			</div>
		</div>
		<div class="list">
		<c:forEach items="${list}" var="product">
			<div class="product">
				<img onclick="toDetail(${product.id})" alt="" src="${product.fullUrl }" style="width: 148ps;height: 300px">
				<p>${product.name }</p>
				<p style="color: red">${product.price }</p>
			</div>
		</c:forEach>	
		</div>
	</body>

</html>		
		