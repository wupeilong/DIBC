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
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>		
</head>
	<body class="contain height100">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
			</div>
		</div>
		<main class="main height100 fc bg-warning">
			<!-- <div class="text-right padding-side"><a href="javascript:history.go(-1)" class="btn btn-primary"><i class="fa fa-angle-double-left"></i>返回</a></div> -->
			<div class="width100">
				<c:if test="${user.type==1}">
					<div class="padding-side margin-bot2">
						<a href="${pageContext.request.contextPath}/wap_ins/inspect_list?start=1" class="btn btn-info form-control">信息查看</a>
					</div>					
					<div class="padding-side margin-bot2">
						<a href="${pageContext.request.contextPath}/wap_ins/inspect_add?checkType=2" class="btn btn-info form-control">管局专检</a>
					</div>
					<div class="padding-side margin-bot2">
						<a href="${pageContext.request.contextPath}/wap_ins/inspect_add?checkType=3" class="btn btn-info form-control">督察专检</a>
					</div>
				</c:if>
				<c:if test="${user.type==2}">
					<div class="padding-side margin-bot2">
						<a href="${pageContext.request.contextPath}/wap_ins/inspect_list?start=2" class="btn btn-info form-control">信息查看</a>
					</div>
					<div class="padding-side margin-bot2">
						<a href="${pageContext.request.contextPath}/wap_ins/inspect_add?checkType=1" class="btn btn-info form-control">商家自检</a>
					</div>					
				</c:if>	
			</div>
		</main>		
	<c:import url="public/footer.jsp"></c:import>
	</body>

</html>
