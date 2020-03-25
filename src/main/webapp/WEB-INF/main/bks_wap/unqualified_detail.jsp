<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>不合格记录详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
			</div>
		</div>
		<main class="main margin-top padding-side">
			<form action="" method="" class="clearfix">
				<div class="workmens_info_top margin-bot">
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>记录单号</span>
					  <div class="form-control box-shadow0 border0">${userDetail.unitName}</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>单位名称</span>
					  <div class="form-control box-shadow0 border0">${userDetail.unitName}</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>类&ensp;&ensp;&ensp;&ensp;型</span>
					  <div class="form-control box-shadow0 border0">${userDetail.duty }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>订&ensp;单&ensp;ID</span>
					  <div class="form-control box-shadow0 border0">${userDetail.username }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>原&ensp;&ensp;&ensp;&ensp;因</span>
					  <div class="form-control box-shadow0 border0">${userDetail.idCard }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>状&ensp;&ensp;&ensp;&ensp;态</span>
					  <div class="form-control box-shadow0 border0">${userDetail.age }岁</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>创建时间</span>
					  <div class="form-control box-shadow0 border0">${userDetail.healthCertificateCode }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>处&ensp;理&ensp;人</span>
					  <div class="form-control box-shadow0 border0">${userDetail.healthCertificateCode }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>处理时间</span>
					  <div class="form-control box-shadow0 border0">${userDetail.healthCertificateCode }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>处理结果</span>
					  <div class="form-control box-shadow0 border0">${userDetail.healthCertificateCode }</div>
					</div>					
				</div>
				
			</form>
			
			<div class="margin-top2 margin-bot2">
				<a href="${pageContext.request.contextPath}/user/workmens_health?userId=${userDetail.id}" class="btn btn-primary form-control">健康状况查询</a>
			</div>
		</main>		
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
	<c:import url="public/footer.jsp"></c:import>
	</body>
</html>
