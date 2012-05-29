<%@page import="shell.framework.model.TblSysUser"%>
<%@page import="shell.framework.organization.user.service.TblSysUserService"%>
<%@page import="shell.framework.dao.support.VOResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="@SHELL 是一个企业级开发的基础平台，集成了SH框架，提供企业级开发的基础功能部分，用户在此基础平台上可以搭建自己的业务平台！">

<title>SHELL</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/cuheXhkBDkh.css">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/p_e4y6WmY0P.css">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/eExuUYovHyE.css">

<style type="text/css">

		/* @SHELL全局样式-div可以水平排列 */
		.shell_inline_block{
			display: inline-block;
		    position: relative;
		}

		/* @SHELL工具栏 */
		.shell_toolBar{
			background: none repeat scroll 0 0 white;
    		border-bottom: 1px solid #DDDDDD;
    		margin-bottom: 10px;
    		padding-bottom: 35px;	
    		padding-top: 0;
		}

		/* @SHELL用户身份面板 */
		.shell_user_identity {
		    color: #000000;
		    background-color: #F4F4F4;
		    background-image: -moz-linear-gradient(center top , #FFFFFF, #F4F4F4);
		    border: 1px solid #DDDDDD;
		    border-radius: 6px 6px 6px 6px;
		    box-shadow: 0 1px 0 #AAAAAA;
		    opacity: 1;
		    padding: 4px;
		    vertical-align: top;
		    width: 128px; 
		    height: 48px; 
		    margin-right: 16px;
		    margin-top: 9px;
		    margin-left: 0px;
		    margin-bottom: 9px;
		}
		/* @SHELL用户身份面板头像 */
		.shell_user_identity_img {
		    border: medium none;
		    border-radius: 0 0 0 0;
		    float: left;
		    width: 48px;
		    height: 48px;
		}
		/* @SHELL用户身份面板文字介绍 */
		.shell_user_identity_intro {
		    font-size: 13px;
		    overflow: hidden;
		    padding: 8px 4px 4px;
		    width: 68px;
		    word-wrap: break-word;
		}
		/* @SHELL用户身份面板鼠标划过效果 */
		.shell_user_identity:HOVER {
			color: #333;
			cursor:pointer;
    		border-color: #999;
    		-moz-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.2) -webkit-box-shadow:0 2px 5px rgba(0, 0, 0, 0.2);
    		box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15);
		}
		
		
		/* @SHELL工具栏按钮 */
		.shell_tool_btn {
			background-image:url(../../../images/facebook.png);
			background-repeat: no-repeat;
			background-position: -352px -348px;
			background-color: #EEE;
			border: 1px solid #999;
			border-bottom-color: #888;
			-webkit-box-shadow: 0 1px 0 rgba(0, 0, 0, .1);
			border-image: initial;
			display: inline-block;
			font-size: 12px;
			font-weight: bold;
			line-height: 13px;
			padding: 5px 9px;
			text-align: center;
			text-decoration: none;
			vertical-align: top;
			white-space: nowrap;
			color: #666;
			
		}
		/* 鼠标划过@SHELL工具栏按钮,突起效果 */
		.shell_tool_btn:HOVER {
		    border-color: #999;
		    -webkit-box-shadow:0 2px 5px rgba(0, 0, 0, 0.2);
		    -moz-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.2) ;
		    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.35);
			cursor:pointer;
		}
		/* 鼠标激活@SHELL工具栏按钮 */
		.shell_tool_btn:ACTIVE {
			background-image: none;
		}	
		
	</style>

	<style type="text/css">
		.shell_pagination_navi{
		    border-top: 1px solid #CCCCCC;
		    margin: 10px 0px 0;
		    padding: 10px 0px 0;
		}
		 
		 /* 有部分css冲突 必须加上 .devsitePage .body */
		.devsitePage .body .shell_pagination_navi ul {  
			margin: 0;
			padding-left:0;   
			text-align: right;
		}
		 
		.shell_pagination_navi li{
			list-style-type: none;
			display: inline;
			padding-bottom: 1px;
			text-align: center;
		}
		 
		.shell_pagination_navi a, .shell_pagination_navi a:visited{
			padding: 2px 6px;
			border: 1px solid #9aafe5;
			text-decoration: none;
			color: #2e6ab1;
			
		}
		 
		.shell_pagination_navi a:hover, .shell_pagination_navi a:active{
			border: 1px solid #2b66a5;
			color: #000;
			text-decoration:none;
			background-color: lightyellow;
		}
		 
		.shell_pagination_navi li.currentpage{
			font-weight: bold;
			padding: 2px 6px;
			border: 1px solid navy;
			background-color: #2e6ab1;
			color: #FFF;
		}
		 
		.shell_pagination_navi li.disablepage{
			padding: 2px 6px;
			border: 1px solid #929292;
			color: #929292;
		}
		 
		.shell_pagination_navi li.nextpage{
		}
		
		
	    
	</style>
	


	
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
			out.println("obj=NULL" );
		}
		
	%>


</head>

<!-- 文档body部分开始 -->

