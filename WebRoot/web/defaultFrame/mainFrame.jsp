<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="@SHELL 是一个企业级开发的基础平台，集成了SH框架，提供企业级开发的基础功能部分，用户在此基础平台上可以搭建自己的业务平台！">

<title>@SHELL</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/cuheXhkBDkh.css">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/p_e4y6WmY0P.css">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/eExuUYovHyE.css">

<!-- 
<script type="text/javascript" src="../../js/common/fNWwCkXLvOv.js"></script>
<script type="text/javascript" async="" src="../../js/common/ga.js"></script>

<script src="./Facebook_resources/Yd1AJTC7arz.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/fLiM0DKnx2t.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/Te7Lb1diu8z.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/-KRncDz6Y2j.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/XtE6Qg0z0vd.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/D8FCGc6HZSS.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/xrEeXUiCo9E.js" type="text/javascript" async=""></script>
-->

</head>

<!-- 文档body部分开始 -->

<body class="safari4 Locale_zh_CN" >
<!--
	<div id="FB_HiddenContainer" style="position:absolute; top:-10000px; width:0px; height:0px;"></div>
-->	

	<div class="devsitePage">
		<!-- 顶行菜单导航开始 -->
		<div class="menu">
				<a class="logo" href="<%=request.getContextPath() %>"> 
					<img class="img" src="<%=request.getContextPath() %>/images/facebook_developer_logo.png" alt="Facebook" width="166" height="17">
			    </a> 
			<div class="content">
					
				<a class="l" href="<%=request.getContextPath() %>/web/defaultFrame/mainFrame.jsp">主面板</a>
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
							<li><a href="<%=request.getContextPath() %>/web/organization/user/index.action?currentPage=1">
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
		
			<!-- 内容主显示区域 -->
			<div class="content">
				<div id="bodyText" class="bodyText">
					<div class="header">
						<div class="content">
							<h1>欢迎使用<font color="red" style="font-style: italic;">@SHELL</font>,请点击左侧导航栏</h1>
						</div>
					</div>

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
</body>
</html>