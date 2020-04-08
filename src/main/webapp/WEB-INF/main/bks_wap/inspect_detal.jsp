<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<title>监督检查表</title>
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
		<main class="main margin-top padding-side05">
			<form action="" method="post">
				  <div class="">
				  	<table class="table table-bordered" cellspacing="" cellpadding="">
				  		<caption>
				  			<c:if test="${checkListbyid.checkType==1}">
				  				<h3 class="text-center">食品商家专项监督检查表</h3>
				  			</c:if>
							<c:if test="${checkListbyid.checkType==2}">
				  				<h3 class="text-center">监督管理局专项监督检查表</h3>
				  			</c:if>
				  			<c:if test="${checkListbyid.checkType==3}">
				  				<h3 class="text-center">督查专项监督检查表</h3>
				  			</c:if>
							<div class="margin-top2">
								<div class="">
									<div class="padding-side margin-top05">
										<span class="">名称：</span><span>${checkListbyid.unitName }</span>
									</div>
									<div class="padding-side margin-top05">
										<span class="">地址：</span><span>${checkListbyid.unitAddress }</span>
									</div>
								</div>
								<div class="fs margin-top05 padding-side">
									<div class="form_title">类型：</div>
									<div class="">
										<label for="" class="padding-side05"><input type="radio" name="objectType" id="" value="大学" /> <span>大学</span></label>
										<label for="" class="padding-side05"><input type="radio" name="objectType" id="" value="高职高专" /> <span>高职高专</span></label>
										<label for="" class="padding-side05"><input type="radio" name="objectType" id="" value="中学" /> <span>中学</span></label>
										<label for="" class="padding-side05"><input type="radio" name="objectType" id="" value="小学" /> <span>小学</span></label>
										<label for="" class="padding-side05"><input type="radio" name="objectType" id="" value="幼儿园" /> <span>幼儿园</span></label>
										<label for="" class="padding-side05"><input type="radio" name="objectType" id="" value="餐饮企业" /> <span>餐饮企业</span></label>
									</div>
									<input type="hidden" value="${checkListbyid.unitType}" id="unitType">
									<script type="text/javascript">
									$(":radio[name='objectType'][value='"+$('#unitType').val()+"']").prop("checked", "checked");
									</script>
								</div>
								<div class="margin-top05 padding-side fb">
									<div class="">
										<div class="">
											负责人员：<span class="" id="legalPerson">${checkListbyid.unitPrincipal }</span>
										</div>
										<div class="margin-top05">
											检查人员：</span><span class="">${checkListbyid.inspectors }</span>
										</div>
									</div>
									<div class="">
										<div class="">
										联系电话：<span class="">${checkListbyid.unitPhone }</span>
										</div>
										<div class="margin-top05">
											<span class="" style="width: 100px;" >检查时间：</span>
						  					<span class="">${checkListbyid.dailyTime }</span>
										</div>
									</div>
								</div>
							</div>
						</caption>
						
						<!-- <select name=""> <option value="">请选择</option> <option value="">合格</option> <option value="">不合格</option> </select> -->
				  		<thead>
				  			<tr><th style="width: 6em;">检查项目</th><th>检查内容</th><th style="width: 6em;">检查结果</th></tr>
				  		</thead>				  		
				  		<tbody>
				  			<tr><td class="vertical-mid" rowspan="14">食品安全管理</td><td>建立了以校长为第一责任人的学校食堂食品安全责任制</td><c:if test="${InspectDetal[0]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[0]==1}"><td style="color: green;">合格</td>	</c:if></tr>
				  			<tr><td>有健全的学校食品安全管理机构</td><c:if test="${InspectDetal[1]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[1]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>有专职食品安全管理人员</td><c:if test="${InspectDetal[2]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[2]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>落实了食品安全责任制度，明确了各环节、各岗位从业人员的责任</td><c:if test="${InspectDetal[3]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[3]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>开展经常性食品安全工作检查并有记录</td><c:if test="${InspectDetal[4]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[4]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>疫情报告有专人负责，明确疫情报告人及其职责范围</td><c:if test="${InspectDetal[5]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[5]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>制定疫期人员选派制度：疫期工作人员14天内不得有出省经历、不得有发热、咳嗽症状，工作人员名单汇报市监局并不得增添工作人员。</td><c:if test="${InspectDetal[6]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[6]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>学校封闭管理制度：学校实行封闭管理，校外无关人员不得入校</td><c:if test="${InspectDetal[7]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[7]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>学校防疫物资储备领用制度：包括防疫物资领用进货台账、领用使用要求</td><c:if test="${InspectDetal[8]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[8]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>疫期食堂管理制度：包括学生就餐地点划分、食堂管理制度、餐具消杀办法</td><c:if test="${InspectDetal[9]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[9]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>从业人员健康检查制度填写从业人员去向表，开展从业人员晨午晚检要求，测量体温</td><c:if test="${InspectDetal[10]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[10]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							
							
							<tr><td>学校分餐制度：包括餐食交接办法、学生用餐时间表、分餐负责人及分餐办法</td><c:if test="${InspectDetal[11]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[11]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>疫情期间，校内超市及小卖部不得营业</td><c:if test="${InspectDetal[12]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[12]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>菜单准备：菜单应报备市场监管局审批，更换菜单须提出申请</td><c:if test="${InspectDetal[13]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[13]==1}"><td style="color: green;">合格</td>	</c:if></tr>
				  			<tr><td class="vertical-mid" rowspan="3">许可情况</td><td>食品经营许可证在有效期内</td><c:if test="${InspectDetal[14]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[14]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>未超出许可范围经营</td><c:if test="${InspectDetal[15]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[15]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>没有转让、涂改、出借、倒卖、出租许可证的行为</td><c:if test="${InspectDetal[16]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[16]==1}"><td style="color: green;">合格</td>	</c:if></tr>
				  			<tr><td class="vertical-mid" rowspan="4">食堂环境</td><td>环境定期清洁,保持良好</td><c:if test="${InspectDetal[17]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[17]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>具有消除老鼠、蟑螂、苍蝇和其他有害昆虫及其孳生条件的防护措施</td><c:if test="${InspectDetal[18]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[18]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>具有足够的通风、排烟设施</td><c:if test="${InspectDetal[19]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[19]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>与厕所等污染源的距离在规定范围内</td><c:if test="${InspectDetal[20]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[20]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							
							
							
							
							
							<tr><td class="vertical-mid" rowspan="4">健康管理及培训</td><td>建立了从业人员健康管理制度</td><c:if test="${InspectDetal[21]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[21]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>从业人员均持有有效的健康合格证明上岗</td><c:if test="${InspectDetal[22]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[22]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>未发现患有有碍食品安全疾病的从业人员加工直接入口食品</td><c:if test="${InspectDetal[23]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[23]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>开展食品安全知识和技能培训，从业人员掌握食品安全基本知识</td><c:if test="${InspectDetal[24]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[24]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td class="vertical-mid" rowspan="4">落实索证索票制度</td><td>采购食品及原料、食品添加剂及食品相关产品进货查验、索证索票并具有采购记录台账</td><c:if test="${InspectDetal[25]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[25]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>不存在“三个严禁”和国家禁止使用或来源不明的食品及原料、食品添加剂及食品相关产品</td><c:if test="${InspectDetal[26]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[26]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>食用油脂、散装食品、一次性餐盒和筷子的进货渠道符合规定，落实索证索票制度</td><c:if test="${InspectDetal[27]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[27]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>库存食品未超过保质期限，原料贮存符合相关要求</td><c:if test="${InspectDetal[28]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[28]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td class="vertical-mid" rowspan="5">清洗消毒</td><td>配备了有效洗涤消毒设施，且数量满足实际需要</td><c:if test="${InspectDetal[29]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[29]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>设立了专用餐饮具保洁设施（柜）</td><c:if test="${InspectDetal[30]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[30]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							
							
							
							
							
							<tr><td>消毒池与其他水池未混用</td><c:if test="${InspectDetal[31]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[31]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>消毒人员掌握基本消毒知识</td><c:if test="${InspectDetal[32]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[32]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>学校应对餐（饮）具、厨具、加工间进行严格消毒。餐（饮）具应一人一具一用一消毒，餐（饮）具去残渣、清洗后要煮沸或流通蒸汽消毒15分钟；或采用热力消毒消毒柜等消毒方式；或采用有效氯250mg/L的含氯消毒剂浸泡30分钟，消毒后应将残留消毒剂冲洗干净，消毒后的餐用具应立即倒置储存在专用保洁柜内备用。</td><c:if test="${InspectDetal[33]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[33]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td class="vertical-mid" rowspan="7">食品加工制作管理</td><td>没有使用超过保质期限、腐败变质等影响食品安全的食品</td><c:if test="${InspectDetal[34]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[34]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>生熟食品未存在交叉污染</td><c:if test="${InspectDetal[35]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[35]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>加工制作的食品能够做到烧熟煮透</td><c:if test="${InspectDetal[36]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[36]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>具有留样设备，留样设备正常运转，按规定留样</td><c:if test="${InspectDetal[37]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[37]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr>
								<td>
									不得加工制作冷荤凉菜，不得加工制作含有豆角的菜品，不得采购使用亚硝酸盐，并在每餐开餐前对提供餐食取样保存，所有留样食品用密封盒子保存至少48小时，每样菜品留样至少125克，存放于专人保管钥匙的上锁的留样冰箱内。
								</td>
								<c:if test="${InspectDetal[38]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[38]==1}"><td style="color: green;">合格</td>	</c:if>
							</tr>
							<tr>
								<td>
									对于同一订购学生餐的学校，应选择食品监督部门和教育行政部门认定的有资质的集体配餐单位进行送餐，配餐公司必须安排专车和专人配送。学校安排专人、设立专点进行餐食验收，核对餐盒标签信息，送餐全程餐食应密封，封条上有配餐溯源信息；学校应采用送餐到班方式供学生就餐，避免校内人员聚集就餐，防止扎堆就餐。师生在就餐前应做好手部卫生清洗工作，进餐时不交流、分散做、单人单座、同向而食、缩短就餐时间，食物残渣要倾倒到指定密闭垃圾桶内，每日定时对就餐区域实行消毒。
								</td>
								<c:if test="${InspectDetal[39]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[39]==1}"><td style="color: green;">合格</td>	</c:if>
							</tr>
							<tr><td>存放时间超过2小时的食品食用前经过充分加热</td><c:if test="${InspectDetal[40]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[40]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td class="vertical-mid" rowspan="2">使用食品添加剂情况</td><td>食品添加剂使用符合国家有关规定</td><c:if test="${InspectDetal[41]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[41]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td>达到专人采购、专人保管、专人领用、专人登记、专柜保存要求</td><c:if test="${InspectDetal[42]==0}"><td style="color: red;">不合格</td>	</c:if><c:if test="${InspectDetal[42]==1}"><td style="color: green;">合格</td>	</c:if></tr>
							<tr><td class="vertical-mid" style="height: 5em;">其它需要说明的情况</td><td colspan="2">${checkListbyid.other }</td></tr>
				  		</tbody>
				  	</table>
				  </div>
			</form>
			<div class="margin-top2 margin-bot2">
				<!-- <button type="button" class="btn btn-primary form-control">提交</button> -->
			</div>
		</main>		
		<script type="text/javascript">
			layui.use('upload', function(){
			  var $ = layui.jquery
			  ,upload = layui.upload;
			  
			  //普通图片上传
			  var uploadInst = upload.render({
			    elem: '#test1'
			    ,url: 'https://httpbin.org/post' //改成您自己的上传接口
			    ,before: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#demo1').attr('src', result); //图片链接（base64）
			      });
			    }
			    ,done: function(res){
			      //如果上传失败
			      if(res.code > 0){
			        return layer.msg('上传失败');
			      }
			      //上传成功
			    }
			    ,error: function(){
			      //演示失败状态，并实现重传
			      var demoText = $('#demoText');
			      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			      demoText.find('.demo-reload').on('click', function(){
			        uploadInst.upload();
			      });
			    }
			  });
			  });
		</script>	
	<c:import url="public/footer.jsp"></c:import>
	</body>

</html>
