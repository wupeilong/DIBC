//需要首先通过Jq来解决内容部分奇偶行的背景色不同

	//找到表格的内容区域中所有的奇数行
	//使用even是为了把通过tbody tr返回的所有tr元素中，
	//在数组里面下标是偶数的元素返回，因为这些元素，
	//实际上才是我们期望的tbody里面的奇数行
	

/*下面兩段开始添加删除行**/
$(document).ready(function() { 
	var now=new Date();
	var mytime=now.toLocaleString();     //获取当前时间
    $("#addBtn").bind("click", function(){  
    	//alert($("tbody tr").length);
    	if($("tbody tr").length==1){
    		if($("tbody tr td").length==1){
    			$("tbody tr").remove();
    		}    		
    		 $("tbody").append("<tr class='text-c va-m'>"+									
			"<td><input type='text' id='sysname' name='sysname' class='input_initd1' ></td>"+
			"<td><input type='text' id='sysnub' name='sysnub' class='input_initd1' ></td>"+			
			"<td><input type='text' id='syscommet' name='syscommet' class='input_initd1'  value='0'></td>"+
			"<td><input type='text' id='20'class='input_initd' readonly unselectable='on' value='"+mytime+"'></td>"+
			"<td class='del-col'>"+
				"<a style='text-decoration:none' class='Hui-save' onClick='typeini_save()' href='javascript:;' title='保存'></a>"+ 
				"<a style='text-decoration:none' class='delBtn' href='javascript:void(0);' title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a>"+
			"</td>"+
		"</tr>");            
    		 delTr();    	
    		$("tbody tr:odd").css("background-color","#EEEEEE");
    	}else{
    		 $("<tr class='text-c va-m'>"+						
			"<td><input type='text' id='sysname' name='sysname' class='input_initd1' ></td>"+
			"<td><input type='text' id='sysnub' name='sysnub' class='input_initd1' ></td>"+			
			"<td><input type='text' id='syscommet' name='syscommet' class='input_initd1' value='0'></td>"+
			"<td><input type='text' id='20'class='input_initd' readonly unselectable='on' value='"+mytime+"'></td>"+
    					"<td class='del-col'>"+
    					"<a style='text-decoration:none' class='Hui-save' onClick='typeini_save()' href='javascript:;' title='保存'></a>"+ 
    					"<a style='text-decoration:none' class='delBtn' href='javascript:void(0);' title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a>"+
    					"</td>"+
    				"</tr>").insertAfter($("tbody tr:last"));                       
    		 delTr();		 
    		$("tbody tr:odd").css("background-color","#EEEEEE");
    	}        
    });    
	delTr();	
   }); 
 
 //删除
 function delTr(){
	$(".delBtn").click(function(){
		$(this).parent().parent().remove();
	});
 }

 /*
 function even(){
 	$("tbody tr:even").css("background-color","#ECE9D8");
 }*/


