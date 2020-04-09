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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>
</head>
	<body class="contain">
		<div class="navigation bg-gradient">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
				<div class="">
					<div class="">
						<!-- <a href="" class="btn bg-primary padding-side"><i class="fa fa-search"></i></a> -->
						<select id="unit_list"">
							<option value="">查询所有企业信息</option>
							<c:forEach items="${unitList}" var="item">								
								<option value="${item.unitId}">${item.unitName}</option>
							</c:forEach>							
						</select>
					</div>
				</div>
				<!-- <a href="http://192.168.1.106:8848/wap_MCLZ/check_add.html" class="btn bg-primary"><i class="fa fa-plus"></i></a> -->
			</div>
		</div>
		<main class="main margin-top">
			<div class="">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead class="bg-primary">
						<tr><th class="text-white">序号</th><th class="text-white">企业名称</th><th class="text-white">企业法人</th><th class="text-white">操作</th></tr>
					</thead>
					<tbody id="result_list">
						<c:forEach items="${unitList}" var="item" varStatus="vs">
							<tr><td>${vs.count}</td><td>${item.unitName}</td><td>${item.legalPerson}</td><td><a href="${pageContext.request.contextPath}/wap_unit/coopration_detal?unitId=${item.unitId}">详情</a></td></tr>
						</c:forEach>						
					</tbody>
				</table>
			</div>
		</main>
	<c:import url="public/footer.jsp"></c:import>
	</body>
	<script type="text/javascript">
	$('select').searchableSelect({
		"afterSelectItem":function(){
			var url = "${pageContext.request.contextPath}/wap_unit/list";
			var data = "unitId=" + $("#unit_list").val();
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
							result += "<td>" + obj.data[i].unitName + "</td>";
							result += "<td>" + obj.data[i].legalPerson + "</td>";
							result += "<td><a href='${pageContext.request.contextPath}/wap_unit/coopration_detal?unitId=" + obj.data[i].unitId + "'>详情</a></td>";
							result += "</tr>";
						}
						$("#result_list").html(result);
						console.log(obj.data);									
					}				
				}
			}); 
		}
	});
	
	
	</script>
</html>
