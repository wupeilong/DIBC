<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>添加多频检查记录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>		
</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
			</div>
		</div>
		<main class="main margin-top2 padding-side05">
			<form action="" method="post" class="detection_add padding-side">
				<fieldset>
				    <legend class="">检测详情:</legend>
					<div class="border-bottom margin-bot2">
						<div class="input-group form-group fs">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>检测对象</span>
						  <div class="form-control padding0 box-shadow0 border0">
							  <div class="">
							  	<!-- <a href="" class="btn bg-primary padding-side"><i class="fa fa-search"></i></a> -->
							  	<select id="unit_list"">
										<option value="0">请选择企业信息</option>
										<c:forEach items="${unitList}" var="item">								
											<option value="${item.unitId}">${item.unitName}</option>
										</c:forEach>							
								</select>
							  	<script>
							  	
							  	$('#unit_list').searchableSelect({
									"afterSelectItem":function(){
										
									}
								});
								
							  	</script>
							  </div>
						  </div>
						  <!-- <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1"> -->
						</div>
						<div class="input-group form-group fs">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>检测时间</span>
						  <div class="box-shadow0 width100 border-bottom">
					 		<jsp:useBean id="now" class="java.util.Date" scope="page"/>
							<fmt:formatDate value="${now}" pattern="yyyy年MM月dd日" />
						  </div>
						</div>
						<div class="input-group form-group fs">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>样&ensp;品&ensp;名</span>
						  <input type="text" class="box-shadow0 width100 border-bottom" id="samplName" name="samplName" placeholder="请输入样品名" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group form-group fs">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>包装分类</span>
						  <input type="text" class="width100 box-shadow0 border-bottom" id="specifications" name="specifications" placeholder="请输入包装分类" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group form-group fs">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>抽检批次</span>
						  <input type="text" class="width100 box-shadow0 border-bottom" id="bath" name="bath" placeholder="请输入抽检批次" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group form-group fs">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>检测项目</span>
						  <input type="text" class="width100 box-shadow0 border-bottom" id="item" name="item" placeholder="请输入检测项目" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group form-group fs">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>检测结果</span>
						  <input type="text" class="width100 box-shadow0 border-bottom" id="result" name="result" placeholder="请输入检测结果" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group form-group fs">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>备&ensp;&ensp;&ensp;&ensp;注</span>
						  <input type="text" class="width100 box-shadow0 border-bottom" id="remark" name="remark" placeholder="请输入备注" aria-describedby="sizing-addon1">
						</div>
					</div>
					<div class="margin-top">
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
					</div>
					
				  </fieldset>
			</form>
			<div class="margin-top2 margin-bot2">
				<button type="button" class="btn btn-primary form-control" id="detection">提交</button>
			</div>
		</main>		
	<c:import url="public/footer.jsp"></c:import>
	</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
<script type="text/javascript">
$("#detection").click(function() {	
	if($("#unit_list").val() == 0){
		layer.msg("请选择检查对象",{icon:2,time:1000});			
	}else if($("#samplName").val() == ""){
		layer.msg("请输入样品名",{icon:2,time:1000});
		$("#samplName").focus();		
	}else if ($("#specifications").val() == "") {
		layer.msg("请输入包装分类",{icon:2,time:1000});
		$("#specifications").focus();		
	}else if($("#bath").val() == 0){
		layer.msg("请输入抽检批次",{icon:2,time:1000});
		$("#bath").focus();		
	}else  if($("#item").val() == ""){
		layer.msg("请输入检测项目",{icon:2,time:1000});
		$("#item").focus();		
	}else if($("#result").val() == ""){
		layer.msg("请输入检测结果",{icon:2,time:1000});
		$("#result").focus();		
	}else if($("#remark").val() == ""){
		layer.msg("请输入备注",{icon:2,time:1000});
		$("#remark").focus();		
	}else if($("#preview").attr('src') == ""){
		layer.msg("请上传过程图片",{icon:2,time:1000});				
	}else{
		var we5 = layerloadingOpen();
		var formData = new FormData();				
		formData.append('unitId',$("#unit_list").val());
		formData.append('unitName',$("#unitName").val());
		formData.append('samplName',$("#samplName").val());
		formData.append('specifications',$("#specifications").val());
		formData.append('bath',$("#bath").val());
		formData.append('item',$("#item").val());
		formData.append('result',$("#result").val());
		formData.append('remark',$("#remark").val());
		formData.append('detectionPhoto',dataURLtoFile($("#preview").attr('src'),"we.jpg"));						
		 $.ajax({
			 url: 'detection_regadd',
	          type: 'POST',
	          cache: false,
	          data: formData,				        
	          processData: false,
	          contentType: false,
				"success" : function(obj) {
					layer.close(we5);
					if (obj.state == 0) {
						layer.msg(obj.message,{icon:2,time:1000});
						return;				
					}else{					
						layer.msg(obj.message,{icon:1,time:1000});
						location.href = "${pageContext.request.contextPath}/detection/detection_add";
					}
					
				}
			}); 
	}
})

	$("#fileinput").on("change",function() {
		intoBase64("fileinput","preview");
	})
</script>
</html>
