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
<body>
	
		<div style="width: 200px;height: 200px">
			<video id="myvideo">
				<c:forEach items="${videoAddressList}" var="item" varStatus="vs">
					<span>${item.cameraPosition}</span>
					<source src="${item.videoAddress}" type="application/x-mpegURL">
				</c:forEach>
			</video>
		</div>
	
	<c:import url="public/footer.jsp"></c:import>
</body>
<script type="text/javascript">
	var player = videojs('myvideo');
		player.play();
</script>
</body>
</html>
