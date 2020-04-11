<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>多频检测记录</title>
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
						<c:if test="${user.type == 1}">
							<a href="${pageContext.request.contextPath}/wap_det/detection_add" class="btn btn-primary"><i class="fa fa-plus"></i></a>
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
		<main class="delivery main padding-side05"">
			<div class="margin-top" id="result_list">
				<c:forEach items="${detectionList}" var="f" varStatus="vs">
					<div class="buy_list">
						<div class="buy_top">
							<p class="fb">
								<span class="buy_top_span bfrifRow"><i class="fa fa-address-card text-danger"></i> <!-- 学校： -->${f.unitName}</span>
								<span class="text-muted bfrifRow padding-side" style="font-size: 10px;"><fmt:formatDate value="${f.createTime}" pattern="yyyy-MM-dd"/></span>
							</p>
						</div>
						<div class="buy_top1">
							<div class="fb">
								<span class="bfrifRow text-muted">样品名 : ${f.samplName }</span>
								<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_det/detection_detal?id=${f.id}">详情</a>
							</div>
						</div>				
					</div>
				</c:forEach>
			</div>
			<!--序号 vs.count -->		
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
		var url = "queryList";
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
					for(var i=0;i<obj.data.length;i++){
						var time = timestampToTime(obj.data[i].createTime);
						result += '<div class="buy_list">';
						result += '<div class="buy_top">';
						result += '<p class="fb">';
						result += '<span class="buy_top_span bfrifRow"><i class="fa fa-bookmark text-danger"></i> <!-- 学校： -->' + obj.data[i].unitName + '</span>';
						result += '<span class="text-muted bfrifRow padding-side" style="font-size: 10px;">' + time + '</span>';
						result += '</p>';
						result += '</div>';
						result += '<div class="buy_top1">';
						result += '<div class="fb">';
						result += '<span class="text-muted">样品名 : ' + obj.data[i].samplName + '</span>';			
						result += '<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_det/detection_detal?id=' + obj.data[i].id + '">详情</a>';				
						result += '</div>';
						result += '</div>';
						result += '</div>';
					}
					$("#result_list").html(result);
				}				
			}
		}); 							
	}
	function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var D = date.getDate() + '';
       	var h = date.getHours() + ':';
       	var m = date.getMinutes() + ':';
       	var s = date.getSeconds();
        return Y+M+D;
    }
    </script>
</html>
