<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>监管账号绑定</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
</head>
	<body class="" style="background-color: #eee;">
		<main class="">
			<div class="bg-white fc">
				<div class="" style="width: 100px; padding: 1.2em 0;">
					<img src="../img/logo.png" class="img-responsive" style="widows: 200px;">
					<p class="text-center">YourNickName</p>
				</div>
			</div>
			<div class="container">
				<div class="margin-top">
					<div class="fonwei margin-bot">登录后该用户将获得以下权限</div>
					<input type="checkbox" name="" id="confirm_login" value="" />
					<label for="confirm_login" class="text-muted" style="font-weight: 400;">获得您的公开信息（昵称、头像等）</label>
				</div>
				<div class="margin-top2">
					<a href="javascript:;" class="btn btn-success form-control login">确定登录</a>
				</div>
			</div>
			<div class="roles" style="display: none;">
				<div class="fc">
					<div class="">
						<a href="binding.html"><img src="../img/logo.png" alt=""></a>
						<a href="binding.html"><img src="../img/logo.png" alt=""></a>
						<a href="binding.html"><img src="../img/logo.png" alt=""></a>
					</div>
				</div>
			</div>
			<script type="text/javascript">
			$(".login").click(function() {
				showModel("请选择您的角色",$(".roles"),5);
			})
		</script>
		</main>
		
	</body>
</html>
