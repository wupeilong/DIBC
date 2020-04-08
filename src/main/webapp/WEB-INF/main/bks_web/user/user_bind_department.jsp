<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单权限</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/menu_authority.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/jquery.treetable.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/jquery.treetable.theme.default.css" />
<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/jquery_table/jquery.treetable.js"></script> 
<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/H-ui.admin.js"></script>
<style type="text/css">
.menu_input{
    width: 100%;
    height: 35px;
    background: #2967ba;
    font-size: 24px;
    font-family: lisu;
    color: #ffffff;
    position: fixed;
    top: 0;
    border: 0;
    cursor: pointer;
}
.menu_input:HOVER {
	 background: #2967ba;
}
</style>
<script type="text/javascript">
	$(function() {
		// initialize treeTable
		$("#example-basic").treetable({
			expandable : true,
			initialState : "expanded",
			//expandable : true
			clickableNodeNames : false,//点击节点名称也打开子节点.
			indent : 30
		//每个分支缩进的像素数。
		});
	});	
</script>
</head>
<body>
	<div>
		<input type="button" onclick="getCheckstrt()" class="menu_input" value="保存设置">
		<table id="example-basic" class="treetable">
			<thead>
				<tr>
					<th style="text-align: center;font-size:18px;color: #ffffff;">部门名称</th>
					<!-- <th style="text-align: center;font-size:18px;color: #ffffff;">部门描述</th> -->
				</tr>
			</thead>
			<tbody>
<<<<<<< HEAD
				<c:forEach items="${list}" var="c">
					<c:set var="counttt" value="2" />
						<tr data-tt-id="${c.departmentId}" data-tt-parent-id="${c.departmentParentId}">
							<td><span style="padding-left: 0px;"></span>
									<input type="radio" name="name" value="${c.departmentId}" />${c.departmentName}
							</td>
							<%-- <td>${c.departmentDescription}</td> --%>
						</tr>					
=======
				<c:forEach items="${list}" var="c" varStatus="rr">
					<c:set var="counttt" value="2" />					
					<c:if test="${!rr.last}">
						<c:if test="${c.departmentId == list[rr.count].departmentParentId}">
							<tr data-tt-id="${c.departmentId}" data-tt-parent-id="${c.departmentParentId}">
								<td><span style="padding-left: 0px;"></span>
									${c.departmentName} 
								</td>
								<td>${c.departmentDescription}</td>
							</tr>		
						</c:if>
						<c:if test="${c.departmentId != list[rr.count].departmentParentId}">
							<tr data-tt-id="${c.departmentId}" data-tt-parent-id="${c.departmentParentId}">
								<td><span style="padding-left: 0px;"></span>
										<input type="radio" name="33"	value="${c.departmentId}" />${c.departmentName}
								</td>
								<td>${c.departmentDescription}</td>
							</tr>		
						</c:if>
					</c:if> 									
>>>>>>> branch 'master' of https://github.com/wupeilong/DIBC.git
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
<script type="text/javascript">
	function getCheckstrt() {
		/* var authorizationContent = ""
		var authorizationId = "${authorizationId}";
		var len = $('input[type="checkbox"]:checked').length;
		$('input[type="checkbox"]:checked').each(function(index, dom) {
			if (index < len - 1) {
				authorizationContent += $(this).val() + ";";
			} else {
				authorizationContent += $(this).val();
			}
		});
		console.log(authorizationContent);
		if (authorizationId != "") {
			$.ajax({
				"url" : "authorization_update",
				"data" : "authorizationId=" + authorizationId + "&authorizationContent=" + authorizationContent,
				"type" : "POST",
				"dataType" : "json",
				"success" : function(obj) {
					if (obj.state == 0) {
						layer.msg(obj.message, {
							icon : 2,
							time : 1000
						});
						return;
					} else {
						layer.msg(obj.message, {
							icon : 1,
							time : 1000
						}, function() {
							location.replace(location.href);
						});
					}
				}
			});
		}  */
	}
</script>
</html>
