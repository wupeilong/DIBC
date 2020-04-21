<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>个人信息完善</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />
	<link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/ajaxfileupload.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
	<body class="contain">	
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="javascript:history.go(0)" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>
					<div class="header-btn text-right">
						<button type="button" class="btn btn-primary form-control" id="register">保存</button>
					</div>			
				</div>
			</div>
			<div class="bannerPane">
				<div class="overlay"></div>
				<div class="s-banner-content">
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
			</div>
		</div>		
		<main class="main padding-side">
			<form action="" method="" class="clearfix">
				<div class="workmens_info_top margin-bot margin-top">					
					<div class="input-group form-group fs">
						  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>所属企业</span>
					<div class="form-control box-shadow0 border0">${userDetail.unitName}</div>					 
					</div>					
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>身份证号</span>
					  <input type="hidden" id="id" name="id" value="${userDetail.id }">
					  <input type="hidden" id="healthCertificate" name="healthCertificate" value="${userDetail.healthCertificate }">
					  <input type="text" class="form-control box-shadow0 border-bottom" id="idCard" name="idCard" value="${userDetail.idCard }" placeholder="请输入身份证号" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>手&ensp;机&ensp;号</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="phone" name="phone"  value="${userDetail.phone }"  placeholder="请输入手机号" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>职&ensp;&ensp;&ensp;&ensp;务</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="duty" name="duty"  value="${userDetail.duty }"  placeholder="请输入职务" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>姓&ensp;&ensp;&ensp;&ensp;名</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="username" name="username"  value="${userDetail.username }"  placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>密&ensp;&ensp;&ensp;&ensp;码</span>
					  <div class="form-control box-shadow0 border0">
					  	<div class="fb"><span>********</span><span><a href="${pageContext.request.contextPath}/wap_user/reset_password" class="btn btn-warning btn-sm">修改密码</a></span></div>
					  </div>
					  <%-- <input type="password" class="form-control box-shadow0 border-bottom" readonly="readonly" value="${userDetail.password }"  id="password" name="password" placeholder="请输入密码" aria-describedby="sizing-addon1"> --%>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>年&ensp;&ensp;&ensp;&ensp;龄</span>
					  <input type="text" class="form-control box-shadow0 border-bottom"  value="${userDetail.age }"  id="age" name="age" placeholder="请输入年龄" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>健康证号</span>
					  <input type="text" class="form-control box-shadow0 border-bottom"  value="${userDetail.healthCertificateCode }"  id="healthCertificateCode" name="healthCertificateCode" placeholder="请输入健康证编号" aria-describedby="sizing-addon1">
					</div>
				</div>				
				<div class="">
					<div class="fc">
						<div class="upload_imgs">
							<div class="fc tip_text">
								<div class="text-info">
									<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
									<div class="text-center">上传图片</div>
								</div>
							</div>
							<input type="file" name="" id="fileinput" value="" accept="image/*"/>
							<c:if test="${userDetail.healthCertificate == null }">
								<img src="" id="preview">
							</c:if>
							<c:if test="${userDetail.healthCertificate != null }">
								<img src="${pageContext.request.contextPath}${userDetail.healthCertificate}" id="preview">
							</c:if>							
						</div>
					</div>
				</div>				
			</form>
			
			<!-- <div class="margin-top2 margin-bot2">
				<button type="button" class="btn btn-primary form-control" id="register">保存</button>
			</div> -->
		</main>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>		
		<script type="text/javascript">
		console.log('用户: ${userDetail}');
			$("#fileinput").on("change",function() {
				intoBase64("fileinput","preview");
			})
			var password_reg = /[a-zA-Z0-9]{6,12}/;
		  	var phone_reg = /(^1[3|4|5|7|8|9]\d{9}$)|(^09\d{8}$)/;
		  	var username_reg = /^[\u4E00-\u9FA5]{2,6}$/;	
		  	var name_reg = /^[\u0391-\uFFE5]+$/;
			var idCard_judge = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
			var age_reg = /^[0-9]{1,3}/; 
			 $('#register').click(function() {
				 if (!name_reg.test($("#duty").val())) {
					layer.msg("请正确输入职务",{icon:2,time:1000});
					$("#duty").focus();		
				}else if(!username_reg.test($("#username").val())){
					layer.msg("请正确输入姓名",{icon:2,time:1000});
					$("#username").focus();		
				}/* else if(!password_reg.test($("#password").val())){
					layer.msg("请正确输入密码",{icon:2,time:1000});
					$("#password").focus();		
				} */else if(!idCard_judge.test($("#idCard").val())){				
					layer.msg("请输入18位身份证号码",{icon:2,time:1000});
					$("#idCard").focus();		
				}else if(!phone_reg.test($("#phone").val())){
					layer.msg("请正确填写手机号",{icon:2,time:1000});
					$("#phone").focus();		
				}else if($("#healthCertificateCode").val() == ""){
					layer.msg("请输入健康证编号",{icon:2,time:1000});
					$("#healthCertificateCode").focus();		
				}else if($("#preview").attr('src') == ""){
					layer.msg("请输入上传健康证",{icon:2,time:1000});
					$("#preview").focus();		
				}else{ 		
					var we8 = layerloadingOpen();
				 	var formData = new FormData();
				 	var path = $("#preview").attr('src');
				 	console.log(path.substring(0,5));
				 	if(path.substring(0,5) == "data:"){
				 		formData.append('unimg',dataURLtoFile($("#preview").attr('src'),"we.jpg"));
				 	}
				 	formData.append('id',$("#id").val());
					formData.append('duty',$("#duty").val());
					formData.append('username',$("#username").val());
					/* formData.append('password',$("#password").val()); */
					formData.append('idCard',$("#idCard").val());
					formData.append('age',$("#age").val());
					formData.append('phone',$("#phone").val());
					formData.append('healthCertificateCode',$("#healthCertificateCode").val());		
					formData.append('healthCertificate',$("#healthCertificate").val());	
					 $.ajax({
						 url: '${pageContext.request.contextPath}/wap_user/update',
				          type: 'POST',
				          cache: false,
				          data: formData,				        
				          processData: false,
				          contentType: false,
							"success" : function(obj) {
								layer.close(we8);
								if (obj.state == 0) {
									layer.msg(obj.message,{icon:2,time:1000});
									return;				
								}else{					
									layer.msg(obj.message,{icon:1,time:1000});
									location.href = "${pageContext.request.contextPath}/wap_user/user_pcenter?id=${user.id}";
								}				
							}
						}); 
					}
		     	});
		</script>
	<c:import url="public/footer.jsp"></c:import>
	</body>

</html>
