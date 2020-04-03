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
	<body class="contain" style="background-color: #eee;">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1);" class="text-white"><i class="fa fa-angle-left"></i></a>
				<!-- <a href="javascript:;" class="text-white"><i class="fa fa-list"></i></a> -->
			</div>
		</div>
		<main class="main padding-side05">
			<div class="">
				<div class="videos margin-bot">
					<video class="thumbnail margin0" id="video1" style="width: 100%;">
						<!-- preload="none" poster="img/banner.jpg" controls -->
						<source src="videos/CAMERAV.webm" type="video/mp4"></source>
						<source src="myvideo.ogv" type="video/ogg"></source>
						<source src="myvideo.webm" type="video/webm"></source>
						<object width="" height="" type="application/x-shockwave-flash" data="myvideo.swf">
							<param name="movie" value="myvideo.swf" />
							<param name="flashvars" value="autostart=true&amp;file=myvideo.swf" />
						</object>
						当前浏览器不支持 video直接播放，点击这里下载视频： <a href="myvideo.webm">下载视频</a>
					</video>
					<div class="text-right">
					    <button onclick="playPause()">播放/暂停</button>
						<button>标清/高清/流畅</button>
					</div>
					<script type="text/javascript">
						var myVideo=document.getElementById("video1"); 
						function playPause(){ 
							if (myVideo.paused) 
							  myVideo.play(); 
							else 
							  myVideo.pause(); 
						} 
					</script>
				</div>
				<div class="">
					<ul class="list-unstyled clearfix video-control">
						<li class="col-xs-4">
							<a href="">
								<i class="fa fa-2x fa-arrows-alt"></i>
								<div class="">全屏</div>
							</a>
						</li>
						<li class="col-xs-4">
							<a href="">
								<i class="fa fa-2x fa-image"></i>
								<div class="">抓图</div>
							</a>
						</li>
						<li class="col-xs-4">
							<a href="">
								<i class="fa fa-2x fa-video-camera"></i>
								<div class="">录像</div>
							</a>
						</li>
						<li class="col-xs-4">
							<a href="">
								<i class="fa fa-2x fa-stop"></i>
								<div class="">停止</div>
							</a>
						</li>
						<li class="col-xs-4">
							<a href="">
								<i class="fa fa-2x fa-backward"></i>
								<div class="">回放</div>
							</a>
						</li>
						<li class="col-xs-4">
							<a href="">
								<i class="fa fa-2x fa-bullhorn"></i>
								<div class="">喊话</div>
							</a>
						</li>
						<li class="col-xs-4">
							<a href="">
								<i class="fa fa-2x fa-volume-up"></i>
								<div class="">声音</div>
							</a>
						</li>
						<li class="col-xs-4">
							<a href="">
								<i class="fa fa-2x fa-cloud"></i>
								<div class="">云台</div>
							</a>
						</li>
						<li class="col-xs-4">
							<a href="">
								<i class="fa fa-2x fa-trash"></i>
								<div class="">移除</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</main>
		<div class="tabBar">
			<ul class="list-unstyled clearfix margin0">
				<li><a href="http://172.20.10.3:8848/wap_MCLZ/home.html"><div><i class="fa fa-home"></i><div>工作台</div></div></a></li>
				<li><a href=""><div><i class="fa fa-user"></i><div>个人中心</div></div></a></li>
			</ul>
		</div>
		<script type="text/javascript">
			eject_pic(".layui-upload-list");
			function eject_pic(el) {
				$(el).toggleClass("preview")
			}
		</script>
	</body>
</html>
