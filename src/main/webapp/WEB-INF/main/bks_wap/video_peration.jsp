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
			cellpadding="">
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
						<td style="text-align: cnter">
							<button id="address_update"  unitid=${item.videoId} type="button" onclick="addressUpdate(this)">修改</button>
							<button id="address_delete" unitid=${item.videoId}  onclick="addressDelete()">删除</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<div style="display: none;" id="update_content">
		<table width="100%" border="2" cellspacing="1" cellpadding="4"
			bgcolor="#cccccc" class="tabtop13" align="center">
			</tr>
			<td width="70%" class="btbg font-center">企业名称</td>
			<td><input type="text" name="top_menu_name" value=""></td>
			</tr>
			<tr>
				<td width="70%" class="btbg font-center">监控位置</td>
				<td><input type="text" name="top_menu_url" value=""></td>
			</tr>
			<tr>
				<td width="70%" class="btbg font-center">视频流地址</td>
				<td><input type="text" name="top_menu_icon" value=""></td>
			</tr>
			<tr>
				<td width="70%" class="btbg font-center">监控类型</td>
				<td>
				<select id="top_is_menu">
						<option value="1">实时监控</option>
						<option value="2">视频回放</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="70%" class="btbg font-center">视频流类型</td>
				<td>
				<select id="top_is_menu">
						<option value="1">RTMP</option>
						<option value="2">TRSP</option>
						<option value="2">FLV</option>
						<option value="2">HTTP</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="18%" class="btbg font-center" colspan="2" align="center">
				<button type="button" class="btn btn-default" onclick="修改()">
						<i class="fa fa-edit" />提交
				</button>
				</td>
			</tr>
		</table>
	</div>
	
	
	
	
	
	<button id="add_is_menu" type="button" onclick="add_is_menu()">asdasdasdas</button>
	<div style="display: none;" id="menu_add">
		<table width="100%" border="2" cellspacing="1" cellpadding="4"
			bgcolor="#cccccc" class="tabtop13" align="center">
			</tr>
			<td width="70%" class="btbg font-center">菜单名称</td>
			<td><input type="text" name="top_menu_name" value=""></td>
			</tr>
			<tr>
				<td width="70%" class="btbg font-center">响应路径</td>
				<td><input type="text" name="top_menu_url" value=""></td>
			</tr>
			<tr>
				<td width="70%" class="btbg font-center">菜单图标</td>
				<td><input type="text" name="top_menu_icon" value=""></td>
			</tr>
			<tr>
				<td width="70%" class="btbg font-center">权限值</td>
				<td><input type="text" name="top_menu_authority" value=""></td>
			</tr>
			<tr>
				<td width="70%" class="btbg font-center">菜单类型</td>
				<td><select id="top_is_menu">
						<option value="0">目 录</option>
						<option value="1">菜 单</option>
						<option value="2">按 钮</option>
				</select></td>
			</tr>
			<tr>
				<td width="18%" class="btbg font-center" colspan="2" align="center"><button
						type="button" class="btn btn-default" onclick="add_top()">
						<i class="fa fa-edit" />提交
					</button></td>
			</tr>
		</table>
	</div>
	<c:import url="public/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	function add_is_menu() {
		layer.open({
			type : 1,
			content : $('#menu_add')
		});
	}
	
	function addressUpdate(e) {
		var id=e.getAttribute("unitid");
		alert(id);
		layer.open({
			type : 1,
			content : $('#update_content')
		});
	}
	
	function addressDelete(e) {
		var id=e.getAttribute("unitid");
		
		$.ajax({
			"url" : url,
			"data" : data,
			"type" : "POST",
			"dataType" : "json",
			"success" : function(obj) {
				if (obj.state == 0) {
					layer.msg(obj.message,{icon:2,time:1000});						
				}else{
					layer.msg(obj.message,{icon:1,time:1000},function(){location.reload()});											
				}					
			}
		}); 
	}
</script>

</body>
</html>
