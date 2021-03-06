<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
		<%@include file="../common/head2.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>靓淘网</title>
		<link rel="stylesheet" href="${ctx}/resources/front/css/order_style.css" />
		<script type="text/javascript">
		function info(order_no) {
			layer.open({
				type:2,//（iframe层）
				title:'订单详情',
				area: ['600px', '400px'],
				offset: '200px',//只定义top坐标，水平保持居中
				content:"${ctx}/order/getOrderInfo.shtml?order_no="+order_no,//这里只是写的一个跳转到JSP页面的方法
		    })
		}
		</script>
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
				<ul style="border: 1px solid #808080;height: 40px;">
					<li class="order_li"><a>全部订单</a></li>
					<li class="order_li"><a>待付款</a></li>
					<li class="order_li"><a>已付款</a></li>
					<li class="order_li"><a>待收货</a></li>
				</ul>
		   </div>
		   <c:forEach items="${orderList}" var="order">
			   <div class="order_list">
			   		<div class="box1">
			   			<p style="color: #F41443">订单号：${order.orderItem.order_no }</p>
			   		</div>
			   		<div class="box2">
			   			<div class="box2_1">
			   				<c:forEach items="${itemList }" var="orderItem">
							    <c:if test="${order.orderItem.order_no == orderItem.order_no }">
							    	<div class="box_order">
							    		<div style="margin-top: 10px;float: left;">
							    			<img alt="" src="${orderItem.product_image }" style="width: 60;height: 75px">
							    		</div>
							    		<div style="float: left: ;">
							    			<p style="padding-top: 10px">${orderItem.product_name }</p>
											<p>数量：${orderItem.quantity }</p>
											<p>单价：${orderItem.current_unit_price }</p>
											<p>总额：${orderItem.total_price }</p>
							    		</div>
							    	</div>
							    </c:if>
						    </c:forEach>
			   			</div>
			   			<!-- <ul class="ord_ul">
			   				<li>123</li>
			   				<li>123</li>
			   				<li>123</li>
			   			</ul> -->
			   			 <div class="box2_2">
			   				<p>
								<c:if test="${order.status == 0 }">已取消</c:if>
								<c:if test="${order.status == 10 }">未付款</c:if>
								<c:if test="${order.status == 20 }">已付款</c:if>
								<c:if test="${order.status == 40}">已发货</c:if>
								<c:if test="${order.status == 50 }">交易成功</c:if>
								<c:if test="${order.status == 60 }">交易关闭</c:if> 
								<!-- 订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭', -->
							</p>
			   			</div>
			   			<div class="box2_3">
			   				<p>收货人：${order.shipping.receiver_name }</p>
			   			</div>
			   			<div class="box2_4">
			   				<button onclick="info(${order.orderItem.order_no })">查看详情</button>
			   				<button>取消订单</button>
			   				<button>物流信息</button>
			   			</div>
			   			<div class="clearfix"></div> 
			   		</div>
			   </div>
		  </c:forEach>
		
	</div>
</body>
</html>		