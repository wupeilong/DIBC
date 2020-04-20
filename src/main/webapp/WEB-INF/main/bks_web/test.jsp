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
						<%-- <td style="text-align: cnter"><c:if
								test="${item.streamType==1}">RTMP</c:if> <c:if
								test="${item.streamType==2}">TRSP</c:if> <c:if
								test="${item.streamType==3}">FLV</c:if> <c:if
								test="${item.streamType==4}">HTTP</c:if></td>--%>
						<td style="text-align: cnter"> 
							<button id="address_update" videoId=${item.videoId}  class="modifyClass"><a href="${pageContext.request.contextPath}/web_video/updateVideoInfo?unitId=${item.unitId}&videoId=${item.videoId}">修改</a></button>
							<button id="address_delete" videoId=${item.videoId}  class="deleteClass" onclick="addressDelete(this)">删除</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<button type="button"  onclick="go()">sdfsdffs</button>
	<%-- <c:import url="public/footer.jsp"></c:import> --%>
	
	<table class="layui-hide" id="demo"></table>
	
</body>

<script type="text/javascript">

function go(){
	console.log("${videoAddressList.get(0)}");
}


layui.use('table', function(){
  var table = layui.table;
  
  //展示已知数据
  table.render({
    elem: '#demo'
    ,cols: [[ //标题栏
      {field: 'unitName', title: '用户名', width: 120}
      ,{field: 'cameraPosition', title: '邮箱', minWidth: 150}
      ,{field: 'videoAddress', title: '签名', minWidth: 160}
      ,{field: 'videoType', title: '性别', width: 80}
      ,{field: 'streamType', title: '城市', width: 100}
    ]]
    ,data:"${videoAddressList.get(0)}"
    //,skin: 'line' //表格风格
    ,even: true
    //,page: true //是否显示分页
    //,limits: [5, 7, 10]
    //,limit: 5 //每页默认显示的数量
  });
});

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
