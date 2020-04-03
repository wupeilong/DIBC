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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css">
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
					<div class="">
						<select id="unit_list"">
								<option value="">查看全部企业</option>
								<c:forEach items="${unitList}" var="item">								
									<option value="${item.unitId}">${item.unitName}</option>
								</c:forEach>							
						</select>
						
					</div>
				</div>
				<a href="${pageContext.request.contextPath}/detection/detection_add" class="btn bg-primary"><i class="fa fa-plus"></i></a>
			</div>
		</div>
		<main class="main margin-top2 padding-side05">
			<div class="">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead>
						<tr><th>检查单位公司</th><th>样品名称</th><th style="width: 4em">日期</th><th style="width: 4em">操作</th></tr>
					</thead>
					<tbody id="result_list">
						<c:forEach items="${detectionList}" var="f">
							<tr>
								<td>${f.unitName }</td>
								<td>${f.samplName }</td>
								<td class="vertical-mid"><fmt:formatDate value="${f.createTime}" pattern="yyyy-MM-dd"/></td>
								<td class="vertical-mid"><a href="${pageContext.request.contextPath}/wap_det/detection_detal?id=${f.id}">详情</a></td>
							</tr>
						</c:forEach>						
					</tbody>
				</table>
			</div>
		</main>
	<c:import url="public/footer.jsp"></c:import>
	</body>
<script>
						$('#unit_list').searchableSelect({
							"afterSelectItem":function(){								
									var url = "queryList";
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
													var time=timestampToTime(obj.data[i].createTime);
													result += "<tr>";
													result += "<td>" + obj.data[i].unitName + "</td>";
													result += "<td>" + obj.data[i].samplName + "</td>";
													result += "<td>"+time+"</td>";
													result += "<td class='vertical-mid'><a href='${pageContext.request.contextPath}/wap_det/detection_detal?id="+obj.data[i].id+"'>详情</a></td>";
													result += "</tr>";
												}
												$("#result_list").html(result);
											}				
										}
									}); 											
							}
						});
						function timestampToTime(timestamp) {
					        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
					        var Y = date.getFullYear() + '-';
					        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
					        var D = date.getDate() + ' ';
					       	var h = date.getHours() + ':';
					       	var m = date.getMinutes() + ':';
					       	var s = date.getSeconds();
					        return M+D;
					    }
					    
						</script>
</html>
