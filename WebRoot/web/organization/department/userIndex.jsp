<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysUser"%>
<%@page import="shell.framework.dao.support.VOResult"%>

<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>user index page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<%
		Object obj = request.getAttribute("voResult");
		VOResult voResult = null;
		java.util.List resultList = null;
		int totalPages = 0;
		int totalRaws = 0;
		
		if(obj != null){
			voResult = (VOResult)obj;
			resultList = voResult.getResultList();
			totalPages = voResult.getTotalPages();
			totalRaws = voResult.getTotalRows();
			//out.println("size=" + resultList.size());			
		}else{
			//out.println("obj=NULL" );
		}
		
	%>

  </head>
  
  <body>
	
	<!-- 主数据显示区域 开始 -->			 		
	<div style="border: solid 0px #cccccc ; height: 100%; overflow:auto;">
		<table style="width: 100%">
			<tr style="background-color: #627aad">
				<th>序号</th>
				<th>全名</th>
				<th>性别</th>
				<th>工号</th>
				<th>地址</th>
				<th>电话</th>
				<th>生日</th>
			</tr>
	
	
		
		<%	if(resultList!=null){			
				for(int j=0;j<resultList.size();j++){
					TblSysUser user = (TblSysUser)resultList.get(j);									
		%>					
	
		<div>
			<tr id="<%=user.getId() %>">
				<td><%=user.getId() %></td>
				<td><%=user.getFullName() %></td>
				<td><%=user.getSex() %></td>
				<td><%=user.getUserCode() %></td>
				<td><%=user.getAddress() %></td>
				<td><%=user.getTelephone() %></td>
				<td><%=user.getBirthday() %></td>
			</tr>
		</div>		
												   
		   <%}}%>
		</table>	

			<!-- 翻页 -->
			<shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>" 
									   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />
	
	</div>
	<!-- 主数据显示区域 结束 -->	


  </body>
</html>
