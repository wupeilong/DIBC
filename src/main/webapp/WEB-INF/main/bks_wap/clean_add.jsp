<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>添加清洗消毒记录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css"/>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>	
	<script src="${pageContext.request.contextPath}/static/js/bks_wap/rolldate.min.js" type="text/javascript" charset="utf-8"></script>
</head>
	<body class="contain">
		<div class="navigation bg-primary">
			<div class="fb padding-side">
				<c:if test="${user.type == 2}">
					<a href="javascript:history.go(-1)" class="text-white"><i class="fa fa-angle-left"></i></a>
				</c:if>				
			</div>
		</div>
		<main class="main margin-top2 padding-side05">
			<form action="" method="post">
				<legend class="text-center border0">餐饮具、工具及保洁设施清洗消毒记录</legend>
				<fieldset>
					<div class="">
						<table class="table table-bordered" cellspacing="" cellpadding="">
							<caption>
								<div class="fb">
									<span class="">消毒人员：<span>${user.username }</span></span>
									<span class="">消毒日期：
										<span>
											<script type="text/javascript">
						                     var date = new Date();
						                     document.write(date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日");
						                    </script>
					                   	</span>
				                   	</span>
								</div>
			                   </span>
							</caption>
							<thead>
								<tr><th colspan="2">消毒项目</th><th colspan="2">消毒结果</th></tr>
							</thead>
							<tbody>
								<tr>
									<td rowspan="4" class="vertical-mid">餐(炊)具种类</td>
									<td>小餐具类</td><td>是：<input type="radio" name="tableware0" id="tableware" value="1" /></td><td>否：<input type="radio" name="tableware0" id="tableware" value="2" /></td>
								</tr>
								<tr>
									<td>大餐具类</td><td>是：<input type="radio" name="tableware1" id="tableware1" value="1" /></td><td>否：<input type="radio" name="tableware1" id="tableware1" value="2" /></td>
								</tr>
								<tr>
									<td>筷子、勺子类</td><td>是：<input type="radio" name="tableware2" id="tableware2" value="1" /></td><td>否：<input type="radio" name="tableware2" id="tableware2" value="2" /></td>
								</tr>
								<tr>
									<td>锅、盆类</td><td>是：<input type="radio" name="tableware3" id="" value="1" /></td><td>否：<input type="radio" name="tableware3" id="" value="2" /></td>
								</tr>
								
								<tr>
									<td colspan="2" class="">工具类</td><td>是：<input type="radio" name="tableware4" id="" value="1" /></td><td>否：<input type="radio" name="tableware4" id="" value="2" /></td>
								</tr>
								<tr>
									<td colspan="2" class="">餐具保洁设施</td><td>是：<input type="radio" name="tableware5" id="" value="1" /></td><td>否：<input type="radio" name="tableware5" id="" value="2" /></td>
								</tr>
								<tr>
									<td rowspan="2" class="vertical-mid">消毒方法</td><td>电子消毒柜</td><td>是：<input type="radio" name="tableware6" id="" value="1" /></td><td>否：<input type="radio" name="tableware6" id="" value="2" /></td>
								</tr>
								<tr>
									<td>消毒药水</td><td>是：<input type="radio" name="tableware7" id="" value="1" /></td><td>否：<input type="radio" name="tableware7" id="" value="2" /></td>
								</tr>
								<tr>
									<td colspan="2">消毒时间</td>
									<td colspan="2">
										<div class="">
											<input readonly="" class="form-control" type="text" id="date-group1-6" placeholder="请输入消毒时间">
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
				<button type="button" class="btn btn-primary form-control" onclick="diskinput()">提交</button>
			</div>
		</main>		
		<script type="text/javascript">
			// var query = new Array();
			// var tr = document.querySelectorAll("tbody tr");
			// for(var i = 0; i < tr.length; i++){
			//    query[i]=new Array(); 
			//    query[i][0]=tr[i].cells[1].innerText;
			//    query[i][1]=tr[i].cells[2].innerText; 
			//    query[i][2]=tr[i].cells[3].querySelector("input").value;
			// }
			// console.log(query)
			
			new Rolldate({
				el: '#date-group1-6',
				format: 'hh:mm',
				lang:{
					title:'选择时间'
				},
				confirm: function(date) {
					$("#date-group1-6").val(date);
					console.log($("#date-group1-6").val())
				},
			})
			
		</script>
	<c:import url="public/footer.jsp"></c:import>
	</body>
<script type="text/javascript">
function diskinput(){	
	var queryrights=new Array();	 	
	for(var i = 0; i < 8; i++){ 
		queryrights[i]=$("input[name='tableware"+i+"']:checked").val();	
	} 	
	var url="clean_regadd"; 
	var  data ="queryrights="+JSON.stringify(queryrights);	 			  
    $.ajax({    	   
	   "url":url,    	  
	   "data":data,
	   "type":"POST",
	   "dataType":"json",
	   "success":function(obj){    		  
		   if (obj.state == 0) {
				layer.msg(obj.message,{icon:2,time:1000});
				return;				
			}else{					
				layer.msg(obj.message,{icon:1,time:1000},function(){location.href="${pageContext.request.contextPath}/wap_clean/clean_list"});
			}  
	   }      
	});  
}
</script>
</html>
