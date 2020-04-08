<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<title>后台用户浏览页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/nav_all.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/Hui-iconfont/1.0.8/iconfont.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery_table/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
<body >
		<div id="menu_update">
			<table width="100%" border="2" cellspacing="1" cellpadding="4" bgcolor="#cccccc" class="tabtop13" align="center">
				<tr>
			    	<td width="30%" class="btbg font-center" >权限ID</td><td><input type="text" id=authorizationId readonly="readonly" value="${authorizationDetail.authorizationId}"></td>
			    <tr>
			    </tr>
			    	<td width="30%" class="btbg font-center">权限名称</td><td><input type="text" id="authorizationName" value="${authorizationDetail.authorizationName}"></td>
			    </tr>
			    <%-- <tr>
			    	<td width="30%" class="btbg font-center">权限值</td><td><input readonly="readonly" type="text" id="authorizationContent" value="${authorizationDetail.authorizationContent}"></td>
			    </tr> --%>
			    <tr>
			    	<td width="30%" class="btbg font-center">权限备注</td><td><input type="text" id="authorizationRemark" value="${authorizationDetail.authorizationRemark}"></td>	
			    </tr>
			    <tr>
			    	<td width="18%" class="btbg font-center" colspan="2" align="center"><button type="button" class="btn btn-default" onclick="update()"><i class="fa fa-edit"/>提交</button></td>
			    </tr>
		</table>
	</div>
</body>

<script type="text/javascript">
	function update(){
		var data = "authorizationId=" + $("#authorizationId").val() + "&authorizationName=" + $("#authorizationName").val() + "&authorizationRemark=" + $("#authorizationRemark").val();
		console.log(data);
		var url = "${pageContext.request.contextPath}/web_auth/authorization_update";
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
</html>
