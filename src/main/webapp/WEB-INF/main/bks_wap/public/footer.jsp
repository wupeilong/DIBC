<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/sidenav.css" type="text/css">
<style type="text/css">

   
</style>
</head>
<body>
<c:if test="${user.type != 3}">
	<nav class="sidenav" data-sidenav data-sidenav-toggle="#sidenav-toggle">	
		<ul class="footer_ul">
			<li><a href="${pageContext.request.contextPath}/wap_unit/coopration_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon1.png" border="0" alt="" title=""/></a><p class="text-center" >企业信息</p></li>					
			<li><a href="${pageContext.request.contextPath}/wap_user/workmens"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon2.png" border="0" alt="" title=""/></a><p class="text-center">从业人员</p></li>
			<li><a href="${pageContext.request.contextPath}/wap_pro/buy_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon3.png" border="0" alt="" title=""/></a><p class="text-center">采购报送</p></li>
			<li><a href="javascript:alert('功能开发中……');"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon4.png" border="0" alt="" title=""/></a><p class="text-center">制餐检视</p></li>
			<li><a href="${pageContext.request.contextPath}/wap_dry/delivery"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon5.png" border="0" alt="" title=""/></a><p class="text-center">配送报备</p></li>
			<li><a href="${pageContext.request.contextPath}/wap_clean/clean_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon6.png" border="0" alt="" title=""/></a><p class="text-center">清洁记录</p></li>
			<li><a href="${pageContext.request.contextPath}/wap_ins/inspect_choise"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon7.png" border="0" alt="" title=""/></a><p class="text-center">监管采集</p></li>
			<li><a href="${pageContext.request.contextPath}/wap_det/detection_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon8.png" border="0" alt="" title=""/></a><p class="text-center">检测报送</p></li>
			<li><a href="${pageContext.request.contextPath}/wap_video/wap_videoscan"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon9.png" border="0" alt="" title=""/></a><p class="text-center">视频监控</p></li>
		</ul>	
  	</nav>
  		<div class="tabBar footer_div">
		<ul class="list-unstyled clearfix margin0">				
			<li style="width: 43%;    font-size:1.5em;"><a href="${pageContext.request.contextPath}/wap_home"><div><i class="fa fa-home"></i></div></a></li>
			<li style="width: 14%;"><a href="javascript:;" class="toggle" id="sidenav-toggle"><div class="footer_dh_bj" style="width: 54px;"><div class="footer_dh" style="width: 54px;"></div></div></a></li>
			<li style="width: 43%;    font-size: 1.5em;"><a href="${pageContext.request.contextPath}/wap_user/user_home"><div><i class="fa fa-user-circle"></i></div></a></li>
		</ul>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/bks_wap/sidenav.min.js"></script>
	<script>$('[data-sidenav]').sidenav();</script>
</c:if>	
</body>
</html>

