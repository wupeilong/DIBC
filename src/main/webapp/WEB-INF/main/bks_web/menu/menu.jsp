<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>菜单页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_web/main_menus.css">
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/Hui-iconfont/1.0.8/iconfont.css" />
 	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bks_web/web_menu.js"></script>
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
	<h1>权限信息添加
		<span>请输入权限信息.</span>
	</h1>
	<label>
		<span>父菜单名称:</span>
		<input id="parentname" type="text" name="name" class="error" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>菜单名称：</span>
		<input id="menuName" type="text" value="" name="menuName" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>权限标识：</span>
		<input id="authority" type="text" value="" name="authority" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>菜单URL：</span>
		<input id="menuUrl" type="text" value="" name="menuUrl" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>菜单类型：</span>
		<select id="ismenus" >
			<option value="0">请选择......</option>
			<option value="1">目录</option>
			<option value="2">菜单</option>
			<option value="3">按钮</option>
		</select>
	</label>	
</form>
<form action="" method="" id="layer_edit" style="display: none;" class="smart-green layui-layer-wrap">
	<h1>权限信息编辑
		<span>请输入权限信息.</span>
	</h1>	
	<label>
		<span>菜单名称：</span>
		<input id="ditmenuName" type="text" value="" name="menuName" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>权限标识：</span>
		<input id="ditauthority" type="text" value="" name="authority" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>菜单URL：</span>
		<input id="ditmenuUrl" type="text" value="" name="menuUrl" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>菜单类型：</span>
		<select id="ditismenus" >
			<option value="0">请选择......</option>
			<option value="1">目录</option>
			<option value="2">菜单</option>
			<option value="3">按钮</option>
		</select>
	</label>	
</form>
</div>

</body>
</html>

