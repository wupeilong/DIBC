<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<title>视频播放时段信息页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/nav_all.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_web/main_menus.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery_table/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
<script type="text/javascript">	
document.onreadystatechange=subSomething;
function subSomething() { 		 
	if(document.readyState == "complete"){	
		$("#loading").css("display","none");
		$("#table_id").css("display","block");
   }	  
} 
</script>
</head>
<body>
<a class="btn btn-success radius r"  href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>	
	<div id="loading">
		<div><img src="${pageContext.request.contextPath}/static/images/bks_web/loading.gif"/></div>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20" id="table_id" style="display: none;"> 
		<span class="l"></span><br/><br/>
	<table class="table table-border table-bordered table-bg table-hover table-sort">		
		<thead>						
			<tr class="text-c">				
				<th width="40">视频ID</th>
				<th width="100">视频开放时间</th>
				<th width="100">视频关闭时间</th>	
				<th width="100">操作</th>			
			</tr>
		</thead>
		<tbody>
				<tr class="text-c">				
				<td>1</td>
				<td>2</td>
				<td>3</td>
				<td class="td-manage">				
					 <a href="javascript:;" onclick="update()" class="operation operation-add" style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe63c;</i>时间设置</a>
				</td>
			</tr>
		</tbody>		
	</table>	
</div>
<form action="" method="" id="video_update" style="display: none;" class="smart-green layui-layer-wrap">
	<h1>视频播放时段编辑
		<span>请输入时段信息.</span>
	</h1>	
	<label>
		<span>开放时间：</span>
		<input id="editDepartmentName" type="text" value="" name="menuName" >
		<div class="error-msg"></div>
	</label>
	<label>
		<span>关闭时间: </span>
		<input id="editDepartmentName" type="text" value="" name="menuName" >
		<div class="error-msg"></div>
	</label>
	<label style="display: none;">
		<span>关闭时间:</span>
		<input id="editDepartmentHead" type="text" name="name" class="error" >
		<div class="error-msg"></div>
	</label>	
</form>
</body>

<script type="text/javascript">
function update(){
	 layer.open({
		  type: 1,
		  shade: false,
		  title: false, //不显示标题
		  content: $('#video_update'),
		  btn: ['提交'],
		  yes: function(index, layero){
			  console.log();
			/*  var data = "departmentId=" + "&authorizationId=" ;
			 var url = "dep_update";
			 console.log(data);
			  $.ajax({
	   			"url" : url,    	    			
	   			"data" : data,
	   			"type" : "POST",
	   			"dataType" : "json",
	   			"success" : function(obj) {
	   				if (obj.state == 0) {
	   					layer.msg(obj.message,{icon:2,time:1000});
	   					return;
	   				}else{
	   					layer.msg(obj.message,{icon:1,time:1000},function(){location.replace(location.href);layer.close(index);});
	   				}	
	   			}
	   		});      */
		  }
	});
}


var table=$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存	
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[1]}// 制定列不参与排序
	]
});
</script>
</html>
