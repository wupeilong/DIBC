<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<title>云监食安系统</title>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<!-- <meta name="viewport" content="width=device-width, initial-scale=0.1"> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
</head>
<body>
	<div class="tabBar">
		<ul class="list-unstyled clearfix margin0">
			<li><a href="${pageContext.request.contextPath}/wap_public_home"><div><i class="fa fa-home"></i><div>主页</div></div></a></li>
			<li><a href="${pageContext.request.contextPath}/wap_user/user_pcenter?id=${user.id}"><div><i class="fa fa-user"></i><div>个人中心</div></div></a></li>
		</ul>
	</div>		
</body>
</html>

