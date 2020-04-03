<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>云监食安系统登录页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
<body class="bg-info container">
		<div class="container">
			<div class="text-center margin-top">
				<div class="logo"><img src="${pageContext.request.contextPath}/static/images/bks_wap/logo.png" class="img-responsive"></div>
				<h3 class="fonwei">云岩区市场监督管理局</h3>
				<%-- <a href="${pageContext.request.contextPath}/home">进入主页</a> --%>
			</div>
			<div class="margin-top3">
				<form class="login_formIn">
					<fieldset id="" class="margin-top margin-bot">
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">账号</span>
						  <input type="text" class="form-control box-shadow0" id="idCard" name="idCard" placeholder="请输入账号" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">密码</span>
						  <input type="password" class="form-control box-shadow0" id="password" name="password" placeholder="请输入密码" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg fs form-group">
						  <span class="input-group-addon clear-bg border0" id="sizing-addon1">
						  	<input type="checkbox" name="" id="remember" value="" />
						  </span>
						  <div class="form-control box-shadow0 border0 clear-bg">记住密码</div>
						</div> 
						<div class="margin-bot2 text-right">
							<a href="${pageContext.request.contextPath}/wap_register" class="">没有账号？去注册</a>
						</div>
					</fieldset>
				</form>
				<div class="text-center margin-top2 margin-bot2"><button type="submit" class="btn btn-primary form-control" id="login" value="登陆" style="height: 50px;">登陆</button></div>
			</div>
		</div>
		<script>
			//记住密码赋值	
			if(!window.localStorage){
			 	console.log("浏览器不支持localstorage");
			}else{
			    //主逻辑业务
			    var storage = window.localStorage;
			    var idCard = storage.getItem("idCard");
			    var password = storage.getItem("password");
			    var remember = storage.getItem("remember");
			    //账户赋值
			    if(idCard != null){
			    	$("#idCard").val(idCard);
			    }else{
			    	$("#idCard").val("");
			    }
			    //密码赋值
			    if(password != null){
			    	 $("#password").val(password);
			    }else{
			    	 $("#password").val("");
			    }
			    //checkbox框赋值
			    if(remember != null){
			    	$("#remember").attr("checked","checked");
			    }		    
			}		

	        
	        
			$("#login").click(function() {
					var account = $("input[name='idCard']").val();
					var password = $("input[name='password']").val();
					var mobileReg = /(^1[3|4|5|7|8|9]\d{9}$)|(^09\d{8}$)/;
					var idCardReg=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
					var passwordReg= /[a-zA-Z0-9]{6,12}/;
					//验证条件
					//!idCardReg.test(account) && !mobileReg.test(account)
					//$(!passwordReg.test(password))
					if (account=='') {
						layer.msg("账号或密码有误，请重新输入",{icon:2,time:1000});
						$("input[name='idCard']").focus();		
					}else if(password==''){
						layer.msg("账号或密码有误，请重新输入",{icon:2,time:1000});
						$("input[name='password']").focus();
					}else{
						var url = "${pageContext.request.contextPath}/wap_user_login";
						var data = "idCard="+account+"&password="+password;	
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
									//选中记住密码 + 并且支持localStorage
									if($('#remember').is(':checked') && window.localStorage){
										var storage = window.localStorage;
										storage.setItem("idCard",$("#idCard").val());
										storage.setItem("password",$("#password").val());
										storage.setItem("remember","1");
									}else{
										var storage = window.localStorage;
										storage.removeItem("idCard");
										storage.removeItem("password");
										storage.removeItem("remember");
									}
									//location.reload();
									layer.msg(obj.message,{icon:1,time:1000},function(){location.href = "wap_home";});
								}					
							}
						}); 
					}				
			})
		</script>
</body>
</html>
