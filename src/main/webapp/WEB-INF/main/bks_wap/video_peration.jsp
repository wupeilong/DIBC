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

</head>
<body class="video_bodydetail" style="text-align: cnter">
	<div class="m" style="text-align: center; padding-bottom: 4em;">


		<table class="table table-striped table-hover" cellspacing=""
			cellpadding="" >
			<thead style="text-align: cnter">
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
			<tbody id="result_list">
				<c:forEach items="${videoAddressList}" var="item" varStatus="vs">
					<c:if test="${vs.index==0}">
						<h4
							style="font-size: 20px; font-weight: 600; padding: 25px 0 0 0;">贵州指上通科技有限责任公司</h4>
					</c:if>
					<tr>
						<td style="text-align: cnter">${vs.count}</td>
						<td style="text-align: cnter">${item.unitName}</td>
						<td style="text-align: cnter">${item.cameraPosition}</td>
						<td style="text-align: cnter">${item.videoAddress}</td>
						<td style="text-align: cnter">${item.videoType}</td>
						<td style="text-align: cnter">${item.streamType}</td>
						<td style="text-align: cnter"><a>删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>




	</div>
	<c:import url="public/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	
</script>

</body>
</html>
