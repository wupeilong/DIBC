<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>企业信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>	
</head>
	<body class="contain">
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="${pageContext.request.contextPath}/wap_home" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>
					<div class="header-btn text-right">
						<button type="button" id="update" class="btn btn-primary" id="register">保存</button>
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
		<!-- <div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
			</div>
		</div> -->
		<main class="main padding-side">
			<form action="" method="post" class="cooperation_detal">
				<fieldset>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">企业名称</span>
					  <input type="hidden" id="unitId" value="${detailUnit.unitId}"/>
					  <input type="" class="form-control box-shadow0 border0" name="unitName" id="unitName" value="${detailUnit.unitName}" placeholder="请输入企业名称"/>
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">统一社会信用代码</span>
					  
					  <input type="" class="form-control box-shadow0 border0" name="businessLicenseCode" id="businessLicenseCode" value="${detailUnit.businessLicenseCode}" placeholder="请输入企业统一社会信用代码"/>
					</div>
					<div class="fsa">							
						<div class="margin-bot2">								 
							<div class="fc">
								<div class="upload_imgs">
									<div class="fc tip_text">
										<div class="text-info">
											<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
											<div class="text-center">上传营业执照</div>
										</div>
									</div>
									<input type="file" name="" id="fileinput" value="" accept="image/*" />
									<c:if test="${detailUnit.businessLicense != null}">
										<img src="${pageContext.request.contextPath}${detailUnit.businessLicense}" id="preview">
									</c:if>
									<c:if test="${detailUnit.businessLicense == null}">
										<img src="" id="preview">
									</c:if>
								</div>
							</div>			
						</div>
						<div class="margin-bot2">
							  <div class="fc">
							  	<div class="upload_imgs">
									<div class="fc tip_text">
										<div class="text-info">
											<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
											<div class="text-center">上传经营许可证</div>
										</div>
									</div>
									<input type="file" name="" id="fileinput1" value="" accept="image/*"/>
									<c:if test="${detailUnit.productionLicense != null}">
										<img src="${pageContext.request.contextPath}${detailUnit.productionLicense}" id="preview1">
									</c:if>
									<c:if test="${detailUnit.productionLicense == null}">
										<img src="" id="preview1">
									</c:if>
								</div>
							  </div>
						</div>
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">营业地址</span>
					  <input type="" class="form-control box-shadow0 border0" name="unitAddress" id="unitAddress" value="${detailUnit.unitAddress}" placeholder="请输入企业营业地址"/>
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">企业类型</span>
					  <select class="form-control box-shadow0 border0" name="unitType" id="unitType">
						  <c:if test="${detailUnit.unitType == 1}">
						  		<option value="1" selected="selected">监管局</option>
						  </c:if>
						  <c:if test="${detailUnit.unitType != 1}">
						  		<c:if test="${detailUnit.unitType == 2}">
						  			<option value="2" selected="selected">学校</option>
									<option value="3">餐饮业</option>
									<option value="4">其他</option>
						  		</c:if>
						  		<c:if test="${detailUnit.unitType == 3}">
						  			<option value="2">学校</option>
									<option value="3" selected="selected">餐饮业</option>
									<option value="4">其他</option>
						  		</c:if>
						  		<c:if test="${detailUnit.unitType == 4}">
						  			<option value="2">学校</option>
									<option value="3">餐饮业</option>
									<option value="4" selected="selected">其他</option>
						  		</c:if>
						  </c:if>						  	
					  </select>
					</div>					
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">法人姓名</span>
					  <input type="" class="form-control box-shadow0 border0" name="legalPerson" id="legalPerson" value="${detailUnit.legalPerson}" placeholder="请输入法人代表姓名"/>
					</div>
				  </fieldset>			
		</main>	
		
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
		<script type="text/javascript">
			
		</script>
	<c:import url="public/footer.jsp"></c:import>
	</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
<script type="text/javascript">
	var password_reg = /[a-zA-Z0-9]{6,12}/;
  	var phone_reg = /(^1[3|4|5|7|8|9]\d{9}$)|(^09\d{8}$)/;
  	var username_reg = /^[\u4E00-\u9FA5]{2,6}$/;	
  	var name_reg = /^[a-zA-Z0-9\u0391-\uFFE5]+$/;
	var idCard_judge = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
	$("#update").click(function() {			 	
		if(!name_reg.test($("#unitName").val())){
			layer.msg("请正确输入企业名称",{icon:2,time:1000});
			$("#unitName").focus();		
		}else if ($("#businessLicenseCode").val() != "" && !password_reg.test($("#businessLicenseCode").val())) {
			layer.msg("请正确输入社会统一信用代码",{icon:2,time:1000});
			$("#businessLicenseCode").focus();		
		}/* else if($("#preview").attr('src') == ""){
			layer.msg("请上传营业执照",{icon:2,time:1000});							
		}else if($("#preview1").attr('src') == ""){
			layer.msg("请上传食品许可证",{icon:2,time:1000});							
		} */else if($("#unitType").val() == 0){
			layer.msg("请选择企业类型",{icon:2,time:1000});
			$("#unitType").focus();		
		}else  if($("#unitAddress").val() == ""){
			layer.msg("请正确填写营业地址",{icon:2,time:1000});
			$("#unitAddress").focus();		
		}else if($("#legalPerson").val() != "" && !username_reg.test($("#legalPerson").val())){
			layer.msg("请填写法人姓名",{icon:2,time:1000});
			$("#legalPerson").focus();		
		}else{
			console.log("asdasdas");
			var we8 = layerloadingOpen();
			var formData = new FormData();
			formData.append('unitName',$("#unitName").val());	
			formData.append('businessLicenseCode',$("#businessLicenseCode").val());
			if($("#preview").attr('src').substring(0,5) == "data:"){
				formData.append('businessLicense',dataURLtoFile($("#preview").attr('src'),"we.jpg"));
			}
			if($("#preview1").attr('src').substring(0,5) == "data:"){
				formData.append('productionLicense',dataURLtoFile($("#preview1").attr('src'),"we.jpg"));
			}
			formData.append('unitAddress',$("#unitAddress").val());					
			formData.append('unitType',$("#unitType").val());
			formData.append('legalPerson',$("#legalPerson").val());					
			 $.ajax({
				 url: '${pageContext.request.contextPath}/wap_unit/update',
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
							layer.msg(obj.message,{icon:1,time:1000} ,function(){
								location.href = "${pageContext.request.contextPath}/wap_unit/coopration_detal?unitId=" + $("#unitId").val(); 
							});							
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
</html>
