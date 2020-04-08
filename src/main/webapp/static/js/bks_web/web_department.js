var editObj=null,ptable=null,treeGrid=null,tableId='treeTable',layer=null;
    layui.config({
        base: '../static/js/layui/extend/'
    }).extend({
        treeGrid:'treeGrid'
    }).use(['jquery','treeGrid','layer'], function(){
        var $=layui.jquery;
        treeGrid = layui.treeGrid;//很重要
        layer=layui.layer;
        ptable=treeGrid.render({
            id:tableId
            ,elem: '#'+tableId
            ,url:'get_department'
            ,cellMinWidth: 100
            ,idField:'departmentId'//必須字段
            ,treeId:'departmentId'//树形id字段名称
            ,treeUpId:'departmentParentId'//树形父id字段名称
            ,treeShowName:'departmentName'//以树形式显示的字段
            ,heightRemove:[".dHead",10]//不计算的高度,表格设定的是固定高度，此项不生效
            ,height:'100%'
            ,isFilter:false
            ,iconOpen:true//是否显示图标【默认显示】
            ,isOpenDefault:true//节点默认是展开还是折叠【默认展开】
            ,loading:true
            ,method:'post'
            ,isPage:false
            ,cols: [[
            {type: 'numbers'},
            {field: 'departmentName', minWidth: 200, title: '部门名称'},
            {field: 'departmentDescription', title: '部门描述'},
            {
                field: 'departmentType', width: 120, align: 'center',templet: function (d) {                	
                    if (d.departmentType == 1) {
                        return '<span class="layui-badge layui-bg-gray">市场监管局</span>';
                    }else if (d.departmentType ==2) {
                        return '<span class="layui-badge layui-bg-blue">市场监管分局</span>';
                    } else if(d.departmentType ==3){
                        return '<span class="layui-badge-rim">社区[街道办事处]</span>';
                    } else if(d.departmentType ==4){
                        return '<span class="layui-badge-rim">居委会</span>';
                    } else if(d.departmentType ==5){
                        return '<span class="layui-badge-rim">网格</span>';
                    }else if(d.departmentType ==6){
                    	return '<span class="layui-badge-rim">主体</span>';
                    }else{
                    	return '<span class="layui-badge-rim">未配置</span>';
                    }
                }, title: '部门类型'
            },     
            {field: 'authorizationName', title: '部门权限'},
            {width:300,title: '操作', align:'center'/*toolbar: '#barDemo'*/
                ,templet: function(d){    
                	var unitName = d.unitName;
                	var departmentId=d.departmentId;
                	var departmentName=d.departmentName;                	
                	var departmentDescription=d.departmentDescription;
                	var departmentAuthorization=d.departmentAuthorization;
                	var departmentType=d.departmentType;
                	var departmentParentId=d.departmentParentId;
                	var authorizationId=d.authorizationId;
                	var strdel="del('" + departmentName + "'," + departmentId + "," + departmentType + ")";
                	var stradd="add('" + unitName + "','" + departmentName + "'," + departmentId + "," + departmentType + ")";
                	var stredit="edit('" + departmentName + "'," + departmentId + "," + departmentType + ",'" + departmentDescription + "','" + departmentAuthorization + "'," + departmentParentId + ")";
                	var strauth = "auth('" + departmentName + "'," + departmentId + "," + authorizationId + ")";
                	var editBtn='<a class="layui-btn layui-btn-primary layui-btn-xs layui-bg-green" href="javascript:;"  onclick="'+stredit+'" >编辑</a>';
                    var delBtn='<a class="layui-btn layui-btn-primary layui-btn-xs layui-bg-red" href="javascript:;"  onclick="'+strdel+'" >删除</a>';
                    var addBtn='<a class="layui-btn layui-btn-primary layui-btn-xs layui-bg-orange" href="javascript:;"  onclick="'+stradd+'" >添加</a>';
                    var addAuth= '<a class="layui-btn layui-btn-primary layui-btn-xs layui-bg-orange operation operation-add" href="javascript:;" onclick="' + strauth + '" style="text-decoration:none"><i class="Hui-iconfont" style="font-size: 1em;">&#xe63c;</i>权限设置</a>';
                    return addBtn+editBtn+delBtn+addAuth;           	
                }
            }
        ]]
            ,parseData:function (res) {//数据加载后回调
            	console.log(res);
                return res;
            }
            ,onClickRow:function (index, o) {
                console.log(index,o,"单击！");
                //msg("单击！,按F12，在控制台查看详细参数！");
            }
            ,onDblClickRow:function (index, o) {
                console.log(index,o,"双击");
                msg("双击！,按F12，在控制台查看详细参数！");
            }
            ,onCheck:function (obj,checked,isAll) {//复选事件
                console.log(obj,checked,isAll,"复选");
                msg("复选,按F12，在控制台查看详细参数！");
            }
            ,onRadio:function (obj) {//单选事件
                console.log(obj,"单选");
                msg("单选,按F12，在控制台查看详细参数！");
            } 
        });        
    });
    function admin_edit(url){	
    	//layer_show(title,url,w,h);
    	layer.open({
    		type: 2,
    		area: ['450px', '780px'],
    		fix: false, //不固定
    		maxmin: false,		
    		shade:0.4,
    		title: false ,	
    		content: url
    	});
    }
   
    
   function addmain() {  
    	var jsonObj = {};     	
    	layer.prompt({title: '请输入部门的名称'}, function(pass, index){    		
    		$.ajax({    			
    			"url" : "dep_add",
    			"data" : "departmentName=" + pass,
    			"type" : "POST",
    			"dataType" : "json",
    			"success" : function(obj) {
    				if (obj.state == 0) {
						layer.msg(obj.message,{icon:2,time:1000});
						return;
					}else{
						layer.msg(obj.message,{icon:1,time:1000},function(){location.reload()});
					}
    			}
    		});   	
    		layer.close(index);
    	}); 
    	//location.replace(location.href);
    }
    function del(departmentName,departmentId,departmentType){    	
    	/*if(menus==1){
    		menus="目录";
    	}else if(menus==2){
    		menus="菜单";
    	}else{
    		menus="按钮";
    	}
        //layer.confirm("你确定删除<span class='layui-badge layui-bg-blue'>" + menus + "->"+name+"</span>的所有数据吗？如果存在下级节点则一并删除，此操作不能撤销！", {icon: 3, title:'提示'}, function (index) {
        layer.confirm("你确定删除<span class='layui-badge layui-bg-blue'>" + menus + "->"+name+"</span>吗？", {icon: 3, title:'提示'}, function (index) {    
        	console.log(menuId);
        	$.ajax({
				"url" : "menu_delete",
				"data" : "menuId=" + menuId,
				"type" : "POST",
				"dataType":"json",
				"success" : function(obj) {
					if (obj.state == 0) {
						layer.msg(obj.message,{icon:2,time:1000});
						return;
					}else{
						layer.msg(obj.message,{icon:1,time:1000},function(){location.replace(location.href);layer.close(index);});
					}	
				}
			});     
        }); */
    }
    
   function auth( departmentName,departmentId,authorizationId){
	   $("#auth_department_name").val(departmentName);
	   if(authorizationId != "" && authorizationId != null){
		   $("#auth_select").val(departmentName);
	   }	   
	   layer.open({
 		  type: 1,
 		  shade: false,
 		  title: false, //不显示标题
 		  content: $('#edit_auth'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响   
 		  btn: ['提交'],
 		  yes: function(index, layero){    			  
 			 var data = "departmentId=" + departmentId + "&authorizationId=" + $("#auth_select").val() ;
 			 var url = "dep_update";
 			 console.log(data);
 			 $.ajax({
 	    			"url" : url,    	    			
 	    			"data" : data,
 	    			"type" : "POST",
 	    			"dataType" : "json",
 	    			"success" : function(obj) {
 	    				if (obj.state == 0) {
 	    					layer.msg(obj.message,{icon:2,time:1000});
 	    					return;
 	    				}else{
 	    					layer.msg(obj.message,{icon:1,time:1000},function(){location.replace(location.href);layer.close(index);});
 	    				}	
 	    			}
 	    		});     		  
 		  }
 	});
   }
    
    function edit(departmentName,departmentId,departmentType,departmentDescription,departmentAuthorization,departmentParentId) {    	
    	if (departmentType == 1) {
            return '<span class="layui-badge layui-bg-gray">市场监管局</span>';
        }else if (departmentType ==2) {
            return '<span class="layui-badge layui-bg-blue">市场监管分局</span>';
        } else if(departmentType ==3){
            return '<span class="layui-badge-rim">社区[街道办事处]</span>';
        } else if(departmentType ==4){
            return '<span class="layui-badge-rim">居委会</span>';
        } else if(departmentType ==5){
            return '<span class="layui-badge-rim">网格</span>';
        }else if(departmentType ==6){
        	return '<span class="layui-badge-rim">主体</span>';
        }else{
        	return '<span class="layui-badge-rim">未配置</span>';
        }
    	$("#ditmenuName").val(name);
    	$("#ditauthority").val(authority);
    	$("#ditmenuUrl").val(menuUrl);
    	$("#ditismenus").val(menus);  	
    	layer.open({
    		  type: 1,
    		  shade: false,
    		  title: false, //不显示标题
    		  content: $('#layer_edit'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响   
    		  btn: ['提交'],
    		  yes: function(index, layero){    			  
    			  var data = "menuId=" + menuId + "&menuName=" + $("#ditmenuName").val() + "&menuUrl=" + $("#ditmenuUrl").val()
    			  		   + "&authority=" + $("#ditauthority").val() + "&isMenu=" + $("#ditismenus").val() + "&parentId=" + parentId;
    			 $.ajax({
    	    			"url" : "menu_update",    	    			
    	    			"data" : data,
    	    			"type" : "POST",
    	    			"dataType" : "json",
    	    			"success" : function(obj) {
    	    				if (obj.state == 0) {
    	    					layer.msg(obj.message,{icon:2,time:1000});
    	    					return;
    	    				}else{
    	    					layer.msg(obj.message,{icon:1,time:1000},function(){location.replace(location.href);layer.close(index);});
    	    				}	
    	    			}
    	    		});     		  
    		  }
    	});
    	
    }
    
    function add(unitName,departmentName,departmentId,departmentType) {
    	$("#unitName").val(unitName);
    	$("#parentDepartmentName").val(departmentName);	
    	layer.open({    		  
    		  type: 1,
    		  area: ['450px', '780px'],
    		  shade: false,
    		  title: false, //不显示标题
    		  content: $('#layer_add'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响   
    		  btn: ['提交'],
    		  yes: function(index, layero){    			  
    			  var data = "departmentName=" + $("#addDepartmentName").val() +"&departmentHead=" + $("#addDepartmentHead").val() 
    			  		   + "&departmentDescription=" + $("#addDepartmentDescription").val() + "&departmentType=" + $("#addDepartmentType").val()
    			  		   + "&authorizationId=" + $("#add_select").val() + "&departmentParentId=" + departmentId;
    	      	  alert(data);
    			 $.ajax({
    	    			"url" : "dep_add",
    	    			"data" : data,
    	    			"type" : "POST",
    	    			"dataType" : "json",
    	    			"success" : function(obj) {
    	    				if (obj.state == 0) {
    	    					layer.msg(obj.message,{icon:2,time:1000});
    	    					return;
    	    				}else{
    	    					layer.msg(obj.message,{icon:1,time:1000},function(){location.replace(location.href);layer.close(index);});
    	    				}	
    	    			}
    	    		});     			  
    		  }
    	});
    	
    }
    function print() {
        console.log(treeGrid.cache[tableId]);
        msg("对象已打印，按F12，在控制台查看！");
    }

    function msg(msg) {
        var loadIndex=layer.msg(msg, {
            time:3000
            ,offset: 'b'//顶部
            ,shade: 0
        });
    }
    
    function openorclose() {
        var map=treeGrid.getDataMap(tableId);
        var o= map['102'];
        treeGrid.treeNodeOpen(tableId,o,!o[treeGrid.config.cols.isOpen]);
    }


    function openAll() {
        var treedata=treeGrid.getDataTreeList(tableId);
        treeGrid.treeOpenAll(tableId,!treedata[0][treeGrid.config.cols.isOpen]);
    }

    function getCheckData() {
        var checkStatus = treeGrid.checkStatus(tableId)
            ,data = checkStatus.data;
        layer.alert(JSON.stringify(data));
    }
    function radioStatus() {
        var data = treeGrid.radioStatus(tableId)
        layer.alert(JSON.stringify(data));
    }
    function getCheckLength() {
        var checkStatus = treeGrid.checkStatus(tableId)
            ,data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
    }

    function reload() {
        treeGrid.reload(tableId,{
            page:{
                curr:1
            }
        });
    }
    function query() {
        treeGrid.query(tableId,{
            where:{
                name:'sdfsdfsdf'
            }
        });
    }    
    function test() {
        console.log(treeGrid.cache[tableId],treeGrid.getClass(tableId));
    }