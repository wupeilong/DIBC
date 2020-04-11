<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>企业信息列表</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/zhou_style.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/selectmenu/css/selectmenu.css" type="text/css">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<style type="text/css">
		.navxg{
			padding:0;
		}
	</style>	
</head>
	<body class="o-page p-about">
		<div id="page" class="public_list">
			<div id="header"  style="background: url(${pageContext.request.contextPath}/static/images/bks_wap/menu-bg.svg) no-repeat center bottom !important;">
				<div class="header-content">
					<a href="javascript:location.replace(location.href);" class="p-link-back"><i class="fa fa-refresh"></i></a>	
					<a class="" id="demoSingle" href="#menu"><i class="fa fa-search fa-2x text-white" style="margin-top:.5em"></i></a>
					<!-- menu-btn -->
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-angle-left fonwei"></i></a>					
				</div>
			</div>
			<div class="bannerPane">
				<div class="overlay"></div>
				<div class="s-banner-content">
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
			</div>			
		</div>   		
		<main class="main margin-top padding-side" style="padding:80px 0;">
			<div class="panel panel-info" style="border-radius: 0px;">				
				<ul class="list-group  panel-body padding0" id="result_list"></ul>
			</div>
		</main>	
	<c:import url="public/public_footer.jsp"></c:import>
	</body>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/static/selectmenu/js/selectmenu.min.js" ></script>    
    <script type="text/javascript">
	$(function(){	
		selectunit("");
		var url = "${pageContext.request.contextPath}/wap_unit/select_unit";		
		$.ajax({
			"url" : url,			
			"type" : "POST",
			"dataType" : "json",
			"success" : function(e) {				
				if (e.state == 0) {layer.msg(e.message,{icon:2,time:1000});
					return;
				}else{					
					 $('#demoSingle').click(function(){
						$(this).selectMenu({
							title : '<i class="fa fa-fw fa-thumbs-o-up"></i> 请选择市场主体',
							arrow : true,
							showField : 'unitName',
							keyField : 'unitId',
							 position : 'center',
							search : true,
							data :e.data,
							eSelect : function(data){
								if(data && data.length > 0){
								console.log(data);
								selectunit(data[0].unitId)
								}
							}
						});
					});
				}
			}
		});		 
	});	
	function selectunit(unitId) {
		var url = "${pageContext.request.contextPath}/wap_unit/list";
		var data = "unitId=" +unitId;
		$.ajax({
			"url" : url,
			"data" : data,
			"type" : "POST",
			"dataType" : "json",
			"success" : function(obj) {
				console.log(obj);
				if (obj.state == 0) {
					layer.msg(obj.message,{icon:2,time:1000});
					return;
				}else{
					var result = "";
					console.log(obj.data);
					for(var i=0;i<obj.data.length;i++){
						result +='<li class="public_list_li">'+
								'<a href="${pageContext.request.contextPath}/wap_public_uintdetail?unitid='+obj.data[i].unitId+'">'+
								'<div class="">'+
								'<h5 class="fonwei public_list_h5">'+obj.data[i].unitName+'</h5>'+							
								'<div class="text-muted bfrifRow" style="    padding: 7px 0px 7px 17px;">'+
								'<img alt="" src="${pageContext.request.contextPath}/static/images/bks_wap/qylx.png" style="width: 20px;">企业类型:';
								if(obj.data[i].unitType == 1){
									result += '<span>监管局</span>';
								}
								if(obj.data[i].unitType == 2){
									result += '<span>学校</span>';
								}
								if(obj.data[i].unitType == 3){
									result += '<span>餐饮</span>';
								}
								if(obj.data[i].unitType == 4){
									result += '<span>其它</span>';
								}																
						 result +='</div></div>'+
									'<div class="fb" >'+
									'<div class="text-muted bfrifRow"style="    padding: 0px 0px 7px 17px;">'+
									'<img alt="" src="${pageContext.request.contextPath}/static/images/bks_wap/frdb.png" style="width: 20px;">法人代表:'+								
									'<span>'+obj.data[i].legalPerson+'</span>'+
									'</div>'+
									'<a href="${pageContext.request.contextPath}/wap_public_uintdetail?unitid='+obj.data[i].unitId+'">'+
									'<img alt="" src="${pageContext.request.contextPath}/static/images/bks_wap/public_xq.png" style="width: 40px;margin-top: -15px;margin-right:1em"></a>'+							
									'</div></a></li>';																			
					}
					$("#result_list").html(result);							
				}		
			}
		});
	}
    </script>	
</html>
