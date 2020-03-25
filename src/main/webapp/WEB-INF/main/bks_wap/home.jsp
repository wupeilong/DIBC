<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>云监食安系统主页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
<body class="bg-info contain">
		<main class="">
			<div class="">
				<div class=""><img src="${pageContext.request.contextPath}/static/images/bks_wap/banner.jpg" class="img-responsive"></div>
			</div>
			<div class="margin-top05 home_menu">
				<div class="list_tit padding-side fonwei text-muted margin-top05"><h5 class="padding-side border-bottom fonwei">功能菜单</h5></div>
				<ul class="function_list list-unstyled clearfix">
					<li class="">
						<a href="${pageContext.request.contextPath}/unit/coopration_list">
							<div><div class="padding-side icon_box"><i class="fa fa-info"></i></div></div>
							<p class="padding-side05">企业信息</p>
						</a>
					</li>
					<li class="">
						<a href="${pageContext.request.contextPath}/user/workmens">
							<div><div class="padding-side icon_box"><i class="fa fa-users"></i></div></div>
							<p class="padding-side05">从业人员</p>
						</a>
					</li>
					<li class="">
						<a href="${pageContext.request.contextPath}/procurement/buy_list">
							<div><div class="padding-side icon_box"><i class="fa fa-opencart"></i></div></div>
							<p class="padding-side05">采购报送</p>
						</a>
					</li>
					<li class="">
						<a href="javascript:alert('功能开发中……');">
							<div><div class="padding-side icon_box"><i class="fa fa-eye"></i></div></div>
							<p class="padding-side05">制餐检视</p>
						</a>
					</li>
					<li class="">
						<a href="${pageContext.request.contextPath}/dry/delivery">
							<div><div class="padding-side icon_box"><i class="fa fa-truck"></i></div></div>
							<p class="padding-side05">配送报备</p>
						</a>
					</li>
					<li class="">
						<a href="${pageContext.request.contextPath}/clean/clean_list">
							<div><div class="padding-side icon_box"><i class="fa fa-shower"></i></div></div>
							<p class="padding-side05">清洁<!-- /消毒 -->记录</p>
						</a>
					</li>
					<li class="">
						<a href="${pageContext.request.contextPath}/inspect/inspect_choise">
							<div><div class="padding-side icon_box"><i class="fa fa-edit"></i></div></div>
							<p class="padding-side05">监管采集</p>
						</a>
					</li>
					<c:if test="${user.type == 1 }">
						<li class="">
						<a href="${pageContext.request.contextPath}/detection/detection_list">
							<div><div class="padding-side icon_box"><i class="fa fa-paper-plane-o"></i></div></div>
							<p class="padding-side05">检测报送</p>
						</a>
					</li>
					</c:if>
					
					<li class="">
						<a href="javascript:alert('功能开发中……');">
							<div><div class="padding-side icon_box"><i class="fa fa-crosshairs"></i></div></div>
							<p class="padding-side05">视频监控</p>
						</a>
					</li>
					
					<li class="">
						<a href="${pageContext.request.contextPath}/unqualified/list_pag">
							<div><div class="padding-side icon_box"><i class="fa fa-crosshairs"></i></div></div>
							<p class="padding-side05">不合格记录</p>
						</a>
					</li>
				</ul>
			</div>
		</main>
		<c:import url="public/footer.jsp"></c:import>
		<script type="text/javascript">
			$("#ai").click(function () {
				alert("功能开发中……")
			})
		</script>
</body>
</html>
