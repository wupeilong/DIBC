<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>配送信息添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/ajaxfileupload.js"></script>	
	<style type="text/css">
		.searchable-select-dropdown{z-index:9;}
	</style>
</head>
	<body class="contain">
		<!-- <div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
			</div>
		</div> -->
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="javascript:history.go(0)" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>
					<div class="header-btn text-right">
						<c:if test="${user.type == 2}">
							<a href="${pageContext.request.contextPath}/wap_dry/delivery_add" class="btn btn-primary">提交</a>
						</c:if>
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
		<main class="main padding-side05">
			<form action="" method="post" class="delivery_add margin-top">
				<fieldset>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>配餐类型</span>
					  <!-- <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1"> -->
					  <select id="type" class="width100 box-shadow0 border-bottom">		
						<option value="">请选择送餐类型</option>					
						<option value="1">早餐</option>
						<option value="2">午餐</option>
						<option value="3">晚餐</option>
					  </select>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>配餐单位</span>
					  <%-- <input type="text" class="form-control box-shadow0 border-bottom" name="account" value="${user.unitName }" aria-describedby="sizing-addon1"> --%>
						<select id="mealsUnitName">
								<option value="">请选择送餐企业</option>
								<c:forEach items="${unitList}" var="item">								
									<option value="${item.unitId}">${item.unitName}</option>
								</c:forEach>							
						</select>
						<a href="javascript:;" class="btn btn-primary"></a>
					</div>
									
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>订餐单位</span>
					  <input type="text" class="width100 box-shadow0 border-bottom" name="acceptance_unit_name" value="${user.unitName }" readonly>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>送餐人</span>
					  <input type="text" class="width100 box-shadow0 border-bottom" name="meals_user_name" value="${user.username }" >
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>配送地址</span>
					  <input type="text" class="width100 box-shadow0 border-bottom" name="address" id="address" placeholder="请输入配送地址">
					</div>
					<div class="fsa margin-bot2">
						<div class="">
							<div class="fc">
								<div class="upload_imgs margin_tb10">
									<div class="fc tip_text">
										<div class="text-info">
											<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
											<div class="text-center">送餐装箱图</div>
										</div>
									</div>
									<input type="file" name="" id="fileinput" value="" accept="image/*"/>
									<img src="" id="preview">
								</div>
							</div>
						</div>
						<div class="">
							<div class="fc">
								<div class="upload_imgs margin_tb10">
									<div class="fc tip_text">
										<div class="text-info">
											<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
											<div class="text-center">装箱封条图</div>
										</div>
									</div>
									<input type="file" name="" id="fileinput1" value="" accept="image/*"/>
									<img src="" id="preview1">
								</div>
							</div>
						</div>
						<div class="">
							<div class="fc">
								<div class="upload_imgs margin_tb10">
									<div class="fc tip_text">
										<div class="text-info">
											<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
											<div class="text-center">送餐车图</div>
										</div>
									</div>
									<input type="file" name="" id="fileinput2" value="" accept="image/*"/>
									<img src="" id="preview2">
								</div>
							</div>
						</div>
					</div>
				  </fieldset>
			</form>
		</main>		
	<c:import url="public/footer.jsp"></c:import>
	</body>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
	<script type="text/javascript">
	$(function () {		
		$('select').searchableSelect();
	    $('#fileinput').on('change',function () {	    	
	    	intoBase64("fileinput","preview");	    	
	    });	 
	    $('#fileinput1').on('change',function () {
	    	intoBase64("fileinput1","preview1");	        
	    });
	    $('#fileinput2').on('change',function () {
	    	intoBase64("fileinput2","preview2");	        
	    });
	  //新增图片
		$("#add").click(function() {
			if($("#preview").attr('src') == ""){
				layer.msg("请上传送餐装箱照",{icon:2,time:1000});
				$("#preview").focus();
			}else if($("#preview1").attr('src') == ""){
				layer.msg("请上传装箱封条照",{icon:2,time:1000});
				$("#preview1").focus();
			}else if($("#preview2").attr('src') == ""){
				layer.msg("请上传送餐车照",{icon:2,time:1000});
				$("#preview2").focus();
			}else if($("#mealsUnitName").val() == ""){
				layer.msg("请选择供配餐企业",{icon:2,time:1000});
				$("#mealsUnitName").focus();
			}else if($("#address").val() == ""){
				layer.msg("请填写配送地址",{icon:2,time:1000});
				$("#address").focus();
			}else if($("#type").val() == ""){
				layer.msg("请填写配餐类型",{icon:2,time:1000});
				$("#type").focus();
			}else{ 				
				var loadingindex = layerloadingOpen();
				var formData = new FormData();				
				formData.append('type',$("#type").val());//送餐类型
				formData.append('mealsUnitId',$("#mealsUnitName").val());//供餐企业
				formData.append('mealsUnitName',$("#mealsUnitName option:selected").text());//供餐企业
				formData.append('acceptanceUnitName','${user.unitName}');//订餐企业
				formData.append('mealsUserName','${user.username}');//订餐企业
				formData.append('packingPhoto',dataURLtoFile($("#preview").attr('src'),'dsf.jpg'));//送餐装箱图
				formData.append('sealPhoto',dataURLtoFile($("#preview1").attr('src'),'dsf1.jpg'));//装箱封条图
				formData.append('carPhoto',dataURLtoFile($("#preview2").attr('src'),'dsf2.jpg'));//送餐车图
				formData.append('address',$("#address").val());//送餐地址
				$.ajax({
					 url: "${pageContext.request.contextPath}/wap_dry/add",
			          type: 'POST',
			          cache: false,
			          data: formData,				        
			          processData: false,
			          contentType: false,
						"success" : function(obj) {
							if (obj.state == 0) {
								layer.close(loadingindex);
								layer.msg(obj.message,{icon:2,time:1000});								
								return;				
							}else{
								layer.close(loadingindex);
								layer.msg(obj.message,{icon:1,time:1000});
								
								//延时刷新页面
								setTimeout(function (){							 
									window.location.href = "${pageContext.request.contextPath}/wap_dry/delivery";
								}, 3000);	
							}
							
						}
				});
			}
		});	
	})					
	</script>
</html>
