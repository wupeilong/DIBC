<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<title>企业信息列表页</title>
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
<a class="btn btn-success radius r"  href="javascript:;" onclick="unit_add()" title="新增" ><i class="icon Hui-iconfont">&#xe600;</i></a>
	<div id="loading">
		<div><img src="${pageContext.request.contextPath}/static/images/bks_web/loading.gif"/></div>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20" id="table_id" style="display: none;">
		<span class="l"></span><br/><br/>
	<table class="table table-border table-bordered table-bg table-hover table-sort">		
		<thead>						
			<tr class="text-c">
				<th width="100">企业名称</th>
				<th width="100">社会通一信用代码</th>
				<th width="100">企业类型</th>
				<th width="100">企业分类</th>
				<th width="100">企业法人</th>
				<th width="100">企业经营地址</th>
				<th width="100">到期时间</th>								
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${unitList}" var="item">
				<tr class="text-c">				
				<td>${item.unitName}</td>
				<td>${item.businessLicenseCode}</td>
				<td>
					<c:if test="${item.unitType == 1}">
						监管局
					</c:if>	
					<c:if test="${item.unitType == 2}">
						学校
					</c:if>	
					<c:if test="${item.unitType == 3}">
						餐饮业
					</c:if>	
					<c:if test="${item.unitType == 4}">
						其他
					</c:if>		
				</td>
				<td>${item.typeName}</td>
				<td>${item.legalPerson}</td>
				<td>${item.unitAddress}</td>
				<td>${item.expirationDate}</td>
				<td class="td-manage">
					<a href="javascript:;" onclick="update_unit('${item.unitId}','${item.unitName}','${item.businessLicenseCode}','${item.typeName}','${item.legalPerson}','${item.unitAddress}','${item.expirationDate}')" class="operation operation-edit" style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe60c;</i>编辑</a> 
					<a href="javascript:;" onclick="del_unit('${item.unitId}')" class="operation operation-del" style="text-decoration:none">
						<i class="Hui-iconfont" style="font-size: 1em;">&#xe6e2;</i>删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>		
	</table>
	<form id="unit_update" class="clearfix well" style="display: none;" >
				<div class="workmens_info_top margin-bot">					
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" for="username"><i class="padding-side05 text-danger vertical-mid">*</i>企&ensp;&ensp;&ensp;业&ensp;&ensp;名&ensp;&ensp;&ensp;称</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="update_unitName" name="unitName"  value=""  placeholder="" aria-describedby="sizing-addon1">				 
					  <input type="hidden" id="update_unitId" value="">
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" for="pwd"><i class="padding-side05 text-danger vertical-mid">*</i>社会统一信用代码</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="update_businessLicenseCode" name="pwd"  value=""  placeholder="请输入社会统一信用代码" aria-describedby="sizing-addon1">
					</div>						
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>企&ensp;&ensp;&ensp;业&ensp;&ensp;分&ensp;&ensp;&ensp;类</span>
					  <select id="update_typeName" style="width: 162px;height: 32px;font-size: 15px" >
					  		<option value="市场监督管理局">市场监督管理局</option>
					  		<option value="学校">学校</option>
					  		<option value="学校食堂">学校食堂</option>
					  		<option value="餐饮业">餐饮业</option>
					  		<option value="配餐单位">配餐单位</option>
					  		<option value="小型餐馆">小型餐馆</option>
					  		<option value="中型餐馆">中型餐馆</option>
					  		<option value="大型餐馆">大型餐馆</option>
					  		<option value="特大型餐馆">特大型餐馆</option>
					  		<option value="企业">企业</option>
					  		<option value="个体">个体</option>
					  		<option value="其他">其他</option>
					  </select>
					  <!-- 手&ensp;机&ensp;号<input type="text" class="form-control box-shadow0 border-bottom" id="update_idCard" name="idCard" value="" placeholder="请输入身份证号" aria-describedby="sizing-addon1"> -->
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>企&ensp;&ensp;&ensp;业&ensp;&ensp;法&ensp;&ensp;&ensp;人</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="update_legalPerson" name="phone"  value=""  placeholder="请输入企业法人名字" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>企&ensp;业&ensp;经&ensp;营&ensp;地址</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="update_unitAddress" name="duty"  value=""  placeholder="请输入企业经营地址" aria-describedby="sizing-addon1">
					</div>
									
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>到&ensp;&ensp;&ensp;期&ensp;&ensp;时&ensp;&ensp;&ensp;间</span>
					  <input type="text" class="form-control box-shadow0 border-bottom"  value=""  id="update_expirationDate" name="age" placeholder="请输入年龄" aria-describedby="sizing-addon1">
					</div>					
				</div>
				<div class="text-center">
					<a href="javascript:;" class="btn btn-primary" id="edit_unit">保存</a>
				</div>
			</form>
			<form id="add_unit" class="clearfix well" style="display: none;" >
				<div class="workmens_info_top margin-bot">					
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" for="username"><i class="padding-side05 text-danger vertical-mid">*</i>企&ensp;&ensp;&ensp;业&ensp;&ensp;名&ensp;&ensp;&ensp;称</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="add_unitName" name="unitName"  value=""  placeholder="" aria-describedby="sizing-addon1">				 
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" for="pwd"><i class="padding-side05 text-danger vertical-mid">*</i>社会统一信用代码</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="add_businessLicenseCode" name="pwd"  value=""  placeholder="请输入社会统一信用代码" aria-describedby="sizing-addon1">
					</div>						
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>企&ensp;&ensp;&ensp;业&ensp;&ensp;分&ensp;&ensp;&ensp;类</span>
					  <select id="add_typeName" style="width: 162px;height: 32px;font-size: 15px" >
					  		<option value="市场监督管理局">市场监督管理局</option>
					  		<option value="学校">学校</option>
					  		<option value="学校食堂">学校食堂</option>
					  		<option value="餐饮业">餐饮业</option>
					  		<option value="配餐单位">配餐单位</option>
					  		<option value="小型餐馆">小型餐馆</option>
					  		<option value="中型餐馆">中型餐馆</option>
					  		<option value="大型餐馆">大型餐馆</option>
					  		<option value="特大型餐馆">特大型餐馆</option>
					  		<option value="企业">企业</option>
					  		<option value="个体">个体</option>
					  		<option value="其他">其他</option>
					  </select>
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>企&ensp;&ensp;&ensp;业&ensp;&ensp;法&ensp;&ensp;&ensp;人</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="add_legalPerson" name="phone"  value=""  placeholder="请输入企业法人名字" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>企&ensp;业&ensp;经&ensp;营&ensp;地址</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="add_unitAddress" name="duty"  value=""  placeholder="请输入企业经营地址" aria-describedby="sizing-addon1">
					</div>
									
					<div class="input-group margin-bot">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>到&ensp;&ensp;&ensp;期&ensp;&ensp;时&ensp;&ensp;&ensp;间</span>
					  <input type="text" class="form-control box-shadow0 border-bottom"  value=""  id="add_expirationDate" name="age" placeholder="请输入年龄" aria-describedby="sizing-addon1">
					</div>					
				</div>
				<div class="text-center">
					<a href="javascript:;" class="btn btn-primary" id="addunit">保存</a>
				</div>
			</form>		
