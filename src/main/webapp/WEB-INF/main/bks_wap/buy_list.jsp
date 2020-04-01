<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>采购报送信息列表</title>
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
						<!-- <a href="" class="btn bg-primary padding-side"><i class="fa fa-search"></i></a> -->
						
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
				<c:if test="${user.type == 2 }">
					<a href="${pageContext.request.contextPath}/wap_pro/buy_add" class="btn bg-primary"><i class="fa fa-plus"></i></a>
				</c:if>				
			</div>
		</div>
		<main class="main margin-top2 padding-side05">
			<div class="">
				<table class="table table-striped table-hover" cellspacing="" cellpadding="">
					<thead>
						<tr><th>采购商</th><th width="60">状态</th><th width="100px">采购日期</th><th width="50px">操作</th></tr>
					</thead>
					<tbody id="result_list">
						<c:forEach items="${procurementList}" var="item">
							<tr><td>${item.unitName}</td>
							<c:if test="${item.status == 0}">
								<td>未验收</td>
							</c:if>
							<c:if test="${item.status == 1}">
								<td>已验收</td>
							</c:if>
							<td><fmt:formatDate value="${item.purchasingTime}" pattern="yyyy-MM-dd" /></td>
							<td><a href="${pageContext.request.contextPath}/wap_pro/buy_detal?id=${item.id}">详情</a></td>
							</tr>
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
			var url = "${pageContext.request.contextPath}/wap_pro/list";
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
							if(obj.data[i].status == 0){
								result += "<td>未验收</td>";
							}
							if(obj.data[i].status == 1){
								result += "<td>已验收</td>";
							}	
							result += "<td>" + format(obj.data[i].purchasingTime, "yyyy-MM-dd") + "</td>";
							result += "<td><a href='${pageContext.request.contextPath}/wap_pro/buy_detal?id=" + obj.data[i].id + "'>详情</a></td>";
							result += "</tr>";
						}
						$("#result_list").html(result);							
					}		
				}
			});
		}
	});
	
	var format = function(time, format) {
	    var t = new Date(time);
	    var tf = function(i) {
	        return (i < 10 ? '0': '') + i
	    };
	    return format.replace(/yyyy|MM|dd|HH|mm|ss/g,
	    function(a) {
	        switch (a) {
	        case 'yyyy':
	            return tf(t.getFullYear());
	            break;
	        case 'MM':
	            return tf(t.getMonth() + 1);
	            break;
	        case 'mm':
	            return tf(t.getMinutes());
	            break;
	        case 'dd':
	            return tf(t.getDate());
	            break;
	        case 'HH':
	            return tf(t.getHours());
	            break;
	        case 'ss':
	            return tf(t.getSeconds());
	            break;
	        }
	    });
	}
	</script>
</html>
