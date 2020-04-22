<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=0.1,minimum-scale=1,maximum-scale=0.1,user-scalable=no">
	<title>企业信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />
	<link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
</head>
	<body class="contain o-page p-about">
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="javascript:history.go(0)" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="${pageContext.request.contextPath}/wap_home" class="p-link-home"><i class="fa fa-arrow-left"></i></a>
					<div class="header-btn text-right">
						<c:if test="${user.unitId == unitDetail.unitId}">							
							<shiro:hasPermission name="unit_update">
								<a href="${pageContext.request.contextPath}/wap_unit/coopration_update"><input type="button"class="btn btn-primary" value="完善企业信息"></a>
							</shiro:hasPermission>
							</c:if>
					</div>
				</div>
			</div>
			<div class="bannerPane">
				<div class="overlay"></div>
				<div class="s-banner-content">
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
			</div>
		</div>
		<main class="main">
			<div class="cooperation_detal">
				
				<div class="margin-top margin-bot">
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">企业名称</span>
					  <div class="form-control box-shadow0 border0" style="font-size:13px;white-space:nowrap;">${unitDetail.unitName}</div>
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">统一社会信用代码</span>
					  <div class="form-control box-shadow0 border0">${unitDetail.businessLicenseCode}</div>
					</div>
					<div class="fsa">
						<div class="margin-bot2">
							  <div class="fc">
								<div class="layui-upload-list fc">
								  <img class="layui-upload-img" src="${pageContext.request.contextPath}${unitDetail.businessLicense}">
								</div>
							  </div>
							  <div class="text-center text-muted">营业执照</div>
						</div>
						<div class="margin-bot2">
							  <div class="fc">
								<div class="layui-upload-list fc">
								  <img class="layui-upload-img" src="${pageContext.request.contextPath}${unitDetail.productionLicense}">
								</div>
							  </div>
							  <div class="text-center text-muted">食品许可证</div>
						</div>
					</div>
					
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">营业地址</span>
					  <div class="form-control box-shadow0 border0">${unitDetail.unitAddress}</div>
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">企业类型</span>
					  
					  <div class="form-control box-shadow0 border0">
					 	 <c:choose>
						  	<c:when test="${unitDetail.unitType == 1}">
						  		监管局
						  	</c:when>
						  	<c:when test="${unitDetail.unitType == 2}">
						  		学校
						  	</c:when>
						  	<c:when test="${unitDetail.unitType == 3}">
						  		餐饮业
						  	</c:when>
						  	<c:when test="${unitDetail.unitType == 4}">
						  		其他
						  	</c:when>
						  	<c:otherwise></c:otherwise>
					  	 </c:choose>
					  </div>
					 
					</div>
					<div class="input-group form-group margin0 fs">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">法人姓名</span>
					  <div class="form-control box-shadow0 border0">${unitDetail.legalPerson}</div>
					</div>
					</div>
					
				<c:if test="${userDetail.size()>0}">
					<div class="">
						<div class="" style="">
							<div class="padding-side fonwei" style="padding:.6em 1em;border-left:4px solid #348dec;background-color:#f7fbfd;">从业人员</div>
						</div>
						<ul class="padding-side list-unstyled margin-bot2 margin-top">
						<c:forEach items="${userDetail}" var="item" varStatus="vs">
							<li class="fb staff_lis border-bottom padding-side">
								<div class="staff-face fs padding-side">
									<div class="bg-gradient bg-circle fc">
										<i class="fa fa-address-book fa-2x text-white"></i>
									</div>
									<div class="padding-side">
										<div class="fonwei staff_name text-muted">${item.username}</div>
										<div class="staff_name text-muted"><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd" /></div>
										<div class="text-muted bfrifRow staff_oc">${item.departmentName}</div>
									</div>
								</div>
								<div class="padding-side" style="padding-left: 0;">
									<a href="${pageContext.request.contextPath}/wap_user/workmens_detal?id=${item.id}"><i class="fa fa-angle-right text-muted fa-2x"></i></a>
								</div>
							</li>
						</c:forEach>
						</ul>
					</div>
					</c:if>
				</div>
		</main>		
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
		<script type="text/javascript">
			var $current = $("fieldset");		
			$current.find("img").bind("click",function(){
				var path=$(this).attr('src');			
				layerImg(path);
			});	
			layui.use('upload', function(){
			  var $ = layui.jquery
			  ,upload = layui.upload;
			  
			  //普通图片上传
			  var uploadInst = upload.render({
			    elem: '#test1'
			    ,url: 'https://httpbin.org/post' //改成您自己的上传接口
			    ,before: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#demo1').attr('src', result); //图片链接（base64）
			      });
			    }
			    ,done: function(res){
			      //如果上传失败
			      if(res.code > 0){
			        return layer.msg('上传失败');
			      }
			      //上传成功
			    }
			    ,error: function(){
			      //演示失败状态，并实现重传
			      var demoText = $('#demoText');
			      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			      demoText.find('.demo-reload').on('click', function(){
			        uploadInst.upload();
			      });
			    }
			  });
			  });
			
			
			var $current = $("main");		
			$current.find("img").bind("click",function(){
				var path=$(this).attr('src');			
				layerImg(path);
			});	
		</script>
	<c:import url="public/footer.jsp"></c:import>
	</body>

</html>
