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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>

</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>	
				<div class="">
					<div class="">
						<c:if test="${user.type == 1}">
									<select id="unit_list">
										<option value="">查询所有企业信息</option>
										<c:forEach items="${unitList}" var="item">								
											<option value="${item.unitId}">${item.unitName}</option>
										</c:forEach>
									</select>
								</c:if>	
						</div>
				</div>
			</div>
		</div>
		<main class="main padding-side05">
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
										市监局专监
									</c:if>
									<c:if test="${f.checkType==3}">
										督查组检查
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
	<c:import url="public/footer.jsp"></c:import>
	</body>
	<script type="text/javascript">$('select').searchableSelect({
		"afterSelectItem":function(){
			var url = "${pageContext.request.contextPath}/wap_ins/queryList";
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
							result += "<td>" + obj.data[i].unitName + "</td>";
							if(obj.data[i].checkType == 1){
								result += "<td>单位自检</td>";
							}
							if(obj.data[i].checkType == 2){
								result += "<td>市监局专监</td>";
							}
							if(obj.data[i].checkType == 3){
								result += "<td>督查组检查</td>";
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
	});	
	</script>
</html>
