<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>监管记录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/selectmenu/css/selectmenu.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/zhou_style.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
	<body class="contain" style="background-color: #f7f7f7;">
		<div id="page">
			<div id="header" >
				<div class="header-content">
					<a href="javascript:history.go(0)" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<c:if test="${user.type == 1}">
						<a class="menu-btn" id="demoSingle" href="#menu"></a>
					</c:if>	
					<c:if test="${user.type != 1}">
						<a class="menu-btn" href="#menu"></a>
					</c:if>						
					<a href="${pageContext.request.contextPath}/wap_ins/inspect_choise" class="p-link-home"><i class="fa fa-arrow-left"></i></a>					
				</div>
				<div class="bg-gradient" style="margin-top: 89px;">
					<ul class="menu clearfix list-unstyled padding-side margin0" style="padding-top:1em;">
					  <li class="active pull-left" style="width: 25%;"><div class="getall text-center text-white">全部</div></li>
					  <li class="pull-left"  style="width: 25%;"><div class="getS text-center text-white">主体自查</div></li>
					  <li class="pull-left"  style="width: 25%;"><div class="getJ text-center text-white">监管检查</div></li><li>
					  <li class="pull-left"  style="width: 25%;"><div class="getD text-center text-white">督查抽查</div></li><li>
					</ul>
				</div>
			</div>
			<div class="bannerPane">
				<div class="overlay"></div>
				<div class="s-banner-content">
					<c:if test="${user.type != 3}">
						<input type="hidden" id="select_uint_id" value="">
					</c:if>
					<c:if test="${user.type == 3}">
						<input type="hidden" id="select_uint_id" value="${checkList[0].unitId}">
					</c:if>
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
			</div>			
		</div>
		<main class="delivery main padding-side05" style="padding-top: 128px;">
			<div class="margin-top" id="result_list">
				<c:forEach items="${checkList}" var="f" varStatus="vs">
					<div class="buy_list" >									
						<div class="buy_top">
							<p class="fb">
								<span class="buy_top_span bfrifRow"><i class="fa fa-bookmark text-danger"></i> <!-- 学校： -->${f.unitName}</span>
								<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_ins/inspect_detal?id=${f.id}">查看详情</a>
							</p>
						</div>
						<div class="buy_top1">
							<div class="fb">
								<span class="text-muted">
									<c:if test="${f.checkType==1}">
										主体自查
									</c:if>
									<c:if test="${f.checkType==2}">
										监管检查
									</c:if>
									<c:if test="${f.checkType==3}">
										督查抽查
									</c:if>
								</span>
								<span class="text-muted" style="font-size: 12px;"><!--  消毒日期 ：-->${f.dailyTime}</span>					
							</div>
						</div>				
					</div>
				</c:forEach>
			</div>
			<div class="margin-bot"></div>
		</main>
		<c:if test="${user.type == 3}">
			<c:import url="public/public_footer.jsp"></c:import>
		</c:if>
		<c:if test="${user.type != 3}">
			<c:import url="public/footer.jsp"></c:import>
		</c:if>	
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
									console.log(data[0].unitId);
									selectunit(data[0].unitId)
								}
							}
						});
					});
				}
			}
		});		 
	});	
	
	function selectunit(unitId) {
		$("#select_uint_id").val(unitId);
		var url = "${pageContext.request.contextPath}/wap_ins/queryList";
		var data = "unitId=" +unitId;
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
					for(var i=0; i<obj.data.length; i++){
						result += '<div class="buy_list">';
						result += '<div class="buy_top">';
						result += '<p class="fb">';
						result += '<span class="buy_top_span bfrifRow"><i class="fa fa-bookmark text-danger"></i> <!-- 学校： -->' + obj.data[i].unitName + '</span>';
						result += '<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_ins/inspect_detal?id=' + obj.data[i].id + '">查看详情</a>';
						result += '</p>';
						result += '</div>';
						result += '<div class="buy_top1">';
						result += '<div class="fb">';
						result += '<span class="text-muted">';
						if(obj.data[i].checkType == 1){
							result += '商家自检';
						}
						if(obj.data[i].checkType == 2){
							result += '监管专检';
						}
						if(obj.data[i].checkType == 3){
							result += '督查专检';
						}						
						result += '</span>';
						result += '<span class="text-muted" style="font-size: 12px;"><!--  消毒日期 ：-->' + obj.data[i].dailyTime + '</span>';				
						result += '</div>';
						result += '</div>';
						result += '</div>';	
					}
					$("#result_list").html(result);
				}
		}
	});
}
	
	
	$(".menu").children().click(function(){
		$(this).parent().children().removeClass("active")
		$(this).addClass("active");
		
	})
	
	$(".getall").click(function(){
		var url = "${pageContext.request.contextPath}/wap_ins/queryList";
		var data = "";
		var unitId = $("#select_uint_id").val();
		if(unitId != ""){
			data = "unitId=" + unitId; 
		}
		$.ajax({
			url:url,
			data:data,
			type : "POST",
			dataType:"json",
			success:function(obj){
				if (obj.state == 0) {
					layer.msg(obj.message,{icon:2,time:1000});
					return;
				}else{
					var result = "";
					for(var i=0; i<obj.data.length; i++){
						result += '<div class="buy_list">';
						result += '<div class="buy_top">';
						result += '<p class="fb">';
						result += '<span class="buy_top_span bfrifRow"><i class="fa fa-bookmark text-danger"></i> <!-- 学校： -->' + obj.data[i].unitName + '</span>';
						result += '<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_ins/inspect_detal?id=' + obj.data[i].id + '">查看详情</a>';
						result += '</p>';
						result += '</div>';
						result += '<div class="buy_top1">';
						result += '<div class="fb">';
						result += '<span class="text-muted">';
						if(obj.data[i].checkType == 1){
							result += '商家自检';
						}
						if(obj.data[i].checkType == 2){
							result += '监管专检';
						}
						if(obj.data[i].checkType == 3){
							result += '督查专检';
						}						
						result += '</span>';
						result += '<span class="text-muted" style="font-size: 12px;"><!--  消毒日期 ：-->' + obj.data[i].dailyTime + '</span>';				
						result += '</div>';
						result += '</div>';
						result += '</div>';	
					}
					$("#result_list").html(result);
				}	
			}
		})
	})
	
	$(".getS").click(function(){
		var url = "${pageContext.request.contextPath}/wap_ins/queryList";
		var data = "checkType=1";
		var unitId = $("#select_uint_id").val();
		if(unitId != ""){
			data += "&unitId=" + unitId; 
		}
		$.ajax({
			url:url,
			data:data,
			type : "POST",
			dataType:"json",
			success:function(obj){
				if (obj.state == 0) {
					layer.msg(obj.message,{icon:2,time:1000});
					return;
				}else{
					var result = "";
					for(var i=0; i<obj.data.length; i++){
						result += '<div class="buy_list">';
						result += '<div class="buy_top">';
						result += '<p class="fb">';
						result += '<span class="buy_top_span bfrifRow"><i class="fa fa-bookmark text-danger"></i> <!-- 学校： -->' + obj.data[i].unitName + '</span>';
						result += '<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_ins/inspect_detal?id=' + obj.data[i].id + '">查看详情</a>';
						result += '</p>';
						result += '</div>';
						result += '<div class="buy_top1">';
						result += '<div class="fb">';
						result += '<span class="text-muted">';
						if(obj.data[i].checkType == 1){
							result += '商家自检';
						}
						if(obj.data[i].checkType == 2){
							result += '监管专检';
						}
						if(obj.data[i].checkType == 3){
							result += '督查专检';
						}						
						result += '</span>';
						result += '<span class="text-muted" style="font-size: 12px;"><!--  消毒日期 ：-->' + obj.data[i].dailyTime + '</span>';				
						result += '</div>';
						result += '</div>';
						result += '</div>';	
					}
					$("#result_list").html(result);
				}	
			}
		})
	})
	$(".getJ").click(function(){
		var url = "${pageContext.request.contextPath}/wap_ins/queryList";
		var data = "checkType=2";
		var unitId = $("#select_uint_id").val();
		if(unitId != ""){
			data += "&unitId=" + unitId; 
		}
		$.ajax({
			url:url,
			data:data,
			type : "POST",
			dataType:"json",
			success:function(obj){
				if (obj.state == 0) {
					layer.msg(obj.message,{icon:2,time:1000});
					return;
				}else{
					var result = "";
					for(var i=0; i<obj.data.length; i++){
						result += '<div class="buy_list">';
						result += '<div class="buy_top">';
						result += '<p class="fb">';
						result += '<span class="buy_top_span bfrifRow"><i class="fa fa-bookmark text-danger"></i> <!-- 学校： -->' + obj.data[i].unitName + '</span>';
						result += '<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_ins/inspect_detal?id=' + obj.data[i].id + '">查看详情</a>';
						result += '</p>';
						result += '</div>';
						result += '<div class="buy_top1">';
						result += '<div class="fb">';
						result += '<span class="text-muted">';
						if(obj.data[i].checkType == 1){
							result += '商家自检';
						}
						if(obj.data[i].checkType == 2){
							result += '监管专检';
						}
						if(obj.data[i].checkType == 3){
							result += '督查专检';
						}						
						result += '</span>';
						result += '<span class="text-muted" style="font-size: 12px;"><!--  消毒日期 ：-->' + obj.data[i].dailyTime + '</span>';				
						result += '</div>';
						result += '</div>';
						result += '</div>';	
					}
					$("#result_list").html(result);
				}	
			}
		})
	})
	$(".getD").click(function(){
		var url = "${pageContext.request.contextPath}/wap_ins/queryList";
		var data = "checkType=3";
		var unitId = $("#select_uint_id").val();
		if(unitId != ""){
			data += "&unitId=" + unitId; 
		}
		$.ajax({
			url:url,
			data:data,
			type : "POST",
			dataType:"json",
			success:function(obj){
				if (obj.state == 0) {
					layer.msg(obj.message,{icon:2,time:1000});
					return;
				}else{
					var result = "";
					for(var i=0; i<obj.data.length; i++){
						result += '<div class="buy_list">';
						result += '<div class="buy_top">';
						result += '<p class="fb">';
						result += '<span class="buy_top_span bfrifRow"><i class="fa fa-bookmark text-danger"></i> <!-- 学校： -->' + obj.data[i].unitName + '</span>';
						result += '<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_ins/inspect_detal?id=' + obj.data[i].id + '">查看详情</a>';
						result += '</p>';
						result += '</div>';
						result += '<div class="buy_top1">';
						result += '<div class="fb">';
						result += '<span class="text-muted">';
						if(obj.data[i].checkType == 1){
							result += '商家自检';
						}
						if(obj.data[i].checkType == 2){
							result += '监管专检';
						}
						if(obj.data[i].checkType == 3){
							result += '督查专检';
						}						
						result += '</span>';
						result += '<span class="text-muted" style="font-size: 12px;"><!--  消毒日期 ：-->' + obj.data[i].dailyTime + '</span>';				
						result += '</div>';
						result += '</div>';
						result += '</div>';	
					}
					$("#result_list").html(result);
				}	
			}
		})
	})
    </script>		
</html>
