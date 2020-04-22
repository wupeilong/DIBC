<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>不合格记录详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
	<link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
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
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>记录单号</span>
					  <div class="form-control box-shadow0 border0">${unqualifiedDetail.id}</div>
					  <input type="hidden" id="unqualifiedId" value="${unqualifiedDetail.id}">
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>单位名称</span>
					  <div class="form-control box-shadow0 border0">${unqualifiedDetail.unitName}</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>类&ensp;&ensp;&ensp;&ensp;型</span>
					  <div class="form-control box-shadow0 border0">
					  	<c:if test="${unqualifiedDetail.type == 1}">
					  		原材料采购
					  	</c:if>
					  	<c:if test="${unqualifiedDetail.type == 2}">
					  		配餐验收
					  	</c:if>
					  	<c:if test="${unqualifiedDetail.type == 3}">
					  		商家自检
					  	</c:if>
					  	<c:if test="${unqualifiedDetail.type == 4}">
					  		监管局专检
					  	</c:if>
					  	<c:if test="${unqualifiedDetail.type == 5}">
					  		督查组专检
					  	</c:if>
					  </div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>订&ensp;单&ensp;ID</span>
					  <div class="form-control box-shadow0 border0">${unqualifiedDetail.orderId }<span style="padding-left:9em;"><a href="${pageContext.request.contextPath}/wap_unq/order_detail?id=${unqualifiedDetail.id}">订单详情</a></span></div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>原&ensp;&ensp;&ensp;&ensp;因</span>
					  <div class="form-control box-shadow0 border0">${unqualifiedDetail.cause }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>状&ensp;&ensp;&ensp;&ensp;态</span>
					  <div class="form-control box-shadow0 border0">
					  		<c:if test="${unqualifiedDetail.status == 0}">
					  			未处理
					  		</c:if>
					  		<c:if test="${unqualifiedDetail.status == 1}">
					  			已处理
					  		</c:if>
					  </div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>创建时间</span>
					  <div class="form-control box-shadow0 border0"><fmt:formatDate value="${unqualifiedDetail.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>处&ensp;理&ensp;人</span>
					  <div class="form-control box-shadow0 border0">${unqualifiedDetail.processUserName }</div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>处理时间</span>
					  <div class="form-control box-shadow0 border0"><fmt:formatDate value="${unqualifiedDetail.processTime }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
					</div>
					<div class="input-group form-group fs">
					  <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>处理结果</span>
					  <div class="form-control box-shadow0 border0">
					  		<c:if test="${unqualifiedDetail.status == 0 && user.unitId ==  unqualifiedDetail.unitId}">
					  			<input type="text" id="result" placeholder="请输入处理结果">
					  		</c:if>
					  		<c:if test="${unqualifiedDetail.status == 1}">
					  			${unqualifiedDetail.result}
					  		</c:if>					  		
					  </div>
					</div>					
				</div>
			</form>
			<div class="margin-top2 margin-bot2">
				<c:if test="${user.unitId == unqualifiedDetail.unitId && unqualifiedDetail.status == 0}">
					<a href="javascript:;" onclick="process()" class="btn btn-primary form-control">处理记录</a>
				</c:if>				
			</div>
		</main>		
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
		<c:import url="public/footer.jsp"></c:import>
	</body>
	<script type="text/javascript">
		function process(){
			if($("#result").val() == ""){
				layer.msg("请输入处理信息！",{icon:2,time:1000});
				return;
			}
			var url = "${pageContext.request.contextPath}/wap_unq/process";
			var data = "result=" + $("#result").val() + "&id=" + $("#unqualifiedId").val();
			$.ajax({
				 "url" : url,
				 "data" : data,
				 "type" : "POST",
				 "dataType" : "json",
				 "success" : function(obj) {
					if (obj.state == 0) {
						layer.msg(obj.message,{icon:2,time:1000});
						return;
					}else{			
						layer.msg(obj.message,{icon:1,time:1000});
						setTimeout(function (){					 
							location.reload();
						}, 3000);
					}								
				}
			}); 
		}
	</script>
</html>