<body class="safari4 Locale_zh_CN" >

	<div class="devsitePage">
		<!-- 顶行菜单导航开始 -->
		<div class="menu">
				<a class="logo" href="<%=request.getContextPath() %>"> 
					<img class="img" src="<%=request.getContextPath() %>/images/facebook_developer_logo.png" alt="Facebook" width="166" height="17">
			    </a> 
			<div class="content">
					
				<a class="l" href="http://developers.facebook.com/docs/">主页</a>
				<a class="l" href="http://developers.facebook.com/module/">组织机构</a>
				<a class="l" href="http://developers.facebook.com/blog/">权限管理</a> 
				<a class="l" href="https://developers.facebook.com/apps">编码设置</a>
				<a class="l" href="https://developers.facebook.com/apps">设置</a>

				<!-- 搜索div开始 -->
				<div class="search">
					<form method="get" action="/shell/login.action">
						<div class="uiTypeahead" id="u362713_2">
							<div class="wrap">
								<input type="hidden" autocomplete="off" class="hiddenInput" name="path" value="">
								<div class="innerWrap">
									<span class="uiSearchInput textInput"> <span>
										 <input	type="text" class="inputtext DOMControl_placeholder"
											name="selection" placeholder="Search for documentation"
											autocomplete="off" spellcheck="false" value="Search for documentation..."
											title="Search for documentation">

											<button type="submit" title="Search for documentation">
												<!--
												<span class="hidden_elem">Search for documentation</span>
												-->
											</button> 
											
										</span></span>
								</div>
							</div>
							<div class="uiTypeaheadView" id="u362713_1"></div>
						</div>
					</form>
				</div>
				<!-- 搜索div结束 -->
				<div class="clear"></div>
			</div>
		</div>
		<!-- 顶行菜单导航结束 -->

		<div class="body nav">
		
			<!-- 左侧导航栏 -->
				<div id="bodyMenu" class="bodyMenu">
					<div class="toplevelnav">
						<ul>
							<li><a class="selected" href="<%=request.getContextPath() %>/web/organization/user/index.action?currentPage=1">
									<div class="navSectionTitle">人员管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/department/index.action">
									<div class="navSectionTitle">组织管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/agentCode/index.action">
									<div class="navSectionTitle">工号管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/skill/index.action">
									<div class="navSectionTitle">技能管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/role/index.action">
									<div class="navSectionTitle">角色管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/group/index.action">
									<div class="navSectionTitle">工作组管理</div> </a></li>				
						</ul>
					</div>
				</div>
		
			<!-- 右侧内容主显示区域 -->
			<div class="content">
				<div id="bodyText" class="bodyText">
					
					<div class="shell_toolBar">
						<div class="shell_tool_btn shell_inline_block" style="float:left;">全部用户[<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>]</div>
						<div style="float: right;">
							<div class="shell_tool_btn shell_inline_block">Q&nbsp;查询</div>
							<div class="shell_tool_btn shell_inline_block">+&nbsp;增加</div>
							<div class="shell_tool_btn shell_inline_block">-&nbsp;删除</div>
							<div class="shell_tool_btn shell_inline_block">+&nbsp;更多操作</div>
						</div>
					</div>
					
				
			 		
					<div>
						
						<%
							if(resultList!=null){
								//行数
								int rowNums = (voResult.getPageSize()/6) + ((voResult.getPageSize()%6)==0?0:1);
										
								for(int i=0;i<rowNums;i++){
						%>			
								<div>
									
						<% 			
									for(int j=0;j<6;j++){
										int indexNum = i*6+j;
										if(indexNum>=voResult.getResultList().size()) break;
										TblSysUser user = (TblSysUser)resultList.get(indexNum);									
										
										//out.println(request.getAttribute("preRequestURL"));
										//user.getFullName();
						%>					
							
						<div class="shell_user_identity shell_inline_block" hc="off" email="" oid="111555290829831625120" tabindex="0" role="link"  >
							<img class="shell_user_identity_img" src="//lh4.googleusercontent.com/-fPvPn34LOVM/AAAAAAAAAAI/AAAAAAAAD5U/zO60w70ymd8/s48-c-k/photo.jpg"  >
							<div class="shell_user_identity_intro"><%=user.getFullName() %></div>
						</div>
							
						<%			}
						%>
							 	</div>		
						<%
								}
							}
						%>
						
					</div>
					
					<!-- 翻页 -->
					<shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>" 
											   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />
			
				</div>
				<div class="clear"></div>
			</div>
		</div>



		<!-- 页脚div 开始 -->
		<div class="footer">
			<div class="content">
				<div class="copyright">SHELL &copy; 2012</div>
				<div class="links">
					<a href="http://www.facebook.com/platform">关于</a> <a
						href="http://developers.facebook.com/policy/">平台政策</a> <a
						href="http://www.facebook.com/policy.php">隐私政策</a> <a
						href="http://www.facebook.com/policy.php">自定义页脚</a>
				</div>
			</div>
		</div>
		<!-- 页脚div 结束 -->
		
	</div>
		
</body>
</html>




