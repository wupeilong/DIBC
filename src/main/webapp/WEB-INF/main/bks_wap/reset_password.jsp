<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>从业人员信息添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/ajaxfileupload.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
			</div>
		</div>
		<main class="main margin-top padding-side">
			<form action="" method="" class="clearfix update_info">
				<div class="margin-bot margin-top">
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>原&ensp;&ensp;密&ensp;&ensp;码</span>
					  <input type="password" class="form-control box-shadow0 border0 border-bottom" name="before_pwd" id="before_pwd" value="" placeholder="请输入原密码"/>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>新&ensp;&ensp;密&ensp;&ensp;码</span>
					  <input type="password" class="form-control box-shadow0 border0 border-bottom" name="new_pwd" id="new_pwd" value="" placeholder="请输入新密码"/>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>确认新密码</span>
					  <input type="password" class="form-control box-shadow0 border0 border-bottom" name="renew_pwd" id="renew_pwd" value="" placeholder="请再次输入新密码"/>
					</div>
				</div>
			</form>
			
			<div class="margin-top2 margin-bot2">
				<a href="javascript:" class="btn btn-primary form-control" id="changepwd">保存修改</a>
			</div>
			<script type="text/javascript">
				var before_pwd=$("input[name='before_pwd']");
				var new_pwd=$("input[name='new_pwd']");
				var renew_pwd=$("input[name='renew_pwd']");
				$("#changepwd").click(function() {
					if (before_pwd.val()=='') {
						layer.msg("原密码不能为空",{icon:2,time:1000});
						before_pwd.focus()
					} else if(new_pwd.val()==''){
						layer.msg("新密码不能为空",{icon:2,time:1000});
						new_pwd.focus()
					}else if(renew_pwd.val()==''){
						layer.msg("请重新输入新密码",{icon:2,time:1000});
						renew_pwd.focus()
					}else{
						var url = "${pageContext.request.contextPath}/wap_user/password_update";
						var data = "password=" + $("#new_pwd").val()+"&oldpassword="+ $("#before_pwd").val();
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
									layer.msg(obj.message,{icon:1,time:1000},function(){
										location.href="${pageContext.request.contextPath}/wap_login";
									});					
								}				
							}
						}); 
					}
				})
			</script>
		</main>		
	<c:import url="public/footer.jsp"></c:import>
	</body>

</html>
