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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.all.js"></script>	
</head>
	<body class="contain">
		<main class="bg-gradientfbot" style="height: 100%;background: url(${pageContext.request.contextPath}/static/images/bks_wap/bg_roles.png) no-repeat;background-size: contain;">
			<div class="text-center">
				<div class="circle bg-gradient margin-top2" style="width: 80px;height: 80px;"> </div>
				<p class="margin-top fonwei text-white">用户：航天员</p>
			</div>
			<div class="roles_lis width100 padding-side margin-top4 margin-bot2">
				<div class="margin-bot fonwei" style="border-left: 4px solid #fe722d;padding-left: 1em;color: #666;font-size: 1.2em;"> 请选择用户角色 </div>
				<ul class="list-unstyled">
					<li class="fs" onclick="return location.href='wap_public_home';">
						<div class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/role1.png" class="" alt=""> </div>
						<div class="padding-side">
							<a href="${pageContext.request.contextPath}/wap_public_home" class="fonwei">大众用户</a>
							<div class="text-muted bfrifRows  " style="margin-top: 0.4em;    font-size: 10px;">大众用户。既是消费者又是监督者，可查看食品安全相关过程。</div>
						</div>
					</li>
					<li class="fs" onclick="model($('.model_step2'))">
						<div class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/role.png" class="" alt=""> </div>
						<div class="padding-side">
							<a href="javascript:;" class="fonwei">主体人员</a>
							<div class="text-muted bfrifRows  " style="margin-top: 0.4em;font-size: 10px;">主体人员。作为食品生产的主体，诚信生产经营，根据相关法律，接受相关部门的监督。</div>
						</div>
					</li>
					<li class="fs" onclick="model($('.model_step3'))">
						<div class=""> <img src="${pageContext.request.contextPath}/static/images/bks_wap/role2.png" class="" alt=""> </div>
						<div class="padding-side">
							<a href="javascript:;" class="fonwei bfrifRows">监管人员</a>
							<div class="text-muted  " style="margin-top: 0.4em;font-size: 10px;">监管人员。黔灵毓秀，贵中云岩，保障人民群众的饮食安全。</div>
						</div>
					</li>
				</ul>
			</div>
			
			<div class="model_step2 fc modelbox" style="display: none;">
				<img src="${pageContext.request.contextPath}/static/images/bks_wap/binding.png" class="img-responsive">
				<div class="bingding_form">
					<div class="tabbox">
						<ul class="tabh list-inline" style="border-bottom: 2px solid #348dec;">
							<li class="fonwei fonsi16 cur">绑定主体</li>
							<li class="fonwei fonsi16">创建主体</li>
						</ul>
						<div class="tabb">
							<div class="tab_type cur">
								<form action="" class="bingform">
									<legend class="fonwei text-muted margin-top4 border0">*注： 系统将根据您所提交的执照编号分配您所属的企业主体信息</legend>
									<div class="margin-top">
										<label for="" class="text-muted"><i class="fa fa-vcard-o"></i></label>
										<input type="text" class="border0 form-control" name="" id="" value="" placeholder="请输入营业执照编号"/>
									</div>
								</form>
								<div class="margin-top4">
									<a href="javascript:;" class="btn btn-primary form-control">提交绑定</a>
								</div>
								<div class="fonwei text-danger margin-top2 border0 text-center"> 账号绑定后您将不需要频繁地登陆 </div>
							</div>
							<div class="tab_type">
								<form action="" class="bingform">
									<div class="margin-top">
										<label for="" class="text-muted"><i class="fa fa-vcard-o"></i></label>
										<input type="text" class="border0 form-control" name="" id="" value="" placeholder="请输入企业名称"/>
									</div>
									<div class="margin-top">
										<label for="" class="text-muted"><i class="fa fa-lock"></i></label>
										<input type="text" class="border0 form-control" name="" id="" value="" placeholder="统一社会信用代码"/>
									</div>
									<div class="margin-top">
										<select name=""class="border0 form-control" style="padding-left: 2.6em;">
											<option value="">请选择企业类型</option>
											<option value="">学校</option>
											<option value="">餐饮企业</option>
											<option value="">其它</option>
										</select>
									</div>
									<div class="margin-top fb">
										<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner2.jpg" class="" style="width: 100px;height: 100px;border: 1px solid #555;">
										<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner2.jpg" class="" style="width: 100px;height: 100px;border: 1px solid #555;">
									</div>
								</form>
								<div class="margin-top">
									<a href="javascript:;" class="btn btn-primary form-control">创建主体</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="model_step3 modelbox" style="display: none;">
				<img src="${pageContext.request.contextPath}/static/images/bks_wap/binding1.png" class="img-responsive">
				<div class="bingding_form" style="position: absolute;bottom: 0em;top: auto;">
					<form action="" class="bingform">
						<legend class="fonsi16">监管人员绑定</legend>
						<div class="">
							<label for="" class="text-muted"><i class="fa fa-mobile"></i></label>
							<input type="text" class="border0 form-control" name="" id="" value="" placeholder="请输入手机号"/>
						</div>
						<div class="margin-top">
							<label for="" class="text-muted"><i class="fa fa-key"></i></label>
							<input type="password" class="border0 form-control" name="" id="" value="" placeholder="请输入密码"/>
						</div>
					</form>
					<div class="margin-top3">
						<a href="javascript:;" class="btn btn-primary form-control">提交绑定</a>
					</div>
				</div>
			</div>
		</main>
		<script type="text/javascript">
			//tab选项卡
			$(".tabbox").find(".tabh").children().click(function(){
				$(this).parent().children().removeClass("cur");
				$(this).addClass("cur");
				var index=$(this).index();
				console.log(index);
				$(this).parents(".tabbox").find(".tabb").children().removeClass("cur");
				$(this).parents(".tabbox").find(".tabb").children().eq(index).addClass("cur");
			})
			
			function model(el) {
				layer.open({
				  type:1,
				  area: ['340px', 'auto'],
				  title: false,
				  content: el,
				  closeBtn:2,
				  shadeClose:true,
				  end: function(index){
					  $(el).css('display','none');		               
		         }
				});    
			}
		</script>
	</body>
</html>
