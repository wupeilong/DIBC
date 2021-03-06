<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>配送信息详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/style.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/index.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/layui/css/layui.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />
	<link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>	
	<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/ajaxfileupload.js"></script>	
</head>
	<body class="contain">
		<div id="page">
			<div id="header">
				<div class="header-content">
					<a href="${pageContext.request.contextPath}/wap_dry/delivery_detal?id=${distributionDetial.id}" class="p-link-back"><i class="fa fa-refresh"></i></a>					
					<a class="menu-btn" id="demoSingle" href="#menu"></a>
					<a href="javascript:history.go(-1)" class="p-link-home"><i class="fa fa-arrow-left"></i></a>
					<div class="header-btn text-right">
						<c:if test="${user.type == 2}">
							<c:if test="${distributionDetial.status == 1 && user.id == distributionDetial.mealsUserId}">
								<button type="button" class="btn btn-primary" id="end">确认送达</button>
							</c:if>
							<c:if test="${distributionDetial.status == 2 && user.unitId == distributionDetial.acceptanceUnitId}">
								<button type="button" class="btn btn-primary" id="reg">确认验收</button>
							</c:if>
							<c:if test="${distributionDetial.status == 3}">
								<button type="button" class="btn btn-primary" id="result">已验收</button>
							</c:if>	 				
						</c:if>
						<c:if test="${user.type != 2}">
							<c:if test="${distributionDetial.status == 1}">
								<button type="button" class="btn btn-primary">启送中</button>
							</c:if>
							<c:if test="${distributionDetial.status == 2}">
								<button type="button" class="btn btn-primary">已送达</button>
							</c:if>
							<c:if test="${distributionDetial.status == 3}">
								<button type="button" class="btn btn-primary" id="result">已验收</button>
							</c:if>							
						</c:if>
					</div>
				</div>
			</div>
			<div class="bannerPane">
				<div class="overlay"></div>
				<div class="s-banner-content">
					<div><img  width="100" src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" /></div>					
				</div>
			</div>						
		</div>		
		<main class="main padding-side05">
			<div class="forms margin-top">
				<form action="" method="post" class="form1 cur margin-bot"  id="form1">
					<fieldset>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">食品类型:</span>
						  <div class="form-control box-shadow0 border0" style="z-index: 1;">
							  <c:if test="${distributionDetial.type == 1}">
							  		早餐
							  </c:if>
							  <c:if test="${distributionDetial.type == 2}">
							  		午餐
							  </c:if>
							  <c:if test="${distributionDetial.type == 3}">
							  		晚餐
							  </c:if>
						  </div>
						</div>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">配餐单位:</span>
						  <div class="form-control box-shadow0 border0" style="z-index: 1;">${distributionDetial.mealsUnitName }</div>
						</div>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">送&nbsp;&nbsp;餐&nbsp;&nbsp;人:</span>
						  <div class="form-control box-shadow0 border0" style="z-index: 1;">${distributionDetial.mealsUserName }</div>
						</div>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">订&nbsp;&nbsp;单&nbsp;&nbsp;号:</span>
						  <div class="form-control box-shadow0 border0" style="z-index: 1;">${distributionDetial.id }</div>
						</div>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">启送时间:</span>
						  <div class="form-control box-shadow0 border0" style="z-index: 1;"><fmt:formatDate value="${distributionDetial.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
						</div>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">送达时间:</span>
						  <div class="form-control box-shadow0 border0" style="z-index: 1;"><fmt:formatDate value="${distributionDetial.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
						</div>						
						<div class="fsa margin-bot2">
							<div class="">
								<div class="fc">
									<div class="layui-upload-list">
									  <img class="layui-upload-img" src="${pageContext.request.contextPath}${distributionDetial.packingPhoto }">
									</div>
								</div>
								<div class="text-center">送餐装箱图</div>
							</div>
							<div class="">
								<div class="fc">
									<div class="layui-upload-list">
									  <img class="layui-upload-img" src="${pageContext.request.contextPath}${distributionDetial.sealPhoto }">
									</div>
								</div>
								<div class="text-center">装箱封条图</div>
							</div>
						</div>
						<div class="fsa margin-bot2">
							<div class="">
								<div class="fc">
									<div class="layui-upload-list">
									  <img class="layui-upload-img" id="fee" src="${pageContext.request.contextPath}${distributionDetial.carPhoto }">
									</div>
								</div>
								<div class="text-center">送餐车图</div>
							</div>
											
							<div class="">
								<div class="fc">
									<div class="upload_imgs margin_tb10">
										<div class="fc tip_text">
											<div class="text-info">
												<div class="fc"> <i class="fa fa-plus padding-side05"></i> </div>
												<div class="text-center">拆封取餐照</div>
											</div>
										</div>									
										<c:if test="${distributionDetial.status == 3}">
											<img alt="" src="${pageContext.request.contextPath}${distributionDetial.openedPhoto}" id="preview">
										</c:if>
										<c:if test="${distributionDetial.status == 2 }">
											<input type="file" name="" id="fileinput" value="" accept="image/*"/>
											<img src="" id="preview">
										</c:if>	
									</div>
								</div>							
								<div class="text-center">拆封取餐照</div>
							</div>
							
						</div>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">验收时间:</span>
						  <div class="form-control box-shadow0 border0"><fmt:formatDate value="${distributionDetial.acceptanceTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
						</div>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">配送状态:</span>
						  <div class="form-control box-shadow0 border0">
						  		<c:if test="${distributionDetial.status == 1}">
						  			启送中
						  		</c:if>
						  		<c:if test="${distributionDetial.status == 2}">
						  			已送达
						  		</c:if>
						  		<c:if test="${distributionDetial.status == 3}">
						  			已验收
						  		</c:if>
						  </div>
						</div>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">配送地点:</span>
						  <div class="form-control box-shadow0 border0">${distributionDetial.address}</div>
						</div>
						<div class="input-group form-group fs border-bottom">
						  <span class="input-group-addon border0 clear-bg fonwei" id="sizing-addon1">创建时间:</span>
						  <div class="form-control box-shadow0 border0"><fmt:formatDate value="${distributionDetial.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
						</div>
					  </fieldset>
				</form>
				<%-- <form action="" method="" class="form2 margin-bot" id="form2">
					<div class="text-muted padding-side">
						<div class="fb">
							<div class="">
								<label>学校名称：</label><span>贵阳一中</span>
							</div>
							<div class="">
								<label>日期：</label><span>2020-03-24</span>
							</div>
						</div>
					</div>
					<table class="table table-bordered" cellspacing="" cellpadding="">
						<thead class="bg-primary">
							<tr><th style="width: 4em;">序号</th><th style="width: 6em;">指标项目</th><th>验收内容</th><th>验收标准</th><th style="width: 6em;">是否达到</th></tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="9" class="vertical-mid">1</td><td rowspan="9" class="vertical-mid">人员链</td>
								<td>建立疫情防控工作领导小组</td>
								<td>校长为第一责任人</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>疫情报告有专人负责</td><td>明确疫情报告人及其职责范围</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>制定疫期人员选派制度</td>
								<td>疫期工作人员14天内不得有出省经历、不得有发热、咳嗽症状，工作人员名单汇报市监局并不得增添工作人员。</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>学校封闭管理制度</td><td>学校实行封闭管理，校外无关人员不得入校</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>学校防疫物资储备领用制度</td><td>包括防疫物资领用进货台账、领用使用要求</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>疫期食堂管理制度</td><td>包括学生就餐地点划分、食堂管理制度、餐具消杀办法</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>从业人员健康检查制度</td><td>填写从业人员去向表，开展从业人员晨午晚检要求，测量体温</td>
								<td class="vertical-mid">
									<select >
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>学校分餐制度</td><td>包括餐食交接办法、学生用餐时间表、分餐负责人及分餐办法</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>菜单准备</td><td>菜单应报备市场监管局审批，更换菜单须提出申请</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td rowspan="" class="vertical-mid">2</td><td class="vertical-mid">配送链</td>
								<td>按照“五专”要求进行配送食品。即专车配送，专人配送，专点接收，专签封箱，专间用餐。</td>
								<td>对于同一订购学生餐的学校，应选择食品监督部门和教育行政部门认定的有资质的集体配餐单位进行送餐，配餐公司必须安排专车和专人配送。学校安排专人、设立专点进行餐食验收，核对餐盒标签信息，送餐全程餐食应密封，封条上有配餐溯源信息；学校应采用送餐到班方式供学生就餐，避免校内人员聚集就餐，防止扎堆就餐。师生在就餐前应做好手部卫生清洗工作，进餐时不交流、分散做、单人单座、同向而食、缩短就餐时间，食物残渣要倾倒到指定密闭垃圾桶内，每日定时对就餐区域实行消毒。</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<c:if test="${distributionDetial.cateringType == 1}">								
							
							<tr>
								<td rowspan="" class="vertical-mid">3</td><td class="vertical-mid">采购链</td>
								<td>各类索证索票齐全，原材料台账登记完善。</td>
								<td>学校应加强食材管理，规范采购渠道做好进货登记台帐，学校不得采购三无产品，不得采购、宰杀活禽，不得购买野生动物及其制品。不使用三无产品、所有食材应做到源头可溯、源头知底，供货商应资质齐全并提供产品检测报告。</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td rowspan="" class="vertical-mid">4</td><td class="vertical-mid">制作链</td>
								<td>严格按照餐饮操作规范要求</td>
								<td>不得加工制作冷荤凉菜，不得加工制作含有豆角的菜品，不得采购使用亚硝酸盐，并在每餐开餐前对提供餐食取样保存，所有留样食品用密封盒子保存至少48小时，每样菜品留样至少125克，存放于专人保管钥匙的上锁的留样冰箱内。</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td rowspan="" class="vertical-mid">5</td><td class="vertical-mid">消毒链</td>
								<td>餐具消毒，环境消毒，车辆消毒</td>
								<td>学校应对餐（饮）具、厨具、加工间进行严格消毒。餐（饮）具应一人一具一用一消毒，餐（饮）具去残渣、清洗后要煮沸或流通蒸汽消毒15分钟；或采用热力消毒消毒柜等消毒方式；或采用有效氯250mg/L的含氯消毒剂浸泡30分钟，消毒后应将残留消毒剂冲洗干净，消毒后的餐用具应立即倒置储存在专用保洁柜内备用。</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td rowspan="2" class="vertical-mid">6</td><td rowspan="2" class="vertical-mid">监管链</td>
								<td>学校监管</td>
								<td>各复课学校要落实疫情防控和食品安全主体责任，各学校校长是学校食堂食品安全第一负责人，分管校长是具体责任人。学校应自行开展自检自查活动，自查情况上报云岩区市场监督管理局。学校食堂加工区域及厨房用具、餐具应进行彻底清洗消毒。开餐前应要对所有食品及食品添加剂进行检查；疫情期间，学校应关闭校内超市及小卖部。</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>市场监督管理局监管</td>
								<td>云岩区市场监管局派辖区分局一名副局长及一名干部专人专岗驻场监督学校及配餐单位食品安全。</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td rowspan="" class="vertical-mid">7</td><td class="vertical-mid">检测链</td>
								<td>市场监管局进行快检</td>
								<td>疫情期间，云岩区市场监督管理局会对各学校进行不定时多频次随机快检，对快检筛查出阳性的食品会责令学校立即停止使用，在将样品送至具有相关资质的检测机构进行检验后，如果确定认为阳性，将依法对学校及相关负责人进行处理。</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td rowspan="" class="vertical-mid">8</td><td class="vertical-mid">督查链</td>
								<td>市场监管局及相关部门进行督查</td>
								<td>由局党组成员带领相关科室组成督查组，严格督办督查各小组及成员单位工作完成情况。</td>
								<td class="vertical-mid">
									<select>
										<option value ="1" selected="">是</option>
										<option value ="0">否</option>
									</select>
								</td>
							</tr>
							</c:if>
						</tbody>
					</table>
					<div class="margin-top2 margin-bot2">
						<c:if test="${distributionDetial.status == 2}">
							<button type="button" class="btn btn-primary form-control" id="acceptance">提交</button>
						</c:if>
					</div>
				</form> --%>
			</div>
		</main>			
		<script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
		
	<c:import url="public/footer.jsp"></c:import>
	</body>
