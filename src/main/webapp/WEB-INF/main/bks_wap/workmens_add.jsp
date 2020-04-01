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
			<form action="" method="" class="clearfix">
				<div class="workmens_info_top margin-bot">
					<%-- <div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>所属企业</span>
					  <div class="form-control box-shadow0 border0">${user.unitName}</div>					 
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>身份证号</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="idCard" name="idCard" value="" placeholder="请输入身份证号" aria-describedby="sizing-addon1">
					</div>--%>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>手&ensp;机&ensp;号</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="phone" name="phone" placeholder="请输入手机号" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>职&ensp;&ensp;&ensp;&ensp;务</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="duty" name="duty" placeholder="请输入职务" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>姓&ensp;&ensp;&ensp;&ensp;名</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="username" name="username" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<!-- <div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>密&ensp;&ensp;&ensp;&ensp;码</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="password" name="password" placeholder="请输入密码" aria-describedby="sizing-addon1">
					</div>					
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>年&ensp;&ensp;&ensp;&ensp;龄</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="age" name="age" placeholder="请输入年龄" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>健康证编号</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="healthCertificateCode" name="healthCertificateCode" placeholder="请输入健康证编号" aria-describedby="sizing-addon1">
					</div> -->
				</div>
				
			<!-- 	<div class="">
					<div class="fc">
						<div class="upload_imgs">
							<div class="fc tip_text">
								<div class="text-info">
									<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
									<div class="text-center">上传图片</div>
								</div>
							</div>
							<input type="file" name="" id="fileinput" value="" accept="image/*"/>
							<img src="" id="preview">
						</div>
					</div>
				</div>			 -->	
			</form>
			
			<div class="margin-top2 margin-bot2">
				<button type="button" class="btn btn-primary form-control" id="register">保存</button>
			</div>
		</main>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>		
		<script type="text/javascript">
		/* 	$("#fileinput").on("change",function() {
				intoBase64("fileinput","preview");
			})		 */	
			var password_reg = /[a-zA-Z0-9]{6,12}/;
		  	var phone_reg = /(^1[3|4|5|7|8|9]\d{9}$)|(^09\d{8}$)/;
		  	var username_reg = /^[\u4E00-\u9FA5]{2,6}$/;	
		  	var name_reg = /^[\u0391-\uFFE5]+$/;
			var idCard_judge = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
			var age_reg = /^[0-9]{1,3}/; 
			 $('#register').click(function() {
				 if ($("#duty").val() == "") {
					layer.msg("请正确输入职务",{icon:2,time:1000});
					$("#duty").focus();		
				}else if($("#username").val() == ""){
					layer.msg("请正确输入姓名",{icon:2,time:1000});
					$("#username").focus();		
				}/* else if(!password_reg.test($("#password").val())){
					layer.msg("请正确输入密码",{icon:2,time:1000});
					$("#password").focus();		
				}else if(!idCard_judge.test($("#idCard").val())){				
					layer.msg("请输入18位身份证号码",{icon:2,time:1000});
					$("#idCard").focus();		
				} */else if(!phone_reg.test($("#phone").val())){
					layer.msg("请正确填写手机号",{icon:2,time:1000});
					$("#phone").focus();		
				}/* else if($("#healthCertificateCode").val() == ""){
					layer.msg("请输入健康证编号",{icon:2,time:1000});
					$("#healthCertificateCode").focus();		
				}else if($("#preview").attr('src') == ""){
					layer.msg("请输入上传健康证",{icon:2,time:1000});
					$("#preview").focus();		
				}else if(age_reg.test($("#age").val())){
					layer.msg("请正确输入年龄",{icon:2,time:1000});
					$("#age").focus();		
				} */else{ 		
					var we2 = layerloadingOpen();
				 	var formData = new FormData();				
					/* formData.append('unimg',dataURLtoFile($("#preview").attr('src'),"we.jpg"));*/
					formData.append('duty',$("#duty").val()); 
					formData.append('username',$("#username").val());
					formData.append('password',$("#phone").val().substring(5,11));
					/* formData.append('idCard',$("#idCard").val());
					formData.append('age',$("#age").val()); */
					formData.append('phone',$("#phone").val());
					/* formData.append('healthCertificateCode',$("#healthCertificateCode").val());	 */			
					 $.ajax({
						 url: '${pageContext.request.contextPath}/wap_user/workmens_reg',
				          type: 'POST',
				          cache: false,
				          data: formData,				        
				          processData: false,
				          contentType: false,
							"success" : function(obj) {
								layer.close(we2);
								if (obj.state == 0) {
									layer.msg(obj.message,{icon:2,time:1000});
									return;				
								}else{					
									layer.msg(obj.message,{icon:1,time:1000});
									location.href = "${pageContext.request.contextPath}/wap_user/workmens";
								}				
							}
						}); 
					}
		     	});		
		</script>
	<c:import url="public/footer.jsp"></c:import>
	</body>

</html>
