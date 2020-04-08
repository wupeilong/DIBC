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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>	
</head>

	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
				<div class="">
					<!-- <a href="" class="btn bg-primary padding-side"><i class="fa fa-search"></i></a> -->
					<c:if test="${user.type == 1}">
						<select id="unit_list"">
							<option value="">查询所有从业人员信息</option>
							<c:forEach items="${unitList}" var="item">								
								<option value="${item.unitId}">${item.unitName}</option>
							</c:forEach>			
						</select>		
					</c:if>								
				</div>
				<c:if test="${user.parentId == 0 && user.type == 2 }">user_add
					<a href="${pageContext.request.contextPath}/wap_user/workmens_add" class="btn bg-primary"><i class="fa fa-plus"></i></a>
				</c:if>
			</div>
		</div>
		<main class="main margin-top2 padding-side05">
			<div class="">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead>
						<tr><th>序号</th><th>员工姓名</th><th>职务</th><th>年龄</th><th>操作</th></tr>
					</thead>
					<tbody id="result_list">
						
						<c:forEach items="${userList}" var="item" varStatus="vs">
							<tr><td>${vs.count }</td><td>${item.username }</td><td>${item.duty }</td><td>${item.age }</td><td><a href="${pageContext.request.contextPath}/wap_user/workmens_detal?id=${item.id }">详情</a></td></tr>
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
			var url = "${pageContext.request.contextPath}/wap_user/unitUserList";
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
	});
	
	
	</script>
</html>
