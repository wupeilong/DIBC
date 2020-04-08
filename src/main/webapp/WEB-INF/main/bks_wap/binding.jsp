<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>微信授权登录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
</head>
	<body class="" style="background-color: #eee;">
		<main class="container fc" style="height: 100%;">
			<div class="" style="width: 300px;margin-bottom: 12em;">
				<form action="" class="bingform">
					<div class="">
						<label for="" class="text-muted"><i class="fa fa-mobile"></i></label>
						<input type="text" class="border-bottom" name="" id="" value="" placeholder="请输入手机号"/>
					</div>
					<div class="margin-top2">
						<label for="" class="text-muted"><i class="fa fa-lock"></i></label>
						<input type="password" class="border-bottom" name="" id="" value="" placeholder="请输入密码"/>
					</div>
				</form>
				<div class="text-center margin-top4">
					<a href="" class="btn btn-success form-control">确定绑定</a>
					<p class="margin-top">绑定账号用以……</p>
				</div>
			</div>
		</main>
		<script type="text/javascript">
			$(".login").click(function() {
				showModel("请选择您的角色",$(".roles"),5);
			})
		</script>
	</body>
</html>
