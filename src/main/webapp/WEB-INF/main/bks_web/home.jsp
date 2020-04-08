<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layer/2.4/skin/layer.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/common.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/style.css"/>
		<script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js" type="text/javascript" charset="utf-8"></script>
		<title>云监食安系统管理后台首页</title>
	</head>
	<body><!-- style="overflow:hidden;" -->
		<div id="ajax-loader" style="cursor: progress; position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background: #fff; z-index: 10000; overflow: hidden;display: none;">
			<img src="${pageContext.request.contextPath}/static/images/bks_web/loading.gif" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
		</div>
		<div class="mainbox">
			<header class="clearfix bg-primary">
				<a href="javascript:;" class="slogo switchLogo pull-left flexCenter text-white">
					<img src="${pageContext.request.contextPath}/static/images/bks_web/logo.png" class="img-responsive"/>
				</a>
				<nav class="flexBet">
					<div class="flexStart">
						<a href="javascript:void(0);" class="switchIcon flexCenter padding-side05 text-white"><i class="fa fa-reorder fa-2x"></i></a>
						<h3 class="margin0 padding-side systemName fontwei"><i class="fa fa-cog fa-spin fa-fw"></i>云监食安系统管理后台首页</h3>
					</div>
					<div class="flexStart">
						<a href="" class="padding-side05 text-white"><i class="fa fa-envelope-o fa-fw fa-1x"></i></a>
						<a href="" class="padding-side05 text-white"><i class="fa fa-bell-o fa-fw fa-1x"></i></a>
						<a href="" class="padding-side05 text-white"><i class="fa fa-flag fa-fw fa-1x"></i></a>
						<a href="" class="flexStart padding-side05 text-white"><i class="fa fa-user-circle-o fa-fw fa-2x"></i><span class="padding-side05">${user.username}</span></a>
					</div>
				</nav>
			</header>
			<div class="main_wrap clearfix">
				<div class="main_sideBar navbar-inverse pull-left">
					<ul class="list-unstyled">
						<li>
							<a href="javascript:void(0);" class="nametext">
								<i class="fa fa-window-restore fa-fw"></i><span class="padding-side05">权限管理</span>
								<i class="fa fa-angle-down fa-fw fa-2x pull-right"></i>
							</a>
							<ul class="subnav list-unstyled">
								<li id="001" data-src="${pageContext.request.contextPath}/web_auth/menu_list_pag">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">菜单列表</span></a>
								</li>
								<li id="002" data-src="${pageContext.request.contextPath}/web_auth/authorization_list_pag">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">权限列表</span></a>
								</li>
								<li id="003" data-src="${pageContext.request.contextPath}/web_auth/dep_list_pag">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">部门列表</span></a>
								</li>
								<!-- <li id="004" data-src="https://www.360.com/">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询4</span></a>
								</li> -->
							</ul>
						</li>
						<li>
							<a href="javascript:void(0);" class=""><i class="fa fa-window-restore fa-fw"></i><span class="padding-side05">社群民意</span>
							<i class="fa fa-angle-down fa-fw fa-2x pull-right"></i></a>
							<ul class="subnav list-unstyled">
								<!-- <li id="005" data-src="http://xgk.sxghfwzx.com/cp/xgk_index.do">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询11</span></a>
								</li>
								<li id="006" data-src="https://www.baidu.com/index.php?tn=monline_3_dg">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询21</span></a>
								</li>
								<li id="007" data-src="https://www.hao123.com/">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询31</span></a>
								</li>
								<li id="008" data-src="https://www.360.com/">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询41</span></a>
								</li> -->
							</ul>
						</li>
						<li>
							<a href="javascript:void(0);" class=""><i class="fa fa-window-restore fa-fw"></i><span class="padding-side05">通知管理</span>
							<i class="fa fa-angle-down fa-fw fa-2x pull-right"></i></a>
							<ul class="subnav list-unstyled">
								<!-- <li id="009" data-src="http://xgk.sxghfwzx.com/cp/xgk_index.do">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询111</span></a>
								</li>
								<li id="0010" data-src="https://www.baidu.com/index.php?tn=monline_3_dg">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询211</span></a>
								</li>
								<li id="0011" data-src="https://www.hao123.com/">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询311</span></a>
								</li>
								<li id="0012" data-src="https://www.360.com/">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询411</span></a>
								</li> -->
							</ul>
						</li>
						<li>
							<a href="javascript:void(0);" class=""><i class="fa fa-window-restore fa-fw"></i><span class="padding-side05">下载管理</span>
							<i class="fa fa-angle-down fa-fw fa-2x pull-right"></i></a>
							<ul class="subnav list-unstyled">
								<!-- <li id="0013" data-src="http://xgk.sxghfwzx.com/cp/xgk_index.do">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询1111</span></a>
								</li>
								<li id="0014" data-src="https://www.baidu.com/index.php?tn=monline_3_dg">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询2111</span></a>
								</li>
								<li id="0015" data-src="https://www.hao123.com/">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询3111</span></a>
								</li>
								<li id="0016" data-src="https://www.360.com/">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">提案查询4111</span></a>
								</li> -->
							</ul>
						</li>
						<li>
							<a href="javascript:void(0);" class=""><i class="fa fa-window-restore fa-fw"></i><span class="padding-side05">用户管理</span>
							<i class="fa fa-angle-down fa-fw fa-2x pull-right"></i></a>
							<ul class="subnav list-unstyled">
								<!-- <li id="0017" data-src="http://xgk.sxghfwzx.com/cp/xgk_index.do">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">1提案查询</span></a>
								</li>
								<li id="0018" data-src="https://www.baidu.com/index.php?tn=monline_3_dg">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">2提案查询</span></a>
								</li>
								<li id="0019" data-src="https://www.hao123.com/">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">3提案查询</span></a>
								</li>
								<li id="0020" data-src="https://www.360.com/">
									<a href="javascript:void(0);"><i class="fa fa-tag fa-fw"></i><span class="padding-side05">4提案查询</span></a>
								</li> -->
							</ul>
						</li>
					</ul>
				</div>
				<div class="content">
					<div class="contentTab flexBet">
						<div class="contentTabL flexStart">
							<span class="btnboxL"><button class="toLeft" title="向左" style="border-right: 1px solid #ccc;"><i class="fa fa-arrow-left"></i></button></span>
							<div class="contTablist_wrap">
								<ul class="contTablist list-unstyled list-inline margin0"></ul>
							</div>	
	
						</div>
						<div class="contentTabR clearfix">
							<button class="pull-left toRight" title="向右" onclick="pageNext(this)"><i class="fa fa-arrow-right"></i></button>
							<div class="operate pull-left">
								<a href="javascript:void(0);" class="padding-side">页面操作<i class="fa fa-caret-down fa-fw"></i></a>
								<ul class="list-unstyled margin0">
									<!-- <li><a href="javascript:void(0);" class="curRefresh" onclick="refreshIframe()">刷新当前</a></li> -->
									<li><a href="javascript:void(0);" class="curRefresh">刷新当前</a></li>
									<li><a href="javascript:void(0);" class="closeCur">关闭当前</a></li>
									<li><a href="javascript:void(0);" class="closeAll">全部关闭</a></li>
									<li><a href="javascript:void(0);" class="closeOthers">除此之外全部关闭</a></li>
								</ul>
							</div>	
							<button class="fullsCreen pull-left"> <i class="fa fa-arrows-alt"></i> </button>
						</div>
					</div>
					<div class="contentBody">
						<div class="iframeWrap">
							<!--<iframe src="http://xgk.sxghfwzx.com/cp/xgk_index.do" id="if001" width="100%" height="100%" frameborder="0"></iframe>-->
						</div>
					</div>
				</div>
			</div>
		</div>	
		<script type="text/javascript">
			// $(".fullsCreen").on('click',function() {
			// 	if (!$(this).attr('fullscreen')) {
   //                  $(this).attr('fullscreen', 'true');
   //                  fullsCreen();
   //              } else {
   //                  $(this).removeAttr('fullscreen')
   //                  exitFullscreen();
   //              }
			// })
			
			// function fullsCreen() {
			// 	var de = document.documentElement;
	  //           if (de.requestFullscreen) {
	  //               de.requestFullscreen();
	  //           } else if (de.mozRequestFullScreen) {
	  //               de.mozRequestFullScreen();
	  //           } else if (de.webkitRequestFullScreen) {
	  //               de.webkitRequestFullScreen();
   //          	}
			// }
			// 
			// function exitFullscreen() {
			// 	var de = document;
	  //           if (de.exitFullscreen) {
	  //               de.exitFullscreen();
	  //           } else if (de.mozCancelFullScreen) {
	  //               de.mozCancelFullScreen();
	  //           } else if (de.webkitCancelFullScreen) {
	  //               de.webkitCancelFullScreen();
	  //           }
			// }
			// 
			// function pagePrev(obj) {
			// 	var visibleWidth=$(".contentTab").width()-$(".btnboxL").width()-$(".contentTabR").width();
			// 	var TablistWidth=$(".contTablist").width();
			// 	if (TablistWidth>visibleWidth) {
			// 		$(".contTablist").css("margin-left","0");
			// 		$(obj).css("color","#999");
			// 		$(".toLeft").css("color","#333");
			// 	} 
			// }
			// 
			// function pageNext(obj){
			// 	var visibleWidth=$(".contentTab").width()-$(".btnboxL").width()-$(".contentTabR").width();
			// 	var TablistWidth=$(".contTablist").width();
			// 	if (TablistWidth>visibleWidth) {
			// 		$(".contTablist").css("margin-left","-"+visibleWidth+"px");
			// 		$(obj).css("color","#999");
			// 		$(".toRight").css("color","#333");
			// 	}
			// }
			// 
			// function closeOthers(){
			// 	var ContTabList=$(".contTablist").children();
			// 	var curContTabId= $(".contTablist").find("li.active").prop("id");
			// 	if (ContTabList.length!=0) {
			// 		var sideId=curContTabId.substr(4);
			// 		$("#"+curContTabId).siblings().remove();
			// 		$("#if"+sideId).siblings().remove();
			// 		var curText=$("#"+curContTabId).text();
			// 		var index=arr.indexOf(curText);
			// 		arr=arr.splice(index,1);
			// 	}
			// }
			// 
			// function closeAll(){
			// 	var ContTabList=$(".contTablist").children();
			// 	if (ContTabList.length!=0) {
			// 		$(".contTablist").find("li").remove();
			// 		$(".iframeWrap").children().remove();
			// 		$(".main_sideBar>ul>li").find("i.fa-angle-down").toggleClass('action').parents().siblings().find("i.fa-angle-down").removeClass('action');
			// 		$(".main_sideBar>ul>li").removeClass("active").find("ul>li").removeClass("active");
			// 		$(".subnav").slideUp(200);
			// 		arr=[];
			// 	}
			// }
			// 
			// function refreshIframe(){
			// 	var ContTabList=$(".contTablist").children();
			// 	if (ContTabList.length!=0) {
			// 		var curContTabId= $(".contTablist").find("li.active").prop("id");
			// 		var sideId=curContTabId.substr(4);
			// 		$("#if"+sideId).attr("src",$("#if"+sideId).attr("src"));
			// 	}
			// }
			
			// function closeCurIframe() {
			// 	var ContTabList=$(".contTablist").children();
			// 	if (ContTabList.length!=0){
			// 		var subNavId= $(".subnav").find("li.active").prop("id"); 
			// 		var contId= $("#cont"+subNavId).prop("id");
			// 		var iframeId=$("#if"+subNavId).prop("id");
			// 		var curItem= $(".contTablist").find("li.active");
			// 		var nextItem= curItem.next();
			// 		var prevItem= curItem.prev();
			// 		var contTabName=curItem.text();
			// 		var index=arr.indexOf(contTabName);
			// 		arr.splice(index,1);
			// 		curItem.remove();
			// 		$(".main_sideBar>ul>li").removeClass("active");
			// 		if (nextItem.length==1){
			// 			nextItem.addClass("active");
			// 			var curItem1= $(".contTablist").find("li.active");
			// 			var curItem1Id=curItem1.prop("id");
			// 			var sideBarId= curItem1Id.substr(4);
			// 			$("#"+sideBarId).parent().find("li").removeClass("active");
			// 			$("#"+sideBarId).addClass("active");
			// 			$("#"+sideBarId).parents("li").addClass("active");
			// 			$("#"+sideBarId).parent().slideDown(200).parent().siblings().find("ul").slideUp(200);
			// 			
			// 			$("#if"+subNavId).remove();
			// 			$("#if"+sideBarId).parent().children().addClass("hidden");
			// 			$("#if"+sideBarId).removeClass("hidden");
			// 		} else{
			// 			if (prevItem.length==1) {
			// 				prevItem.addClass("active");
			// 				var curItem1= $(".contTablist").find("li.active");
			// 				var curItem1Id=curItem1.prop("id");
			// 				var sideBarId= curItem1Id.substr(4);
			// 				$("#"+sideBarId).parent().find("li").removeClass("active");
			// 				$("#"+sideBarId).addClass("active");
			// 				$("#"+sideBarId).parent().slideDown(200).parent().siblings().find("ul").slideUp(200);
			// 				
			// 				$("#if"+subNavId).remove();
			// 				$("#if"+sideBarId).parent().children().addClass("hidden");
			// 				$("#if"+sideBarId).removeClass("hidden");
			// 			} else{
			// 				$(".subnav").parent().siblings().removeClass("active");
			// 				$(".subnav").find("li").removeClass("active");
			// 				$("iframe").remove();
			// 				return false;
			// 			}
			// 		}
			// 	}
			// 	
			// }
			
