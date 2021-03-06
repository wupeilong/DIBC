<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>微信授权登录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.all.js"></script>
</head>
	<body class="contain">
		<main class="bg-gradientfbot" style="height: 100%;background: url(${pageContext.request.contextPath}/static/images/bks_wap/bg_roles.png) no-repeat;background-size: contain;">
			<div class="text-center">
				<div class="circle bg-gradient margin-top2" style="width: 80px;height: 80px;"><img style="width: 80px;height: 80px;  border-radius:50%;"  src="${wx_user_info.headimgurl}"></div>
				<p class="margin-top fonwei binding_page_black fonwei" style="color: #0a0a0a;">用户：${wx_user_info.nickname}</p>
			</div>
			<div class="roles_lis width100 padding-side margin-top4 margin-bot2">
				<div class="margin-bot fonwei" style="border-left: 4px solid #fe722d;padding-left: 1em;color: #666;font-size: 1.2em;"> 请选择用户角色 </div>
				<ul class="list-unstyled">
					<li class="fs" id="bind_public" onclick="bindPublic()">
						<div class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/role1.png" class="" alt=""> </div>
						<div class="padding-side">
							<%-- <a href="${pageContext.request.contextPath}/wap_public_home" class="fonwei">大众用户</a> --%>
							<a href="javascript:;" class="fonwei">大众用户</a>
							<div class="binding_page_black fonwei bfrifRows  " style="margin-top: 0.4em;    font-size: 10px;">大众用户。既是消费者又是监督者，可查看食品安全相关过程，齐抓共管食品安全。</div>
						</div>
					</li>
					<li class="fs" onclick="model($('.model_step2'))">
						<div class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/role.png" class="" alt=""> </div>
						<div class="padding-side">
							<a href="javascript:;" class="fonwei">市场主体</a>
							<div class="binding_page_black fonwei bfrifRows  " style="margin-top: 0.4em;font-size: 10px;">主体人员。作为食品生产的主体，诚信生产经营，根据相关法律，接受相关部门的监督。</div>
						</div>
					</li>
					<li class="fs" onclick="model($('.model_step3'))">
						<div class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/role2.png" class="" alt=""> </div>
						<div class="padding-side">
							<a href="javascript:;" class="fonwei bfrifRows">监管人员</a>
							<div class="binding_page_black fonwei  " style="margin-top: 0.4em;font-size: 10px;">监管人员。黔灵毓秀，贵中云岩，保障人民群众的饮食安全。</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="model_step2 fc modelbox" style="display: none; opacity: 0.6;">
				<img src="${pageContext.request.contextPath}/static/images/bks_wap/binding.png" class="img-responsive">
				<div class="bingding_form">
					<div class="tabbox">						
						<div class="tabb">
							<div class="tab_type cur">
								<form action="" class="bingform">
									<legend class="fonsi16">主体绑定</legend>
									<legend class="fonwei binding_page_black margin-top2 border0">*注： 系统将根据您所绑定的手机账户分配您所属的企业主体信息</legend>
									<div class="">
										<label for="mobile" class="binding_page_black"><i class="fa fa-mobile"></i></label>
										<input type="text" class="border0 form-control" name="mobile" id="mobile" value="" placeholder="请输入手机号"/>
									</div>
									<div class="margin-top">
										<label for="password" class="binding_page_black"><i class="fa fa-key"></i></label>
										<input type="password" class="border0 form-control" name="password" id="" value="" placeholder="请输入密码"/>
									</div>
								</form>
								<div class="tips text-danger text-center margin-top" style="height:1em"></div>
								<div class="margin-top2">
									<a href="javascript:;" class="btn btn-primary form-control" onclick="binding_submit(this,2)">提交绑定</a>
								</div>
								<div class="fonwei text-info margin-top2 border0 text-center"> 账号绑定后您将不需要频繁地登陆 </div>
							</div>							
						</div>
					</div>
				</div>
			</div>
			<div class="model_step3 modelbox" style="display: none; opacity: 0.6;">
				<img src="${pageContext.request.contextPath}/static/images/bks_wap/binding.png" class="img-responsive">
				<div class="bingding_form">
					<div class="tabbox">						
						<div class="tabb">
							<div class="tab_type cur">
								<form action="" class="bingform">
									<legend class="fonsi16">监管人员绑定</legend>
									<legend class="fonwei binding_page_black margin-top2 border0">*注： 系统将根据您所提供的手机账户绑定监管账户信息</legend>
									<div class="">
										<label for="mobile" class="binding_page_black"><i class="fa fa-mobile"></i></label>
										<input type="text" class="border0 form-control" name="mobile" id="mobile" value="" placeholder="请输入手机号"/>
									</div>
									<div class="margin-top">
										<label for="password" class="binding_page_black"><i class="fa fa-key"></i></label>
										<input type="password" class="border0 form-control" name="password" id="" value="" placeholder="请输入密码"/>
									</div>
								</form>
								<div class="tips text-danger text-center margin-top" style="height:1em"></div>
								<div class="margin-top2">
									<a href="javascript:;" class="btn btn-primary form-control" onclick="binding_submit(this,1)">提交绑定</a>
								</div>
								<div class="fonwei text-info margin-top2 border0 text-center"> 账号绑定后您将不需要频繁地登陆 </div>
							</div>							
						</div>
					</div>
				</div>
			</div>
		</main>
		<script type="text/javascript">
		function bindPublic(){
			var url = "${pageContext.request.contextPath}/wap_bind_public";
			$.ajax({
				"url" : url,
				"data" : '',
				"type" : "POST",
				"dataType" : "json",
				"success" : function(obj) {
					if (obj.state == 0) {
						layer.msg(obj.message,{icon:2,time:1000});
						return;
					}else{
						layer.msg(obj.message,{icon:1,time:1000},function(){										
							location.href = "${pageContext.request.contextPath}/wap_public_home";
						});
					}					
				}
			});
		}
		/* $("#bind_public").click(function(){
			
			  
		}); */
		
			
			function binding_submit(e,type) {
				var mobile=$(e).parents(".bingding_form").find("form input[name=mobile]").val();
				var password=$(e).parents(".bingding_form").find("form input[name=password]").val();
				var mobileReg = /(^1[3|4|5|7|8|9]\d{9}$)|(^09\d{8}$)/;
				//var pwd_reg=/[a-zA-Z0-9]{6,12}/;
				var tips=$(e).parents(".bingding_form").find(".tips");
				if (!mobileReg.test(mobile) || mobile=='') {
					layer.msg("您输入的手机号错误，请重新输入！",{icon:2,time:1000});
					return;
				}
				if (password=='') {
					layer.msg("您输入的密码错误，请重新输入！",{icon:2,time:1000});					
					return;
				}
				var url = "${pageContext.request.contextPath}/wap_bind_supervise";
				var data = "password=" + password + "&phone=" + mobile + "&type=" + type;
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
								location.href = "${pageContext.request.contextPath}/wap_home";
							});
						}					
					}
				});
				
			}
			//tab选项卡
			/* $(".tabbox").find(".tabh").children().click(function(){
				$(this).parent().children().removeClass("cur");
				$(this).addClass("cur");
				var index=$(this).index();
				console.log(index);
				$(this).parents(".tabbox").find(".tabb").children().removeClass("cur");
				$(this).parents(".tabbox").find(".tabb").children().eq(index).addClass("cur");
			}) */
			
			function model(el) {
				layer.open({
				  type:1,
				  area: ['340px', '530px'],
				  title: false,
				  content: el,
				  closeBtn:2,
				  shadeClose:true,
				  end: function(index){
					  $(el).css('display','none');		               
		         }
				});    
			}
			document.body.addEventListener('touchstart', function () {});
		</script>
	</body>
</html>
