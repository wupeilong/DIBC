<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title></title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
<body class="bg-info container">
		<div class="container">
			<div class="text-center margin-top">
				<div class="logo"><img src="${pageContext.request.contextPath}/static/images/bks_wap/logo.png" class="img-responsive"></div>
				<h3 class="fonwei">云岩区市场监督管理局</h3>
				<a href="${pageContext.request.contextPath}/home">进入主页</a>
			</div>
			<div class="margin-top3">
				<form class="login_form">
					<fieldset id="" class="margin-top margin-bot">
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">账号</span>
						  <input type="text" class="form-control box-shadow0" name="account" placeholder="请输入账号" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">密码</span>
						  <input type="password" class="form-control box-shadow0" name="password" placeholder="请输入密码" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg fs form-group">
						  <span class="input-group-addon clear-bg border0" id="sizing-addon1"><input type="checkbox" name="" id="" value="" /></span>
						  <div class="form-control box-shadow0 border0 clear-bg">记住密码</div>
						</div>
						<div class="margin-bot2 text-right">
							<a href="http://192.168.1.106:8848/wap_MCLZ/register.html" class="">已有账号？去登陆</a>
						</div>
					</fieldset>
				</form>
				<div class="text-center margin-top2 margin-bot2"><button type="submit" class="btn btn-primary form-control" id="login" value="登陆" style="height: 50px;">登陆</button></div>
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