<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<title>采购报送信息列表</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/index.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>
</head>
<body class="contain" style="background-color: #eee; height: auto;">

	<main class="" style="padding-bottom: 46.5px;">
	<div class="border0 bg0">
		<div class="text-center bg-gradient" style="padding-bottom: 2em;">
			 <div class="navigation"
				style="position: relative; background-color: rgba(0, 0, 0, 0);">
				<div class="fb padding-side">
				</div>
			</div> 
			<div class="fonwei text-white fonsi16">${unitDetail.unitName}</div>
			<div class="text-white margin-top">
				${unitDetail.businessLicenseCode}</div>
		</div>
		<div class="panel-body padding0">
			<ul class="formlist list-group margin0">
				<li class="list-group-item fs" style="border-radius: 0;"><span
					class="padding-side text-muted">法人代表</span><label class="">${unitDetail.legalPerson}</label>
				</li>
				<li class="list-group-item fs"><span
					class="padding-side text-muted">营业地址</span><label class="">${unitDetail.unitAddress}</label>
				</li>
				<li class="list-group-item fs"><span
					class="padding-side text-muted">企业类型</span>
				<label class="">
						<c:if test="${unitDetail.unitType==1}">监管局</c:if> 	
						<c:if test="${unitDetail.unitType==2}">学校</c:if> 
						<c:if test="${unitDetail.unitType==3}">餐饮</c:if> 
						<c:if test="${unitDetail.unitType==4}">其它</c:if>
				</label></li>				
				<li class="list-group-item">
					<div class="fsa">
						<div>
							<img src="${pageContext.request.contextPath}${unitDetail.businessLicense}" class=""
								style="width: 100px; height: 100px; border: 1px solid #555;">
							<p class="text-center margin-top">营业执照</p>
						</div>
						<div>
							<img src="${pageContext.request.contextPath}${unitDetail.productionLicense}" class=""
								style="width: 100px; height: 100px; border: 1px solid #555;">
							<p class="text-center margin-top">经营许可证</p>
						</div>
					</div>
				</li>
			</ul>
			<div class="" style="">
				<ul class="coinfoLis list-unstyled">
					<li class="text-center margin-bot">
						<div class="fc">
							<a href="${pageContext.request.contextPath}/wap_user/workmens?unitId=${unitDetail.unitId}" class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/icon2.png">
								<p>从业人员</p>
							</a>
						</div>
					</li>
					<li class="text-center margin-bot">
						<div class="fc">
							<a href="workmens.html" class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/icon6.png">
								<p>清洗消毒</p>
							</a>
						</div>
					</li>
					<li class="text-center margin-bot">
						<div class="fc">
							<a href="workmens.html" class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/icon8.png">
								<p>监管检查</p>
							</a>
						</div>
					</li>
					<li class="text-center margin-bot">
						<div class="fc">
							<a href="${pageContext.request.contextPath}/wap_video/wap_videodetal?unitId=${unitDetail.unitId}" class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/icon8.png">
								<p>实时监控</p>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</main>
	<c:import url="public/public_footer.jsp"></c:import>
</body>
</html>
