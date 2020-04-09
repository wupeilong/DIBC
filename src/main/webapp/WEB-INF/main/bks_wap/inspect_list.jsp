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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/zhou_style.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/selectmenu/css/selectmenu.css" type="text/css">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
	

</head>
	<body navxg >
		<div id="page">
			<div id="header" >
				<div class="header-content">
					<a href="${pageContext.request.contextPath}/wap_home" class="p-link-back"><i class="fa fa-home"></i></a>					
					<c:if test="${user.type == 1}">
						<a class="menu-btn" id="demoSingle" href="#menu"></a>
					</c:if>	
					<c:if test="${user.type != 1}">
						<a class="menu-btn" href="#menu"></a>
					</c:if>						
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>					
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
			<div class="bg-gradient" style="margin-top: 89px;">
						<ul class="menu clearfix list-unstyled padding-side margin0" style="padding-top:1em;">
						  <li class="active pull-left" id=""><div class="getall text-center">全部</div></li>
						  <li class="pull-left" id=""><div class="getS text-center">商家自检</div></li>
						  <li class="pull-left" id=""><div class="getJ text-center">监管专检</div></li><li>
						  <li class="pull-left" id=""><div class="getD text-center">督察专检</div></li><li>
						</ul>
					</div>			
		</div>
				
		<main class="main padding-side05" style="padding-top: 0px;">
			<div class="bg-warning margin-top2">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead>
						<tr><th>企业名称</th><th width="90">检查类型</th><th width="90px">检查时间</th><th width="45px">操作</th></tr>
					</thead>
					<tbody id="result_list">
						<c:forEach items="${checkList}" var="f">
							<tr>
								<td>${f.unitName}</td>
								<td>
									<c:if test="${f.checkType==1}">
										单位自检
									</c:if>
									<c:if test="${f.checkType==2}">
										监管专监
									</c:if>
									<c:if test="${f.checkType==3}">
										督查专检
									</c:if>
								</td>
								<td>${f.dailyTime}</td>
								<td style="4em"><a href="${pageContext.request.contextPath}/wap_ins/inspect_detal?id=${f.id}">详情</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
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
					for(var i=0;i<obj.data.length;i++){	
						result += "<tr>";
						result += "<td>" + obj.data[i].unitName + "</td>";
						if(obj.data[i].checkType == 1){
							result += "<td>单位自检</td>";
						}
						if(obj.data[i].checkType == 2){
							result += "<td>监管专检</td>";
						}
						if(obj.data[i].checkType == 3){
							result += "<td>督查专检</td>";
						}							
						result += "<td>" + obj.data[i].dailyTime + "</td>";
						result += "<td style='4em'><a href='${pageContext.request.contextPath}/wap_ins/inspect_detal?id=" + obj.data[i].id + "'>详情</a></td>";
						result += "</tr>";
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
					for(var i=0;i<obj.data.length;i++){
						result += "<tr>";
						result += "<td>" + obj.data[i].unitName + "</td>";
						if(obj.data[i].checkType == 1){
							result += "<td>单位自检</td>";
						}
						if(obj.data[i].checkType == 2){
							result += "<td>监管专检</td>";
						}
						if(obj.data[i].checkType == 3){
							result += "<td>督查专检</td>";
						}							
						result += "<td>" + obj.data[i].dailyTime + "</td>";
						result += "<td style='4em'><a href='${pageContext.request.contextPath}/wap_ins/inspect_detal?id=" + obj.data[i].id + "'>详情</a></td>";
						result += "</tr>";				
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
					for(var i=0;i<obj.data.length;i++){
						result += "<tr>";
						result += "<td>" + obj.data[i].unitName + "</td>";
						if(obj.data[i].checkType == 1){
							result += "<td>单位自检</td>";
						}
						if(obj.data[i].checkType == 2){
							result += "<td>监管专检</td>";
						}
						if(obj.data[i].checkType == 3){
							result += "<td>督查专检</td>";
						}							
						result += "<td>" + obj.data[i].dailyTime + "</td>";
						result += "<td style='4em'><a href='${pageContext.request.contextPath}/wap_ins/inspect_detal?id=" + obj.data[i].id + "'>详情</a></td>";
						result += "</tr>";				
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
					for(var i=0;i<obj.data.length;i++){
						result += "<tr>";
						result += "<td>" + obj.data[i].unitName + "</td>";
						if(obj.data[i].checkType == 1){
							result += "<td>单位自检</td>";
						}
						if(obj.data[i].checkType == 2){
							result += "<td>监管专检</td>";
						}
						if(obj.data[i].checkType == 3){
							result += "<td>督查专检</td>";
						}							
						result += "<td>" + obj.data[i].dailyTime + "</td>";
						result += "<td style='4em'><a href='${pageContext.request.contextPath}/wap_ins/inspect_detal?id=" + obj.data[i].id + "'>详情</a></td>";
						result += "</tr>";				
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
					for(var i=0;i<obj.data.length;i++){
						result += "<tr>";
						result += "<td>" + obj.data[i].unitName + "</td>";
						if(obj.data[i].checkType == 1){
							result += "<td>单位自检</td>";
						}
						if(obj.data[i].checkType == 2){
							result += "<td>监管专检</td>";
						}
						if(obj.data[i].checkType == 3){
							result += "<td>督查专检</td>";
						}							
						result += "<td>" + obj.data[i].dailyTime + "</td>";
						result += "<td style='4em'><a href='${pageContext.request.contextPath}/wap_ins/inspect_detal?id=" + obj.data[i].id + "'>详情</a></td>";
						result += "</tr>";				
					}
					$("#result_list").html(result);
				}	
			}
		})
	})
    </script>		
</html>
