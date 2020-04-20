<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>部门信息页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_web/main_menus.css">
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/Hui-iconfont/1.0.8/iconfont.css" />
 	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bks_web/web_department.js"></script>
</head>
<body>

<div class="layui-container">
    <br><br>   
    <div class="layui-btn-group">    	
    	<button class="layui-btn layui-btn-primary  layui-bg-btn" onclick="addmain();">新增一行</button>       
        <button class="layui-btn layui-btn-primary layui-bg-btn"  onclick="openAll();">展开或折叠全部</button>              
        <a class="layui-btn layui-btn-primary  layui-bg-btn"  href="javascript:location.replace(location.href);" title="刷新" >
        <i class="Hui-iconfont">&#xe68f;</i>刷新</a>                  
        <br>
    </div>
    <table id="treeTable" class="layui-table"  olay-filter="treeTable">
    </table>
    
<form action="" method="" id="layer_add" style="display: none;" class="smart-green layui-layer-wrap">
	<h1>部门信息添加
		<span>请输入权限信息.</span>
	</h1>	
	<label>
		<span>直属部门:</span>
		<input id="parentDepartmentName" type="text" name="name" class="error" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>部门名称：</span>
		<input id="addDepartmentName" type="text" value="" name="menuName" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>部门负责人:</span>
		<input id="addDepartmentHead" type="text" name="name" class="error" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>部门描述：</span>
		<input id="addDepartmentDescription" type="text" value="" name="authority" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>部门类型：</span>
		<select id="addDepartmentType" >
				<option value="0">请选择......</option>
				<option value="1">市场监管局</option>
				<option value="2">市场监管分局</option>
				<option value="3">社区[街道办事处]</option>
				<option value="4">居委会</option>
				<option value="5">网格</option>
				<option value="6">主体</option>
		</select>
	</label>
	<label>
		<span>权限类型：</span>
		<select id="add_select" >
			<option value="0">请选择</option>
			<c:forEach items="${authorizationList}" var="item">
				<option value="${item.authorizationId}">${item.authorizationName}</option>
			</c:forEach>			
		</select>
	</label>
</form>
<form action="" method="" id="layer_edit" style="display: none;" class="smart-green layui-layer-wrap">
	<h1>部门信息编辑
		<span>请输入部门信息.</span>
	</h1>	
	<label>
		<span>部门名称：</span>
		<input id="editDepartmentName" type="text" value="" name="menuName" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>部门负责人:</span>
		<input id="editDepartmentHead" type="text" name="name" class="error" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>部门描述：</span>
		<input id="editDepartmentDescription" type="text" value="" name="authority" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>部门类型：</span>
		<select id="editDepartmentType" >
				<option value="0">请选择......</option>
				<option value="1">市场监管局</option>
				<option value="2">市场监管分局</option>
				<option value="3">社区[街道办事处]</option>
				<option value="4">居委会</option>
				<option value="5">网格</option>
				<option value="6">主体</option>
		</select>
	</label>
	<label>
		<span>权限类型：</span>
		<select id="edit_select" >
			<option value="0">请选择</option>
			<c:forEach items="${authorizationList}" var="item">
				<option value="${item.authorizationId}">${item.authorizationName}</option>
			</c:forEach>			
		</select>
	</label>
</form>

<form action="" method="" id="edit_auth" style="display: none;" class="smart-green layui-layer-wrap">
	<h1>权限配置
		<span>请选择...</span>
	</h1>
	<label>
		<span>部门名称：</span>
		<input id="auth_department_name" readonly="readonly" type="text" value="" name="" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>权限类型：</span>
		<select id="auth_select" >
			<option value="0">请选择</option>
			<c:forEach items="${authorizationList}" var="item">
				<option value="${item.authorizationId}">${item.authorizationName}</option>
			</c:forEach>			
		</select>
	</label>	
</form>
</div>
<div style="height:80px; width:150px;">
</div>
</body>
</html>

