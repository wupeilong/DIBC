<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>个人信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />
	<link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>		
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
	<body class="contain">
		<div id="page">
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
		<main class="main padding-side">			
			<form action="" method="" class="clearfix update_info margin-top margin-bot">
				<%-- <div class="border-bottom margin-top">
					<div class="fb padding-side05 sb margin-bot">
						<div class="item_name fonwei">个人信息</div>						
						<div class="">
							<span>								
								<a href="${pageContext.request.contextPath}/wap_user/workmens_update"><input type="button"class="btn btn-primary form-control" value="完善个人信息"><!-- <i class="fa fa-edit" style="font-size: 20px;color: #1294b3;"></i> --></a>
							</span>
						</div>
					</div>
				</div> --%>
				<div class="workmens_info_top margin-bot">					
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>所属单位</span>
					  <div class="form-control box-shadow0 border0">${userPcenter.unitName}</div>
					</div>					
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>职&ensp;&ensp;&ensp;&ensp;务</span>
					  <div class="form-control box-shadow0 border0">${userPcenter.duty}</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>姓&ensp;&ensp;&ensp;&ensp;名</span>
					  <div class="form-control box-shadow0 border0">${userPcenter.username}</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>身&ensp;份&ensp;证</span>
					  <div class="form-control box-shadow0 border0">${userPcenter.idCard}</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>年&ensp;&ensp;&ensp;&ensp;龄</span>
					  <div class="form-control box-shadow0 border0">
					  	<c:if test="${userPcenter.age != null}">
					  		${userPcenter.age}岁
					  	</c:if>					  		
					  </div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>健康证号</span>
					  <div class="form-control box-shadow0 border0">${userPcenter.healthCertificateCode}</div>
					</div>
				</div>
				<div class="">
					  <div class="fc">
						<div class="layui-upload-list fc">
						  <img class="layui-upload-img" src="${pageContext.request.contextPath}${userPcenter.healthCertificate}">
						</div>
					  </div>
					  <div class="text-center">从业人员健康证</div>
				</div>
			</form>		
		<script type="text/javascript">
			$(".munulist").click(function() {
				$(this).find("ul").toggle()
			})
		</script>	
		</main>	
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>	
	<c:if test="${user.type == 3}">
		<c:import url="public/public_footer.jsp"></c:import>
	</c:if>
	<c:if test="${user.type != 3}">
		<c:import url="public/footer.jsp"></c:import>
	</c:if>	
</body>
<script type="text/javascript">
var $current = $("form");		
$current.find("img").bind("click",function(){
	var path=$(this).attr('src');			
	layerImg(path);
});	
</script>
</html>
