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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
			</div>
		</div>
		<main class="main margin-top2 padding-side">
			<form action="" method="post" class="cooperation_detal">
				<div class="border-bottom margin-top">
					<div class="fb padding-side05 sb margin-bot">
						<div class="item_name fonwei">企业信息</div>
						<div class="">
							<span><a href="user_update.html"><i class="fa fa-edit"></i></a></span>
						</div>
					</div>
				</div>
				<fieldset>
				    <!-- <legend>企业信息:</legend> -->
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">企业名称</span>
					  <input type="" class="form-control box-shadow0 border0" name="" id="" value="${unitDetail.unitName}" placeholder="请输入企业名称"/>
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">统一社会信用代码</span>
					  <div class="form-control box-shadow0 border0">${unitDetail.businessLicenseCode}</div>
					  <input type="" class="form-control box-shadow0 border0" name="" id="" value="${unitDetail.businessLicenseCode}" placeholder="请输入企业统一社会信用代码"/>
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
											<div class="text-center">上传经营许可证</div>
										</div>
									</div>
									<input type="file" name="" id="fileinput1" value="" accept="image/*"/>
									<img src="" id="preview1">
								</div>
							  </div>
						</div>
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">营业地址</span>
					  <input type="" class="form-control box-shadow0 border0" name="" id="" value="${unitDetail.unitAddress}" placeholder="请输入企业营业地址"/>
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">企业类型</span>
					  <select class="form-control box-shadow0 border0" name="">
					  	<option value="">监管局</option>
						<option value="">学校</option>
						<option value="">食品企业</option>
					  </select>
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">企业类型</span>
					  <c:choose>
					  	<c:when test="${unitDetail.unitType == 1}">
					  		<div class="form-control box-shadow0 border0">监管局</div>
					  	</c:when>
					  	<c:when test="${unitDetail.unitType == 2}">
					  		<div class="form-control box-shadow0 border0">学校</div>
					  	</c:when>
					  	<c:when test="${unitDetail.unitType == 3}">
					  		<div class="form-control box-shadow0 border0">餐饮业</div>
					  	</c:when>
					  	<c:when test="${unitDetail.unitType == 4}">
					  		<div class="form-control box-shadow0 border0">其他</div>
					  	</c:when>
					  </c:choose>
					  
					</div>
					<div class="input-group form-group fs border-bottom">
					  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">法人姓名</span>
					  <input type="" class="form-control box-shadow0 border0" name="" id="" value="${unitDetail.legalPerson}" placeholder="请输入法人代表姓名"/>
					</div>
				  </fieldset>
				 <!-- <div class="margin-top2">
				  	<div>
			　　　　　　<input type="file" accept="image/*">
			　　　　　　<input type="file" accept="video/*" capture="camcorder">
			　　　　</div>
				  </div> -->
				  
			</form>
			<!-- <div class="margin-top2 margin-bot2">
				<button type="button" class="btn btn-primary form-control">保存</button>
			</div> -->
		</main>		
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
		<script type="text/javascript">
			var $current = $("fieldset");		
			$current.find("img").bind("click",function(){
				var path=$(this).attr('src');			
				layerImg(path);
			});	
			layui.use('upload', function(){
			  var $ = layui.jquery
			  ,upload = layui.upload;
			  
			  //普通图片上传
			  var uploadInst = upload.render({
			    elem: '#test1'
			    ,url: 'https://httpbin.org/post' //改成您自己的上传接口
			    ,before: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#demo1').attr('src', result); //图片链接（base64）
			      });
			    }
			    ,done: function(res){
			      //如果上传失败
			      if(res.code > 0){
			        return layer.msg('上传失败');
			      }
			      //上传成功
			    }
			    ,error: function(){
			      //演示失败状态，并实现重传
			      var demoText = $('#demoText');
			      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			      demoText.find('.demo-reload').on('click', function(){
			        uploadInst.upload();
			      });
			    }
			  });
			  });
		</script>
	<c:import url="public/footer.jsp"></c:import>
	</body>

</html>