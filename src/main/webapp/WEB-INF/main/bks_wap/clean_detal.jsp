<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>清洗消毒详情</title>
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
		<main class="main margin-top2 padding-side05">
			<form action="" method="post">
				<fieldset>
				    <legend class="text-center border0">餐饮具、工具及保洁设施清洗消毒记录</legend>
					<div class="">
						<table class="table table-bordered" cellspacing="" cellpadding="">
							<caption class="">
								<div class="fb">
									<span class="">消毒人员：<span>${disinfectionbyid[0].username}</span></span>
									<span class="padding-side05">消毒日期：<span>${disinfectionbyid[0].dailyTime}</span><span>
								</div>			                   
							</caption>
							<thead>
								<tr><th colspan="2">消毒项目</th><th colspan="2">消毒结果</th></tr>
							</thead>
							<tbody>
							
							
								<tr>
									<td rowspan="4" class="vertical-mid">餐(炊)具种类</td>
									<td>小餐具类</td>
									<c:if test="${DisinfectionDetal[0]==1}">
										<td>是：<input type="radio" name="tableware0" id="tableware" value="1" checked="checked" /></td>
										<td>否：<input type="radio" name="tableware0" id="tableware" value="2" /></td>
									</c:if>
									<c:if test="${DisinfectionDetal[0]!=1}">
										<td>是：<input type="radio" name="tableware0" id="tableware" value="1"  /></td>
										<td>否：<input type="radio" name="tableware0" id="tableware" value="2" checked="checked"/></td>
									</c:if>
								</tr>
								<tr>
									<td>大餐具类</td>
									<c:if test="${DisinfectionDetal[1]==1}">
										<td>是：<input type="radio" name="tableware1" id="tableware" value="1" checked="checked" /></td>
										<td>否：<input type="radio" name="tableware1" id="tableware" value="2" /></td>
									</c:if>
									<c:if test="${DisinfectionDetal[1]!=1}">
										<td>是：<input type="radio" name="tableware1" id="tableware" value="1"  /></td>
										<td>否：<input type="radio" name="tableware1" id="tableware" value="2" checked="checked"/></td>
									</c:if>
								</tr>
								<tr>
									<td>筷子、勺子类</td>
									<c:if test="${DisinfectionDetal[2]==1}">
										<td>是：<input type="radio" name="tableware2" id="tableware" value="1" checked="checked" /></td>
										<td>否：<input type="radio" name="tableware2" id="tableware" value="2" /></td>
									</c:if>
									<c:if test="${DisinfectionDetal[2]!=1}">
										<td>是：<input type="radio" name="tableware2" id="tableware" value="1"  /></td>
										<td>否：<input type="radio" name="tableware2" id="tableware" value="2" checked="checked"/></td>
									</c:if>
								</tr>
								<tr>
									<td>锅、盆类</td>
									<c:if test="${DisinfectionDetal[3]==1}">
										<td>是：<input type="radio" name="tableware3" id="tableware" value="1" checked="checked" /></td>
										<td>否：<input type="radio" name="tableware3" id="tableware" value="2" /></td>
									</c:if>
									<c:if test="${DisinfectionDetal[3]!=1}">
										<td>是：<input type="radio" name="tableware3" id="tableware" value="1"  /></td>
										<td>否：<input type="radio" name="tableware3" id="tableware" value="2" checked="checked"/></td>
									</c:if>
								</tr>
								
								<tr>
									<td colspan="2" class="">工具类</td>
									<c:if test="${DisinfectionDetal[4]==1}">
										<td>是：<input type="radio" name="tableware4" id="tableware" value="1" checked="checked" /></td>
										<td>否：<input type="radio" name="tableware4" id="tableware" value="2" /></td>
									</c:if>
									<c:if test="${DisinfectionDetal[4]!=1}">
										<td>是：<input type="radio" name="tableware4" id="tableware" value="1"  /></td>
										<td>否：<input type="radio" name="tableware4" id="tableware" value="2" checked="checked"/></td>
									</c:if>
								</tr>
								<tr>
									<td colspan="2" class="">餐具保洁设施</td>
									<c:if test="${DisinfectionDetal[5]==1}">
										<td>是：<input type="radio" name="tableware5" id="tableware" value="1" checked="checked" /></td>
										<td>否：<input type="radio" name="tableware5" id="tableware" value="2" /></td>
									</c:if>
									<c:if test="${DisinfectionDetal[5]!=1}">
										<td>是：<input type="radio" name="tableware5" id="tableware" value="1"  /></td>
										<td>否：<input type="radio" name="tableware5" id="tableware" value="2" checked="checked"/></td>
									</c:if>
								</tr>
								<tr>
									<td rowspan="2" class="vertical-mid">消毒方法</td><td>电子消毒柜</td>
									<c:if test="${DisinfectionDetal[6]==1}">
										<td>是：<input type="radio" name="tableware6" id="tableware" value="1" checked="checked" /></td>
										<td>否：<input type="radio" name="tableware6" id="tableware" value="2" /></td>
									</c:if>
									<c:if test="${DisinfectionDetal[6]!=1}">
										<td>是：<input type="radio" name="tableware6" id="tableware" value="1"  /></td>
										<td>否：<input type="radio" name="tableware6" id="tableware" value="2" checked="checked"/></td>
									</c:if>
								</tr>
								<tr>
									<td>消毒药水</td>
									<c:if test="${DisinfectionDetal[7]==1}">
										<td>是：<input type="radio" name="tableware7" id="tableware" value="1" checked="checked" /></td>
										<td>否：<input type="radio" name="tableware7" id="tableware" value="2" /></td>
									</c:if>
									<c:if test="${DisinfectionDetal[7]!=1}">
										<td>是：<input type="radio" name="tableware7" id="tableware" value="1"  /></td>
										<td>否：<input type="radio" name="tableware7" id="tableware" value="2" checked="checked"/></td>
									</c:if>
								</tr>
								<tr>
									<td colspan="2" class="vertical-mid">消毒时间</td>
									<td colspan="2" style="width: 15em;">
										<div class="">
											<input readonly="" class="form-control" type="text" id="date-group1-6" value="<fmt:formatDate value="${disinfectionbyid[0].createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" placeholder="hh:mm">
										</div>
										<!-- <select name="">
											<option value="">请选择时间</option>
										</select> -->
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				  </fieldset>
			</form>
			<div class="margin-top2 margin-bot2">
				<!-- <button type="button" class="btn btn-primary form-control">提交</button> -->
			</div>
		</main>			
	<c:import url="public/footer.jsp"></c:import>
	</body>

</html>
