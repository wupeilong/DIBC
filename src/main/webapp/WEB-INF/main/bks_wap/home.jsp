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
	<link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
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
<body class="contain" style=";background-image: url(${pageContext.request.contextPath}/static/images/bks_wap/bg_home.jpg);position: relative;height: auto;height: 100%;">
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
		<main class="" id="main_container" style="position: relative;background-size: contain;padding-bottom: 5em;">
			<div class="banner_wrap ">
				<div id="certify" style="width: 100%;">
					<div class="swiper-container swiper-container-horizontal">
						<div class="swiper-wrapper">
							<div class="swiper-slide swiper-slide-duplicate-next" data-swiper-slide-index="0" style="transform: translateX(1976px) scale(0.2); z-index: 959; opacity: 0; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/ban1.jpg" class="img-responsive">
							</div>
							 <div class="swiper-slide" data-swiper-slide-index="1" style="transform: translateX(1248px) scale(0.4); z-index: 969; opacity: 1; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/ban2.jpg" class="img-responsive ">
							</div>
							<div class="swiper-slide" data-swiper-slide-index="2" style="transform: translateX(676px) scale(0.6); z-index: 979; opacity: 1; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/ban3.jpg" class="img-responsive ">
							</div>
							<div class="swiper-slide swiper-slide-duplicate-next" data-swiper-slide-index="0" style="transform: translateX(1976px) scale(0.2); z-index: 959; opacity: 0; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/ban4.jpg" class="img-responsive ">
							</div>
							<div class="swiper-slide" data-swiper-slide-index="1" style="transform: translateX(1248px) scale(0.4); z-index: 969; opacity: 1; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/ban5.jpg" class="img-responsive">
							</div>
							<div class="swiper-slide" data-swiper-slide-index="2" style="transform: translateX(676px) scale(0.6); z-index: 979; opacity: 1; transition-duration: 300ms;">
								<img src="${pageContext.request.contextPath}/static/images/bks_wap/ban6.jpg" class="img-responsive ">
							</div>
							<div class="swiper-slide swiper-slide-duplicate-next" data-swiper-slide-index="0" style="transform: translateX(1976px) scale(0.2); z-index: 959; opacity: 0; transition-duration: 300ms;">
								<img id="img_fd" src="${pageContext.request.contextPath}/static/images/bks_wap/ban7.jpg" class="img-responsive ">
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
			<div class="menu fc padding-side">
				<ul class="list-unstyled" style="" id="menu_top">				
					<shiro:hasPermission name="wap_unit">
						<li>
							<a href="${pageContext.request.contextPath}/wap_unit/coopration_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon1.png" bor der="0" alt="" title=""/><p class="text-center">企业信息</p></a>
						</li>
					</shiro:hasPermission>
					<c:if test="${user.type == 2}">
						<shiro:hasPermission name="wap_user">				
							<li><a href="${pageContext.request.contextPath}/wap_user/workmens"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon2.png" border="0" alt="" title=""/><p class="text-center">从业人员</p></a></li>
						</shiro:hasPermission>
					</c:if>					
					<shiro:hasPermission name="wap_pro">
						<li><a href="${pageContext.request.contextPath}/wap_pro/buy_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon3.png" border="0" alt="" title=""/><p class="text-center">索证索票</p></a></li>
					</shiro:hasPermission>
					<c:if test="${user.type == 1}">
						<shiro:hasPermission name="web_food">
							<li><a href="javascript:alert('功能开发中……');"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon4.png" border="0" alt="" title=""/><p href="" class="text-center">AI识别</p></a></li>
						</shiro:hasPermission>
						<shiro:lacksPermission name="web_food">
							<li><a href="javascript:;"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon4.png" border="0" alt="" title="" style="-webkit-filter: grayscale(1);filter: gray; filter: grayscale(1);"/><p href="" class="text-center">AI识别</p></a></li>
						</shiro:lacksPermission>
					</c:if>
					<shiro:hasPermission name="wap_dry">
						<li><a href="${pageContext.request.contextPath}/wap_dry/delivery"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon5.png" border="0" alt="" title=""/><p class="text-center">配送核查</p></a></li>
					</shiro:hasPermission>
					
					<li style="background:url(${pageContext.request.contextPath}/static/images/bks_wap/logo_home.png) no-repeat;background-size: 65%;background-position: center;">
						<%-- <img src="${pageContext.request.contextPath}/static/images/bks_wap/logo_home.png" class="img-responsive" style="height: 18vw;" alt="" title=""/> --%>
						<div style="height: 18vw;"></div>
					</li>
					
					<shiro:hasPermission name="wap_clean">
						<li><a href="${pageContext.request.contextPath}/wap_clean/clean_list"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon6.png" border="0" alt="" title=""/><p class="text-center">洗消记录</p></a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="wap_ins">
						<li><a href="${pageContext.request.contextPath}/wap_ins/inspect_choise"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon7.png" border="0" alt="" title=""/><p class="text-center">监管采集</p></a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="wap_det">
						<li><a id="detection" href="javascript:;"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon8.png" border="0" alt="" title=""/><p class="text-center">
						<c:if test="${user.type == 2}">
							检测结果
						</c:if>
						<c:if test="${user.type == 1}">
							检验检测
						</c:if></p></a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="wap_video">
						<li><a href="${pageContext.request.contextPath}/wap_video/wap_videoscan"><img src="${pageContext.request.contextPath}/static/images/bks_wap/icon9.png" border="0" alt="" title=""/><p class="text-center">视频监控</p></a></li>
					</shiro:hasPermission>
				</ul>
			</div>
			<c:import url="public/footer.jsp"></c:import>
			<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
			<script type="text/javascript">
				/* var current = $(".swiper-wrapper");		
				current.find("img").bind("click",function(){
					var path=$(this).attr('src');
					layerImg(path);
				});
				
				$("#img_fd").click(function(){
					layerImg($("#img_fd").attr('src'));
				}); */
				
				$("#detection").click(function(){
					 /* if('${user.type}' != 1){
						layer.msg("此功能尚未对外开放！",{icon:0,time:1000});
					 }else{ */
						location.href = "${pageContext.request.contextPath}/wap_det/detection_list";		
					/*  } */					  
				});	
				
				
				 certifySwiper = new Swiper('#certify .swiper-container', {
					watchSlidesProgress: true,
					slidesPerView: 'auto',
					centeredSlides: true,
					loop: true,
					loopedSlides:5,
					autoplay: {
					    disableOnInteraction: false,
					},
					navigation: {
						nextEl: '.swiper-button-next',
						prevEl: '.swiper-button-prev',
					},
					pagination: {
						el: '.swiper-pagination',
						clickable :true,
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
					 var m1_top = ($(window).height() - $(".banner_wrap").height() - $(".footer_div").height() - $(".padding-side").height())/3;				       
				     $("#menu_top").css({"margin-top": m1_top + "px"});
				    //alert(m1_top);
				})
				
				 window.ontouchstart = function(e) {
				    if (e.target.tagName === 'img')
				         e.preventDefault();
				 }; 
				/*  (document).ready(function(){
				    
				 
				 // 下面为随窗口变化动态改变margin
				     window.onresize=function(){
				     var m1_top = (( $(window).height() - $(".login-box-body").height() )/2-$(".login-logo").height())/2;
				      $(".login-logo").css({"margin": m1_top + "px auto"});
				      $(".login-bottom").css({"margin-top": m1_top + "px"});
				     } 
				 
				}); */
			</script>
			
		</main>
	</body>
			
</html>
