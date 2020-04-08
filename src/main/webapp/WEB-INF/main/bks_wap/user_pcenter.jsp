<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>		
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
				<div class="munulist">
					<a href="javascript:;" class="text-white"> <i class="fa fa-list"></i></a>
					<ul class="list-unstyled margin0">
						<li><a href="${pageContext.request.contextPath}/wap_unit/coopration_detal?unitId=${userPcenter.unitId}" class="fonwei">企业信息查询</a></li>
						<li><a href="${pageContext.request.contextPath}/wap_user/workmens_health?userId=${user.id}" class="fonwei">健康状况查询</a></li>
						<li><a href="${pageContext.request.contextPath}/wap_user/workmens_health_add" class="fonwei">健康信息录入</a></li>
						<li><a href="${pageContext.request.contextPath}/wap_user/reset_password" class="fonwei">个人密码修改</a></li>
					</ul>
				</div>
			</div>
		</div> 
		
		<main class="main margin-top padding-side">			
			<form action="" method="" class="clearfix update_info">
				<div class="border-bottom margin-top">
					<div class="fb padding-side05 sb margin-bot">
						<div class="item_name fonwei">个人信息</div>						
						<div class="">
							<span>								
								<a href="${pageContext.request.contextPath}/wap_user/workmens_update"><input type="button"class="btn btn-primary form-control" value="完善个人信息"><!-- <i class="fa fa-edit" style="font-size: 20px;color: #1294b3;"></i> --></a>
							</span>
						</div>
					</div>
				</div>
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
			
			<%-- <div class="margin-top2 margin-bot2">
				<a href="${pageContext.request.contextPath}/unit/coopration_detal?unitId=${userPcenter.unitId}" class="btn btn-primary margin-bot form-control">企业信息查询</a>
				<a href="${pageContext.request.contextPath}/user/workmens_health?userId=${user.id}" class="btn btn-primary margin-bot form-control">健康状况查询</a>
				<a href="${pageContext.request.contextPath}/user/workmens_health_add" class="btn btn-primary margin-bot form-control">健康状况录入</a>
			</div> --%>
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
