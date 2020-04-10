<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<title>采购信息添加</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/index.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/bks_wap/zhou_style.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/bks_wap/header_style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/js/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/ajaxfileupload.js"></script>
<script
	src="${pageContext.request.contextPath}/static/js/bks_wap/rolldate.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/selector/jquery.searchableSelect.js"></script>
<style type="text/css">
.table>tbody>tr>td {
	padding: 0;
}
</style>
</head>
<body class="contain">
	<!-- <div class="navigation bg-primary">
		<div class="fb padding-side">
			<a href="javascript:history.go(-1)" class="text-white"><i
				class="fa fa-angle-left"></i></a>
		</div>
	</div> -->
	<div id="page">
		<div id="header">
			<div class="header-content">
				<a href="javascript:history.go(0)" class="p-link-back"><i
					class="fa fa-refresh"></i></a> <a class="menu-btn" id="demoSingle"
					href="#menu"></a> <a href="javascript:history.go(-1)"
					class="p-link-home"><i class="fa fa-arrow-left"></i></a>
				<div class="header-btn text-right">
					<button type="button" class="btn btn-primary form-control" id="add">提交</button>
				</div>
			</div>
		</div>
		<div class="bannerPane">
			<div class="overlay"></div>
			<div class="s-banner-content">
				<div>
					<img width="100"
						src="${pageContext.request.contextPath}/static/images/bks_wap/logo-pages.svg" />
				</div>
			</div>
		</div>
	</div>
	<main class="main margin-top padding-side05">
	<form action="" method="post" class="padding-side login_formc">
		<fieldset>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">供&ensp;应&ensp;商</span>
				<span id="unitspan"> 
				<select id="unit_list">
						<!-- class="form-control box-shadow0 border-bottom" -->
						<option value="">查询所有企业信息</option>
						<c:forEach items="${unitList}" var="item">
							<option value="${item.unitId}">${item.unitName}</option>
						</c:forEach>
				</select>
				</span> 
				<input type="text" style="display: none" id="inputType"
					placeholder="请输入商家名称"> <input type="button"
					class="swh switchsucess" id="swithcButton" onclick="swhBtn()"
					value="+">

				<!-- <span class="input-group-addon border0 clear-bg" id="sizing-addon1"><i class="padding-side05 text-danger vertical-mid">*</i>供&ensp;应&ensp;商</span>
						  <input type="text" class="form-control box-shadow0 border-bottom" name="account"  aria-describedby="sizing-addon1"> -->
			</div>
			<div class="fsa">
				<div class="margin-bot2">
					<div class="fc">
						<div class="upload_imgs">
							<div class="fc tip_text">
								<div class="text-info">
									<div class="fc">
										<i class="fa fa-plus padding-side05"></i>
									</div>
									<div class="text-center">上传营业执照</div>
								</div>
							</div>
							<input type="file" name="" id="fileinput" value=""
								accept="image/*" /> <img src="" id="preview">
						</div>
					</div>
				</div>
				<div class="margin-bot2">
					<div class="fc">
						<div class="upload_imgs">
							<div class="fc tip_text">
								<div class="text-info">
									<div class="fc">
										<i class="fa fa-plus padding-side05"></i>
									</div>
									<div class="text-center">上传食品许可证</div>
								</div>
							</div>
							<input type="file" name="" id="fileinput1" value=""
								accept="image/*" /> <img src="" id="preview1">
						</div>
					</div>
				</div>
				<div class="margin-bot2">
					<div class="fc">
						<div class="upload_imgs">
							<div class="fc tip_text">
								<div class="text-info">
									<div class="fc">
										<i class="fa fa-plus padding-side05"></i>
									</div>
									<div class="text-center">上传检验合格报告</div>
								</div>
							</div>
							<input type="file" name="" id="fileinput2" value=""
								accept="image/*" /> <img src="" id="preview2">
						</div>
					</div>
				</div>
			</div>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">联&ensp;系&ensp;人</span>
				<input type="text" class="form-control box-shadow0 border-bottom"
					id="supplierPerson" placeholder="请输如联系人">
			</div>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">联系电话</span>
				<input type="text" class="form-control box-shadow0 border-bottom"
					id="supplierPhone" placeholder="请输入联系电话">
			</div>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">采购公司</span>
				<div class="form-control box-shadow0 border0">${user.unitName }</div>
			</div>
			<div class="input-group form-group fs">
				<span class="input-group-addon border0 clear-bg fonwei">采&ensp;购&ensp;人</span>
				<div class="form-control box-shadow0 border0">${user.username }</div>
			</div>
		</fieldset>
	</form>
	<div class="margin-top2 goods_list" id="">
		<table class="table table-striped table-bordered table-hover"
			id="mytable" cellspacing="" cellpadding="">
			<caption>供货明细：</caption>
			<thead>
				<tr>
					<th style="width: 3.4em;">序号</th>
					<th>商品名</th>
					<th>数量</th>
					<th style="width: 8.4em;">生产日期</th>
					<th style="width: 3.4em;">操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td contenteditable="false" class="vertical-mid">1</td>
					<td class="vertical-mid" name="good_sname" contenteditable></td>
					<td class="vertical-mid" name="good_scount" contenteditable></td>
					<td name="good_stime"><input readonly=""
						class="el_time form-control border0" type="text" id="date"
						placeholder="请选择日期" style="border-radius: 0;"></td>
					<td class="vertical-mid" contenteditable="false"><a
						href="javascript:;" onclick="del_tr(this)"
						class="del_tr text-danger">删除</ a></td>
				</tr>
			</tbody>
		</table>
		<div class="text-right padding-side">
			<input type="button" onclick="add_tr(this)" class="btn btn-success"
				id="add_tr" value="新增商品">
		</div>
	</div>

	<div class="margin-top">
		<div class="">
			<div class="fc">
				<div class="upload_imgs">
					<div class="fc tip_text">
						<div class="text-info">
							<div class="fc">
								<i class="fa fa-plus padding-side05"></i>
							</div>
							<div class="text-center">上传发票图片</div>
						</div>
					</div>
					<input type="file" name="" id="fileinput3" value=""
						accept="image/*" /> <img src="" id="preview3">
				</div>
			</div>
		</div>
	</div>
	<div class="margin-top2 margin-bot2"></div>
	</main>
	<c:import url="public/footer.jsp"></c:import>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/bks_wap/imgBase64.js"></script>
