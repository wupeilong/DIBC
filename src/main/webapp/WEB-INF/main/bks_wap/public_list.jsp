<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>采购报送信息列表</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>	
</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
				<div class="">
					<div class="">
						<!-- <a href="" class="btn bg-primary padding-side"><i class="fa fa-search"></i></a> -->
						
						<c:if test="${user.type == 1}">
							<select id="unit_list">
								<option value="">查询所有企业信息</option>
								<c:forEach items="${unitList}" var="item">								
									<option value="${item.unitId}">${item.unitName}</option>
								</c:forEach>
							</select>
						</c:if>					
				
					</div>
				</div>
				<c:if test="${user.type == 2}">
					<a href="${pageContext.request.contextPath}/wap_pro/buy_add" class="btn bg-primary"><i class="fa fa-plus"></i></a>
				</c:if>				
			</div>
		</div>
		<main class="main margin-top padding-side">
			<div class="panel panel-info">
				<div class="panel-heading fb" style="background-image: linear-gradient(22deg,#61e0fd,#328fe1);">
					<div></div>
					<!-- <a href="" class="btn bg-primary padding-side"><i class="fa fa-search"></i></a> -->
					<select id="psType">
						<option value="device">device</option>
						<option value="with">with</option>
						<option value="entertainment">entertainment</option>
						<option value="and">and</option>
						<option value="social">social</option>
						<option value="networking">networking</option>
						<option value="apps">apps</option>
						<option value="or">or</option>
						<option value="apps">apps</option>
						<option value="that">that</option>
						<option value="will">will</option>
						<option value="boost">boost</option>
						<option value="your">your</option>
						<option value="productivity">productivity</option>
						<option value="Download">Download</option>
						<option value="or">or</option>
						<option value="buy">buy</option>
						<option value="apps">apps</option>
						<option value="from">from</option>
						<option value="Afbb">Afbb</option>
						<option value="Akademie">Akademie</option>
						<option value="Berlin">Berlin</option>
						<option value="reviews">reviews</option>
						<option value="by">by</option>
						<option value="real">real</option>
					</select>
					<script type="text/javascript">
						$(function(){
							$('select').searchableSelect();
							// $('#psType').searchableSelect({
							//     "afterSelectItem": function() {
							//         alert($('#psType').val());
							//     }
							// });
						});
						
					</script>
				</div>
				<ul class="list-group margin-top panel-body padding0">					
					<li class="list-group-item">
						<div class="">
							<h5 class="fonwei">贵州指上通科技有限责任公司</h5>							
							<div class="text-muted bfrifRow">
								企业类型：餐饮业 								
							</div>
						</div>
						<div class="fb margin-top" style="align-items: flex-end;">
							<div class="">								
								<a href="" class="label label-warning">法人代表：吴培龙</a>
							</div>
							<a href="h${pageContext.request.contextPath}/wap_unit/coopration_detal？unitId=1" class="btn btn-primary">查看信息</a>
						</div>
					</li>
					<li class="list-group-item">
						<div class="">
							<h5 class="fonwei">贵州施工队有限公司</h5>
							<div class="text-muted bfrifRow">
								贵州施工队有限公司,发噶是公司的风格俺是个队有限公司,发噶是公司的风格俺是个队有限公司,发噶是公司的风格俺是个
							</div>
						</div>
						<div class="fb margin-top" style="align-items: flex-end;">
							<div class="">
								<a href="http://192.168.2.2:8848/wap_MCLZ/public_detal.html" class="label label-warning">飞洒个你是对方</a>
							</div>
							<a href="" class="btn btn-primary">查看信息</a>
						</div>
					</li>
				</ul>
			</div>
		</main>	
	<c:import url="public/footer.jsp"></c:import>
	</body>
</html>
