<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>靓淘网</title>
		<%@include file="../common/head2.jsp" %>
		<link rel="stylesheet" href="${ctx}/resources/front/css/order_style.css" />
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
		
		<div class="order">
			<div style="width: 1100px;height: 41px;background-color: #F41443 ">
				<ul style="border: 1px solid black;height: 40px;">
					<li class="order_li"><a>全部订单</a></li>
					<li class="order_li"><a>待付款</a></li>
					<li class="order_li"><a>已付款</a></li>
					<li class="order_li"><a>待收货</a></li>
				</ul>
		   </div>
		
		<div style="margin-top:20px;height: 50px;">
			<ul style="border: 1px solid black;height: 40px;padding-top: 10px;;">
					<li class="orderli">订单信息</li>
					<li class="orderli">订单详情</li>
					<li class="orderli">订单时间</li>
					<li class="orderli">订单状态</li>
					<li class="orderli">订单操作</li>
				</ul>
				<c:forEach items="${list }" var="orderItem">
					<div class="order_box">
						<p>订单号：${orderItem.order_no }</p>
						<img alt="" src="${orderItem.product_image }" style="width: 60;height: 75px">
						<p>${orderItem.product_name }</p>
					</div>
					<div class="order_box">
						<p>数量：${orderItem.quantity }</p>
						<p>单价：${orderItem.current_unit_price }</p>
						<p>总额：${orderItem.total_price }</p>
					</div>
					<div class="order_box">
						<p><fmt:formatDate value="${orderItem.create_time }" pattern="yyyy-MM-dd hh:mm:ss"  /></p>
					</div>
					<div class="order_box">
						<%-- <c:if test="${order.status == 0 }">已取消</c:if>
						<c:if test="${order.status == 10 }">未付款</c:if>
						<c:if test="${order.status == 20 }">已付款</c:if>
						<c:if test="${order.status == 40}">已发货</c:if>
						<c:if test="${order.status == 50 }">交易成功</c:if>
						<c:if test="${order.status == 60 }">交易关闭</c:if> --%>
						<!-- 订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭', -->
					</div>
					<div class="order_box">
						<button>订单详情</button>
						<button>取消订单</button>
						<button>退款</button>
					</div>
				</c:forEach>
		</div>
		
	</div>
</body>
</html>		