<script type="text/javascript">
		/* $("#reg").click(function() {
			console.log("12111");
			//验收
			if($("#preview").attr('src') == ""){
				layer.msg("请上传拆封取餐照",{icon:2,time:1000});
				$("#preview").focus();
				return;
			} 
			//$(this).parents("#form1").removeClass("cur");
			//$(this).parents("#form1").next().addClass("cur");
			$("#form1").removeClass("cur");
			//$("#form2").addClass("cur");
		})*/
		
		/* $("#result").click(function() {
			$(document).scrollTop(0);
			var detialResult = '${distributionDetial.acceptanceResult}';
			if(detialResult != "" && detialResult != null ){
				var data = JSON.parse(detialResult);
				$(".form2").find("select").each(function(index){
					if(data[index] == 1){
						$(this).html("<option value ='1' selected='selected'>是</option>");
					}else{
						$(this).html("<option value ='0' selected='selected'>否</option>");
					}				
				});
				$(".form1").removeClass("cur");
				$(".form2").addClass("cur");
			}			
		}) */
		
		var $current = $("fieldset");		
		$current.find("img").bind("click",function(){
			var path=$(this).attr('src');		
			layerImg(path);
		});	
		
		 $('#fileinput').on('change',function () {	    	
		    	intoBase64("fileinput","preview");	    	
		    });	
		 
		$("#end").click(function () {			
			layer.confirm('是否确认送达？', {
				  btn: ['是', '否']
				}, function(index, layero){
					songda();
				}, function(index){				  
				});
		})
		
		//确认送达
		function songda(){
			var data = "id=${distributionDetial.id}";
			var url = "${pageContext.request.contextPath}/wap_dry/service";
			$.ajax({
				"url" : url,
				"data" : data,
				"type" : "POST",
				"dataType" : "json",
				"success" : function(obj) {
					if (obj.state == 0) {
						layer.msg(obj.message,{icon:2,time:1000});						
					}else{
						layer.msg(obj.message,{icon:1,time:1000},function(){
							window.location.reload();
						});							
					}					
				}
			}); 
		}
		
		$("#reg").click(function () {
//		$("#acceptance").click(function () {
			 //验收
			 if($("#preview").attr('src') == ""){
				layer.msg("请上传拆封取餐照",{icon:2,time:1000});
				$("#preview").focus();
				return;
			 }
			 layer.confirm('是否确认验收？', {
				  btn: ['是', '否'] //可以无限个按钮
				}, function(index, layero){
					acceptance();
				  	//按钮【按钮一】的回调
					//layer.close(index);
				}, function(index){
				  	//按钮【按钮二】的回调
					//layer.alert("按钮二");
				});
		})
		
		//确认验收
		function acceptance(){	
			var loadingindex=layerloadingOpen();
			var formData = new FormData();
			var acceptanceResult = new Array();
			$(".form2").find("select").each(function(index){
				var acceptance = $(this).children("option:selected").val();
				acceptanceResult[index] = acceptance;
			});
			formData.append('id','${distributionDetial.id}');//订单ID
			formData.append('acceptanceResult',JSON.stringify(acceptanceResult));//验收结果
			formData.append('openedPhoto',dataURLtoFile($("#preview").attr('src'),'dsf.jpg'));//拆封取餐照
			var url = "${pageContext.request.contextPath}/wap_dry/acceptance";
			$.ajax({
				  url: url,
		          type: 'POST',
		          cache: false,
		          data: formData,			        
		          processData: false,
		          contentType: false,
				  success : function(obj) {
					layer.close(loadingindex);
					if (obj.state == 0) {
						layer.msg(obj.message,{icon:2,time:1000});						
					}else{
						layer.msg(obj.message,{icon:1,time:1000});							
					}		
					//延时刷新页面
					setTimeout(function (){							 
						window.location.reload();
					}, 3000);	
				}
			}); 
		}		
	</script>	
</html>