// 			function switchSideBar(obj) {
// 				$(obj).parents("header").toggleClass("switchHeader");
// //				$(".subnav").css("display","none");
// 				$(".main_sideBar>ul>li").find("a i.fa-angle-down").removeClass("action");
// 				$(".main_wrap").toggleClass("switchCon");
// 				$(".main_sideBar .subnav").css("display","none");
// 			}
			
			var limit=$(".main_wrap").hasClass(".switchCon");
			if (limit) {
				$(".main_sideBar>ul>li").hover(
					console.log($(this))
//					function() { $(this).find(".subnav").css("display","block"); },
//					function() { $(this).find(".subnav").css("display","none"); }
				)
			}
			
			// $(".main_sideBar>ul>li>a").click(function(){
			// 	$(this).parent().find("ul").slideToggle(200).parent().siblings().find("ul").slideUp(200);
			// 	$(this).find("i.fa-angle-down").toggleClass('action').parents().siblings().find("i.fa-angle-down").removeClass('action');
			// })
			
			//var arr=[];//左边子导航
			// $(".subnav>li>a").click(function(){
			// 	$(this).parents(".main_sideBar").children().children().removeClass("active");
			// 	$(this).parents(".subnav").parent().addClass("active");
			// 	$(this).parents(".main_sideBar").children().find(".subnav li").removeClass("active");
			// 	$(this).parent().parent().children().removeClass("active");
			// 	$(this).parent().addClass("active");
			// 	var sid=$(this).parent().prop("id");
			// 	var dataSrc=$(this).parent().attr("data-src");
			// 	var iframe='<iframe src="'+dataSrc+'" class="" id="if'+sid+'" width="100%" height="100%" frameborder="0"></iframe>';
			// 	
			// 	$("#cont"+sid).parent().find("li").removeClass("active");
			// 	$("#cont"+sid).addClass("active");
			// 	$("#if"+sid).parent().find("iframe").addClass("hidden");
			// 	$("#if"+sid).removeClass("hidden");
			// 	
			// 	var texts=$(this).find("span").text();
			// 	if (arr.indexOf(texts)==-1) {
			// 		arr.push(texts);
			// 		var li='<li class="" id="cont'+sid+'"><a href="javascript:;">'+texts+'<i class="fa fa-times fa-fw" onclick="closeNavTab(this)"></i></a></li>';
			// 		$(".contTablist").append(li);
			// 		$("#cont"+sid).parent().find("li").removeClass("active");
			// 		$("#cont"+sid).addClass("active");
			// 		var visibleWidth=$(".contentTab").width()-$(".btnboxL").width()-$(".contentTabR").width();
			// 		var TablistWidth=$(".contTablist").width();
			// 		if (TablistWidth>visibleWidth) {
			// 			var overArea = TablistWidth-visibleWidth;
			// 			$(".contTablist").css("margin-left","-"+overArea+"px");
			// 		}
			// 		
			// 		$(".iframeWrap").append(iframe);
			// 		$("#if"+sid).parent().find("iframe").addClass("hidden");
			// 		$("#if"+sid).removeClass("hidden");
			// 	}
			// 	
			// 	$(".contTablist>li>a").on('click',function() {
			// 		$(this).parents(".main_wrap").find(".main_sideBar").children().find(".subnav li").removeClass("active");
			// 		$(this).parents(".contTablist").find("li").removeClass("active");
			// 		$(this).parent().addClass("active");
			// 		
			// 		var sidebarAndBtn=$(".main_sideBar").width()+$(".btnboxL").width();
			// 		//console.log($(this).offset().left-sidebarAndBtn);//offset距离body的距离
			// 		var curPosition=$(this).parent().offset().left-sidebarAndBtn+$(this).parent().width();//当前li的最右边到TAB盒子的距离
			// 		var visibleWidth=$(".contentTab").width()-$(".btnboxL").width()-$(".contentTabR").width();
			// 		if (curPosition>visibleWidth) {
			// 			$(".contTablist").css("margin-left","-"+(curPosition-visibleWidth)+"px");
			// 		}
			// 		if ($(this).offset().left<sidebarAndBtn) {
			// 			var curItemOver=$(".main_sideBar").width()-$(this).offset().left;//当前左边超出部分
			// 			var curUlMarginL=parseInt($(".contTablist").css("margin-left"));//当前ul的偏移
			// 			var activeMarginL=curUlMarginL+curItemOver+$(".btnboxL").width();
			// 			$(".contTablist").css("margin-left",activeMarginL+"px");
			// 		}
			// 		var contTab=$(this).parent().prop("id");
			// 		var sideid=contTab.substr(4);
			// 		
			// 		$("#"+sideid).parents("ul").children().removeClass("active");
			// 		$("#"+sideid).parents("li").addClass("active");
			// 		$("#"+sideid).parent().slideDown(200).parent().siblings().find("ul").slideUp(200);
			// 		$("#"+sideid).parents("li").find("a i.fa-angle-down").addClass('action').parents("li").siblings().find("a i.fa-angle-down").removeClass('action');
			// 		
			// 		$("#"+sideid).parent().find("li").removeClass("active");
			// 		$("#"+sideid).addClass("active");
			// 		
			// 		$("#if"+sideid).parent().find("iframe").addClass("hidden");
			// 		$("#if"+sideid).removeClass("hidden");
			// 	})
			// })
			
