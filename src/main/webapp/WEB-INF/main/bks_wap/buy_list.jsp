<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>采购报送信息列表</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/zhou_style.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/selectmenu/css/selectmenu.css" type="text/css">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
	<style type="text/css">

.navxg{
	padding:0;
}
	</style>	
</head>
	<body class="o-page p-about" style="background-color: #f7f7f7;">
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
					<div class="header-btn text-right">
						<c:if test="${user.type == 2 }">
							<a href="${pageContext.request.contextPath}/wap_pro/buy_add" class="btn bg-primary"><i class="fa fa-plus"></i></a>
						</c:if>
					</div>
				</div>
				<div class="bg-gradient menu_wrap" style="margin-top: 89px;">
					<ul class="menu clearfix list-unstyled padding-side margin0" style="padding-top:1em;">
					  <li class="active pull-left" id="whole"><div class="getall text-center text-white">全部</div></li>
					  <li class="pull-left" id="no_acceptance"><div class="getUn text-center text-white">未验收</div></li>
					  <li class="pull-left" id=" "><div class="geted text-center text-white">已验收</div></li><li>
					</ul>
				</div>
			</div>
			<div class="bannerPane">
				<div class="overlay"></div>
				<div class="s-banner-content">
					<input type="hidden" id="select_uint_id" value="">
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
			</div>
			
		</div>
		<main class="main padding-side05" style="padding-top: 146px;padding-bottom: 60px;" id="result_list">
			<c:forEach items="${procurementList}" var="item">
				<div class="buy_list">
					<div class="buy_top"><p class="text-muted"><i class="fa fa-bookmark text-danger"></i> 订单号:
						<span class="buy_top_span">${item.id}</span>
						<a class="buy_top_a"  href="${pageContext.request.contextPath}/wap_pro/buy_detal?id=${item.id}">详情</a>
						<c:if test="${item.status == 0}">
							<span class="buy_top_span1">未验收</span>	
						</c:if>
						<c:if test="${item.status == 1}">
							<span class="buy_top_span1">已验收</span>
						</c:if>											
						</p>
					</div>
					<div class="buy_top1">
						<div>
							<span class="fonwei text-muted bfrifRow">${item.unitName}</span>
							<span class="buy_top1_span text-muted"><fmt:formatDate value="${item.purchasingTime}" pattern="yyyy-MM-dd" /></span>
						</div>
					</div>
				</div>
			</c:forEach>		
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
		var url = "${pageContext.request.contextPath}/wap_pro/list";
		var data = "unitId=" + unitId;
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
						result += '<div class="buy_list">'+
								  '<div class="buy_top"><p class="text-muted"><i class="fa fa-bookmark text-danger"></i> 订单号:'+
								'<span class="buy_top_span">'+obj.data[i].id+'</span>'+
								'<a class="buy_top_a"  href="${pageContext.request.contextPath}/wap_pro/buy_detal?id='+ obj.data[i].id +'">详情</a>';
								if(obj.data[i].status == 0){
									result += '<span class="buy_top_span1">未验收</span>';
								}
								if(obj.data[i].status == 1){
									result += '<span class="buy_top_span1">已验收</span>';
								}																		
								result += '</p></div><div class="buy_top1"><div><span class="fonwei text-muted bfrifRow">'+obj.data[i].unitName+'</span><span class="buy_top1_span text-muted">'+ format(obj.data[i].purchasingTime, "yyyy-MM-dd") +'</span>'+				
										  '</div></div></div>';						
					}
					$("#result_list").html(result);							
				}		
			}
		});
	}
    </script>	
	<script type="text/javascript">
	$(".getall").click(function(){
		var url = "${pageContext.request.contextPath}/wap_pro/list";
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
					for(var i=0;i<obj.data.length;i++){
						result += '<div class="buy_list">'+
								  '<div class="buy_top"><p class="text-muted"><i class="fa fa-bookmark text-danger"></i> 订单号:'+
								  '<span class="buy_top_span">'+obj.data[i].id+'</span>'+
								  '<a class="buy_top_a"  href="${pageContext.request.contextPath}/wap_pro/buy_detal?id='+ obj.data[i].id +'">详情</a>';
						if(obj.data[i].status == 0){
							result += '<span class="buy_top_span1">未验收</span>';
						}
						if(obj.data[i].status == 1){
							result += '<span class="buy_top_span1">已验收</span>';
						}																		
						result += '</p></div><div class="buy_top1"><div><span class="fonwei text-muted bfrifRow">'+obj.data[i].unitName+'</span><span class="buy_top1_span text-muted">'+ format(obj.data[i].purchasingTime, "yyyy-MM-dd") +'</span>'+				
										  '</div></div></div>';						
					}
					$("#result_list").html(result);
				}	
			}
		})
	})
	$(".getUn").click(function(){
		var url = "${pageContext.request.contextPath}/wap_pro/list";
		var data = "status=0";
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
					for(var i=0;i<obj.data.length;i++){
						result += '<div class="buy_list">'+
								  '<div class="buy_top"><p class="text-muted"><i class="fa fa-bookmark text-danger"></i> 订单号:'+
								  '<span class="buy_top_span">'+obj.data[i].id+'</span>'+
								  '<a class="buy_top_a"  href="${pageContext.request.contextPath}/wap_pro/buy_detal?id='+ obj.data[i].id +'">详情</a>';
						if(obj.data[i].status == 0){
							result += '<span class="buy_top_span1">未验收</span>';
						}
						if(obj.data[i].status == 1){
							result += '<span class="buy_top_span1">已验收</span>';
						}																		
						result += '</p></div><div class="buy_top1"><div><span class="fonwei text-muted bfrifRow">'+obj.data[i].unitName+'</span><span class="buy_top1_span text-muted">'+ format(obj.data[i].purchasingTime, "yyyy-MM-dd") +'</span>'+				
										  '</div></div></div>';						
					}
					$("#result_list").html(result);
				}	
			}
		})
	})
	$(".geted").click(function(){
		var url = "${pageContext.request.contextPath}/wap_pro/list";
		var data = "status=1";
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
					for(var i=0;i<obj.data.length;i++){
						result += '<div class="buy_list">'+
								  '<div class="buy_top"><p class="text-muted"><i class="fa fa-bookmark text-danger"></i> 订单号:'+
								  '<span class="buy_top_span">'+obj.data[i].id+'</span>'+
								  '<a class="buy_top_a"  href="${pageContext.request.contextPath}/wap_pro/buy_detal?id='+ obj.data[i].id +'">详情</a>';
						if(obj.data[i].status == 0){
							result += '<span class="buy_top_span1">未验收</span>';
						}
						if(obj.data[i].status == 1){
							result += '<span class="buy_top_span1">已验收</span>';
						}																		
						result += '</p></div><div class="buy_top1"><div><span class="fonwei text-muted bfrifRow">'+obj.data[i].unitName+'</span><span class="buy_top1_span text-muted">'+ format(obj.data[i].purchasingTime, "yyyy-MM-dd") +'</span>'+				
										  '</div></div></div>';						
					}
					$("#result_list").html(result);
				}	
			}
		})
	})
	$(".menu").children().click(function(){
		$(this).parent().children().removeClass("active")
		$(this).addClass("active");
		
	})
	
	
	var format = function(time, format) {
	    var t = new Date(time);
	    var tf = function(i) {
	        return (i < 10 ? '0': '') + i
	    };
	    return format.replace(/yyyy|MM|dd|HH|mm|ss/g,
	    function(a) {
	        switch (a) {
	        case 'yyyy':
	            return tf(t.getFullYear());
	            break;
	        case 'MM':
	            return tf(t.getMonth() + 1);
	            break;
	        case 'mm':
	            return tf(t.getMinutes());
	            break;
	        case 'dd':
	            return tf(t.getDate());
	            break;
	        case 'HH':
	            return tf(t.getHours());
	            break;
	        case 'ss':
	            return tf(t.getSeconds());
	            break;
	        }
	    });
	}
	</script>
</html>
