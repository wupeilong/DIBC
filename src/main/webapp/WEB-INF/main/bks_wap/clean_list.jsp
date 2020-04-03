<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>清洗消毒记录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>	
</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
				<div class="">
					<div class="">
						<c:if test="${user.type==1}">
							<select id="unit_list"">
									<option value="0">选择全部企业信息</option>
									<c:forEach items="${unitList}" var="item">								
										<option value="${item.unitId}">${item.unitName}</option>
									</c:forEach>							
							</select>
						</c:if>						
					</div>
				</div>
				<c:if test="${user.type == 2}">
					<a href="${pageContext.request.contextPath}/wap_clean/clean_add" class="btn bg-primary"><i class="fa fa-plus"></i></a>
				</c:if>				
			</div>
		</div>
		<main class="main margin-top2 padding-side05">
			<div class="">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead>
						<tr><th width="45">序号</th><th>学校名称</th><th>消毒日期</th><th width="45">操作</th></tr>
					</thead>
					<tbody id="datvarbody">
						<c:forEach items="${disinfectionlist}" var="f" varStatus="vs">
							<tr>
								<td>${vs.count}</td>
								<td>${f.unitName}</td>
								<td>${f.dailyTime}</td>
								<td><a href="${pageContext.request.contextPath}/wap_clean/clean_detal?id=${f.id}">详情</a></td>
							</tr>
						</c:forEach>						
					</tbody>
				</table>
			</div>
		</main>	
	<c:import url="public/footer.jsp"></c:import>
	</body>
<script type="text/javascript">
	$('#unit_list').searchableSelect({
		"afterSelectItem":function(){			
			var url = "../clean/clean_alllist";
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
						var datvar="";							
						for(var i=0;i<obj.data.length;i++){
							datvar +='<tr><td>' + (i+1) + '</td>'+
									'<td>'+obj.data[i].unitName+'</td>'+
									'<td>'+obj.data[i].dailyTime+'</td>'+
									'<td><a href="${pageContext.request.contextPath}/wap_clean/clean_detal?id='+obj.data[i].id+'">详情</a></td></tr>';							
						}
						$("#datvarbody").html(datvar);													
					}				
				}
			}); 					
		}
	});	
</script>
</html>
