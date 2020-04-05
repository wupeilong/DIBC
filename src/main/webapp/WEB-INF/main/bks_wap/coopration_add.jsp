<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>云监食安系统企业注册页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>		
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head>
	<body class="bg-info container">
		<div class="container">			
					<div class="login_form1 inputbox margin-top3 margin-bot2 cur">
						<h5 class="fonwei margin-bot2">企业信息：</h5>
						<div class="input-group form-group">
						  <span class="input-group-addon">企业名称</span>
						  <input type="text" class="form-control box-shadow0" id="unitName" name="unitName" placeholder="请输入企业名称 " aria-describedby="sizing-addon1">
						</div>
						<div class="input-group form-group">
						  <span class="input-group-addon" >统一社会信用代码</span>
						  <input type="text" class="form-control box-shadow0" id="businessLicenseCode" name="businessLicenseCode" placeholder="请输入统一社会信用代码" aria-describedby="sizing-addon1">
						</div>
						<div class="fsa border-bottom">							
							<div class="margin-bot2">								 
								<div class="fc">
									<div class="upload_imgs">
										<div class="fc tip_text">
											<div class="text-info">
												<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
												<div class="text-center">上传营业执照</div>
											</div>
										</div>
										<input type="file" name="" id="fileinput" value="" accept="image/*"/>
										<img src="" id="preview">
									</div>
								</div>			
							</div>
							<div class="margin-bot2">
								  <div class="fc">
								  	<div class="upload_imgs">
										<div class="fc tip_text">
											<div class="text-info">
												<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
												<div class="text-center">上传食品许可证</div>
											</div>
										</div>
										<input type="file" name="" id="fileinput1" value="" accept="image/*"/>
										<img src="" id="preview1">
									</div>
								  </div>
							</div>
						</div>	
						<div class="input-group form-group">
						  <span class="input-group-addon">企业类型</span>
						  	<select id="unitType" name="unitType" style=" height: 28px;">
								<option value="0">请选择企业类型</option>								
								<option value="2">学校</option>
								<option value="3">餐饮业</option>
								<option value="4">其他</option>
							</select>
						</div>
						<div class="text-center margin-top2 margin-bot2"><button type="button" class="btn btn-primary form-control" id="register" value="注册">注册</button></div>
					</div>
				</form>
				
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
		<script>
		
			var password_reg = /[a-zA-Z0-9]{6,12}/;
		  	var phone_reg = /(^1[3|4|5|7|8|9]\d{9}$)|(^09\d{8}$)/;
		  	var username_reg = /^[\u4E00-\u9FA5]{2,6}$/;	
		  	var name_reg = /^[\u0391-\uFFE5]+$/;
			var idCard_judge = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
			var age_reg = /^[0-9]{1,3}/; 
			$("#register").click(function() {			 	
				if($("#unitName").val() == ""){
					layer.msg("请输入企业名称",{icon:2,time:1000});
					$("#unitName").focus();	
				}else if (!password_reg.test($("#businessLicenseCode").val())) {
					layer.msg("请正确输入社会统一信用代码",{icon:2,time:1000});
					$("#businessLicenseCode").focus();		
				}else if($("#preview").attr('src') == ""){
					layer.msg("请上传营业执照",{icon:2,time:1000});							
				}else if($("#preview1").attr('src') == ""){
					layer.msg("请上传许可证照",{icon:2,time:1000});							
				}else if($("#unitType").val() == 0){
					layer.msg("请选择企业类型",{icon:2,time:1000});
					$("#unitType").focus();		
				}else{
					var we3 = layerloadingOpen();
					var formData = new FormData();
					formData.append('unitName',$("#unitName").val());	
					formData.append('businessLicenseCode',$("#businessLicenseCode").val());
					formData.append('businessLicense',dataURLtoFile($("#preview").attr('src'),"we.jpg"));
					formData.append('productionLicense',dataURLtoFile($("#preview1").attr('src'),"we.jpg"));				
					formData.append('unitType',$("#unitType").val());		
					 $.ajax({
						 url: '${pageContext.request.contextPath}/wap_create_bind_unit',
				          type: 'POST',
				          cache: false,				          
				          data: formData,				        
				          processData: false,
				          contentType: false,
							"success" : function(obj) {
								layer.close(we3);
								if (obj.state == 0) {
									layer.msg(obj.message,{icon:2,time:1000});									 
									return;				
								}else{					
									layer.msg(obj.message,{icon:1,time:1000},function(){layer_close();});
									setTimeout(function (){							 
										window.location.href = "${pageContext.request.contextPath}/wap_login";
									}, 3000);
								}								
							}
						}); 
				}
			})			
			
			$("#fileinput").on("change",function() {
				intoBase64("fileinput","preview");						
			})
			$("#fileinput1").on("change",function() {						
				intoBase64("fileinput1","preview1");
			})
		</script>		
	</body>
</html>
