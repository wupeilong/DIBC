<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>监管采集导航页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>		
</head>
	<body class="contain height100" style="background-image: url(${pageContext.request.contextPath}/static/images/bks_wap/bg-jgcj.png);background-repeat: no-repeat;background-size: cover;">
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="${pageContext.request.contextPath}/wap_home" class="p-link-back"><i class="fa fa-home"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>					
				</div>
			</div>
			<div class="bannerPane" style="background:#ffffff;opacity:0">
				<div class="overlay" style="opacity:0"></div>
				<div class="s-banner-content">
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
			</div>				
		</div>  
		<main class="main height100 fc fbot padding-side">
			<ul class="inspect_lis list-unstyled fsa">
				<li class="padding-side">
					<div class="check_info">
						<img src="${pageContext.request.contextPath}/static/images/bks_wap/jgcj1.png" class="img-responsive">
						<p class="text-center text-white fonwei">信息查看</p>
					</div>
				</li>
				<c:if test="${user.type == 2}">
					<li class="padding-side">
						<div class="check_self">
							<img src="${pageContext.request.contextPath}/static/images/bks_wap/jgcj3.png" class="img-responsive">
							<p class="text-center text-white fonwei">商家自检</p>
						</div>
					</li>
				</c:if>
				
				<c:if test="${user.type == 2}">
					<li class="padding-side">
						<div class="check_gov">
							<img src="${pageContext.request.contextPath}/static/images/bks_wap/jgcj4.png" class="img-responsive">
							<p class="text-center text-white fonwei">管局专检</p>
						</div>
					</li>
					<li class="padding-side">
						<div class="check_prof">
							<img src="${pageContext.request.contextPath}/static/images/bks_wap/jgcj2.png" class="img-responsive">
							<p class="text-center text-white fonwei">督察专检</p>
						</div>
					</li>
				</c:if>
			</ul>
		</main>
		<div class="tabBar">
			<ul class="list-unstyled clearfix margin0">
				<li><a href="home.html"><div><i class="fa fa-home"></i><div>工作台</div></div></a></li>
				<li><a href=""><div><i class="fa fa-user"></i><div>个人中心</div></div></a></li>
			</ul>
		</div>
		<script type="text/javascript">
			$(".check_info").click(function() {
				location.href= "${pageContext.request.contextPath}/wap_ins/inspect_list";
					// /wap_ins/inspect_list
			})
			$(".check_self").click(function() {
				location.href="${pageContext.request.contextPath}/wap_ins/inspect_add?checkType=1";
			})
			$(".check_gov").click(function() {
				location.href="${pageContext.request.contextPath}/wap_ins/inspect_add?checkType=2";
			})
			$(".check_prof").click(function() {
				location.href="${pageContext.request.contextPath}/wap_ins/inspect_add?checkType=3";
			})
			document.body.addEventListener('touchstart', function () {});
		</script>
		
		<c:import url="public/footer.jsp"></c:import>

	</body>

</html>
