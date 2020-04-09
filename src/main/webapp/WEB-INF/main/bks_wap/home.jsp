<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>云监食安系统主页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/loadmillers.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/swiper.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/home_style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/swper5.0.1.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		window.addEventListener("load",function() {
			// Set a timeout...
			setTimeout(function(){
			// Hide the address bar!
			window.scrollTo(0, 1);
			}, 0);
		});
	</script>
</head>
<body class="contain" style=";background-image: url(${pageContext.request.contextPath}/static/images/bks_wap/bg_home.jpg);position: relative;">
		<div class="bg-primary loader_wrap">
			<div class="loader">
				<div class="line-scale-pulse-out">
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
		<main class="" id="main_container" style="position: relative;height: 100%;background-size: contain;">
			<div class="banner_wrap ">
				<div id="certify" style="width: 100%;">
					<div class="swiper-container swiper-container-horizontal">
						<div class="swiper-wrapper" style="transition-duration: 300ms; transform: translate3d(-4340px, 0px, 0px);">
							<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="transform: translateX(7956px) scale(-0.8); z-index: 909; opacity: 0; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner1.jpg" class="img-responsive">
							</div>
							<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="1" style="transform: translateX(6448px) scale(-0.6); z-index: 919; opacity: 0; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner1.jpg">
							</div>
							<div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="transform: translateX(5096px) scale(-0.4); z-index: 929; opacity: 0; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner2.jpg">
							</div>
							<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="3" style="transform: translateX(3900px) scale(-0.2); z-index: 939; opacity: 0; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner3.jpg">
							</div>
							<div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="4" style="transform: translateX(2860px) scale(0); z-index: 949; opacity: 0; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner1.jpg">
							</div>
							
							<div class="swiper-slide swiper-slide-duplicate-next" data-swiper-slide-index="0" style="transform: translateX(1976px) scale(0.2); z-index: 959; opacity: 0; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner1.jpg" class="img-responsive">
							</div>
							<div class="swiper-slide" data-swiper-slide-index="1" style="transform: translateX(1248px) scale(0.4); z-index: 969; opacity: 1; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner1.jpg" class="img-responsive">
							</div>
							<div class="swiper-slide" data-swiper-slide-index="2" style="transform: translateX(676px) scale(0.6); z-index: 979; opacity: 1; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner1.jpg" class="img-responsive">
							</div>
							<div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="3" style="transform: translateX(260px) scale(0.8); z-index: 989; opacity: 1; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner1.jpg" class="img-responsive">
							</div>
							<div class="swiper-slide swiper-slide-active" data-swiper-slide-index="4" style="transform: translateX(0px) scale(1); z-index: 999; opacity: 1; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner1.jpg" class="img-responsive">
							</div>
							<div class="swiper-slide swiper-slide-duplicate swiper-slide-next" data-swiper-slide-index="0" style="transform: translateX(-260px) scale(0.8); z-index: 989; opacity: 1; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/banner1.jpg" class="img-responsive">
							</div>
						</div>
					</div>
					<div class="swiper-pagination swiper-pagination-bullets">
						<span class="swiper-pagination-bullet"></span>
						<span class="swiper-pagination-bullet"></span>
						<span class="swiper-pagination-bullet"></span>
						<span class="swiper-pagination-bullet"></span>
						<span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
					</div>
					<!-- <div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div> -->
				</div>
			</div>
			<div class="menu" style="margin-bottom: 51.2px">
				<ul>
					<li><a href="${pageContext.request.contextPath}/wap_unit/coopration_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon1.png" border="0" alt="" title=""/></a><p class="text-center">企业信息</p></li>
					<shiro:hasPermission name="wap_user">
						<li><a href="${pageContext.request.contextPath}/wap_user/workmens"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon2.png" border="0" alt="" title=""/></a><p class="text-center">从业人员</p></li>
					</shiro:hasPermission>
					<li><a href="${pageContext.request.contextPath}/wap_pro/buy_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon3.png" border="0" alt="" title=""/></a><p class="text-center">采购报送</p></li>
					<li><a href="javascript:alert('功能开发中……');"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon4.png" border="0" alt="" title=""/></a><p class="text-center">制餐检视</p></li>
					<li><a href="${pageContext.request.contextPath}/wap_dry/delivery"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon5.png" border="0" alt="" title=""/></a><p class="text-center">配送报备</p></li>
					<li><a href="${pageContext.request.contextPath}/wap_clean/clean_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon6.png" border="0" alt="" title=""/></a><p class="text-center">清洁记录</p></li>
					<li><a href="${pageContext.request.contextPath}/wap_ins/inspect_choise"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon7.png" border="0" alt="" title=""/></a><p class="text-center">监管采集</p></li>
					<li><a href="${pageContext.request.contextPath}/wap_det/detection_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon8.png" border="0" alt="" title=""/></a><p class="text-center">检测报送</p></li>
					<li><a href="${pageContext.request.contextPath}/wap_video/wap_videoscan"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon9.png" border="0" alt="" title=""/></a><p class="text-center">视频监控</p></li>
				</ul>
			</div>
			
			<c:import url="public/footer.jsp"></c:import>
			<script type="text/javascript">
				certifySwiper = new Swiper('#certify .swiper-container', {
					watchSlidesProgress: true,
					slidesPerView: 'auto',
					centeredSlides: true,
					loop: true,
					loopedSlides: 5,
					autoplay: false,
					navigation: {
						nextEl: '.swiper-button-next',
						prevEl: '.swiper-button-prev',
					},
					pagination: {
						el: '.swiper-pagination',
						//clickable :true,
					},
					on: {
						progress: function(progress) {
							for (i = 0; i < this.slides.length; i++) {
								var slide = this.slides.eq(i);
								var slideProgress = this.slides[i].progress;
								modify = 1;
								if (Math.abs(slideProgress) > 1) {
									modify = (Math.abs(slideProgress) - 1) * 0.3 + 1;
								}
								translate = slideProgress * modify * 260 + 'px';
								scale = 1 - Math.abs(slideProgress) / 5;
								zIndex = 999 - Math.abs(Math.round(10 * slideProgress));
								slide.transform('translateX(' + translate + ') scale(' + scale + ')');
								slide.css('zIndex', zIndex);
								slide.css('opacity', 1);
								if (Math.abs(slideProgress) > 3) {
									slide.css('opacity', 0);
								}
							}
						},
						setTransition: function(transition) {
							for (var i = 0; i < this.slides.length; i++) {
								var slide = this.slides.eq(i)
								slide.transition(transition);
							}
				
						}
					}
				
				})
				
				$(document).ready(function() {
					$(".loader_wrap").fadeOut();
				})
			</script>
			
		</main>
	</body>
			
</html>
