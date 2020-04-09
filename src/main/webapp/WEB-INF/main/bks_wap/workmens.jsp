<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>从业人员信息列表</title>
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
		<div id="page" class="">
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
					 <c:if test="${user.type == 2}"><!-- 禁主体有权限人员可添加 -->
						<shiro:hasPermission name="user_add"> 
						<a href="${pageContext.request.contextPath}/wap_user/workmens_add" class="btn btn-primary" style="position: absolute; right: 5px;top: 50px;"><i class="fa fa-plus"></i></a>					
						</shiro:hasPermission>
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
		<main class="main">
			<div class="coopration_list">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead class="bg-primary">
						<tr><th style="width:3.4em">序号</th><th style="width:5.4em">员工姓名</th><th>职务</th><th style="width:3.4em">年龄</th><th style="width:3.4em">操作</th></tr>
					</thead>
					<tbody id="result_list">						
						<c:forEach items="${userList}" var="item" varStatus="vs">
							<tr><td class="vertical-mid">${vs.count }</td>
							<td class="vertical-mid"><span class="" style="">${item.username }</span></td>
							<td class="vertical-mid td-left">${item.departmentName }</td>
							<td class="vertical-mid">${item.age }</td>
							<td class="vertical-mid"><a href="${pageContext.request.contextPath}/wap_user/workmens_detal?id=${item.id }">详情</a></td></tr>
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
		var url = "${pageContext.request.contextPath}/wap_user/unitUserList";
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
						result += "<tr>";
						result += "<td>" + (i+1) + "</td>";
						result += "<td>" + obj.data[i].username + "</td>";
						result += "<td>" + obj.data[i].duty + "</td>";
						result += "<td>" + obj.data[i].age + "</td>";
						result += "<td><a href='${pageContext.request.contextPath}/wap_user/workmens_detal?id=" + obj.data[i].id + "'>详情</a></td>";
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
