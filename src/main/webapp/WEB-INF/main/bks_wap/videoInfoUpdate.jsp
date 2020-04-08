<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<title>采购信息添加</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/index.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/js/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/ajaxfileupload.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/bks_wap/rolldate.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>
<style type="text/css">
.table>tbody>tr>td {
	padding: 0;
}
</style>
</head>
<body class="contain">
	<div class="navigation bg-primary">
		<div class="fb padding-side">
			<a href="javascript:history.go(-1)" class="text-white"><i
				class="fa fa-angle-left"></i></a>
		</div>
	</div>
	<main class="main margin-top padding-side05">
	<form action="" method="post" class="padding-side login_formc">
		<fieldset>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">企业名称</span>
				<div class="form-control box-shadow0 border0">${videoInfo.unitName }</div>
				<div class="form-control box-shadow0 border0" style="display: none">
					<input id="videoId" type="text"
					class="form-control box-shadow0 border-bottom" id="supplierPerson"
					value="${videoInfo.videoId }">
				
				</div>
			</div>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">监控位置</span>
				<!-- <input type="text" class="form-control box-shadow0 border-bottom" id="supplierPerson" placeholder="请输入监控位置"> -->
				<input id="cameraPosition" type="text"
					class="form-control box-shadow0 border-bottom" id="supplierPerson"
					value="${videoInfo.cameraPosition}">
			</div>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">视频流地址</span>
				<input id="videoAddress" type="text"
					class="form-control box-shadow0 border-bottom" id="supplierPerson"
					value="${videoInfo.videoAddress}">
			</div>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">监控类型</span>
				<select id="videoType" name="videoType" style="height: 28px;">
					<option value="0">请选择监控类型</option>
					<option value="1"
						<c:if test="${videoInfo.videoType==1}">selected</c:if>>实时监控</option>
					<option value="2"
						<c:if test="${videoInfo.videoType==2}">selected</c:if>>视频回放</option>
				</select>
			</div>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">视频流类型</span>
				<select id="streamType" name="streamType" style="height: 28px;">
					<option value="0">请选择视频类型</option>
					<option value="1"
						<c:if test="${videoInfo.streamType==1}">selected</c:if>>RTMP</option>
					<option value="2"
						<c:if test="${videoInfo.streamType==2}">selected</c:if>>TRSP</option>
					<option value="3"
						<c:if test="${videoInfo.streamType==3}">selected</c:if>>FLV</option>
					<option value="4"
						<c:if test="${videoInfo.streamType==4}">selected</c:if>>HTTP</option>
				</select>
			</div>
		</fieldset>
	</form>
	<div class="margin-top2 margin-bot2">
		<button type="button" class="btn btn-primary form-control" id="add">提交</button>
	</div>
	</main>
	<c:import url="public/footer.jsp"></c:import>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
<script type="text/javascript">
					$('select').searchableSelect();
					
					
					$("#add").click(function() {
						var cameraPosition= $("#cameraPosition").val();
						var videoAddress= $("#videoAddress").val();
						var videoType= $("#videoType").val();
						var streamType= $("#streamType").val();
						var videoId=$("#videoId").val();
						var obj = {'unitName':'','videoId':videoId,'streamType':streamType,'videoType':videoType,'videoAddress':videoAddress,'cameraPosition':cameraPosition};
						console.log(obj);
						 $.ajax({
							 url: "${pageContext.request.contextPath}/wap_video/wap_videosave",
					          type: 'POST',
					          data: obj,
					          /* contentType : 'application/json', z这种形式data必须是json字符串*/
					          dataType: 'json',
								"success" : function(result) {	
									/* console.log(result);
									layer.close(result); */
									if (result.state == 0) {											
										layer.msg(result.message,{icon:1,time:1000},function(){self.location=document.referrer;});
										return;				
									}else{		
										//返回上级并刷新
										layer.msg(result.message,{icon:1,time:1000},function(){self.location=document.referrer});
										//延时刷新页面																	 
										/* location.href = "${pageContext.request.contextPath}/wap_pro/buy_list"; */							
									}
									
								}
							}); 
						
						
					}
					);
</script>
</html>
