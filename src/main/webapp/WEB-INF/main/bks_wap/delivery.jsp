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
	<body class="contain">
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="${pageContext.request.contextPath}/wap_home" class="p-link-back"><i class="fa fa-home"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>
					<c:if test="${user.type == 2}">
						<a href="${pageContext.request.contextPath}/wap_dry/delivery_add" class="btn bg-primary"><i class="fa fa-plus"></i></a>
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
		<main class="main margin-top2 padding-side05">
			<div class="">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead>
						<tr><th width="45px">序号</th><th>配送单号</th><th>供应商</th><th>验收单位</th><th width="45px">操作</th></tr>
					</thead>
					<tbody id="result_list">
						<c:forEach items="${distributionList}" var="item" varStatus="vs">
							<tr>
							<td>${vs.count}</td>
							<td>${item.id }</td>
							<td>${item.mealsUnitName}</td>
							<td>${item.acceptanceUnitName}</td>
							<td><a href="${pageContext.request.contextPath}/wap_dry/delivery_detal?id=${item.id}">详情</a></td>
							</tr>
						</c:forEach>				
					</tbody>
				</table>
			</div>
		</main>	
	<c:import url="public/footer.jsp"></c:import>
	</body>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/static/selectmenu/js/selectmenu.min.js" ></script>    
    <script type="text/javascript">
	$(function(){	
		selectunit("");
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
						result += "<tr>";
						result += "<td>" + (i+1) + "</td>";
						result += "<td>" + obj.data[i].id + "</td>";
						result += "<td>" + obj.data[i].mealsUnitName + "</td>";
						result += "<td>" + obj.data[i].acceptanceUnitName + "</td>";
						result += "<td><a href='${pageContext.request.contextPath}/wap_dry/delivery_detal?id=" + obj.data[i].id + "'>详情</a></td>";
						result += "</tr>";
					}
					$("#result_list").html(result);
					console.log(obj.data);									
				}				
			}
		});
	}
    </script>	
</html>