// 			function closeNavTab(obj){
// 				var contTabId=$(obj).parent().parent().prop("id");//当前ID
// 				var sideid=contTabId.substr(4);
// 				
// 				var nextItem=$("#"+contTabId).next();
// 				var prevItem=$("#"+contTabId).prev();
// 				var nextItemId=nextItem.prop("id");
// 				var prevItemId=prevItem.prop("id");
// 				
// 				if ($("#"+contTabId).hasClass("active")) {
// 					$("#if"+sideid).remove();
// 					if (nextItem.length==1){
// 						$("#"+nextItemId).addClass("active");
// 						$("#if"+nextItemId.substr(4)).removeClass("hidden");
// 						$("#"+nextItemId.substr(4)).parent().find("li").removeClass("active");
// 						$("#"+nextItemId.substr(4)).addClass("active");
// 					} else if(prevItem.length==1){
// 						$("#"+prevItemId).addClass("active");
// 						$("#if"+prevItemId.substr(4)).removeClass("hidden");
// 						$("#"+prevItemId.substr(4)).parent().find("li").removeClass("active");
// 						$("#"+prevItemId.substr(4)).addClass("active");
// 					}else{
// 						$("#"+sideid).parent().find("li").removeClass("active");
// 					}
// 				} else{
// //					console.log(sideid);
// 					$("#if"+sideid).remove();
// 				}
// 				var chara=$(obj).parent().text()
// 				if (arr.indexOf(chara)!=-1) {
// 					arr.splice(arr.indexOf(chara),1);
// 					$(obj).parent().parent().remove();
// 				}
// 			}
			
		</script>
		<script src="${pageContext.request.contextPath}/static/js/bks_web/index.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>