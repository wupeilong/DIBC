<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>配送信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>		
</head>
	<body class="bg-info container">
		<div class="container">
			<div class="text-center margin-top2">
				<h3 class="fonwei">云岩区市场监督管理局</h3>
			</div>
			<div class="margin-top4">
				<form class="login_form">
					<legend>用户注册</legend>
					<fieldset id="" class="margin-top margin-bot">
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">身份证号</span>
						  <input type="text" class="form-control box-shadow0" name="account" placeholder="请输入账号" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">密码</span>
						  <input type="password" class="form-control box-shadow0" name="password" placeholder="请输入密码" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">确认密码</span>
						  <input type="repassword" class="form-control box-shadow0" name="repassword" placeholder="请在次输入密码" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">真实姓名</span>
						  <input type="text" class="form-control box-shadow0" name="account" placeholder="请输入真实姓名" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">职务</span>
						  <input type="text" class="form-control box-shadow0" name="account" placeholder="请输入职务" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">年龄</span>
						  <input type="text" class="form-control box-shadow0" name="account" placeholder="请输入年龄" aria-describedby="sizing-addon1">
						</div>
						<div class="margin-bot2 text-right">
							<a href="http://192.168.1.106:8848/wap_MCLZ/login.html" class="">已有账号？去登陆</a>
						</div>
					</fieldset>
				</form>
				<div class="text-center margin-top margin-bot2"><button type="submit" class="btn btn-primary form-control" id="login" value="登陆" style="height: 50px;">登陆</button></div>
			</div>
		</div>
		<script>
			$("#login").click(function() {
				// var username = $("#username").val();
				// var password = $("#password").val();
				$.ajax({
					url:"",
					type:"post",
					data:$('form').serialize(),
					// data:{'username':username,'password':password},
					dataType:"json",
					success:function(data) {
						console.log(data)
						if (data.code==1) {
							layer.msg(data.msg,{
								icon:1,
								function(){}
							})
							location.href=data.url;
						} else{
							layer.msg(data.msg,{
								icon:2,
								function(){}
							})
						}
						// location.href="{:url('home/common/login')}"
					}
				})
			})
		</script>
	</body>
</html>
