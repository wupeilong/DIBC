<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>
<title>系统错误页面</title>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bks_wap/error.css"  media="screen" />
</head>

<body>			
	<div id="da-wrapper" class="fluid">         
        <div id="da-content">          
            <div class="da-container clearfix">            
            	<div id="da-error-wrapper">                	
                   	<div id="da-error-pin"></div>
                    <div id="da-error-code">
                    	error <span>500</span>
                    </div>                
                	<h1 class="da-error-heading">哎哟喂！服务器错误！</h1>
                    <p>异常信息：<label>${ex}</label></p>    
                    <p>访问路径：<label>${path}</label></p> 
                    <p>详细信息：</p> 
                    <p class="w3l-p">当您看到这个页面,表示您的访问服务器出错了,这个错误是您在使用的过程中使用了不合法的参数或由于网络原因导致服务器连接异常、数据处理异常,如果是在本站点击后出现这个页面,请联系管理员处理,站长感谢您的支持!</p>                
                </div>
            </div>
        </div>       
    </div>
</body>
</html>