</div>
</body>

<script type="text/javascript">
function unit_add(){
	layer.open({
		type: 1,
		content: $('#add_unit')
	});
}
$("#addunit").click(function adduser(){
		if($("#add_unitName").val() == ""){
			layer.msg("企业名称不能为空！",{icon:2,time:1000});
			return;
		}	
		var data = "unitName=" + $("#add_unitName").val() + "&typeName=" + $("#add_typeName").val() + "&legalPerson=" + $("#add_legalPerson").val()
				 + "&unitAddress=" + $("#add_unitAddress").val() + "&expirationDate=" + $("#add_expirationDate").val();
		var url = "${pageContext.request.contextPath}/web_unit/add_unit";
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


function del_unit(unitId){
	layer.confirm('是否确定删除用户？', {
		  btn: ['确定', '取消'] //可以无限个按钮		  
		}, function(index, layero){
			delete_user(unitId);
		}, function(index){
		  //按钮【按钮二】的回调
		});
}


function delete_user(unitId){
	var data = "unitId=" + unitId;
	var url = "${pageContext.request.contextPath}/web_unit/del_unit";
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

$("#edit_unit").click(function(){
	if($("#update_unitName").val() == ""){
		layer.msg("企业名称不能为空！",{icon:2,time:1000});
		return;
	}	
	var data = "unitId=" + $("#update_unitId").val() + "&unitName=" + $("#update_unitName").val() + "&typeName=" + $("#update_typeName").val() + "&businessLicenseCode=" + $("#update_businessLicenseCode").val()
			 + "&legalPerson=" + $("#update_legalPerson").val() + "&unitAddress=" + $("#update_unitAddress").val() + "&expirationDate=" + $("#update_expirationDate").val();
	var url = "${pageContext.request.contextPath}/web_unit/update_unit";
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

function update_unit(unitId,unitName,businessLicenseCode,typeName,legalPerson,unitAddress,expirationDate){
	$("#update_unitId").val(unitId);
	$("#update_unitName").val(unitName);
	$("#update_businessLicenseCode").val(businessLicenseCode);
	$("#update_typeName").val(typeName);
	$("#update_legalPerson").val(legalPerson);
	$("#update_unitAddress").val(unitAddress);
	$("#update_expirationDate").val(expirationDate);
	layer.open({
		type: 1,
		content: $('#unit_update')
	});
}

var table=$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存	
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[4]}// 制定列不参与排序
	]
});


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
