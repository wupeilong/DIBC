<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>健康信息添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
			</div>
		</div>
		<main class="main margin-top padding-side05">
			<form action="" method="" class="clearfix">
				<div class="margin-bot2">
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>姓名</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>测温日期</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>体测温度</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>发热</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>腹泻</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>伤口化脓</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>个人卫生</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>备注</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>上传时间</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" name="account" placeholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="margin-top">
				<div class="fc">
					<div class="upload_imgs">
						<div class="fc tip_text">
							<div class="text-info">
								<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
								<div class="text-center">上传健康码</div>
							</div>
						</div>
						<input type="file" name="" id="fileinput" value="" accept="image/*"/>
						<img src="" id="preview">
					</div>
				</div>
				<script type="text/javascript">
					$("#fileinput").on("change",function() {
						changepic("fileinput","preview");
					})
					
					function changepic(fid,img_id) {
						 var reads = new FileReader();
						 f = document.getElementById(fid).files[0];
						 reads.readAsDataURL(f);
						 reads.onload = function(e) {
						 document.getElementById(img_id).src = this.result;
						 $("#"+img_id).css("display", "block");
						 };
					}
				</script>
			</div>
				</div>
			</form>
			
			<div class="margin-top2 margin-bot2">
				<button type="button" class="btn btn-primary form-control">提交</button>
			</div>
		</main>		
	<c:import url="public/footer.jsp"></c:import>
	</body>

</html>
