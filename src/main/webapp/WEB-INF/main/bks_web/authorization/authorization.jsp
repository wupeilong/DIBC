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
<body >
<a class="btn btn-success radius r"  href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>	
	<div id="loading">
		<div><img src="${pageContext.request.contextPath}/static/images/bks_web/loading.gif"/></div>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20" id="table_id" style="display: none;"> 
		<span class="l"></span><br/><br/>
	<table class="table table-border table-bordered table-bg table-hover table-sort">		
		<thead>						
			<tr class="text-c">				
				<th width="40">ID</th>
				<th width="160">权限名称</th>
				<th width="130">权限备注</th>
				<th id="th_userAuthority" width="380">权限值</th>		
				<th width="300">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${authorizationList}" var="c">
				<tr class="text-c">				
				<td>${c.authorizationId}</td>
				<td>${c.authorizationName}</td>
				<td>${c.authorizationRemark}</td>
				<td>${c.authorizationContent}</td>
				<td class="td-manage">				
					<a href="javascript:;" onclick="admin_edit('${c.authorizationName}权限设置','menu_authority?authorizationId=${c.authorizationId}','4','480','550')" class="operation operation-add" style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe63c;</i>权限设置</a> 			
					<a href="javascript:;" onclick="admin_edit('${c.authorizationName}编辑','authorization_update_page?authorizationId=${c.authorizationId}','4','600','115')" class="operation operation-edit" style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe60c;</i>编辑</a> 
					<a href="javascript:;" onclick="admin_del('${c.authorizationId}','${c.authorizationName}')" class="operation operation-del" style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe6e2;</i>删除</a>				
				</td>
			</tr>			
			</c:forEach>
		</tbody>		
	</table>
</div>
<button type="button" class="btn btn-default" onclick="add()" >添加权限</button>
<div style="display:none;" id="auth_add">
		<table width="100%" border="2" cellspacing="1" cellpadding="4" bgcolor="#cccccc" class="tabtop13" align="center">				
			    </tr>
			    	<td width="30%" class="btbg font-center">权限名称</td><td><input type="text" id="add_authName" value=""></td>
			    </tr>
			    <tr>
			    	<td width="30%" class="btbg font-center">权限备注</td><td><input type="text" id="add_authRemark" value=""></td>
			    </tr>
			    <%-- <tr>
			    	<td width="30%" class="btbg font-center" colspan="2" align="center"><a href="javascript:;" onclick="admin_edit('${c.authorizationName}权限设置','menu_authority?type=admin&id=${c.authorizationId}','4','480','550')"  style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe63c;</i>权限设置</a></td>
			    </tr>	 --%>		    	    
			    <tr>
			    	<td width="18%" class="btbg font-center" colspan="2" align="center"><button type="button" class="btn btn-default" onclick="add_auth()"><i class="fa fa-edit"/>提交</button></td>
			    </tr>
		</table>
	</div>
</body>

<script type="text/javascript">
function add(){
	layer.open({
		type: 1,
		content: $('#auth_add')
	});
}
	
function add_auth(){
	var data = "authorizationName=" + $("#add_authName").val() + "&authorizationRemark=" + $("#add_authRemark").val();
	console.log(data);
	var url = "${pageContext.request.contextPath}/web_auth/authorization_add";
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


var table=$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存	
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[4]}// 制定列不参与排序
	]
});

/*管理员-删除*/
function admin_del(authorizationId,authorizationName){
	layer.confirm('确认要删除【' + authorizationName + '】权限吗？',function(index){		
		var url = "authorization_delete";
		var data ="authorizationId=" + authorizationId;
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
					layer.msg(obj.message,{icon:1,time:1000},function(){location.replace(location.href);layer.close(layer.index);});
				}				
			}
		}); 
	});
}
/*管理员-编辑*/
/*管理员-编辑*/
function admin_edit(title,url,id,w,h){	
	//layer_show(title,url,w,h);
	layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: false,		
		shade:0.4,
		title: false ,	
		content: url
	});
}
</script>
</html>
