<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<title>用户部门信息页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/miller_style.css"/>
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
<a class="btn btn-success radius r"  href="javascript:;" onclick="user_add()" title="新增" ><i class="icon Hui-iconfont">&#xe600;</i></a>
	<div id="loading">
		<div><img src="${pageContext.request.contextPath}/static/images/bks_web/loading.gif"/></div>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20" id="table_id" style="display: none;"> 
		<span class="l"></span><br/><br/>
	<table class="table table-border table-bordered table-bg table-hover table-sort">		
		<thead>						
			<tr class="text-c">				
				<th width="40">企业</th>
				<th width="100">名字</th>
				<!-- <th width="100">头像</th> -->
				<th width="100">身份证</th>				
				<th width="100">手机</th>
				<th width="100">部门</th>
				<th width="100">职务</th>		
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList}" var="item">
				<tr class="text-c">				
				<td>${item.unitName}</td>
				<td>${item.username}</td>
				<%-- <td><img src="${item.headUrl}"/></td> --%>
				<td>${item.idCard}</td>
				<td>${item.phone}</td>
				<td>${item.departmentName}</td>
				<td>${item.duty}</td>
				<td class="td-manage">				
					<a href="javascript:;" onclick="admin_edit('${c.authorizationName}部门设置','${pageContext.request.contextPath}/web_auth/department_bind?userId=${item.id }','4','480','550')" class="operation operation-add" style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe63c;</i>部门设置</a>
					<a href="javascript:;" onclick="update_user('${item.id}','${item.unitName}','${item.username}','${item.idCard}','${item.phone}','${item.duty}','${item.age}')" class="operation operation-edit" style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe60c;</i>编辑</a> 
					<a href="javascript:;" onclick="del_user('${item.id}')" class="operation operation-del" style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe6e2;</i>删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>		
	</table>
	<form id="user_update" class="clearfix well" style="display: none;" >
				<div class="workmens_info_top margin-bot">					
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" for="username"><i class="padding-side05 text-danger vertical-mid">*</i>所属企业</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="update_unitName" name="unitName"  value=""  placeholder="" aria-describedby="sizing-addon1">				 
					  <input type="hidden" id="update_userId" value="">
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" for="pwd"><i class="padding-side05 text-danger vertical-mid">*</i>姓&ensp;&ensp;&ensp;&ensp;名</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="update_username" name="pwd"  value=""  placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>						
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>身份证号</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="update_idCard" name="idCard" value="" placeholder="请输入身份证号" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>手&ensp;机&ensp;号</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="update_phone" name="phone"  value=""  placeholder="请输入手机号" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>职&ensp;&ensp;&ensp;&ensp;务</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="update_duty" name="duty"  value=""  placeholder="请输入职务" aria-describedby="sizing-addon1">
					</div>
									
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>年&ensp;&ensp;&ensp;&ensp;龄</span>
					  <input type="text" class="form-control box-shadow0 border-bottom"  value=""  id="update_age" name="age" placeholder="请输入年龄" aria-describedby="sizing-addon1">
					</div>					
				</div>
				<div class="text-center">
					<a href="javascript:;" class="btn btn-primary" id="edit_user">保存</a>
				</div>
			</form>
			<form id="add_user" class="clearfix well" style="display: none;" >
				<div class="workmens_info_top margin-bot">
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" for="username"><i class="padding-side05 text-danger vertical-mid">*</i>姓&ensp;&ensp;&ensp;&ensp;名</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="add_username" name="username"  value=""  placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>						
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>身份证号</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="add_idCard" name="idCard" value="" placeholder="请输入身份证号" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>手&ensp;机&ensp;号</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="add_phone" name="phone"  value=""  placeholder="请输入手机号" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>职&ensp;&ensp;&ensp;&ensp;务</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="add_duty" name="duty"  value=""  placeholder="请输入职务" aria-describedby="sizing-addon1">
					</div>
									
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>年&ensp;&ensp;&ensp;&ensp;龄</span>
					  <input type="text" class="form-control box-shadow0 border-bottom"  value=""  id="add_age" name="age" placeholder="请输入年龄" aria-describedby="sizing-addon1">
					</div>					
				</div>
				<div class="text-center">
					<a href="javascript:;" class="btn btn-primary" id="adduser">提交</a>
				</div>
			</form>
</div>
</body>

<script type="text/javascript">
function user_add(){
	layer.open({
		type: 1,
		content: $('#add_user')
	});
}
$("#adduser").click(function adduser(){
	if($("#add_username").val() == ""){
		layer.msg("姓名不能为空！",{icon:2,time:1000});
		return;
	}else if($("#add_phone").val() == ""){
		layer.msg("手机号不能为空！",{icon:2,time:1000});		
		return;
	} else{
		var data ="username=" + $("#add_username").val() + "&idCard=" + $("#add_idCard").val() + "&phone=" 
		 + $("#add_phone").val() + "&duty=" + $("#add_duty").val() + "&age=" + $("#add_age").val();
		var url = "${pageContext.request.contextPath}/web_user/add_user";
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
});
function del_user(userId){
	layer.confirm('是否确定删除用户？', {
		  btn: ['确定', '取消'] //可以无限个按钮		  
		}, function(index, layero){
			delete_user(userId);
		}, function(index){
		  //按钮【按钮二】的回调
		});
}


function delete_user(userId){	
	var data = "id=" + userId;
	var url = "${pageContext.request.contextPath}/web_user/delete_user";
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

$("#edit_user").click(function(){
	if($("#update_phone").val() == ""){
		layer.msg("手机号不能为空！",{icon:2,time:1000});
		return;
	}
	if($("#update_username").val() == ""){
		layer.msg("姓名不能为空！",{icon:2,time:1000});
		return;
	}
	var data = "id=" + $("#update_userId").val() + "&unitName=" + $("#update_unitName").val() + "&username=" + $("#update_username").val()
			 + "&idCard=" + $("#update_idCard").val() + "&phone=" + $("#update_phone").val() + "&duty=" + $("#update_duty").val()
			 + "&age=" + $("#update_age").val();
	var url = "${pageContext.request.contextPath}/web_user/update_user";
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
});
function update_user(userId,unitName,username,idCard,phone,duty,age){
	$("#update_userId").val(userId);
	$("#update_unitName").val(unitName);
	$("#update_username").val(username);
	$("#update_idCard").val(idCard);
	$("#update_phone").val(phone);
	$("#update_duty").val(duty);
	$("#update_age").val(age);	
	layer.open({
		type: 1,
		content: $('#user_update')
	});
}

function add(){
	layer.open({
		type: 1,
		content: $('#auth_add')
	});
}
	
function add_auth(){
	var data = "authorizationName=" + $("#add_authName").val() + "&authorizationRemark=" + $("#add_authRemark").val();
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
