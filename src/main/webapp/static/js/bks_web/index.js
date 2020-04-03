// 立刻执行函数
// $.learunindex={
	// 	load:function () {
	// 		$(window).load(function () {
	// 			window.setTimeout(function () {
	// 				$('#ajax-loader').fadeOut();
	// 			}, 300);
	// 		});
	// 	}
	// };
    // code 
//后台管理框架模板
(function($){
	// var sidederbarList=[];
	var arr=[];
	$.learuntab ={
		siderbarAnimation:function(){
			$(this).parent().find("ul").slideToggle(200).parent().siblings().find("ul").slideUp(200);
			$(this).find("i.fa-angle-down").toggleClass('action').parents().siblings().find("i.fa-angle-down").removeClass('action');
		},
		refreshIframe:function (){
		 	var contTabList=$(".contTablist").children();
		 	if (contTabList.length!=0) {
		 		var curContTabId= $(".contTablist").find("li.active").prop("id");
		 		var sideId=curContTabId.substr(4);
		 		$("#if"+sideId).attr("src",$("#if"+sideId).attr("src"));
		 	}
		},
		closeCurIframe:function(){
			var contTabList=$(".contTablist li");
			if (contTabList.length!=0){
				var subNavId= $(".subnav").find("li.active").prop("id");
				var contId= $("#cont"+subNavId).prop("id");
				var iframeId=$("#if"+subNavId).prop("id");
				var curItem= $(".contTablist").find("li.active");
				var nextItem= curItem.next();
				var prevItem= curItem.prev();
				var contTabName=curItem.text();
				var index=arr.indexOf(contTabName);
				arr.splice(index,1);
				curItem.remove();
				$(".main_sideBar>ul>li").removeClass("active");
				if (nextItem.length==1){
					nextItem.addClass("active");
					var curItem1= $(".contTablist").find("li.active");
					var curItem1Id=curItem1.prop("id");
					var sideBarId= curItem1Id.substr(4);
					$("#"+sideBarId).parent().find("li").removeClass("active");
					$("#"+sideBarId).addClass("active");
					$("#"+sideBarId).parents("li").addClass("active");
					$("#"+sideBarId).parent().slideDown(200).parent().siblings().find("ul").slideUp(200);
					
					$("#if"+subNavId).remove();
					$("#if"+sideBarId).parent().children().addClass("hidden");
					$("#if"+sideBarId).removeClass("hidden");
				} else{
					if (prevItem.length==1) {
						prevItem.addClass("active");
						var curItem1= $(".contTablist").find("li.active");
						var curItem1Id=curItem1.prop("id");
						var sideBarId= curItem1Id.substr(4);
						$("#"+sideBarId).parent().find("li").removeClass("active");
						$("#"+sideBarId).addClass("active");
						$("#"+sideBarId).parent().slideDown(200).parent().siblings().find("ul").slideUp(200);
						
						$("#if"+subNavId).remove();
						$("#if"+sideBarId).parent().children().addClass("hidden");
						$("#if"+sideBarId).removeClass("hidden");
						
						var visibleWidth=$(".contentTab").width()-$(".btnboxL").width()-$(".contentTabR").width();
						var TablistWidth=$(".contTablist").width();
						if (TablistWidth>visibleWidth) {
							var overArea = TablistWidth-visibleWidth;
							$(".contTablist").css("margin-left","-"+overArea+"px");
						}else{
							$(".contTablist").css("margin-left","0");
						}
					} else{
						$(".subnav").parent().siblings().removeClass("active");
						$(".subnav").find("li").removeClass("active");
						$("iframe").remove();
						return false;
					}
				}
				
			}
		},
		closeOthers:function(){
			var ContTabList=$(".contTablist li");
			var curContTabId= $(".contTablist").find("li.active").prop("id");
			if (ContTabList.length!=0) {
				var sideId=curContTabId.substr(4);
				$("#"+curContTabId).siblings().remove();
				$("#if"+sideId).siblings().remove();
				var curText=$("#"+curContTabId).text();
				var index=arr.indexOf(curText);
				arr=arr.splice(index,1);
			}
		},
		closeAll:function(){
			var ContTabList=$(".contTablist li");
			if (ContTabList.length!=0) {
				$(".contTablist").find("li").remove();
				$(".contTablist").css("margin-left","0");
				$(".iframeWrap").children().remove();
				$(".main_sideBar>ul>li").find("i.fa-angle-down").toggleClass('action').parents().siblings().find("i.fa-angle-down").removeClass('action');
				$(".main_sideBar>ul>li").removeClass("active").find("ul>li").removeClass("active");
				$(".subnav").slideUp(200);
				arr=[];
			}
		},
		switchSideBar:function (){
			$(this).parents("header").toggleClass("switchHeader");
			$(".main_sideBar>ul>li").find("a i.fa-angle-down").removeClass("action");
			$(".main_wrap").toggleClass("switchCon");
			$(".main_sideBar .subnav").css("display","none");
			if ($(".main_wrap").hasClass("switchCon")) {
				$(".switchCon .main_sideBar>ul>li").mouseenter($.learuntab.showSubNav);
				$(".switchCon .main_sideBar>ul>li").mouseleave($.learuntab.hideSubNav);
			}else{
				$(".main_sideBar>ul>li").unbind("mouseenter");
				$(".main_sideBar>ul>li").unbind("mouseleave");
			}
		},
		showSubNav:function() {
			$(this).find(".subnav").css("display","block");
		},
		hideSubNav:function() {
			$(this).find(".subnav").css("display","none");
		},
		fullsCreen:function (){
			var de = document.documentElement;
		    if (de.requestFullscreen){
		        de.requestFullscreen();
		    } else if (de.mozRequestFullScreen) {
		        de.mozRequestFullScreen();
		    } else if (de.webkitRequestFullScreen) {
		        de.webkitRequestFullScreen();
			}
		},
		exitFullscreen:function (){
			var de = document;
		    if (de.exitFullscreen) {
		        de.exitFullscreen();
		    } else if (de.mozCancelFullScreen) {
		        de.mozCancelFullScreen();
		    } else if (de.webkitCancelFullScreen) {
		        de.webkitCancelFullScreen();
		    }
		},
		pagePrev:function (){
			var visibleWidth=$(".contentTab").width()-$(".btnboxL").width()-$(".contentTabR").width();
			var tablistWidth=$(".contTablist").width();
			if (tablistWidth>visibleWidth) {
				$(".contTablist").css("margin-left","0");
				$(".toLeft").css("color","#999");
				$(".toRight").css("color","#333");
			} 
		},
		pageNext:function (){
			var visibleWidth=$(".contentTab").width()-$(".btnboxL").width()-$(".contentTabR").width();
			var tablistWidth=$(".contTablist").width();
			if (tablistWidth>visibleWidth) {
				$(".contTablist").css("margin-left","-"+visibleWidth+"px");
				$(".toLeft").css("color","#333");
				$(".toRight").css("color","#999");
			}
		},
		addContTablist:function () {
			$(this).parents(".main_sideBar").children().children().removeClass("active");
			$(this).parents(".subnav").parent().addClass("active");
			$(this).parents(".main_sideBar").children().find(".subnav li").removeClass("active");
			$(this).parent().parent().children().removeClass("active");
			$(this).parent().addClass("active");
			var sid=$(this).parent().prop("id");
			var dataSrc=$(this).parent().attr("data-src");
			var iframe='<iframe src="'+dataSrc+'" class="" id="if'+sid+'" width="100%" height="100%" frameborder="0"></iframe>';
			
			$("#cont"+sid).parent().find("li").removeClass("active");
			$("#cont"+sid).addClass("active");
			$("#if"+sid).parent().find("iframe").addClass("hidden");
			$("#if"+sid).removeClass("hidden");
			
			var texts=$(this).find("span").text();
			if (arr.indexOf(texts)==-1) {
				arr.push(texts);
				var li='<li class="" id="cont'+sid+'"><a href="javascript:;">'+texts+'<i class="fa fa-times fa-fw"></i></a></li>';
				$(".contTablist").append(li);
				$("#cont"+sid).parent().find("li").removeClass("active");
				$("#cont"+sid).addClass("active");
				var visibleWidth=$(".contentTab").width()-$(".btnboxL").width()-$(".contentTabR").width();
				var tablistWidth=$(".contTablist").width();
				if (tablistWidth>visibleWidth) {
					$(".toLeft").css("color","#333");
					var overArea = tablistWidth-visibleWidth;
					var curTabItem=$(".contTablist li.active").width();
					$(".contTablist").css("margin-left","-"+(overArea+curTabItem)+"px");
				}
				
				$(".iframeWrap").append(iframe);
				$("#if"+sid).parent().find("iframe").addClass("hidden");
				$("#if"+sid).removeClass("hidden");
			}
			$(".contTablist>li>a").click($.learuntab.activeContTab)
			$(".contTablist>li>a>i").click($.learuntab.closeNavTab)
		},
		activeContTab:function() {
			$(this).parents(".main_wrap").find(".main_sideBar").children().find(".subnav li").removeClass("active");
			$(this).parents(".contTablist").find("li").removeClass("active");
			$(this).parent().addClass("active");
			
			var sidebarAndBtn=$(".main_sideBar").width()+$(".btnboxL").width();
			//console.log($(this).offset().left-sidebarAndBtn);//offset距离body的距离
			var curPosition=$(this).parent().offset().left-sidebarAndBtn+$(this).parent().width();//当前li的最右边到TAB盒子的距离
			var visibleWidth=$(".contentTab").width()-$(".btnboxL").width()-$(".contentTabR").width();
			if (curPosition>visibleWidth) {
				console.log("1111")
				$(".contTablist").css("margin-left","-"+(curPosition-visibleWidth)+"px");
			}
			if ($(this).offset().left<sidebarAndBtn) {
				var curItemOver=$(".main_sideBar").width()-$(this).offset().left;//当前左边超出部分
				var curUlMarginL=parseInt($(".contTablist").css("margin-left"));//当前ul的偏移
				var activeMarginL=curUlMarginL+curItemOver+$(".btnboxL").width();
				$(".contTablist").css("margin-left",activeMarginL+"px");
			}
			var contTab=$(this).parent().prop("id");
			var sideid=contTab.substr(4);
			
			$("#"+sideid).parents("ul").children().removeClass("active");
			$("#"+sideid).parents("li").addClass("active");
			$("#"+sideid).parent().slideDown(200).parent().siblings().find("ul").slideUp(200);
			$("#"+sideid).parents("li").find("a i.fa-angle-down").addClass('action').parents("li").siblings().find("a i.fa-angle-down").removeClass('action');
			
			$("#"+sideid).parent().find("li").removeClass("active");
			$("#"+sideid).addClass("active");
			
			$("#if"+sideid).parent().find("iframe").addClass("hidden");
			$("#if"+sideid).removeClass("hidden");
		},
		closeNavTab:function(){
			var contTabId=$(this).parent().parent().prop("id");//当前ID
			var sideid=contTabId.substr(4);
			var nextItem=$("#"+contTabId).next();
			var prevItem=$("#"+contTabId).prev();
			var nextItemId=nextItem.prop("id");
			var prevItemId=prevItem.prop("id");
			
			if ($("#"+contTabId).hasClass("active")){
				$("#if"+sideid).remove();
				if (nextItem.length==1){
					$("#"+nextItemId).addClass("active");
					$("#if"+nextItemId.substr(4)).removeClass("hidden");
					$("#"+nextItemId.substr(4)).parent().find("li").removeClass("active");
					$("#"+nextItemId.substr(4)).addClass("active");
				} else if(prevItem.length==1){
					$("#"+prevItemId).addClass("active");
					$("#if"+prevItemId.substr(4)).removeClass("hidden");
					$("#"+prevItemId.substr(4)).parent().find("li").removeClass("active");
					$("#"+prevItemId.substr(4)).addClass("active");
				}else{
					$("#"+sideid).parent().find("li").removeClass("active");
				}
			} else{
				$("#if"+sideid).remove();
			}
			var chara=$(this).parent().text()
			if (arr.indexOf(chara)!=-1) {
				arr.splice(arr.indexOf(chara),1);
				$(this).parent().parent().remove();
			}
		},
		init:function (){
			$(".closeCur").on("click",$.learuntab.closeCurIframe);
			$(".closeAll").on("click",$.learuntab.closeAll);
			$(".closeOthers").on("click",$.learuntab.closeOthers);
			$(".main_sideBar>ul>li>a").on("click",$.learuntab.siderbarAnimation);
			$(".switchLogo").on("click",$.learuntab.switchSideBar);
			$(".switchIcon").on("click",$.learuntab.switchSideBar);
			$(".curRefresh").on("click",$.learuntab.refreshIframe);
			$(".toLeft").on("click",$.learuntab.pagePrev);
			$(".toRight").on("click",$.learuntab.pageNext);
			$(".fullsCreen").on('click',function() {
				if (!$(this).attr('fullscreen')) {
			        $(this).attr('fullscreen', 'true');
			        $.learuntab.fullsCreen();
			    } else {
			        $(this).removeAttr('fullscreen')
			        $.learuntab.exitFullscreen();
			    }
			});
			$(".subnav>li>a").on("click",$.learuntab.addContTablist);
		}
	};
	
	$(function () {
		// $.learunindex.load();
		// $.learunindex.loadMenu();
		$.learuntab.init();
	});
})(jQuery);

