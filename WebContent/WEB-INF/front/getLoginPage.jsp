<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../common/head2.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>靓淘网-登录</title>
		<link rel="stylesheet" href="${ctx}/resources/front/css/getLoginPage_style.css" />
		<script type="text/javascript">
		function submitForm() {
			var options = {
					url:"${ctx}/index/login.shtml",
					type:"post",
					dataType:"json",
					data:$("#login_form").serialize(),
					success:function(data){
						if(data.status == 0) {
							parent.layer.msg(data.msg);
							//当你在iframe页面关闭自身时
							var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
							setTimeout(function(){
								parent.layer.close(index); //再执行关闭  
								window.parent.location.reload();//刷新父页面
							},1000);
						} else {
							layer.msg(data.msg);
						} 
					}
			};
			$.ajax(options);
		}
		</script>
	</head>

	<body>
		
				<div class="login">
					<form id="login_form" method="post">
						<ul>
							<li class="login_title_1">
								<a href="">密码登录</a>

							</li>
							<li class="login_title_2">
								<a href="">扫码登录</a>
							</li>
							<li>
								<input name="username" class="login_user" type="text" placeholder="会员名/邮箱/手机号" />
								<input name="password" class="login_password" type="password" placeholder="密码" />
								<!-- <input class="login_btn" type="button" value="登录" /> -->
								<button onclick="submitForm()" class="login_btn"type="button">登录</button>
							</li>
							
							<li class="renmenber_user">
								<input type="checkbox" value="remer_user" id="remer_user" />
								<label for="remer_user">记住用户名</label>
							</li>
							<li class="login_bottom">
								<a href="">忘记密码</a>
								<a href="">免费注册</a>
							</li>
						</ul>
					</form>
				</div>
			<div class="clearfix"></div>
		
	</body>

</html>