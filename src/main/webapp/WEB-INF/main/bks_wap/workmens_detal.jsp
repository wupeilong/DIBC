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
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>所属企业</span>
					  <div class="form-control box-shadow0 border0">${userDetail.unitName}</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>职&ensp;&ensp;&ensp;&ensp;务</span>
					  <div class="form-control box-shadow0 border0">${userDetail.duty }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>姓&ensp;&ensp;&ensp;&ensp;名</span>
					  <div class="form-control box-shadow0 border0">${userDetail.username }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>身份证号</span>
					  <div class="form-control box-shadow0 border0">${userDetail.idCard }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>年&ensp;&ensp;&ensp;&ensp;龄</span>
					  <div class="form-control box-shadow0 border0">
					  	<c:if test=" ${userDetail.age != null}">
					  	  ${userDetail.age }岁
					  	</c:if>					
					  </div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>健康证编号</span>
					  <div class="form-control box-shadow0 border0">${userDetail.healthCertificateCode }</div>
					</div>
				</div>
				<div class="">
					  <div class="fc">
						<div class="layui-upload-list fc">
						  <img class="layui-upload-img" src="${pageContext.request.contextPath}${userDetail.healthCertificate}">
						</div>
					  </div>
					  <div class="text-center">从业人员健康证</div>
				</div>
			</form>
			
			<div class="margin-top2 margin-bot2">
				<a href="${pageContext.request.contextPath}/wap_user/workmens_health?userId=${userDetail.id}" class="btn btn-primary form-control">健康状况查询</a>
			</div>
		</main>		
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
	<c:import url="public/footer.jsp"></c:import>
	</body>
<script type="text/javascript">
var $current = $("form");		
$current.find("img").bind("click",function(){
	var path=$(this).attr('src');			
	layerImg(path);
});	
</script>
</html>
