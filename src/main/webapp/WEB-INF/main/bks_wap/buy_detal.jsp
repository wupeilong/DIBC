<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>采购报送信息详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>	
</head>
	<body class="contain o-page p-about">
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="javascript:history.go(0)" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>
					<div class="header-btn text-right">
						<c:if test="${procurementDetail.status == 0}">
						<c:if test="${user.type  == 1 }">
							<a href="javascript:;" class="btn btn-primary form-control">未验收</a>
						</c:if>
						<c:if test="${user.type  == 2 }">
							<a href="javascript:;" class="btn btn-primary form-control" id="acceptance">确认验收</a>
						</c:if>
						</c:if>
						<c:if test="${procurementDetail.status == 1}">
							<a href="javascript:;" class="btn btn-primary form-control">已验收</a>
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
			<div class="margin-top">
				<div class="input-group form-group fs border-bottom">
				  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">供&ensp;应&ensp;商</span>
				  <div class="form-control box-shadow0 border0" style="    z-index: 0;">${procurementDetail.supplier }</div>
				</div>
				<!-- <div class="input-group form-group fs border-bottom"> -->
				  <!-- <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">供应商营业执照</span> -->
				  <!-- <div class="form-control box-shadow0 border0"> -->
				  <div class="fsa margin-bot2">	
				  	<div class="">
							<div class="fc">
								<div class="layui-upload-list">
								  <img class="layui-upload-img" src="${pageContext.request.contextPath}${procurementDetail.supplierBusinessLicense }">
								</div>
							</div>
							<div class="text-center">供应商营业执照</div>
						</div>
						<div class="">
							<div class="fc">
								<div class="layui-upload-list">
								  <img class="layui-upload-img" src="${pageContext.request.contextPath}${procurementDetail.supplierProductionLicense }">
								</div>
							</div>
							<div class="text-center">食品经营许可证</div>
						</div>
						<div class="">
							<div class="fc">
								<div class="layui-upload-list">
								  <img class="layui-upload-img" src="${pageContext.request.contextPath}${procurementDetail.supplierQualification }">
								</div>
							</div>
							<div class="text-center">经营资质</div>
						</div>
					</div>
				<div class="input-group form-group fs border-bottom">
				  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">联&ensp;系&ensp;人</span>
				  <div class="form-control box-shadow0 border0" style="    z-index: 0;">${procurementDetail.supplierPerson }</div>
				</div>
				<div class="input-group form-group fs border-bottom">
				  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">联系电话</span>
				  <div class="form-control box-shadow0 border0" style="    z-index: 0;">${procurementDetail.supplierPhone }</div>
				</div>
				<div class="input-group form-group fs border-bottom">
				  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">订&ensp;单&ensp;号</span>
				  <div class="form-control box-shadow0 border0" style="    z-index: 0;">${procurementDetail.id }</div>
				</div>
				<div class="input-group form-group fs border-bottom">
				  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">采购公司</span>
				  <div class="form-control box-shadow0 border0" style="    z-index: 0;">${procurementDetail.unitName }</div>
				</div>
				<div class="input-group form-group fs border-bottom">
				  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">采&ensp;购&ensp;人</span>
				  <div class="form-control box-shadow0 border0" style="    z-index: 0;">${procurementDetail.username }</div>
				</div>
				<div class="input-group form-group fs border-bottom">
				  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">验&ensp;收&ensp;人</span>
				  <div class="form-control box-shadow0 border0" style="    z-index: 0;">${procurementDetail.acceptanceUsername }</div>
				</div>
				<div class="">
					<table class="table table-striped table-bordered table-hover" cellspacing="" cellpadding="">
						<caption>供货明细：</caption>
						<thead>
							<tr><th>序号</th><th>商品名</th><th>数量</th><th>生产日期</th><th>验收结果</th></tr>
						</thead>
						<tbody>
							<c:forEach items="${procurementDetail.detailList}" var="item" varStatus="vs">
								<tr>	
									<td>${vs.count}</td>
									<td>${item.productName }</td>
									<td>${item.count}</td>
									<td><fmt:formatDate value="${item.productionDate}" pattern="yyyy-MM-dd" /></td>
									<td>
										<c:if test="${item.qualified == 0}">
											不合格
										</c:if>
										<c:if test="${item.qualified == 1}">
											合格
										</c:if>
										<c:if test="${item.qualified == null }">
											<select name="ys" id="${item.procurementDetailId}">
												<option value="0">不合格</option>										
												<option value="1">合格</option>												
											</select>
										</c:if>										
									</td>
								</tr>	
							</c:forEach>							
						</tbody>
					</table>
				</div>
				
				<div class="">
					  <div class="fc">
						<div class="layui-upload-list fc">
						  <img class="layui-upload-img" src="${pageContext.request.contextPath}${procurementDetail.invoice }">
						</div>
					  </div>
					  <div class="text-center">采购凭证（发票/收据）</div>
				</div>
				
			 </div>
			 
			<div class="margin-top2 margin-bot2"></div>
		</main>		
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
		<script type="text/javascript">
		var $current = $("main");		
		$current.find("img").bind("click",function(){
			var path=$(this).attr('src');			
			layerImg(path);
		});	
		//点击验收
		$("#acceptance").click(function () { 
			layer.confirm('是否确认验收？', {
				  btn: ['是', '否'] //可以无限个按钮
				}, function(index, layero){
					acceptance();
				  	//按钮【按钮一】的回调
					//layer.close(index);
				}, function(index){
				  	//按钮【按钮二】的回调
					//layer.alert("按钮二");
				});
		})
		
		function acceptance(){
			var query = new Array(); 
			var ys = document.querySelectorAll("select[name='ys']");
			for(var i = 0; i < ys.length; i++){ 			
			   query[i]=new Array(); 
			   query[i][0]=ys[i].id;       
			   query[i][1]=ys[i].value; 
			}
			var data ="result=" + JSON.stringify(query) + "&id=" + '${procurementDetail.id}';
			var url = "${pageContext.request.contextPath}/wap_pro/acceptance";
			$.ajax({
				"url" : url,
				"data" : data,
				"type" : "POST",
				"dataType" : "json",
				"success" : function(obj) {
					if (obj.state == 0) {
						layer.msg(obj.message,{icon:2,time:1000});						
					}else{
						layer.msg(obj.message,{icon:1,time:1000});							
					}		
					//延时刷新页面
					setTimeout(function (){							 
						window.location.reload();
					}, 3000);	
				}
			}); 
		}
		
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
