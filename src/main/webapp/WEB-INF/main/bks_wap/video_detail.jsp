<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<meta name="viewport"	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<title>监控视频列表</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
<link href="${pageContext.request.contextPath}/static/css/bks_wap/video-js.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/bks_wap/video.css" rel="stylesheet">
<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/video/video.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/video/videojs-contrib-hls.min.js"></script>

</head>
<body class="video_bodydetail">	
	<div class="m" style="text-align: center;padding-bottom: 4em;">
		<c:forEach items="${videoAddressList}" var="item" varStatus="vs">
			<div class="video_div" style="display: inline-block;">
				<c:if test="${vs.index==0}">
					<h4 style="font-size: 20px;font-weight: 600;padding: 25px 0 0 0; text-align: center" >${item.unitName}</h4>
				</c:if>
				<p>位置：<span>${item.cameraPosition}</span></p>
			    <video id="my-video${item.videoId}" class="video-js" controls preload="auto" width="340" height="200" poster="m.jpg" data-setup="{}">      	
			    	<source src="${item.videoAddress}" type="application/x-mpegURL">
			        <p class="vjs-no-js"> 111 <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a> </p>
			    </video>
			</div>			          
	     </c:forEach>     
    </div>
	<c:import url="public/footer.jsp"></c:import>
</body>
<script src="${pageContext.request.contextPath}/static/js/bks_wap/video.min.js"></script> 
      <script type="text/javascript">
		  //设置中文
		  videojs.addLanguage('zh-CN', {
			  "Play": "播放",
			  "Pause": "暂停",
			  "Current Time": "当前时间",
			  "Duration": "时长",
			  "Remaining Time": "剩余时间",
			  "Stream Type": "媒体流类型",
			  "LIVE": "直播",
			  "Loaded": "加载完毕",
			  "Progress": "进度",
			  "Fullscreen": "全屏",
			  "Non-Fullscreen": "退出全屏",
			  "Mute": "静音",
			  "Unmute": "取消静音",
			  "Playback Rate": "播放速度",
			  "Subtitles": "字幕",
			  "subtitles off": "关闭字幕",
			  "Captions": "内嵌字幕",
			  "captions off": "关闭内嵌字幕",
			  "Chapters": "节目段落",
			  "Close Modal Dialog": "关闭弹窗",
			  "Descriptions": "描述",
			  "descriptions off": "关闭描述",
			  "Audio Track": "音轨",
			  "You aborted the media playback": "视频播放被终止",
			  "A network error caused the media download to fail part-way.": "网络错误导致视频下载中途失败。",
			  "The media could not be loaded, either because the server or network failed or because the format is not supported.": "视频因格式不支持或者服务器或网络的问题无法加载。",
			  "The media playback was aborted due to a corruption problem or because the media used features your browser did not support.": "由于视频文件损坏或是该视频使用了你的浏览器不支持的功能，播放终止。",
			  "No compatible source was found for this media.": "无法找到此视频兼容的源。",
			  "The media is encrypted and we do not have the keys to decrypt it.": "视频已加密，无法解密。",
			  "Play Video": "播放视频",
			  "Close": "关闭",
			  "Modal Window": "弹窗",
			  "This is a modal window": "这是一个弹窗",
			  "This modal can be closed by pressing the Escape key or activating the close button.": "可以按ESC按键或启用关闭按钮来关闭此弹窗。",
			  ", opens captions settings dialog": ", 开启标题设置弹窗",
			  ", opens subtitles settings dialog": ", 开启字幕设置弹窗",
			  ", opens descriptions settings dialog": ", 开启描述设置弹窗",
			  ", selected": ", 选择",
			  "captions settings": "字幕设定",
			  "Audio Player": "音频播放器",
			  "Video Player": "视频播放器",
			  "Replay": "重播",
			  "Progress Bar": "进度小节",
			  "Volume Level": "音量",
			  "subtitles settings": "字幕设定",
			  "descriptions settings": "描述设定",
			  "Text": "文字",
			  "White": "白",
			  "Black": "黑",
			  "Red": "红",
			  "Green": "绿",
			  "Blue": "蓝",
			  "Yellow": "黄",
			  "Magenta": "紫红",
			  "Cyan": "青",
			  "Background": "背景",
			  "Window": "视窗",
			  "Transparent": "透明",
			  "Semi-Transparent": "半透明",
			  "Opaque": "不透明",
			  "Font Size": "字体尺寸",
			  "Text Edge Style": "字体边缘样式",
			  "None": "无",
			  "Raised": "浮雕",
			  "Depressed": "压低",
			  "Uniform": "均匀",
			  "Dropshadow": "下阴影",
			  "Font Family": "字体库",
			  "Proportional Sans-Serif": "比例无细体",
			  "Monospace Sans-Serif": "单间隔无细体",
			  "Proportional Serif": "比例细体",
			  "Monospace Serif": "单间隔细体",
			  "Casual": "舒适",
			  "Script": "手写体",
			  "Small Caps": "小型大写字体",
			  "Reset": "重启",
			  "restore all settings to the default values": "恢复全部设定至预设值",
			  "Done": "完成",
			  "Caption Settings Dialog": "字幕设定视窗",
			  "Beginning of dialog window. Escape will cancel and close the window.": "开始对话视窗。离开会取消及关闭视窗",
			  "End of dialog window.": "结束对话视窗"
			});
		  
		  $('video').each (function () {
			  var myPlayer = videojs($(this).id);
				videojs($(this).id).ready(function(){
					var myPlayer = this;
					myPlayer.play();
				});
			});			
		</script> 
</body>
</html>
