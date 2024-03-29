<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>企业信息列表</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/ztable.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/selectmenu/css/selectmenu.css" type="text/css">
	<link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>

</head>
	<body class="contain o-page p-about">
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="javascript:history.go(0)" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="${pageContext.request.contextPath}/wap_home" class="p-link-home"><i class="fa fa-arrow-left"></i></a>					
				</div>
			</div>
		</div>
		<main class="main">
			<div class="coopration_list">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead class="bg-primary">
						<tr><th style="width:4.4em">序号</th><th>企业名字</th><th style="width:6.7em">企业法人</th><th style="width:4.4em">操作</th></tr>
					</thead>
					<tbody id="result_list">
						<c:forEach items="${unitList}" var="item" varStatus="vs">
							<c:if test="${vs.index%2 == 0}">
								<tr>
								<td class="vertical-mid">${vs.count}</td>
								<td class="vertical-mid td-left">${item.unitName}</td>
								<td class="vertical-mid">${item.legalPerson}</td>
								<td class="vertical-mid"><a href="${pageContext.request.contextPath}/wap_unit/coopration_detal?unitId=${item.unitId}">详情</a></td></tr>
							</c:if>
							<c:if test="${vs.index%2 != 0}">
								<tr>
								<td class="vertical-mid alt">${vs.count}</td>
								<td class="vertical-mid td-left alt">${item.unitName}</td>
								<td class="vertical-mid alt">${item.legalPerson}</td>
								<td class="vertical-mid alt"><a href="${pageContext.request.contextPath}/wap_unit/coopration_detal?unitId=${item.unitId}">详情</a></td></tr>
							</c:if>							
						</c:forEach>						
					</tbody>
				</table>
			</div>
			<div class="bannerPane">
				<div class="overlay"></div>
				<div class="s-banner-content">
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
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
		var url = "${pageContext.request.contextPath}/wap_unit/list";
		var data = "unitId=" +unitId+"&unitName=";
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
						if(i%2 == 0){
							result += "<tr>";	
							result += "<td>" + (i+1) + "</td>";
							result += "<td class='vertical-mid alt'>" + obj.data[i].unitName+ "</td>";
							result += "<td class='vertical-mid td-left alt'>" + obj.data[i].legalPerson + "</td>";							
							result += "<td class='vertical-mid alt'><a href='${pageContext.request.contextPath}/wap_unit/coopration_detal?unitId=" + obj.data[i].unitId + "'>详情</a></td>";
							result += "</tr>";
						}else{
							result += "<tr>";	
							result += "<td>" + (i+1) + "</td>";
							result += "<td class='vertical-mid alt'>" + obj.data[i].unitName  + "</td>";
							result += "<td class='vertical-mid td-left alt'>" + obj.data[i].legalPerson + "</td>";							
							result += "<td class='vertical-mid alt'><a href='${pageContext.request.contextPath}/wap_unit/coopration_detal?unitId=" + obj.data[i].unitId + "'>详情</a></td>";
							result += "</tr>";
						}						
					}
					$("#result_list").html(result);													
				}				
			}
		}); 
	}
    </script>	
</html>
