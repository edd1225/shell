<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>error page</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    
    <div align="center">
    	
    	<h1><font color="red">出错了！</font></h1>
    	<hr/>
    </div>
    
   	<div>
   		${exception}
   	</div>
    
  </body>
</html>
