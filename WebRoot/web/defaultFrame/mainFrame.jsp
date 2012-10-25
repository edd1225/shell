<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="@SHELL 是一个企业级开发的基础平台，集成了SH框架，提供企业级开发的基础功能部分，用户在此基础平台上可以搭建自己的业务平台！">

<title>@SHELL</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
</head>

<!-- 文档body部分开始 -->
<body>

	<div class="shellPage">
		<!-- 顶行菜单导航开始 -->
		<div class="menu">
		
		<div class="topNav">
				
				<div class="topNavWrapper">
					<a class="l" href="<%=request.getContextPath() %>/web/defaultFrame/mainFrame.jsp">主面板</a>
					<a class="l" href="http://developers.facebook.com/module/">组织机构</a>
					<a class="l" href="http://developers.facebook.com/blog/">权限管理</a> 
					<a class="l" href="https://developers.facebook.com/apps">编码设置</a>
					<a class="l" href="https://developers.facebook.com/apps">设置</a>
					<!-- 登录个人信息 -->
					<div align="right" style="float:right; padding-top: 7px;padding-right: 5px;font-size: 12px; ">
						<span style="padding-left: 5px;">
							<%=request.getSession().getAttribute("userCode")!=null ? request.getSession().getAttribute("userCode") : "游客" %>	
						</span>
						<span style="padding-left: 5px;">
							设置
						</span>
						<span style="padding-left: 5px;">
							注销
						</span>
					</div>	
				</div>
				
				<div style="clear: both;"></div>
		
			</div>
		
	 	<div class="logo">
			<a href="<%=request.getContextPath() %>"> 
				<img class="img" src="<%=request.getContextPath() %>/images/facebook_developer_logo.png" alt="Facebook" width="166" height="17">
		    </a>
	 	</div>
	 	
		</div>
		<!-- 顶行菜单导航结束 -->

		<div style="clear: both;"></div>

		<div class="body nav">
		
			<!-- 内容主显示区域 -->
			<div class="content">
				
				<div class="contentWrap">
							<div id="bodyText" class="bodyText">
								<div class="header">
									<div class="headWrap">
										<h1>欢迎使用<font color="red" style="font-style: italic;">@SHELL</font>,请点击左侧导航栏</h1>
									</div>
								</div>
							</div>
					
				</div>

				<!-- 页脚div 开始 -->
				<div class="footer">
					<div class="footerWrap">
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
			
			<!-- 左侧导航栏 -->
			<div id="bodyMenu" class="bodyMenu">
				<div class="toplevelnav">
					<ul>
						<li><a href="<%=request.getContextPath() %>/web/organization/user/index.action">
								<div class="navSectionTitle">人员管理</div> </a></li>
						<li><a href="<%=request.getContextPath() %>/web/organization/department/index.action">
								<div class="navSectionTitle">部门管理</div> </a></li>
						<li><a href="<%=request.getContextPath() %>/web/organization/agentCode/index.action">
								<div class="navSectionTitle">工号管理</div> </a></li>
						<li><a href="<%=request.getContextPath() %>/web/organization/position/index.action">
								<div class="navSectionTitle">岗位管理</div> </a></li>
						<li><a href="<%=request.getContextPath() %>/web/organization/role/index.action">
								<div class="navSectionTitle">角色管理</div> </a></li>
					</ul>
				</div>
			</div>
			
			
		
		</div>


			
		
		</div>
</body>
</html>