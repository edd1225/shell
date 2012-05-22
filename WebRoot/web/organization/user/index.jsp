<%@page import="shell.framework.model.TblSysUser"%>
<%@page import="shell.framework.organization.user.service.TblSysUserService"%>
<%@page import="shell.framework.dao.support.VOResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		.toolBar{
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
		/* 鼠标划过@SHELL工具栏按钮 */
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

	
	<%
		Object obj = request.getAttribute("voResult");
		VOResult voResult = null;
		java.util.List resultList = null;
		if(obj != null){
			voResult = (VOResult)obj;
			resultList = voResult.getResultList();
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
							<li><a class="selected" href="<%=request.getContextPath() %>/web/organization/user/index.action">
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
					
					<div class="toolBar">
						<div class="shell_tool_btn shell_inline_block" style="float:left;">全部用户[<font color="red">500</font>]</div>
						<div style="float: right;">
							<div class="shell_tool_btn shell_inline_block">Q&nbsp;查询</div>
							<div class="shell_tool_btn shell_inline_block">+&nbsp;增加</div>
							<div class="shell_tool_btn shell_inline_block">-&nbsp;删除</div>
							<div class="shell_tool_btn shell_inline_block">+&nbsp;更多操作</div>
						</div>
					</div>
					
					 <div class="nW sD oz-sg-elements" style="height: 78px; ">
						
						<div class="shell_user_identity shell_inline_block" hc="off" email="" oid="111555290829831625120" tabindex="0" role="link"  >
							<img class="shell_user_identity_img" src="//lh6.googleusercontent.com/-3uDUPJuV6kM/AAAAAAAAAAI/AAAAAAAAIrc/ZbZyaG7iLkA/s48-c-k/photo.jpg"  >
							<div class="shell_user_identity_intro">萍明蕊</div>
						</div>
						
						<div class="shell_user_identity shell_inline_block" hc="off" email="" oid="107953151459945545823" tabindex="0" role="link"  >
							<img class="shell_user_identity_img"  src="//lh4.googleusercontent.com/-fPvPn34LOVM/AAAAAAAAAAI/AAAAAAAAD5U/zO60w70ymd8/s48-c-k/photo.jpg"  >
							<div class="shell_user_identity_intro">周星星</div>
						</div>
						
						<div class="shell_user_identity shell_inline_block " hc="off" email="" oid="115520253246151112657" tabindex="0" role="link"  >
							<img class="shell_user_identity_img"  src="//lh4.googleusercontent.com/-x4cAWUGz05w/AAAAAAAAAAI/AAAAAAAAABM/VUeeF0XpmpU/s48-c-k/photo.jpg"  >
							<div class="shell_user_identity_intro">嘿嘿嘿</div>
						</div>
						
						<div class="shell_user_identity shell_inline_block " hc="off" email="jackychi@gmail.com" oid="114852792723220419539" tabindex="0" role="link"  >
							<img class="shell_user_identity_img"  src="//lh6.googleusercontent.com/-8YMruLgDWpA/AAAAAAAAAAI/AAAAAAAAANU/Xuw-lAgXiLU/s48-c-k/photo.jpg"  >
							<div class="shell_user_identity_intro">Jianqiang Chi</div>
						</div>
						
						<div class="shell_user_identity  shell_inline_block" hc="off" email="" oid="102225227289672438488" tabindex="0" role="link"  >
							<img class="shell_user_identity_img"  src="//lh5.googleusercontent.com/-SdX4Ak0hq00/AAAAAAAAAAI/AAAAAAAA_8w/nc5uCCNxDRw/s48-c-k/photo.jpg"  >
							<div class="shell_user_identity_intro">Robin Yew</div>
						</div>
						
						<div class="shell_user_identity  shell_inline_block" hc="off" email="" oid="108323473136128442646" tabindex="0" role="link"  >
							<img class="shell_user_identity_img"  src="//lh6.googleusercontent.com/-fWc2OXsKTrc/AAAAAAAAAAI/AAAAAAAAADY/u1sh-2WG1AI/s48-c-k/photo.jpg"  >
							<div class="shell_user_identity_intro">Xiao Hui</div>
						</div>
						
					</div>
					
					<div class="nW sD oz-sg-elements" style="height: 78px; ">
						
						<%
							if(resultList!=null){
								for(int i=0;i<resultList.size();i++){
									TblSysUser user = (TblSysUser)resultList.get(i);									
										//user.getFullName();
						%>					
							
							
						<div class="shell_user_identity shell_inline_block" hc="off" email="" oid="111555290829831625120" tabindex="0" role="link"  >
							<img class="shell_user_identity_img" src="//lh4.googleusercontent.com/-fPvPn34LOVM/AAAAAAAAAAI/AAAAAAAAD5U/zO60w70ymd8/s48-c-k/photo.jpg"  >
							<div class="shell_user_identity_intro"><%=user.getFullName() %></div>
						</div>
							
							
						<%			
								}
							}
						%>
						
					</div>
					
					
					<div class="nW sD oz-sg-elements" style="height: 78px; ">
						
						<%
							if(resultList!=null){
								for(int i=0;i<resultList.size();i++){
									TblSysUser user = (TblSysUser)resultList.get(i);									
										//user.getFullName();
						%>					
							
							
						<div class="shell_user_identity shell_inline_block" hc="off" email="" oid="111555290829831625120" tabindex="0" role="link"  >
							<img class="shell_user_identity_img" src="//lh4.googleusercontent.com/-fPvPn34LOVM/AAAAAAAAAAI/AAAAAAAAD5U/zO60w70ymd8/s48-c-k/photo.jpg"  >
							<div class="shell_user_identity_intro"><%=user.getFullName() %></div>
						</div>
							
							
						<%			
								}
							}
						%>
						
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




