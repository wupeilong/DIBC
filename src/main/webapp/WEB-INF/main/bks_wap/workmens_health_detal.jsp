<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>健康信息添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
</head>
	<body class="contain">
		<main class="main workmen_health_detal" style="padding-top:100px;">
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
			<form action="" method="" class="clearfix margin-top">			
				<div class="margin-bot2">
					<div class="input-group form-group border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">姓名</span>
					   <div class="form-control box-shadow0 border0">${hygieneDetail.username }</div>
					</div>
					<div class="input-group form-group border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">测温日期</span>
					   <div class="form-control box-shadow0 border0">${hygieneDetail.dailyTime }</div>
					</div>
					<div class="input-group form-group border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">体测温度</span>
					   <div class="form-control box-shadow0 border0">${hygieneDetail.celsius }</div>
					</div>
					<div class="input-group form-group border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">发热</span>
					   <div class="form-control box-shadow0 border0">${hygieneDetail.fever }</div>
					</div>
					<div class="input-group form-group border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">腹泻</span>
					  <div class="form-control box-shadow0 border0">${hygieneDetail.diarrhea }</div>
					</div>
					<div class="input-group form-group border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">伤口化脓</span>
					  <div class="form-control box-shadow0 border0">${hygieneDetail.woundsFester }</div>
					</div>
					<div class="input-group form-group border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">个人卫生</span>
					  <div class="form-control box-shadow0 border0">${hygieneDetail.hygiene }</div>
					</div>					
					<div class="input-group form-group border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">备注</span>
					  <div class="form-control box-shadow0 border0">${hygieneDetail.remark }</div>
					</div>
					<div class="input-group form-group border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">上传时间</span>
					  <div class="form-control box-shadow0 border0"><fmt:formatDate value="${hygieneDetail.uploadTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
					</div>
					<div class="">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1">健康码图片</span>
					  <div class="fc">
					  	<div class="layui-upload-list">
					  		<img class="layui-upload-img" id="demo1" src="${pageContext.request.contextPath}${hygieneDetail.healthCodePhoto}">
					  	</div>
					  </div>
					</div>
				</div>
			</form>
			<c:if test="${user.type != 3}">
				<c:import url="public/footer.jsp"></c:import>
			</c:if>
		</main>
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
	<c:if test="${user.type == 3}">
		<c:import url="public/public_footer.jsp"></c:import>
	</c:if>
	
	</body>
</html>
