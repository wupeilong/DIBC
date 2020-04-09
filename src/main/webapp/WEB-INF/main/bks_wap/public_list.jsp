<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>企业信息列表</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/zhou_style.css"/>
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
	<body class="">
		<div class="navigation bg-primary">
			<div class="padding-side">
				<a href="javascript:history.go(-1)" class="text-white video_fh" style=" margin-top: 0px"><!-- <i class="fa fa-angle-left"></i> --></a>
				<div class="">
					<div class="">
						<!-- <a href="" class="btn bg-primary padding-side"><i class="fa fa-search"></i></a> -->
						
						<%-- <c:if test="${user.type == 1}"> --%>
							<select id="unit_list">
								<option value="">查询所有企业信息</option>
								<c:forEach items="${unitList}" var="item">								
									<option value="${item.unitId}">${item.unitName}</option>
								</c:forEach>
							</select>
						<%-- </c:if> --%>					
				
					</div>
				</div>
				<c:if test="${user.type == 2}">
					<a href="${pageContext.request.contextPath}/wap_pro/buy_add" class="btn bg-primary"><i class="fa fa-plus"></i></a>
				</c:if>				
			</div>
		</div>
		<main class="main margin-top padding-side" style="    padding: 50.4px 0.1em;">
			<div class="panel panel-info" style="border-radius: 0px;">				
				<ul class="list-group  panel-body padding0" id="result_list"></ul>
			</div>
		</main>	
	<c:import url="public/public_footer.jsp"></c:import>
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
					console.log(obj);
					if (obj.state == 0) {
						layer.msg(obj.message,{icon:2,time:1000});
						return;
					}else{
						var result = "";
						console.log(obj.data);
						for(var i=0;i<obj.data.length;i++){
							result +='<li class="public_list_li">'+
									'<a href="${pageContext.request.contextPath}/wap_public_uintdetail?unitid='+obj.data[i].unitId+'">'+
									'<div class="">'+
									'<h5 class="fonwei public_list_h5">'+obj.data[i].unitName+'</h5>'+							
									'<div class="text-muted bfrifRow" style="    padding: 7px 0px 7px 17px;">'+
									'<img alt="" src="${pageContext.request.contextPath}/static/images/bks_wap/qylx.png" style="width: 20px;">企业类型:';
									if(obj.data[i].unitType == 1){
										result += '<span>监管局</span>';
									}
									if(obj.data[i].unitType == 2){
										result += '<span>学校</span>';
									}
									if(obj.data[i].unitType == 3){
										result += '<span>餐饮</span>';
									}
									if(obj.data[i].unitType == 4){
										result += '<span>其它</span>';
									}																
							 result +='</div></div>'+
										'<div class="fb" >'+
										'<div class="text-muted bfrifRow"style="    padding: 0px 0px 7px 17px;">'+
										'<img alt="" src="${pageContext.request.contextPath}/static/images/bks_wap/frdb.png" style="width: 20px;">法人代表:'+								
										'<span>'+obj.data[i].legalPerson+'</span>'+
										'</div>'+
										'<a href="${pageContext.request.contextPath}/wap_public_uintdetail?unitid='+obj.data[i].unitId+'">'+
										'<img alt="" src="${pageContext.request.contextPath}/static/images/bks_wap/public_xq.png" style="width: 40px;margin-top: -15px;"></a>'+							
										'</div></a></li>';																			
						}
						$("#result_list").html(result);							
					}		
				}
			});
		}
	}); 
	</script>
</html>
