<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>配送信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/selectmenu/css/selectmenu.css" type="text/css">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
	<body class="contain" style="background-color: #eee;">
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="javascript:history.go(0)" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<c:if test="${user.type == 1}">
						<a class="menu-btn" id="demoSingle" href="#menu"></a>
					</c:if>	
					<c:if test="${user.type != 1}">
						<a class="menu-btn" href="#menu"></a>
					</c:if>
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>
					<c:if test="${user.type == 2}">
						<a href="${pageContext.request.contextPath}/wap_dry/delivery_add" class="btn bg-primary" style="position: absolute; right: 5px;top: 50px;"><i class="fa fa-plus"></i></a>
					</c:if>						
				</div>
			</div>
			<div class="bannerPane">
				<div class="overlay"></div>
				<div class="s-banner-content">
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
			</div>						
		</div>		
		<main class="main padding-side05">
			<div class="margin-top" id="result_list">				
				<c:forEach items="${distributionList}" var="item" varStatus="vs">
				<div class="delivery_li fb margin-bot" style="height: 100px;">
					<div class="" style="width: 90%;">
						<div class="margin-bot">
							<div class="fonwei"><i class="fa fa-address-card-o text-primary"></i> 供应商：${item.mealsUnitName}</div>
						</div>
						<div class="fb ftop" style="font-size: 12px;">
							<div class="">
								<div class="text-muted"><i class="fa fa-calendar-minus-o text-danger"></i> 配送单号：</div>
								<span class="padding-side">${item.id }</span>
							</div>
							<div class="padding-side border-left yanshou" style="border-left: 1px solid #ddd;">
								<div class="text-muted"><i class="fa fa-cart-arrow-down text-success"></i> 验收单位：</div>
								<span class="">${item.acceptanceUnitName}</span>
							</div>
						</div>
					</div>
					<div class="fc fend" style="width: 10%;height: 100%;border-left: 1px solid #ddd;">
						<a href="${pageContext.request.contextPath}/wap_dry/delivery_detal?id=${item.id}"><i class="fa fa-angle-right fa-3x text-muted"></i></a>
					</div>
				</div>
				</c:forEach>
				
			</div>
		</main>	
	<c:import url="public/footer.jsp"></c:import>
	</body>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/static/selectmenu/js/selectmenu.min.js" ></script>    
    <script type="text/javascript">
	$(function(){
		//selectunit("");		
		var url = "${pageContext.request.contextPath}/wap_unit/select_unit";		
		$.ajax({
			"url" : url,			
			"type" : "POST",
			"dataType" : "json",
			"success" : function(e) {				
				if (e.state == 0) {layer.msg(e.message,{icon:2,time:1000});
					return;
				}else{					
					 $('#demoSingle').click(function(){
						$(this).selectMenu({
							title : '<i class="fa fa-fw fa-thumbs-o-up"></i> 请选择市场主体',
							arrow : true,
							showField : 'unitName',
							keyField : 'unitId',
							 position : 'center',
							search : true,
							data :e.data,
							eSelect : function(data){
								if(data && data.length > 0){
									console.log(data[0].unitName);
								selectunit(data[0].unitName)
								}
							}
						});
					});
				}
			}
		});		 
	});	
	function selectunit(unitId) {
		var url = "${pageContext.request.contextPath}/wap_dry/deliveryList";
		var data = "unitName=" + unitId;	
		$.ajax({
			"url" : url,
			"data" : data,
			"type" : "POST",
			"dataType" : "json",
			"success" : function(obj) {
				if (obj.state == 0) {
					layer.msg(obj.message,{icon:2,time:1000});
					return;
				}else{
					var result = "";
					for(var i=0;i<obj.data.length;i++){
						result += '<div class="delivery_li fb margin-bot" style="height: 100px;">'
							result += '<div class="" style="width: 90%;">'
							result += '<div class="margin-bot">'
							result += '<div class="fonwei"><i class="fa fa-address-card-o text-primary"></i> 供应商：' + obj.data[i].mealsUnitName + '</div>'
							result += '</div>'
							result += '<div class="fb ftop" style="font-size: 12px;">'
							result += '<div class="">'
							result += '<div class="text-muted"><i class="fa fa-calendar-minus-o text-danger"></i> 配送单号：</div>'
							result += '<span class="padding-side">' + obj.data[i].id + '</span>'
							result += '</div>'
							result += '<div class="padding-side border-left yanshou" style="border-left: 1px solid #ddd;">'
							result += '<div class="text-muted"><i class="fa fa-cart-arrow-down text-success"></i> 验收单位：</div>'
							result += '<span class="">' + obj.data[i].acceptanceUnitName + '</span>'
							result += '</div>'
							result += '</div>'
							result += '</div>'
							result += '<div class="fc fend" style="width: 10%;height: 100%;border-left: 1px solid #ddd;">'
							result += '<a href="${pageContext.request.contextPath}/wap_dry/delivery_detal?id=' + obj.data[i].id + '"><i class="fa fa-angle-right fa-3x text-muted"></i></a>'
							result += '</div>'
							result += '</div>'						
					}
					$("#result_list").html(result);
					console.log(obj.data);									
				}				
			}
		});
	}
    </script>	
</html>
