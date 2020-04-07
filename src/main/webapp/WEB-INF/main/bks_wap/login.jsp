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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/zlogin.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>

	
</head>
<body class="bg_body container">
		<div class="container">
			<div class="text-center margin-top">
				<div class="logo"><img src="${pageContext.request.contextPath}/static/images/bks_wap/wep_login.png" class="img-responsive"></div>
				<!-- <h3>云岩食安监督管理系统</h3> -->
				<%-- <a href="${pageContext.request.contextPath}/home">进入主页</a> --%>
			</div>
			<div class="margin-top3">
				<form class="login_formIn">
					<fieldset id="" class="margin-top margin-bot">
						<div class="login_form">
							<div class="login_switch tabbox">
								<div class="login_form_top tabh">
									<a class="cur">微信登录</a>|<a>账号登录</a>
								</div>
								<div class="tabb">
									<div class="tab_type cur">
										<div style="padding: 45px 0 0 25px;font-size: 17px;font-weight: 600;color: #212121; list-style: initial;"><span>登录后应用将获得以下权限</span></div>
										<div style="padding: 10px 0 0 40px;"><span>获取你的公开信息（呢称、头像等）</span></div>
										<div class="text-center margin-top2 margin-bot2"><button type="submit" class="btn btn-primary form-control" id="wx_login" value="微信授权登陆" style="height: 50px;width: 180px;    background-color: #15bb17;
	    border-color: #a9e895;">微信一键登陆</button></div>
	    							</div>
									<div class="tab_type">
										<div class="login_user">
											<input type="text" class="login_input box-shadow0" id="idCard" name="idCard" placeholder="请输入账号" aria-describedby="sizing-addon1">
										</div>
										<div class="login_pwd">
											<input type="password" class="login_input box-shadow0" id="password" name="password" placeholder="请输入密码" aria-describedby="sizing-addon1">
										</div>
										<div class="text-center margin-top2 margin-bot2">
											<button type="submit" class="btn btn-primary form-control" id="login" value="登陆" style="height: 40px;background-color: #5298fe; border-color: #66a4da;width: 250px;">立即登录</button>
											</div>
									</div>
		
								</div>
							</div>
													
						</div>					
						<!-- <div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">账号</span>
						  <input type="text" class="form-control box-shadow0" id="idCard" name="idCard" placeholder="请输入账号" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg form-group">
						  <span class="input-group-addon" id="sizing-addon1">密码</span>
						  <input type="password" class="form-control box-shadow0" id="password" name="password" placeholder="请输入密码" aria-describedby="sizing-addon1">
						</div>	 -->
						
					</fieldset>
				</form>
				
			</div>
			<div class="text-center text-white">
				<p>Copyright&copy;2020 贵州科技</p>
				<p>黔公网安备11000002000001号</p>
			</div>	
			
		</div>
		<div id="roles" style="display: none;">
			<ul>
				<li><a href="${pageContext.request.contextPath}/wap_bind_public">我是大众</a></li>
				<li><a href="javascript:void(0);" id="public_bind">我是大众</a></li>
				<li><a href="javascript:void(0);" id="unit_bind">我是主体人员</a></li>
				<li><a href="javascript:void(0);" id="supervise_bind">我是监管人员</a></li>
			</ul>
		</div>
		<script type="text/javascript">
		//切换登陆方式
		$(".tabbox").find(".tabh a").click(function(){
			$(this).parent().children("a").removeClass("cur");
			$(this).addClass("cur");
			var index=$(this).index();
			console.log(index);
			$(this).parents(".tabbox").find(".tabb").children().removeClass("cur");
			$(this).parents(".tabbox").find(".tabb").children().eq(index).addClass("cur");
		})
		
		
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
		
		//微信一键登录
		$("#wx_login").click(function() {
			console.log("123456");
			location.href = '${wechat_login_url}';
		});
		
        
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
		   
		//大众
		$("#public_bind").click(function(){
			alert('${wx_user}');
		});
		
		
		//主体
		$("#unit_bind").click(function(){			
			layer.open({ 
				type: 1, 
				content: '<ul><li><a>绑定主体</a></li><li><a>创建主体</a></li></ul>' 
			});
			
		})
		//监管
		$("#supervise_bind").click(function(){
			console.log("监管");
		})		
		
		//第一次进入系统 用户绑定角色
		$(function(){
			var type = '${isbind}';			
			if(type == 1){
				layer.open({
			    	  title: ['请选择用户类型', 'font-size:18px;'],
			    	  type: 1,
			    	  content: $('#roles')
			    	});
			}				
		});
		</script>		
</body>
</html>
