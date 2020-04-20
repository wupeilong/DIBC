<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>云监食安系统管理后台首页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layer/2.4/skin/layer.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/common.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/style.css"/>
	<script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/js/layui/layui.js"/></script>
</head>
<body>
	<div>
		<table width="60%" border="0" cellspacing="1" cellpadding="4" bgcolor="#cccccc" class="tabtop13" align="center">
			<thead>
				<tr>
			    <th width="8%" class="btbg font-center">菜单ID</th>
			    <th width="8%" class="btbg font-center">菜单名称</th>
			    <th width="8%" class="btbg font-center">响应路径</th>
			    <th width="8%" class="btbg font-center">菜单图标</th>
			    <th width="8%" class="btbg font-center">权限值</th>
			    <th width="8%" class="btbg font-center">菜单类型</th>
			    <th width="8%" class="btbg font-center">父节点ID</th>
			    <td width="8%" class="btbg font-center" >删除</td>
			    <td width="8%" class="btbg font-center">编辑</td>
			    <td width="8%" class="btbg font-center">新增</td>			     
			  </tr>
			</thead>
		  	<tbody>
		  		<c:forEach items="${menuList}" var="item">
		  			<tr>
					    <td name="menuId">${item.menuId}</td>
					    <td name="menuName">${item.menuName}</td>
					    <td name="menuUrl">${item.menuUrl}</td>
					    <td name="menuIcon">${item.menuIcon}</td>
					    <td name="authority">${item.authority}</td>
					    <c:if test="${item.isMenu == 0}">
					    	<td name="isMenu" isMenu="${item.isMenu}">目录</td>
					    </c:if>
					    <c:if test="${item.isMenu == 1}">
					    	<td name="isMenu" isMenu="${item.isMenu}">菜单</td>
					    </c:if>
					    <c:if test="${item.isMenu == 2}">
					    	<td name="isMenu" isMenu="${item.isMenu}">按钮</td>
					    </c:if>
					    <td name="parentId">${item.parentId}</td>
					    <td><button type="button" class="btn btn-default" onclick="delete_menu(this)"><i class="fa fa-trash"/></button></td>
					    <td><button type="button" class="btn btn-default" onclick="update_menu(this)"><i class="fa fa-edit"/></button></td>
					    <td><button type="button" class="btn btn-default" onclick="add_menu(this)" ><i class="fa fa-plus-circle"/></button><td>	   
			  		</tr>
		  		</c:forEach>
		  	</tbody>	  	
		</table>
	</div>
	<button type="button" class="btn btn-default" onclick="add_top_menu()" >添加顶级菜单</button>   
	<div style="display:none;" id="menu_update">
		<table width="100%" border="2" cellspacing="1" cellpadding="4" bgcolor="#cccccc" class="tabtop13" align="center">
				<tr>
			    	<td width="70%" class="btbg font-center" >菜单ID</td><td ><input type="text" name="menu_id" readonly="readonly" value=""></td>
			    <tr>
			    </tr>
			    	<td width="70%" class="btbg font-center">菜单名称</td><td><input type="text" name="menu_name" value=""></td>
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">响应路径</td><td><input type="text" name="menu_url" value=""></td>
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">菜单图标</td><td><input type="text" name="menu_icon" value=""></td>	
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">权限值</td><td><input type="text" name="menu_authority" value=""></td>
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">菜单类型</td>
			    	<td>
			    		<select id="is_menu">
							<option value="0">目 录</option>
							<option value="1">菜 单</option>
							<option value="2">按 钮</option>			
						</select>
			    	</td>   
			    </tr>		    
			    <tr>
			    	<td width="18%" class="btbg font-center" colspan="2" align="center"><button type="button" class="btn btn-default" onclick="update()"><i class="fa fa-edit"/>提交</button></td>
			    </tr>
		</table>
	</div>
	<div style="display:none;" id="menu_add">
		<table width="100%" border="2" cellspacing="1" cellpadding="4" bgcolor="#cccccc" class="tabtop13" align="center">
				<tr>
			    	<td width="70%" class="btbg font-center" >父级菜单ID</td><td ><input type="text" name="parent_menu_id" readonly="readonly" value=""></td>
			    <tr>
			    <tr>
			    	<td width="70%" class="btbg font-center" >父级菜单名称</td><td ><input type="text" name="parent_menu_name" readonly="readonly" value=""></td>
			    <tr>				
			    </tr>
			    	<td width="70%" class="btbg font-center">菜单名称</td><td><input type="text" name="add_menu_name" value=""></td>
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">响应路径</td><td><input type="text" name="add_menu_url" value=""></td>
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">菜单图标</td><td><input type="text" name="add_menu_icon" value=""></td>	
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">权限值</td><td><input type="text" name="add_menu_authority" value=""></td>
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">菜单类型</td>
			    	<td>
			    		<select id="add_is_menu">
							<option value="0">目 录</option>
							<option value="1">菜 单</option>
							<option value="2">按 钮</option>			
						</select>
			    	</td>   
			    </tr>		    
			    <tr>
			    	<td width="18%" class="btbg font-center" colspan="2" align="center"><button type="button" class="btn btn-default" onclick="add()"><i class="fa fa-edit"/>提交</button></td>
			    </tr>
		</table>
	</div>
	<div style="display:none;" id="top_menu_add">
		<table width="100%" border="2" cellspacing="1" cellpadding="4" bgcolor="#cccccc" class="tabtop13" align="center">				
			    </tr>
			    	<td width="70%" class="btbg font-center">菜单名称</td><td><input type="text" name="top_menu_name" value=""></td>
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">响应路径</td><td><input type="text" name="top_menu_url" value=""></td>
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">菜单图标</td><td><input type="text" name="top_menu_icon" value=""></td>	
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">权限值</td><td><input type="text" name="top_menu_authority" value=""></td>
			    </tr>
			    <tr>
			    	<td width="70%" class="btbg font-center">菜单类型</td>
			    	<td>
			    		<select id="top_is_menu">
							<option value="0">目 录</option>
							<option value="1">菜 单</option>
							<option value="2">按 钮</option>	
						</select>
			    	</td>   
			    </tr>		    
			    <tr>
			    	<td width="18%" class="btbg font-center" colspan="2" align="center"><button type="button" class="btn btn-default" onclick="add_top()"><i class="fa fa-edit"/>提交</button></td>
			    </tr>
		</table>
	</div>
	<script type="text/javascript">
		
		function delete_menu(e){
			var menuId = $(e).parents("tr").find("td[name='menuId']").text();
			var url = "${pageContext.request.contextPath}/web_auth/menu_delete";
			var data = "menuId=" + menuId;
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
		function update_menu(e){
			var menuId = $(e).parents("tr").find("td[name='menuId']").text();
			var menuName = $(e).parents("tr").find("td[name='menuName']").text();
			var menuUrl = $(e).parents("tr").find("td[name='menuUrl']").text();
			var menuIcon = $(e).parents("tr").find("td[name='menuIcon']").text();
			var authority = $(e).parents("tr").find("td[name='authority']").text();
			var isMenu = $(e).parents("tr").find("td[name='isMenu']").attr('isMenu');
			//var parentId = $(e).parents("tr").find("td[name='parentId']").text();
			$("input[name=menu_id").val(menuId);
			$("input[name=menu_name").val(menuName);
			$("input[name=menu_url").val(menuUrl);
			$("input[name=menu_icon").val(menuIcon);
			$("input[name=menu_authority").val(authority);
			$("#is_menu").each(function(){
				console.log($(this).find("option").val());
				console.log($(this).find("option").eq(isMenu));
		        $(this).find("option").eq(isMenu).prop("selected",true);
		    });
		 	layer.open({
				type: 1,
				content: $('#menu_update')
			});
		}
		function update(){
			var menuId = $("input[name=menu_id").val();
			var menuName = $("input[name=menu_name").val();
			var menuUrl = $("input[name=menu_url").val();
			var menuIcon = $("input[name=menu_icon").val();
			var authority = $("input[name=menu_authority").val();
			var isMenu = $("#is_menu").val();
			console.log(isMenu);
			var url = "${pageContext.request.contextPath}/web_auth/menu_update";
			var data = "menuId=" + menuId + "&menuName=" + menuName + "&menuUrl=" + menuUrl
					 + "&menuIcon=" + menuIcon + "&authority=" + authority + "&isMenu=" + isMenu;
			console.log(data);
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
		function add_menu(e){
			var menuId = $(e).parents("tr").find("td[name='menuId']").text();
			var menuName = $(e).parents("tr").find("td[name='menuName']").text();
			var isMenu = $(e).parents("tr").find("td[name='isMenu']").attr('isMenu');
			$("input[name=parent_menu_id").val(menuId);
			$("input[name=parent_menu_name").val(menuName);
			var select = "";
			if(isMenu == 0){
				select = "<option value='0'>目 录</option><option value='1'>菜 单</option><option value='2'>按 钮</option>";
			}else if(isMenu == 1){
				select = "<option value='1'>菜 单</option><option value='2'>按 钮</option>";
			}else{
				select = "<option value='2'>按 钮</option>";
			}
			$("#add_is_menu").html(select);
			layer.open({
				type: 1,
				content: $('#menu_add')
			});
		}
		
		function add(){
			var parentId = $("input[name=parent_menu_id").val();
			var menuName = $("input[name=add_menu_name").val();
			var menuUrl = $("input[name=add_menu_url").val();
			var menuIcon = $("input[name=add_menu_icon").val();
			var authority = $("input[name=add_menu_authority").val();
			var isMenu = $("#add_is_menu").val();
			var url = "${pageContext.request.contextPath}/web_auth/menu_add";
			var data = "parentId=" + parentId + "&menuName=" + menuName + "&menuUrl=" + menuUrl
					 + "&menuIcon=" + menuIcon + "&authority=" + authority + "&isMenu=" + isMenu;
			console.log(data);
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
		
		function add_top_menu(){
			layer.open({
				type: 1,
				content: $('#top_menu_add')
			});
		}
		
		function add_top(){
			var menuName = $("input[name=add_menu_name").val();
			var menuUrl = $("input[name=add_menu_url").val();
			var menuIcon = $("input[name=add_menu_icon").val();
			var authority = $("input[name=add_menu_authority").val();
			var isMenu = $("#add_is_menu").val();
			var url = "${pageContext.request.contextPath}/web_auth/menu_add";
			var data = "&menuName=" + menuName + "&menuUrl=" + menuUrl + "&menuIcon=" 
					 + menuIcon + "&authority=" + authority + "&isMenu=" + isMenu;
			console.log(data);
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
        