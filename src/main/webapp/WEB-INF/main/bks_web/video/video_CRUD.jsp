<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<title>监控视频列表</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/index.css" />
<link
	href="${pageContext.request.contextPath}/static/css/bks_wap/video-js.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/static/css/bks_wap/video.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/video/video.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/video/videojs-contrib-hls.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/static/js/layui/layui.js" /></script>
</head>
<body class="video_bodydetail" style="text-align: cnter">


	<div class="m" style="text-align: center; padding-bottom: 4em;">
	
		<table class="table table-striped table-hover" cellspacing=""
			style="text-align: center"
			cellpadding="">
			<thead>
				<tr style="text-align: cnter">
					<th style="text-align: cnter">序号</th>
					<th style="text-align: cnter">企业名称</th>
					<th style="text-align: cnter">监控位置</th>
					<th style="text-align: cnter">视频流地址</th>
					<th style="text-align: cnter">监控类型</th>
					<th style="text-align: cnter">视频流类型</th>
					<th style="text-align: cnter">操作</th>
				</tr>
			</thead>
			<h4 style="font-size: 20px; font-weight: 600; padding: 25px 0 0 0;">贵州指上通科技有限责任公司</h4>
			
			<div style="width: 100%;margin-top: 50px;margin-bottom: 50px">
			<span class="">监控位置:</span>
			<input id="cameraPosition" type="text" class="inputClass" id="supplierPerson" > 
			<input id="unitId" type="text" style="display: none" value="${unitid}">
			<span class="VideoAddClass">视频流地址:</span> 
			<input id="videoAddress" type="text" class="inputClass" > 
			<span class="VideoAddClass">监控类型:</span> 
			<select id="videoType"
				name="videoType" style="height: 28px;">
				<option value="0">请选择监控类型</option>
				<option value="1">实时监控</option>
				<option value="2">视频回放</option>
			</select> 
			<span class="VideoAddClass">视频流类型:</span> 
			<select id="streamType"
				name="streamType" style="height: 28px;">
				<option value="0">请选择视频类型</option>
				<option value="1">RTMP</option>
				<option value="2">TRSP</option>
				<option value="3">FLV</option>
				<option value="4">HTTP</option>
			</select>
			<button id="addressAdd" type="button"" class="addClass">增加</button>
		</div>
			
			
			<tbody id="result_list">
				<c:forEach items="${videoAddressList}" var="item" varStatus="vs">
					
					<tr>
						<td style="text-align: cnter">${vs.count}</td>
						<td style="text-align: cnter">${item.unitName}</td>
						<td style="text-align: cnter">${item.cameraPosition}</td>
						<td style="text-align: cnter">${item.videoAddress}</td>
						<td style="text-align: cnter"><c:if
								test="${item.videoType==1}">实时监控</c:if> <c:if
								test="${item.videoType==2}">视频回放</c:if></td>
						<td style="text-align: cnter">${item.streamType}</td>
						<td style="text-align: cnter">
							<button id="address_update" videoId=${item.videoId}  class="modifyClass"><a href="${pageContext.request.contextPath}/web_video/updateVideoInfo?unitId=${item.unitId}&videoId=${item.videoId}">修改</a></button>
							<button id="address_delete" videoId=${item.videoId}  class="deleteClass" onclick="addressDelete(this)">删除</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:import url="public/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	$("#addressAdd").click(function() {
		var unitId = $("#unitId").val()
		var cameraPosition = $("#cameraPosition").val();
		var videoAddress = $("#videoAddress").val();
		var videoType = $("#videoType").val();
		var streamType = $("#streamType").val();
		var obj = {
			'unitId' : unitId,
			'unitName' : '',
			'streamType' : streamType,
			'videoType' : videoType,
			'videoAddress' : videoAddress,
			'cameraPosition' : cameraPosition
		};
		
		if(cameraPosition==""){
			layer.msg("请录入监控位置",{
				icon : 2,
				time : 1000
			},function(){
				$("#cameraPosition").focus()
			});
			
			return;
		}
		if(videoAddress==""){
			layer.msg("请录入视频流地址",{
				icon : 2,
				time : 1000
			},function(){
				$("#videoAddress").focus()
			});
			
			return;
		}
		if(videoType==0){
			layer.msg("请录监控类型",{
				icon : 2,
				time : 1000
			},function(){
				$("#videoType").focus()
			});
			
			return;
		}
		if(streamType==0){
			layer.msg("请录入视频流类型",{
				icon : 2,
				time : 1000
			},function(){
				$("#streamType").focus()
			});
			
			return;
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/web_video/web_videosave",
			type : 'POST',
			data : obj,
			/* contentType : 'application/json', z这种形式data必须是json字符串*/
			dataType : 'json',
			"success" : function(result) {
				/* console.log(result);
				layer.close(result); */
				if (result.state == 0) {
					layer.msg(obj.message, {
						icon : 2,
						time : 1000
					}, function() {
						location.reload()
					});
					return;
				} else {
					layer.msg("操作成功", {
						icon : 1,
						time : 1000
					}, function() {
						location.reload()
					});
				}

			}
		});

	});

	function addressDelete(e) {
		
		 layer.confirm("你确定删除吗？", {btn: ['确定', '取消'], title:'提示'},function(index){
			 var id = e.getAttribute("videoId"); 
				console.log(id+"***************************")
				var url = "${pageContext.request.contextPath}/web_video/web_videodelete";
				var data = "videoId=" + id;
				$.ajax({
					"url" : url,
					"data" : data,
					"type" : "POST",
					"dataType" : "json",
					"success" : function(obj) {
						layer.msg(obj.message, {
							icon : 1,
							time : 1000
						}, function() {
							location.reload()
						});

					}
				});

			 
		 });

		
	}
</script>
<style>
.VideoAddClass {
	margin-left: 93px
}
.addClass{
	width: 98px;
    margin-left: 22px;
    background-color: #FFEB3B;
    border-radius: 4px;
}
.modifyClass{
}
.deleteClass{
	width: 60px;
    margin-left: 10px;
    background-color: #FF5722;
    border-radius: 4px;
}
th {
    text-align: center;
}
.inputClass{


}
</style>

</body>
</html>
