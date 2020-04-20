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
		// Highlight a row when selected
		$("#example-basic tbody").on("mousedown", "tr", function() {
			$(".selected").not(this).removeClass("selected");
			$(this).toggleClass("selected");
		});
		$("#example-basic input[type=checkbox]").click(function(e) {
			checkboxClickFn(this);
		});
	});
	function checkboxClickFn(_this, autoFlag, parentSelectedFlag) {
		var checked = $(_this).attr("checked");
		var menuId = $(_this).parent().parent().attr("data-tt-id");
		var parentMenuId = $(_this).parent().parent().attr("data-tt-parent-id");
		var childCount = $("#example-basic").find(
				"[data-tt-parent-id='" + menuId + "']").find(
				"input[type=checkbox]").length;
		if (autoFlag) {//自动触发
			if (parentSelectedFlag) {//如果是需要选中其父节点
				//将其直接的父节点置为选中状态
				$("#example-basic").find("[data-tt-id='" + parentMenuId + "']")
						.find("input[type=checkbox]").each(
								function() {
									$(this).attr("checked", true).prop(
											"checked", true);
									if (parentMenuId == "0") {
										return;//已经到根节点，直接返回
									}
									//自动将该节点的父节点的父节点选中
									checkboxClickFn(this, true, true);
								});
				return;
			}
			if (checked) {//如果是已经选中，则其子菜单全部选中
				if (childCount == 0) {
					return;
				}
				$("#example-basic")
						.find("[data-tt-parent-id='" + menuId + "']").find(
								"input[type=checkbox]").each(
								function() {
									$(this).attr("checked", true).prop(
											"checked", true);
									checkboxClickFn(this, true);
								});
			} else {//如果是取消选中，则其子菜单全部取消选中
				if (childCount == 0) {
					return;
				}
				$("#example-basic")
						.find("[data-tt-parent-id='" + menuId + "']").find(
								"input[type=checkbox]").each(
								function() {
									$(this).prop("checked", false).removeAttr(
											"checked");
									checkboxClickFn(this, true);
								});
			}
			return;
		}
		//手动触发
		if (!checked) {
			$(_this).attr("checked", true);
			$(_this).prop("checked", true);
			//将其直接的父节点置为选中状态
			if (menuId != "0") {//选中的不是根节点
				$("#example-basic").find("[data-tt-id='" + parentMenuId + "']")
						.find("input[type=checkbox]").each(
								function() {
									$(this).attr("checked", true).prop(
											"checked", true);
									//自动将该节点的父节点的父节点选中
									checkboxClickFn(this, true, true);
								});
			}
			if (childCount == 0) {
				return;
			}
			$("#example-basic").find("[data-tt-parent-id='" + menuId + "']")
					.find("input[type=checkbox]").each(function() {
						$(this).attr("checked", true).prop("checked", true);
						checkboxClickFn(this, true);
					});
		} else {
			$(_this).prop("checked", false).removeAttr("checked");
			if (childCount == 0) {
				return;
			}
			$("#example-basic").find("[data-tt-parent-id='" + menuId + "']")
					.find("input[type=checkbox]").each(function() {
						$(this).prop("checked", false).removeAttr("checked");
						checkboxClickFn(this, true);
					});
		}
	}
</script>
</head>
<body>
	<div>
		<input type="button" onclick="getCheckstrt()" class="menu_input" value="保存权限">
		<table id="example-basic" class="treetable">
			<thead>
				<tr>
					<th style="text-align: center;font-size:18px;color: #ffffff;">权限名称</th>
					<th style="text-align: center;font-size:18px;color: #ffffff;">权限值</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="c">
					<c:set var="counttt" value="2" />
					<c:if test="${adminAuthority != null}">
						<c:forEach items="${adminAuthority}" var="ad">
							<c:if test="${c.authority eq ad}">
								<tr data-tt-id="${c.menuId}" data-tt-parent-id="${c.parentId}" style="color: #ffffff">
									<c:if	test="${Authority!=null}">										
											<td><span style="padding-left: 0px;"></span>
												<c:forEach items="${Authority}" var="f" varStatus="status">										
													<c:if test="${c.authority eq f}">
														<input type="checkbox" name="${c.parentId}"	value="${c.authority}" checked="checked" />${c.menuName}
														<c:set var="counttt" value="${counttt+1 }" />
													</c:if>
													<c:if test="${status.last && counttt==2}">
														<input type="checkbox" name="${c.parentId}"	value="${c.authority}" />${c.menuName} 
													</c:if>	
												</c:forEach>												
											</td>
											<td>${c.authority}</td>										
									</c:if>
									<c:if test="${Authority==null}">
										<td><span style="padding-left: 0px;"></span>								
											<input type="checkbox" name="${c.parentId}"	value="${c.authority}" />${c.menuName}
										</td>
										<td>${c.authority}</td>
									</c:if>									
								</tr>
							</c:if>
						</c:forEach>					
					</c:if>
					<c:if test="${adminAuthority == null}">
						<tr data-tt-id="${c.menuId}" data-tt-parent-id="${c.parentId}">
							<td><span style="padding-left: 0px;"></span> 
								<c:if	test="${Authority!=null}">
									<c:forEach items="${Authority}" var="f" varStatus="status">
										<c:if test="${c.authority eq f}">
											<input type="checkbox" name="${c.parentId}"	value="${c.authority}" checked="checked" />${c.menuName}
											<c:set var="counttt" value="${counttt+1 }" />
										</c:if>
										<c:if test="${status.last && counttt==2}">
											<input type="checkbox" name="${c.parentId}"	value="${c.authority}" />${c.menuName} 
										</c:if>
									</c:forEach>
								</c:if> 
								<c:if test="${Authority==null}">								
									<input type="checkbox" name="${c.parentId}"	value="${c.authority}" />${c.menuName}
								</c:if>
							</td>
							<td>${c.authority}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
<script type="text/javascript">
	function getCheckstrt() {
		var authorizationContent = ""
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
		} 
	}
</script>
</html>
