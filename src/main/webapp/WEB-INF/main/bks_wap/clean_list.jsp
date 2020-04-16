<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>清洗消毒记录</title>
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
						<c:if test="${user.type == 2}">
							<a href="${pageContext.request.contextPath}/wap_clean/clean_add" class="btn btn-primary"><i class="fa fa-plus"></i></a>
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
				<c:if test="${disinfectionlist == null || fn:length(disinfectionlist) <= 0 }">
					<span style="top: 65px;position: relative;color: #c23412;font-size: 17px;font-weight: 600">暂无清洗记录</span>
				</c:if>
				<c:forEach items="${disinfectionlist}" var="f" varStatus="vs">
					<div class="buy_list">
						<div class="buy_top">
							<p class="fb">
								<span class="buy_top_span bfrifRow fonwei"><i class="fa fa-address-card-o text-danger"></i> <!-- 学校： -->${f.unitName}</span>
								<span class="bfrifRow"></span>
							</p>
						</div>
						<div class="buy_top1">
							<div class="fb">
								<span class="text-muted bfrifRow"><!--  消毒日期 ：-->${f.dailyTime}</span>
								<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_clean/clean_detal?id=${f.id}">详情</a>
							</div>
						</div>				
					</div>
				</c:forEach>
			</div>
			<!--序号 vs.count -->		
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
		console.log("qqqqqqqq");
		var url = "${pageContext.request.contextPath}/wap_clean/clean_alllist";
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
					var datvar="";							
					for(var i=0;i<obj.data.length;i++){
						datvar += '<div class="buy_list">'
						datvar += '<div class="buy_top">'
						datvar += '<p class="fb">'
						datvar += '<span class="buy_top_span bfrifRow"><i class="fa fa-bookmark text-danger"></i> <!-- 学校： -->' + obj.data[i].unitName + '</span>'
						datvar += '<span class="bfrifRow"></span>'
						datvar += '</p>'
						datvar += '</div>'
						datvar += '<div class="buy_top1">'
						datvar += '<div class="fb">'
						datvar += '<span class="text-muted bfrifRow"><!--  消毒日期 ：-->' + obj.data[i].dailyTime + '</span>'
						datvar += '<a class="buy_top_a btn btn-warning"  href="${pageContext.request.contextPath}/wap_clean/clean_detal?id=' + obj.data[i].id + '">详情</a>'
						datvar += '</div>'
						datvar += '</div>'				
						datvar += '</div>'
						/* datvar += '<div class="buy_list">'
							   +  '<div class="buy_top"><p class="text-muted"><i class="fa fa-bookmark text-danger"></i>'
							   +  '订单号:<span class="buy_top_span">'+obj.data[i].id+'</span>'
							   +  '<a class="buy_top_a"  href="${pageContext.request.contextPath}/wap_pro/buy_detal?id='+ obj.data[i].id +'">详情</a>';
						datvar += '</p></div><div class="buy_top1"><div><span class="fonwei text-muted bfrifRow">' +obj.data[i].unitName+'</span>'							  
							   +  '<span class="buy_top1_span text-muted">format(' + obj.data[i].purchasingTime + ',yyyy-MM-dd)"</span></div></div></div>';	 */												
					}
					$("#result_list").html(datvar);											
				}				
			}
		}); 				
	}
    </script>	

</html>
