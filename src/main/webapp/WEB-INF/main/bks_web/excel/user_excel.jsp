<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>后台用户信息修改页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_web/hqt_admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/excel/dist/css/tableexport.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/Hui-iconfont/1.0.8/iconfont.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/excel/xlsx.core.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/excel/blob.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/excel/FileSaver.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/excel/dist/js/tableexport.js"></script>
</head>

<body>
			<div class="padding-side2 margin_top2">			
				<div class="margin_bot2">
					<div class="flex_JCbetw">						
						<span class="">
							<span class="l"><a href="javascript:;" onclick="selectFile()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe645;</i>导入文件</a> </span>
							<span class="l"><a href="javascript:;" onclick="diskproduct()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe632;</i>保存</a> </span>
							<span class=""><a class="btn btn-warning radius r" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></span>
						</span>
					</div>
				</div>
				<div class=""> <input type="file" id="file" style="display:none;" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/> </div>
				<div class="" id="result" contenteditable>
					<table class="table table-bordered table-hover fontwei" id="test_table" cellspacing="" cellpadding="">
						<tbody>
							<tr class="result_tr">
								<td></td>
								<td>名字</td>
								<td>联系方式</td>
								<td>工作部门</td>
								<td>权限级别</td>																
								<td contenteditable="false">操作</td></tr>						
						</tbody>
					</table>
				</div>			
			</div>		
		<script type="text/javascript">		
			var options='';				
			$(function(){
				$("table").tableExport({formats:["xlsx","xls","csv","txt"]});
				$("caption").attr("contenteditable","false");
				var tr=document.querySelectorAll("tr");
			})
			function diskproduct(){	
					var userList = new Array();	
					var rs = document.getElementsByName("tr_idx")		
			   		for(var i = 0; i < rs.length; i++){     		
			   			userList[i]=new Array();
			    	 	for(var j = 0;j<rs[i].cells.length-1; j++){
			    	 		if(j!=0 && j<14){    	 		
			    	 			userList[i][j-1]=rs[i].cells[j].innerHTML;    	 			 	 			
			    	 		}    	 				
			    	 	}    	 	
					}
					console.log(userList);
			    	var url="${pageContext.request.contextPath}/web_user/bath_add"; 
			    	var  data ="userList="+JSON.stringify(userList);	    			  
			         $.ajax({    	   
			    	   "url":url,    	  
			    	   "data":data,
			    	   "type":"POST",
			    	   "dataType":"json",
			    	   "success":function(obj){    		  
			    		   if(obj.state==0){
			    			   layer.msg(obj.message,{icon:2,time:1000});
			    			   return;
			      			}
			    		   layer.msg(obj.message,{icon:1,time:2000});
			    		   var d=obj.data;
			    		   var html = '<table class="table table-bordered table-hover fontwei" id="test_table"><tbody><tr class="result_tr">'+
			    		   			'<td></td>' +
									'<td>名字</td>' +
									'<td>联系方式</td>' +
									'<td>工作部门</td>' +	
									'<td>权限级别</td>' +
									'<td contenteditable="false">操作</td></tr>';
			    		   for(var j=0;j<d.length;j++){
			    			   var b=j+1;
			    			   html +="<tr name='tr_idx' id='"+b+"' ><td class='result_tr'>"+b+"</td>";
			    			   for(var i=0;i<d[j].length;i++){
			    					html +="<td>"+d[j][i]+"</td>";	   
			    			   }
			    			   html +='<td contenteditable="false"><a href="javascript:void(0)"><i class="Hui-iconfont">&#xe609;</i></a></td></tr>';			    			  
			    		   }
			    		   html +="</tbody></table>";
			    		   document.getElementById('result').innerHTML = html;  	
			    		   $("table").tableExport({formats:["xlsx","xls","csv","txt"]});
			    	   }      
			    	});
			}
			
			
			function selectFile() {
				document.getElementById('file').click();
			}
			
			//读取本地excel文件
			function readWorkbookFromLocalFile(file, callback) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			        var data = e.target.result;
			        var workbook = XLSX.read(data, {type: 'binary'});
			        if(callback) callback(workbook);
			    };
			    reader.readAsBinaryString(file);			   
			}			
			function readWorkbook(workbook) {
				var sheetNames = workbook.SheetNames; // 工作表名称集合
				var worksheet = workbook.Sheets[sheetNames[0]]; // 这里我们只读取第一张sheet
				var csv = XLSX.utils.sheet_to_csv(worksheet);
				document.getElementById('result').innerHTML = csv2table(csv);
			}
			
			// 将csv转换成表格
			function csv2table(csv){	
				var html = '<table class="table table-bordered table-hover fontwei" id="test_table">';
				var rows = csv.split('\n');
				rows.pop(); // 最后一行没用的
				rows.forEach(function(row, idx) {
					var columns = row.split(',');
					columns.unshift(idx+1); // 添加行索引	
					if(idx==0){
						html += '<tr class="result_tr" >';
						columns.forEach(function(column,j) {
							if(j!=0){
								html += '<td>'+column+'</td>';
							}else{
								html += '<td></td>';
							}				
						});
						html += '<td contenteditable="false">操作</td></tr>';
					}else{
						html += "<tr name='tr_idx' id='td_"+idx+"'>";
						columns.forEach(function(column,j) {
							if(j!=0){
								html += "<td name='td_"+idx+"' id='"+column+"'>"+column+'</td>'; 									
							}else{
								var coo=column-1;
								html += "<td class='result_tr' name='td_"+idx+"' id='"+column+"'>"+coo+'</td>';
							}
						});
						html += '<td contenteditable="false"><a href="javascript:void(0)"><i class="Hui-iconfont">&#xe609;</i></a></td></tr>';
					}
				
				});
				html += '</table>';
				return html;
			}
			
			$(function() {
				document.getElementById('file').addEventListener('change', function(e) {
					var files = e.target.files;
					if(files.length == 0) return;
					var f = files[0];
					if(!/\.xlsx$/g.test(f.name)) {
						alert('仅支持读取xlsx格式！');
						return;
					}
					readWorkbookFromLocalFile(f, function(workbook) {
						readWorkbook(workbook);
						$("table").tableExport({formats:["xlsx","xls","csv","txt"]});
					});
				});	
			});
			function excel(){
				$("#test_table").table2excel({
			        exclude: ".noExl", //过滤位置的 css 类名
			        filename: "企业清单-" + new Date().getTime() + ".xls" //文件名称
			    });
			}
			
		</script>
</body>
</html>
