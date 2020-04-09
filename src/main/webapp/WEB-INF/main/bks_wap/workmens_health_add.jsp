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
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>	
</head>
	<body class="contain">
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="javascript:history.go(0)" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>					
				</div>
			</div>
			<div class="bannerPane">
				<div class="overlay"></div>
				<div class="s-banner-content">
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
			</div>					
		</div> 
		<main class="main margin-top padding-side05">
			<form action="" method="" class="clearfix" id="hygiene_form">
				<div class="margin-bot2">
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>姓名</span>
					  <div class="form-control box-shadow0 border0">${user.username}</div>
					  <input type="hidden" id="userId" name="userId" value="${user.id}">
					  <input type="hidden" id="username" name="username" value="${user.username}">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>测温日期</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" readonly="readonly" id="dailyTime" name="dailyTime" peplaceholder="请输入姓名" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>体测温度</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="celsius" name="celsius"  aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>发热</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="fever" name="fever" value="无" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>腹泻</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="diarrhea" name="diarrhea" value="无" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>伤口化脓</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="woundsFester" name="woundsFester" value="无" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>个人卫生</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="hygiene" name="hygiene" value="无" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid"> </i>备注</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="remark" name="remark" value="无" aria-describedby="sizing-addon1">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>上传时间</span>
					  <input type="text" class="form-control box-shadow0 border-bottom" id="uploadTime" readonly="readonly" name="uploadTime" placeholder="请输入姓名" aria-describedby="sizing-addon1">
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
				<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
				<script type="text/javascript">
					$("#fileinput").on("change",function() {
						intoBase64("fileinput","preview");
					})
				 	function datetime() {
						 var now = new Date();
						 document.getElementById("dailyTime").value = now.getFullYear() + "-"
						 + (now.getMonth() + 1) + "-" + now.getDate();
						/*  document.getElementById("uploadTime").value = " " + now.getHours() + ":"
						 + now.getMinutes() + ":" + now.getSeconds(); */
					}
					window.setInterval("datetime()", 1000);  
					setInterval(
							"document.getElementById('uploadTime').value=new Date().toLocaleString()+'  星期'+'日一二三四五六'.charAt(new Date().getDay());",
							1000);
			
			</script>
			</div>
				</div>
			</form>
			
			<div class="margin-top2 margin-bot2">
				<button type="button" class="btn btn-primary form-control" onclick="save()">提交</button>
			</div>
		</main>		
	<c:import url="public/footer.jsp"></c:import>
	</body>
<script type="text/javascript">
function save(){	
		if($("#celsius").val() == ""){
			layer.msg("请输入你的体温",{icon:2,time:1000});
			$("#celsius").focus();		
		}else if ($("#fever").val() == "") {
			layer.msg("信息不能为空",{icon:2,time:1000});
			$("#fever").focus();		
		}else if($("#diarrhea").val() == ""){
			layer.msg("信息不能为空",{icon:2,time:1000});
			$("#diarrhea").focus();		
		}else if($("#woundsFester").val() == ""){
			layer.msg("信息不能为空",{icon:2,time:1000});
			$("#woundsFester").focus();		
		}else  if($("#hygiene").val() == ""){
			layer.msg("信息不能为空",{icon:2,time:1000});
			$("#hygiene").focus();		
		}else if($("#remark").val() == ""){
			layer.msg("信息不能为空",{icon:2,time:1000});
			$("#remark").focus();		
		}else if($("#preview").attr('src') == ""){
			layer.msg("请上传你的健康码",{icon:2,time:1000});	
			$("#preview").focus();
		}else{
			var we7 = layerloadingOpen();
			var formData = new FormData();	
			var data=$("#hygiene_form").serialize()
			formData.append('healthCodePhoto',dataURLtoFile($("#preview").attr('src'),"we.jpg"));
			formData.append('userId',$("#userId").val());	
			formData.append('username',$("#username").val());	
			formData.append('dailyTime',$("#dailyTime").val());	
			formData.append('celsius',$("#celsius").val());	
			formData.append('fever',$("#fever").val());	
			formData.append('diarrhea',$("#diarrhea").val());	
			formData.append('woundsFester',$("#woundsFester").val());	
			formData.append('hygiene',$("#hygiene").val());	
			formData.append('remark',$("#remark").val());		
			 $.ajax({
				 url: '${pageContext.request.contextPath}/wap_user/workmens_health_regadd',
		          type: 'POST',
		          cache: false,
		          data: formData,				        
		          processData: false,
		          contentType: false,
					"success" : function(obj) {
						layer.close(we7);
						if (obj.state == 0) {
							layer.msg(obj.message,{icon:2,time:1000});
							return;				
						}else{					
							layer.msg(obj.message,{icon:1,time:1000},function(){location.href = '${pageContext.request.contextPath}/wap_user/workmens_health?userId=' + ${user.id}});
						}
						
					}
				}); 
		}	
}
</script>
</html>
