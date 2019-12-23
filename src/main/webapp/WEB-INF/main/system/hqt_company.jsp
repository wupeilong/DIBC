<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<title>单位页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/nav_all.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/Hui-iconfont/1.0.8/iconfont.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery_table/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>

<body>
<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
<div class="page-container">
		<div class="text-c" style="height: 50px;"></div>
	<div class="cl pd-5 bg-1 bk-gray">  <span class="r">共有数据：<strong>${companyList.size()}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-bg table-hover table-sort">
		<thead>			
			<tr class="text-c">				
				<th width="40">ID</th>
				<th width="200">单位编码</th>
				<th width="200">单位(机构)名称</th>	
				<th width="200">单位地址</th>				
				<th width="300">创建时间</th>
				<th width="300">操作</th>			
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${companyList}" var="c">
				<tr class="text-c">					
					<td>${c.companyId}</td>
					<td>${c.companyNumber}</td>
					<td>${c.companyName}</td>	
					<td>${c.companyAdress}</td>					
					<td><fmt:formatDate value="${c.creationTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>				
					<td class="td-manage"> 
						<a title="编辑" href="javascript:;" onclick="company_edit('单位：${c.companyName}信息编辑','hqt_companyedit?companyId=${c.companyId}','4','850','550')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> 
						<a title="删除" href="javascript:;" onclick="company_del('${c.companyId}','${c.companyName}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
				</tr>
			</c:forEach>			
		</tbody>
	</table>
</div>
</body>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 0, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[5]}// 制定列不参与排序
	]
});
/*分类角色-删除*/
function company_del(companyId,companyName){
	layer.confirm('确认要删除单位：'+companyName+'  吗？',function(index){		
		var url = "companydel";
		var data ="companyId="+companyId;
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
function company_edit(title,url,id,w,h){	
	layer_show(title,url,w,h);
}
</script>
</html>
