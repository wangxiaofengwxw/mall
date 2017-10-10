<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>靓淘网</title>
		<%@include file="../common/head2.jsp" %>
		<link rel="stylesheet" href="${ctx}/resources/front/css/payment_style.css" />
	</head>

	<body>
		<!-----------------------1.top-------------------->
		<div class="bg_color">
			<div class="top_center">
				<div class="left">
					<span class="wel">
						欢迎来到靓淘！
					</span>
				</div>
				<div class="right">
					<ul>
						<li>
						<c:if test="${isUser == null}"><a  class="login" href="${ctx}/index/login.shtml" target="_blank" >请登录</a></c:if>
						<c:if test="${isUser != null}">${isUser.username }</c:if>
						</li>
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
				<img class="logo_img" src="${ctx}/resources/front/img/LOGO.png" />
			</div> 
			<div class="center">
			    <form action="${ctx }/index/list.shtml">
					<input class="btn1" type="text" value="洗面奶" />
					<button class="btn2" >搜索</button>
					<!-- <input class="btn2" type="button" value="搜索" /> -->
				</form>
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
		<!-----------------------3.导航栏-------------------->
		<div class="big_menu">
			<div class="menu">
				<ul class="menu_ul">
					<li>
						<a class="current" href="">
							商城首页
						</a>
					</li>
					<li>
						<a href="">
							美妆商城
						</a>
					</li>
					<li>
						<a href="">
							服装运动
						</a>
					</li>
					<li>
						<a href="">
							家电数码
						</a>
					</li>
					<li>
						<a href="">
							家装家纺
						</a>
					</li>
					<li>
						<a href="">
							淘遍美食
						</a>
					</li>
					<li>
						<a href="">
							国际轻奢
						</a>
					</li>
					<div class="clearfix"></div>
				</ul>
			</div>
		</div>
		
		<div style="width: 1100px;border: 1px solid black;  margin-left: 480px;margin-top: 30px">
		<p>选择收货地址：</p>
		<c:forEach items="${list }" var="Shipping">
			<div style="width: 300px;
			height: 200px;
			float: left;
			margin-left: 20px;
			border: 1px solid red;">
			   <p>
			   ${Shipping.receiver_province}
			   ${Shipping.receiver_city}
			   ${Shipping.receiver_district}
			   ${Shipping.receiver_address}
			   ${Shipping.receiver_zip}
			  </p>
			  <p>姓名：${isUser.username}</p>
			  <p>固定电话：${Shipping.receiver_phone}</p>
			  <p>移动电话：${Shipping.receiver_mobile}</p>
			</div>
		</c:forEach>	
		<div class="clearfix"></div>
		<div style="margin-top: 50px;height: 100px;border: 1px solid black;">
			<p>选择付款方式:</p>
			<p>    1:</p>
			<p>    2:</p>
			<p>    3:</p>
		</div>
		
		<div>
			<p>总价：${tatolPrice }</p>
			<button style="margin-left: 900px">提交订单</button>
		</div>
		
		<div>
			
	</body>
</html>		