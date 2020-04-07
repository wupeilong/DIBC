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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/zhou_style.css"/>
	<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css"/> --%>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>
	<style type="text/css">
.searchable-select{
	width: 80%;
    float: right;  
    margin: -30px 15px 0 0;  
}
.navxg{
	padding:0;
}
	</style>	
</head>
	<body class="" style="background-color: #f7f7f7;">
		<div class="navigation bg-primary navxg" style="background: #2089b1;">
			<div class="">
				<a href="javascript:history.go(-1)" class="text-white video_fh"><!-- <i class="fa fa-angle-left"></i> --></a>				
					<div class="" style="width: 100%;">						
						<!-- <a href="" class="btn bg-primary padding-side"><i class="fa fa-search"></i></a> -->						
						<c:if test="${user.type == 1}">  
							<select id="unit_list">
								<option value="">查询所有企业信息</option>
								<c:forEach items="${unitList}" var="item">								
									<option value="${item.unitId}">${item.unitName}</option>
								</c:forEach>
							</select>
						</c:if>			
					</div><br>			
					<div class=""style="width: 100%;">
						<ul id="menu">
						  <li class="active" ><a href="" >全部</a></li><li ><a href="">未验收</a></li><li ><a href="">已验收</a></li><li>
						</ul>
					</div>
				<c:if test="${user.type == 2 }">
					<a href="${pageContext.request.contextPath}/wap_pro/buy_add" class="btn bg-primary"><i class="fa fa-plus"></i></a>
				</c:if>				
			</div>
		</div>
		
		<main class="main margin-top2 padding-side05" style="padding-top: 78.4px;" id="result_list">
			<c:forEach items="${procurementList}" var="item">
				<div class="buy_list">
					<div class="buy_top"><p>订单号：
						<span class="buy_top_span">${item.id}</span>
						<a class="buy_top_a"  href="${pageContext.request.contextPath}/wap_pro/buy_detal?id=${item.id}">详情</a>
						<c:if test="${item.status == 0}">
							<span class="buy_top_span1">未验收</span>	
						</c:if>
						<c:if test="${item.status == 1}">
							<span class="buy_top_span1">已验收</span>
						</c:if>											
						</p>
					</div>
					<div class="buy_top1"><p>${item.unitName}									
						<span class="buy_top1_span"><fmt:formatDate value="${item.purchasingTime}" pattern="yyyy-MM-dd" /></span>					
						</p>
					</div>				
				</div>
			</c:forEach>		
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
							result += '<div class="buy_list">'+
									  '<div class="buy_top"><p>订单号:'+
									'<span class="buy_top_span">'+obj.data[i].id+'</span>'+
									'<a class="buy_top_a"  href="${pageContext.request.contextPath}/wap_pro/buy_detal?id='+ obj.data[i].id +'">详情</a>';
									if(obj.data[i].status == 0){
										result += '<span class="buy_top_span1">未验收</span>';
									}
									if(obj.data[i].status == 1){
										result += '<span class="buy_top_span1">已验收</span>';
									}																		
									result += '</p></div><div class="buy_top1"><p>'+obj.data[i].unitName+'<span class="buy_top1_span">'+ format(obj.data[i].purchasingTime, "yyyy-MM-dd") +'</span>'+				
											  '</p></div></div>';							
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
