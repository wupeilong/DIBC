 
	 	function intoBase64(inputId,imgId){	 		
	 		var filePath = $("#"+inputId).val(), //获取input的value,里面是文件的路径
            	fileFormat = filePath.substring(filePath.lastIndexOf('.')).toLowerCase(),
            	imgBase64 = '', //存储图片的base64
           	 	maxSize = 100*1024,
            	fileObj = $("#"+inputId)[0].files[0];//document.getElementById('upload').files[0]; //上传文件的对象,要这样写才行，用jquery写法获取不到对象            	
	 		//检查文件格式
	        if(!fileFormat.match(/.png|.jpg|.jpeg|.gif/)){
	        	layer.msg('文件类型错误,文件格式必须为:png/jpg/jpeg! ',{icon:2,time:1000}); 	          
	            return;
	        }
	        var index = layerloadingOpen();
	        console.log("未压缩文件Size：" + fileObj.size);
	        console.log("压缩界限Size：" + maxSize);
	        if(fileObj.size > maxSize){
	        	alert("1111")
	            //调用函数,对图片进行压缩
	            compressBase64(fileObj,function (imgBase64) {
	                imgBase64 = imgBase64;
	                $("#"+imgId).attr('src',imgBase64);
	                layer.close(index);
	            })
	        }else{
	        	noBase64(fileObj,function (imgBase64) {
	                imgBase64 = imgBase64;
	                $("#"+imgId).attr('src',imgBase64);	
	                layer.close(index);
	            });
	        }
	        
	 	}
	 	function layerImg(imgId){	 		
	 		layer.open({
	 			  type: 1,
	 			  title: "",
	 			  closeBtn: 0,
	 			  area: ['auto'],	 			 
	 			  shadeClose: false,
	 		/*	  btn: '关闭',*/
	 			  content:'<div><img src="'+imgId+'" id="preview" style="width: 360px;height: 360px;"><span class="layui-layer-setwin"><a class="layui-layer-ico layui-layer-close layui-layer-close2" href="javascript:;"></a></span></div>',
	 			  success: function (layero) {
				        layero.find('.layui-layer-content').css({	
				        	'height':'360px',
				            'width': '360px',		            
				            'color': 'rgb(45, 26, 26)',
				        	'font-size': '15px',
				        	'font-weight': '600'
				        });
				        layero.find('.layui-layer-setwin').css({				            
				        	'right': '28px',
				        	'top': '28px'
				        });
				        layero.find('.layui-layer-btn').css({
				            'padding': '0px',
				            'margin': '0px',		            
				            'color': 'rgb(45, 26, 26)',
				        	'font-size': '15px',
				        	'font-weight': '600'
				        });
				    }
	 		});
	 	}
	 	function layerloadingOpen(){
	 		var loadingIndex = layer.load(1, { //icon支持传入0-2
			    shade: [0.5, 'gray'], //0.5透明度的灰色背景
			    content: '加载中...',
			    success: function (layero) {
			        layero.find('.layui-layer-content').css({
			            'padding-top': '39px',
			            'width': '160px',		            
			            'color': 'rgb(45, 26, 26)',
			        	'font-size': '15px',
			        	'font-weight': '600'
			        });
			    }
			});
	 		return loadingIndex;
	 	}
	    //不对图片进行压缩
	    function noBase64(fileObj,callback) {
	        var r = new FileReader();
	        //转成base64
	        r.onload = function () {
	            imgBase64 = r.result;
	         //   console.log(imgBase64);
	            callback(imgBase64);
	        }
	        r.readAsDataURL(fileObj);//转成base64格式
	    }
	 
	    //对图片进行压缩	 
	    function compressBase64(fileObj,callback) {
	        if(typeof (FileReader) === 'undefined'){
	        	layer.msg("当前浏览器内核不支持base64图片压缩",{icon:2,time:1000}); 	                     
	        }else{
	            try{
	                var reader = new FileReader();
	                reader.onload = function (e) {
	                	var path=this.result;
	                	var img = new Image();
	                    img.src = path;
	                    img.onload = function(){
	                        var that = this;
	                        // 默认按比例压缩
	                        var w = that.width,
	                            h = that.height,
	                            scale = w / h;
	                        w = fileObj.width || w;
	                        h = fileObj.height || (w / scale);
	                        var quality = 0.2;  // 默认图片质量为0.7
	                        //生成canvas
	                        var canvas = document.createElement('canvas');
	                        var ctx = canvas.getContext('2d');
	                        // 创建属性节点
	                        var anw = document.createAttribute("width");
	                        anw.nodeValue = w;
	                        var anh = document.createAttribute("height");
	                        anh.nodeValue = h;
	                        canvas.setAttributeNode(anw);
	                        canvas.setAttributeNode(anh);
	                        ctx.drawImage(that, 0, 0, w, h);
	                        // 图像质量
	                        if(fileObj.quality && fileObj.quality <= 1 && fileObj.quality > 0){
	                            quality = fileObj.quality;
	                        }
	                        // quality值越小，所绘制出的图像越模糊
	                        var base64 = canvas.toDataURL('image/jpeg', quality);
	                        // 回调函数返回base64的值
	                        callback(base64);
	                        console.log(base64);
	                    } 	                   
	                };
	                reader.readAsDataURL(fileObj);
	            }catch (e) {
	            	layer.msg('图片处理失败!',{icon:2,time:1000});               
	            }
	        }
	    }
	    function dataURLtoFile(dataurl, filename) {//将base64转换为文件，dataurl为base64字符串，filename为文件名（必须带后缀名，如.jpg,.png）
	        var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
	            bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
	        while(n--){
	            u8arr[n] = bstr.charCodeAt(n);
	        }
	        return new File([u8arr], filename, {type:mime});
	      }
	    
	  //将base64转换为blob
	    function dataURLtoBlob(dataurl) {

	    	var arr = dataurl.split(','),

	    	        mime = arr[0].match(/:(.*?);/)[1],

	    	        bstr =atob(arr[1]),

	    	        n = bstr.length,

	    	        u8arr =new Uint8Array(n);

	    	    while (n--) {

	    	u8arr[n] = bstr.charCodeAt(n);

	    	    }
	    	
	    	return new Blob([u8arr], {type:mime});

	    	}
	    
	    
	  //将blob转换成file

	    function blobToFile(theBlob, fileName){
	    	
	    	theBlob.lastModifiedDate =new Date();
	    	
	        theBlob.name = fileName;
	    	
	        return theBlob;

	    }

	    

	    	
