<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>从业人员健康状况</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
</head>
	<body class="contain">
		<main class="main" style="padding-top:120px;">
			<!-- <div class="navigation bg-primary">
				<div class="fb padding-side">
					<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
				</div>
			</div> -->
			<div id="page" class="">
				<div id="header">
					<div class="header-content">
						<a href="javascript:history.go(0)" class="p-link-back"><i class="fa fa-refresh"></i></a>				
						<a class="menu-btn" id="demoSingle" href="#menu"></a>
						<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>
					</div>
				</div>
				<div class="bannerPane">
					<div class="overlay"></div>
					<div class="s-banner-content">
						<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
					</div>
				</div>			
			</div>
			<div class="">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead>
						<tr><th>编号</th><th>姓名</th><th>体温状况℃</th><th>测温日期</th><th>操作</th></tr>
					</thead>
					<tbody>
						<c:forEach items="${hygieneList}" var="item" varStatus="vs">
							<tr><td>${vs.count}</td><td>${item.username}</td><td>${item.celsius}</td><td>${item.dailyTime }</td><td><a href="${pageContext.request.contextPath}/wap_user/workmens_health_detal?hygieneId=${item.hygieneId}">详情</a></td></tr>
						</c:forEach>	
						</tbody>
				</table>
			</div>
			<c:if test="${user.type == 3}">
				<c:import url="public/public_footer.jsp"></c:import>
			</c:if>
		</main>
		<c:if test="${user.type != 3}">
			<c:import url="public/footer.jsp"></c:import>
		</c:if>
	</body>
</html>
