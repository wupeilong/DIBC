<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>个人中心</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/user_pcenter.css">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>		
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
</head >
<body style="background: rgba(40, 42, 54, 0.5490196078431373);">
	<div class="aui-page-my">
				<div class="aui-my-info">
					<div class="aui-my-info-back">	</div>	
					<c:if test="${wx_user_info == null}">
						<c:if test="${user.openid == null}">
						    <span>你未绑定微信，<a href="${pageContext.request.contextPath}/wx_login">去绑定!</a></span>
						</c:if>
						<c:if test="${user.openid != null}">
						    <span>未使用微信登录,<a href="${pageContext.request.contextPath}/wx_login" >去登录!</a></span>
						</c:if>
					</c:if>
					
					<c:if test="${wx_user_info != null}">										
						<img src="${wx_user_info.openIdheadimgurl}" class="aui-my-avatar">					
						<div class="aui-mt-location aui-l-red"></div>
					</c:if>					
				</div>
				<div class="aui-l-content">
					<div class="aui-menu-list aui-menu-list-clear">
						<ul>
							<li class="b-line">
								<a href="${pageContext.request.contextPath}/wap_user/user_pcenter?id=${user.id}">
									<div class="aui-icon"><img src="${pageContext.request.contextPath}/static/images/bks_wap/user_pcenter/my_dh2.png"></div>
									<h3>个人信息</h3>
									<div class="aui-time"><i class="aui-jump"></i></div>
								</a>
							</li>
							<li class="b-line">
								<a href="${pageContext.request.contextPath}/wap_user/workmens_update">
									<div class="aui-icon"><img src="${pageContext.request.contextPath}/static/images/bks_wap/user_pcenter/my_dh4.png"></div>
									<h3>完善个人信息</h3>
									<div class="aui-time"><i class="aui-jump"></i></div>
								</a>
							</li>
							<li class="b-line">
								<a href="${pageContext.request.contextPath}/wap_unit/coopration_detal?unitId=${userPcenter.unitId}">
									<div class="aui-icon"><img src="${pageContext.request.contextPath}/static/images/bks_wap/user_pcenter/my_dh3.png"></div>
									<h3>企业信息查询</h3>
									<div class="aui-time"><i class="aui-jump"></i></div>
								</a>
							</li>
							<li class="b-line">
								<a href="${pageContext.request.contextPath}/wap_user/workmens_health?userId=${user.id}">
									<div class="aui-icon"><img src="${pageContext.request.contextPath}/static/images/bks_wap/user_pcenter/my_dh1.png"></div>
									<h3>健康状况查询</h3>
									<div class="aui-time"><i class="aui-jump"></i></div>
								</a>
							</li>
							<li class="b-line">
								<a href="${pageContext.request.contextPath}/wap_user/workmens_health_add">
									<div class="aui-icon"><img src="${pageContext.request.contextPath}/static/images/bks_wap/user_pcenter/my_dh5.png"></div>
									<h3>健康信息录入</h3>
									<div class="aui-time"><i class="aui-jump"></i></div>
								</a>
							</li>
							<li class="b-line">
								<a href="${pageContext.request.contextPath}/wap_user/reset_password">
									<div class="aui-icon"><img src="${pageContext.request.contextPath}/static/images/bks_wap/user_pcenter/my_dh6.png"></div>
									<h3>个人密码修改</h3>
									<div class="aui-time"><i class="aui-jump"></i></div>
								</a>
							</li>							
						</ul>
					</div>
				</div>
			</div>	
	<c:if test="${user.type == 3}">
		<c:import url="public/public_footer.jsp"></c:import>
	</c:if>
	<c:if test="${user.type != 3}">
		<c:import url="public/footer.jsp"></c:import>
	</c:if>	
</body>
</html>
