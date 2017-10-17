<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.situ.mall.pojo.*"%>  
<!DOCTYPE html>
<html>

	<head>
		<!-- <meta charset="UTF-8"> -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>靓淘网_购物车</title>
		<%@include file="../common/head2.jsp" %>
		<link rel="stylesheet" href="${ctx}/resources/front/css/cart_style.css" />
		<script type="text/javascript">
		/* var isDel = confirm("您确定要删除吗");
		if(isDel) { */
			function sub(id) {
				var num = $("#num"+id).val();
				if(num == 1) {
					var isDel = confirm("您确定要删除吗");
					if(isDel) {
						window.location.href="${ctx}/cart/deleteCart.shtml?id="+id;
					}
					return;
				}
				window.location.href="${ctx}/cart/addCart.shtml?productId="+id+"&amount="+(-1);
			}
			function add(id,stock) {
				var num = $("#num"+id).val();
				if(num == stock) {
                    alert("没货了，亲")
                    return;
				}
				window.location.href="${ctx}/cart/addCart.shtml?productId="+id+"&amount="+1;
			}

			/* $(function(){
				var num = $("#num").val();
				var pri = $("#pri").val();
				var subTatal = num * pri;
				$("#total").val(subTatal);
			}) */
			function selectAll() {
				$("input[name=selectIds]").prop("checked",$("#select").is(":checked"));
			}
			function deleteCart(id) {
				window.location.href="${ctx}/cart/deleteCart.shtml?id="+id;
			}
		</script>
	</head>

	<body>
		<div class="bg_color">
			<div class="top_center">
				<div class="left">
					<span class="wel">欢迎来到靓淘网！</span>
				</div>
				<div class="right">
					<ul>
						<li>
						<c:if test="${isUser == null}"><a  class="login" href="${ctx}/index/login.shtml" target="_blank" >请登录</a></c:if>
						<c:if test="${isUser != null}">${isUser.username }</c:if>
						</li>
						<li>
							<a href="register.html" target="_blank">快速注册</a>
						</li>
						<li>
							<a class="collect" href="">我的收藏</a>
						</li>
						<li>
							<a class="indent" href="">我的订单</a>
						</li>
						<li>
							<a class=phone href="">手机靓购</a>
						</li>
						<li>
							<a href="">我的积分</a>
						</li>
						<li>
							<a href="">我的评价</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="logo_center">
			<div class="left">
				<img class="logo_img" src="${ctx}/resources/front/img/LOGO.png" />
				<span class="car_text">购物车</span>
			</div>
			<div class="right">
				<input class="car_input" type="text" />
				<input class="car_search" type="button" value="搜索" />
			</div>
		</div>
		<div class="title">
			<div class="title_top">
				<ul>
					<li>
						<a href="">全部商品</a>
					</li>
					<li>
						<a href="">降价商品</a>
					</li>
					<li>
						<a href="">库存紧张</a>
					</li>
				</ul>
				<p style="margin:0;padding-right: 10px; float: right;line-height: 40px;">配送至：<span style="border: 1px solid rgb(51,51,51);">山东省 青岛市 市南区 <img src="${ctx}/resources/front/img/narrow.png"/></span></p>
			</div>
			<div class="title_center">
				<ul style="color: #666666;margin-top: 10px;margin-bottom: 10px;">
					<li style="margin-left: 16px;margin-right: 8px;">
						<input type="checkbox" />
					</li>
					<li style="margin-left: 8px;margin-right: 38px;">全选</li>
					<li style="margin-left: 38px;margin-right: 168px;">商品</li>
					<li style="margin-left: 138px;margin-right: 58px;">单价</li>
					<li style="margin-left: 58px;margin-right: 58px;">数量</li>
					<li style="margin-left: 58px;margin-right: 58px;">小计</li>
					<li style="margin-left: 58px;margin-right: 36px;">操作</li>
				</ul>
			</div>
			<div class="title_bottom">
			<input type="checkbox" style="color: #666666;margin: 23px 11px 10px 22px;" />
			<img src="${ctx}/resources/front/img/156.png" style="margin: 0px 142px 0px 11px; " />
			<img src="${ctx}/resources/front/img/157.png" style="margin-left: 142px; " />
		</div>
		</div>
		
		<c:forEach items="${buyCartVO.items }" var="CartItemVO">
		<div class="car_1">
			<div class="car_1_top">
				<img src="${ctx}/resources/front/img/158.png" />
				<p class="car_1_top_p">
					<span class="span1">
						活动商品购满¥105.00 , 即可加价换购商品1件&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span>
					<span class="span2">
						&nbsp;查看换购品
					</span>
					<span class="span3">
						&nbsp;&nbsp;去凑单&gt;
					</span>
				</p>
			</div>
		 <div class="car_2_bottom">
				<div class="car_con_1">
					<td><input id="productId" type="checkbox"name="selectIds"value="${CartItemVO.product.id }"></td>
				</div>
				<div class="car_con_2">
					<img src="${CartItemVO.product.fullUrl}" style="width: 40px;height: 60px"/>
				</div>
				<div class="car_con_3">
					<p class="p_title">${CartItemVO.product.subtitle }</p>
					<img src="${ctx}/resources/front/img/160.png" />
					<p class="p_seven">&nbsp;支持7天无理由退货</p>
					<img src="${ctx}/resources/front/img/161.png" />
					<p class="p_select">&nbsp;选包装</p>
				</div>
				<ul class="car_ul">
					<li class="price">
						<span style="color: #CCCCCC; margin-bottom: 15px;line-height: 20px;">
							<del>
								¥ 1699.00<br />
							</del>
						</span>
						<span id="pri"  style="color: #666666;">
							${CartItemVO.product.price }
						</span>
					</li>
					<li class="num_select">
						<input onclick="sub(${CartItemVO.product.id})" class="car_ul_btn1" type="button" value="-" />
						<input id="num${CartItemVO.product.id}" class="car_ul_text" type="text" value="${CartItemVO.amount }" />
						<input onclick="add(${CartItemVO.product.id},${CartItemVO.product.stock})" class="car_ul_btn2" type="button" value="+" />
						<%-- <input id="stock" type="hidden" value="${cart.product.stock }">
						<input type="hidden" id="price" value="${cart.product.price }"> --%>
					</li>
					<li class="money">
						<span id="total" style="color: #F41443;">
							${CartItemVO.product.price * CartItemVO.amount }
						</span>
					</li>
					<li class="delete">
						<img onclick="deleteCart(${CartItemVO.product.id})" src="${ctx}/resources/front/img/166.png" />
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		</c:forEach>
			
		<div class="blank">
			
		</div>
		<form action="${ctx }/order/toPayment.shtml" method="post">
		<div class="total">
				<ul style="color: #666666;margin-top: 10px;margin-bottom: 10px;">
					<li style="margin-left: 16px;margin-right: 8px;">
						<input type="checkbox"  onclick="selectAll();" id="select">
					</li>
					<li style="margin-left: 8px;margin-right: 265px;">全选</li>
					<li style="margin-left: 265px;margin-right: 18px;">总金额（已免运费）：<span style="color: #F41443;">¥${buyCartVO.totalPrice }</span></li>
					<%-- <li class="total_right"><a href="${ctx }/index/toPayment.shtml">立即结算</a></li> --%>
				</ul>
				<input type="hidden" name="tatolPrice"value="${buyCartVO.totalPrice }">
				<input type="hidden" name="userId" value="${isUser.id }"> 
				<%-- <input type="hidden" name="userId"value="${isUser.id }"> --%>
				<button style="margin-left: 900px;background-color: #F41443;"><span style="color: white;">去付款</span></button>
			</div>
			</form>
					<div class="sp">
			<div class="sp1">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp2">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp3">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="sp4">
				<p style="color: rgb(51,51,51);">品质保障</p>
				<p style="font-size: 12px; color: #808080;margin-top: 5px;">品质护航 购物无忧</p>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="more">
			<div class="mb1">
				<ul>
					<li>
						购物指南
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;免费注册
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;开通支付宝
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;支付宝充值
						</a>
					</li>
				</ul>
			</div>
			<div class="mb2">
				<ul>
					<li>
						品质保障
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;发票保障
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;售后规则
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;缺货赔付
						</a>
					</li>
				</ul>
			</div>
			<div class="mb3">
				<ul>
					<li>
						支付方式
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;快捷支付
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;信用卡
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;货到付款
						</a>
					</li>
				</ul>
			</div>
			<div class="mb4">
				<ul>
					<li>
						商家服务
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;商家入驻
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;商家中心
						</a>
					</li>
					<li>
						<a href="">
							&nbsp;&nbsp;运营服务
						</a>
					</li>
				</ul>
			</div>
			<div class="mb5">
				<ul>
					<li>
						手机靓淘
					</li>
					<li>
						<img src="${ctx}/resources/front/img/98.png"/>
					</li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="link">
			<ul>
				<li>
					<a href="">
						关于靓淘
					</a>
				</li>
				<li>
					<a href="">
						帮助中心
					</a>
				</li>
				<li>
					<a href="">
						开放平台
					</a>
				</li>
				<li>
					<a href="">
						诚聘精英
					</a>
				</li>
				<li>
					<a href="">
						联系我们
					</a>
				</li>
				<li>
					<a href="">
						网站合作
					</a>
				</li>
				<li>
					<a href="">
						法律声明及隐私政策
					</a>
				</li>
				<li>
					<a href="">
						知识产权
					</a>
				</li>
				<li>
					<a href="">
						廉政举报
					</a>
				</li>
				<li>
					<a href="">
						规则意见征集
					</a>
				</li>
			</ul>
		</div>
		<div class="copyright">
			COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利. 客服热线：400-123-888888<br /> 
			京公网安备 110101020011226|京ICP证111033号|食品流通许可证 SP1101051110165515（1-1）|营业执照
		</div>
	</body>

</html>