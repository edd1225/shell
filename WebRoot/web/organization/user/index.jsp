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

<title>@SHELL</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/cuheXhkBDkh.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/p_e4y6WmY0P.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/eExuUYovHyE.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/jquery.min.js"></script>

<script type="text/javascript">
	
	//用户表单提交
	function doSubmit(currentPage){
		if(currentPage!=null && currentPage>0){
			document.getElementById("currentPage").value = currentPage;
		}
		var userForm = document.forms[0];
		with(userForm){
			action = "<%=request.getContextPath() %>/web/organization/user/index.action";
			submit();
		}
	}
	
</script>

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
					
					<div class="shell_toolBar">
						<div class="shell_tool_btn shell_inline_block" style="float:left;">全部用户(<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>人)</div>
						<div class="shell_tool_btn shell_inline_block" style="float:left;"> 已选择(<div class="shell_inline_block" id="shell_view_selected_count">0</div>)</div>
						<div style="float: right;">
								

							<!-- 搜索div开始 -->
							<div class="shell_inline_block">
					<form name="userForm" method="post" action="">
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
						<input type="hidden" id="ids" name="id" value="fuck you." />
									<div class="uiTypeahead" id="u362713_2">
										<div class="wrap">
											<div class="innerWrap">
												<span class="shell_tool_search textInput"> 
													<span>
													 <input	type="text" class="inputtext DOMControl_placeholder"
														name="fullName" value="<%=request.getParameter("fullName")==null?"":request.getParameter("fullName") %>" title="键入搜索条件" />
														<button type="button" title="Search for documentation" onclick="doSubmit(0);"></button> 
													</span>
												</span>
											</div>
										</div>
									</div>
					</form>
							</div>
							<!-- 搜索div结束 -->
								
								
						<!--  
							<div class="shell_tool_btn shell_inline_block">Q&nbsp;查询</div>
						-->	
							<div class="shell_tool_btn shell_inline_block">+&nbsp;增加</div>
							<div class="shell_tool_btn shell_inline_block" onclick="doDelete();">-&nbsp;删除</div>
							<div class="shell_tool_btn shell_inline_block">U&nbsp;更新</div>
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
	
						<div id="<%=user.getId() %>" class="shell_user_identity shell_inline_block" tabindex="0" role="link"  >
							<img class="shell_user_identity_img" src="<%=request.getContextPath() %>/images/shell_identify_default_img.jpg"  >
							<div class="shell_user_identity_intro"><%=user.getFullName() %>  </div>
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
	
	
<script type="text/javascript">

	//批量删除用户
	function doDelete(){
		var selectedCount = parseInt($("#shell_view_selected_count").text(),10);
		if(selectedCount<=0){
			alert('至少选择一位用户，支持批量删除！');
			return false;
		}else{
			if(window.confirm("确定删除？")){
				//循环取出选择对象id值，以“-”进行分隔
				var userIDs = "";
				$.each($(".shell_item_selected"),function(key,obj){
					obj=$(obj);
					userIDs = userIDs + obj.attr("id") + "-";
				});
				
				$("#ids").attr("value",userIDs.substring(0,userIDs.length-1));
				
				var userForm = document.forms[0];
				with(userForm){
					action = "<%=request.getContextPath() %>/web/organization/user/delete.action";
					submit();
				}
			}
		} 
	}

	$(document).ready(function(){
		$.each($(".shell_user_identity"),function(key,obj){
			obj=$(obj);
			obj.click(function(){
				rescumeCount(obj);
				obj.toggleClass("shell_item_selected");
			})
		});		
		
		//已选择对象个数变化函数
		var rescumeCount = function(obj){
			if (obj.hasClass("shell_item_selected")) {
				$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) - 1);
			} else {  //选择对象个数递增
				$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) + 1);
			}
		};
	});


</script>	
	
	
	
		
</body>
</html>