<script type="text/javascript">
	/* 切换按钮事件 */
	function swhBtn() {
		
	
		//默认选中第一个
		
		$("#unit_list").find("option:selected").attr("selected", false);
			$("#unit_list").find("option[value='']").attr("selected",true);//任务名称
			$("#unit_list").find("option:selected").each(function(i){
				if($(this).text()=="查询所有企业信息"){
   				var divVal=$(this).val();
					$("#unitspan").find("div").each(function(){
	   					if($(this).attr("data-value")==divVal){
	   					 	$(this).click();
	   					}
	   			});
   			}
			})
		
		
		//清空是否已有证件的标志
			$("#fileinput").attr("name","");
			$("#fileinput1").attr("name","");
		
		//清空值
		$("#unit_list").val("");
		$("#inputType").val("");
		
		//输入方式切换
		$("#inputType").toggle();
		$("#unitspan").toggle();
		
		//清空图片
		$("#preview").attr("src", "");
		$("#preview1").attr("src", "");
		$("#preview2").attr("src", "");
		$("#preview3").attr("src", "");
		
		//展示上传功能
		$("#fileinput").css("display", "block");
		$("#fileinput1").css("display", "block");
		
		
	}

	$('select').searchableSelect({"afterSelectItem" : function() {
							//清空已有证件的标志
							$("#fileinput").attr("name","");
							$("#fileinput1").attr("name","");
							
							//展示上传功能
							$("#fileinput").css("display", "block");
							$("#fileinput1").css("display", "block");
							
							//清空图片
							$("#preview").attr("src", "");
							$("#preview1").attr("src", "");
							$("#preview2").attr("src", "");
							$("#preview3").attr("src", "");

							var url = "${pageContext.request.contextPath}/wap_unit/list";
							var data = "unitId=" + $("#unit_list").val();

							$.ajax({
										"url" : url,
										"data" : data,
										"type" : "POST",
										"dataType" : "json",
										"success" : function(obj) {
											if(obj.state==0){
												layer.msg(obj.message, {
													icon : 1,
													time : 1000
												});
												
												return;
											}
											console.log(obj);
											$("#supplierPerson").val(obj.data[0].legalPerson);
											if ($("#unit_list").val() == "") {
												return;
											} else {
												console
														.log("${pageContext.request.contextPath}/"
																+ obj.data[0].businessLicense);
												console
														.log("${pageContext.request.contextPath}/"
																+ obj.data[0].productionLicense);
												if (obj.data[0].businessLicense == ""
														|| obj.data[0].businessLicense == null) {
													layer.msg("未保存该企业的营业执照", {
														icon : 1,
														time : 1000
													});

												} else {
													
													$("#preview").attr("src","${pageContext.request.contextPath}/"+ obj.data[0].businessLicense);
													//设置已有证件标志
													$("#fileinput").attr("name","yes");
													
													
													//已有证件  禁止更改
													$("#fileinput").css(
															"display", "none");

												}
												if (obj.data[0].productionLicense == ""
														|| obj.data[0].productionLicense == null) {
													layer.msg("未保存该企业的食品许可证", {
														icon : 1,
														time : 1000
													});
												} else {
													$("#preview1").attr("src","${pageContext.request.contextPath}/"+ obj.data[0].productionLicense);
													//设置已有证件标志
													$("#fileinput1").attr("name","yes");
													
													//已有证件  禁止更改
													$("#fileinput1").css(
															"display", "none");
												}

											}
										}

									});

						}
					}

			);

	$("#add").click(
					function() {	
						
						var detailList = new Array();
						var tr = document.querySelectorAll("tbody tr");
						for (var i = 0; i < tr.length; i++) {
							detailList[i] = new Array();
							detailList[i][0] = tr[i].cells[1].innerText;
							if (tr[i].cells[1].innerText == "") {
								layer.msg("请完善供货明细！", {
									icon : 2,
									time : 1000
								});
								return;
							}
							detailList[i][1] = tr[i].cells[2].innerText;
							if (tr[i].cells[2].innerText == "") {
								layer.msg("请完善供货明细！", {
									icon : 2,
									time : 1000
								});
								return;
							}
							detailList[i][2] = tr[i].cells[3]
									.querySelector("input").value;
							if (tr[i].cells[3].querySelector("input").value == "") {
								layer.msg("请完善供货明细！", {
									icon : 2,
									time : 1000
								});
								return;
							}
						}
						//供货商名字不能为空
						if ($("#unit_list").val() == ""
								&& $("#inputType").val() == "") {
							layer.msg("请录入供货商", {
								icon : 2,
								time : 1000
							});
							$("#select").focus();
						} else if ($("#preview").attr('src') == "") {
							layer.msg("请上传营业执照", {
								icon : 2,
								time : 1000
							});
							$("#preview").focus();
						}else if($("#preview1").attr('src') == ""){
							layer.msg("请上传食品许可证", {
								icon : 2,
								time : 1000
							});
							$("#preview1").focus();
						}else if ($("#preview3").attr('src') == "") {
							layer.msg("请上传发票图片", {
								icon : 2,
								time : 1000
							});
							$("#preview3").focus();
						} else if ($("#supplierPerson").attr('src') == "") {
							layer.msg("请填写供货商联系人", {
								icon : 2,
								time : 1000
							});
							$("#supplierPerson").focus();
						} else if ($("#supplierPhone").attr('src') == "") {
							layer.msg("请填写供货商联系电话", {
								icon : 2,
								time : 1000
							});
							$("#supplierPhone").focus();
						} else {
							var we1 = layerloadingOpen();
							var formData = new FormData();
							//若供货id不为空 传入供货商id
							if ($("#unit_list").val() != "") {
								formData.append('supplierUnitId', $("#unit_list").val());//供货商ID
							}
							//传入供货商名称
							formData.append('supplier',$("#unit_list").val() == "" ? $("#inputType").val() : $("#unit_list").find("option:selected").text());//供货商ID											
							
							//若果企业已有证件 则不传
							
							if ($("#fileinput").attr('name')!="yes") {							
								formData.append('supplierBusinessLicense',dataURLtoFile($("#preview").attr('src'),"we.jpg"));//营业执照			
							}
							if ($("#fileinput1").attr('name')!="yes") {
								formData.append('supplierproductionLicense',
								dataURLtoFile($("#preview1").attr('src'), "we.jpg"));//许可证										
							}							
							if ($("#preview2").attr('src') != "") {
								formData.append('supplierQualification',dataURLtoFile($("#preview2").attr('src'), "we.jpg"));//资质
							}
							formData.append('invoice', dataURLtoFile($("#preview3").attr('src'), "we.jpg"));//发票 
							formData.append('supplierPerson', $("#supplierPerson").val());//联系人					
							formData.append('supplierPhone',$("#supplierPhone").val());//联系电话
							formData.append('detailList', JSON.stringify(detailList));//采购详情
							console.log(formData);
							$.ajax({
										url : "${pageContext.request.contextPath}/wap_pro/add",
										type : 'POST',
										cache : false,
										data : formData,
										processData : false,
										contentType : false,
										"success" : function(obj) {
											layer.close(we1);
											console.log(obj);
											if (obj.state == 0) {
												layer.msg(obj.message, {
													icon : 2,
													time : 1000
												});
												return;
											} else {
												layer.msg(obj.message, {
													icon : 1,
													time : 1000
												});
												//延时刷新页面																	 
												location.href = "${pageContext.request.contextPath}/wap_pro/buy_list";
											}

										}
									});

						}
					});

	new Rolldate({
		el : '#date',
		format : 'YYYY-MM-DD',
		lang : {
			title : '选择日期'
		},
		confirm : function(date) {
			$("#date").val(date);
		},
	})

	/**
	 * @param {Object} obj
	 */
	function add_tr(obj) {
		var tr = '', index;
		var trlen = $(obj).parents(".goods_list").find("tbody tr").length;
		if (trlen == 0) {
			index = 0
		} else {
			index = parseInt($(obj).parents(".goods_list").find(
					"tbody tr:last td:first").text());
		}
		for (var i = (index + 1); i < (index + 2); i++) {
			tr += '<tr> <td class="vertical-mid">'
					+ i
					+ '</td><td class="vertical-mid" contenteditable></td><td class="vertical-mid" contenteditable></td>'
					+ '<td class="vertical-mid"><input readonly="" class="form-control el_time border0" type="text" id="date'+index+'" style="border-radius:0;" placeholder="请选择日期"></td>'
					+ '<td class="vertical-mid"><a href="javascript:;" onclick="del_tr(this)" class="del_tr text-danger">删除</ a></td></tr>'
		}
		$(obj).parents(".goods_list").find("table tbody").append(tr);
		var dateObj = {
			el : '#date' + index,
			format : 'YYYY-MM-DD',
			lang : {
				title : '选择日期'
			},
			confirm : function(date) {
				$("#date" + index).val(date);
			}
		}
		new Rolldate(dateObj)
	}

	/**
	 * @param {Object} obj
	 */
	function del_tr(obj) {
		$(obj).parents("tr").remove();
	}

	$("#fileinput").on("change", function() {
		console.log($("#fileinput").val());
		intoBase64("fileinput", "preview");
	})
	$("#fileinput1").on("change", function() {
		intoBase64("fileinput1", "preview1");
	})
	$("#fileinput2").on("change", function() {
		intoBase64("fileinput2", "preview2");
	})
	$("#fileinput3").on("change", function() {
		intoBase64("fileinput3", "preview3");
	})
</script>
<style>
.swh {
	position: absolute;
	padding: 5px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	width: 58px;
	height: 29px;
	margin-left: 289px;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
}

.switchsucess {
	color: #fff;
	background-color: #5cb85c;
	border-color: #4cae4c;
}

#unitspan {
	text-align: center;
}

#inputType {
	height: 34px;
	text-align: center;
	border-radius: 4px;
}
</style>
</html>
