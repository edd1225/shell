<%@page import="shell.framework.model.TblSysUser"%>
<%@page import="shell.framework.organization.user.service.TblSysUserService"%>
<%@page import="shell.framework.dao.support.VOResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="@SHELL 是一个企业级开发的基础平台，集成SPIRNG、HIBERNATE框架，提供企业级开发的基础功能部分，用户在此基础平台上可以搭建自己的业务平台！">

<title>@SHELL</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css">

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
		
			<!-- 右侧内容主显示区域 -->
			<div class="content">
				<div class="contentWrap">
				
				<div id="bodyText" class="bodyText">
				
					<div class="shell_toolBar">
						
						<!-- 题头开始 -->
						<table cellspacing=0 cellpadding=0 width=100% border=0 align="center">
						  <tbody>
						    <tr>
						      <td width=20 valign="top" bgcolor="E3EDFF" >
						      	<img src="../../../images/holly-11-10t.gif" border=0> 
						      </td>
						      <td bgcolor="E3EDFF" width="100%">
						        <table width="100%" border="0" cellspacing="0" cellpadding="0">
						          <tr>
						            <td height="4" colspan="9"></td>
						          </tr>
						          <tr>
						          	<td width="10%" style="text-align: right;">
						          		<span> 已选择(<span id="shell_view_selected_count">0</span>)</span>
						          	</td>
									<td width="10%" style="text-align: right;">
										<span>全部部门(<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>人)</span>
									</td>
						          
						            <td width="5%" style="text-align: right;">
						           	 <span onclick="javascript:doAddUser();" style="cursor: pointer;">
						            	<img src="../../../images/docnew.gif">
						            	增加</span>
						            </td>
						            <td width="5%" style="text-align: right;">
						           	 <span onclick="javascript:doBatchDelete();" style="cursor: pointer;">
						            	<img src="../../../images/docdelete.gif">
						            	删除</span>
						            </td>
						            <td width="5%" style="text-align: right;">
							            <span onclick="javascript:doUpdateUser();" style="cursor: pointer;">
						            	<img src="../../../images/docedit.gif">
						            	更新</span>
						            </td>
						            <td width="10%" style="text-align: center;">
						            	<span style="cursor: pointer;">
						            	<img  src="../../../images/shapeTriangle.gif">
						            	更多操作</span>
						            </td>
						            <td width="10%">
						            	<!-- 搜索div开始 -->
										<div>
										<form name="userForm" method="post" action="">
											<input type="hidden" id="currentPage" name="currentPage" value="1" />
											<input type="hidden" id="ids" name="id" value="fuck you." />
												<div class="uiTypeahead">
													<div class="wrap">
														<div class="innerWrap">
															<span class="shell_tool_search textInput"> 
																<span>
																 <input	type="text" class="inputtext DOMControl_placeholder"
																	name="fullName" value="<%=request.getParameter("fullName")==null?"":request.getParameter("fullName") %>" title="键入搜索条件" />
																	<button type="button" title="Search for documentation" onclick="javascript:doUserSearch();"></button> 
																</span>
															</span>
														</div>
													</div>
												</div>
										</form>
										</div>
										<!-- 搜索div结束 -->
						            </td>
						            <td width="35%" align="right">
						            
						            </td>
						            <td width="10" align="right"><b><img src="../../../images/holly-x.gif" height="12"></b></td>
						            <td width="10" align="center"><b><img src="../../../images/holly-s.gif" height="12"></b></td>
						         
						          </tr>
						        </table>
						        <b></b>
						        </td>
						      <td align="right" valign="top" bgcolor="E3EDFF"><img src="../../../images/holly-11-10v.gif" border=0></td>
						    </tr>
						    <tr>
						      <td colspan="3" valign="top" height="2" bgcolor="2865A2"></td>
						    </tr>
						  </tbody>
						</table>
						<!-- 题头结束 -->
						
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
							<li><a class="selected" href="<%=request.getContextPath() %>/web/organization/position/index.action">
									<div class="navSectionTitle">岗位管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/role/index.action">
									<div class="navSectionTitle">角色管理</div> </a></li>
						</ul>
					</div>
				</div>
	
		</div>



	</div>

<!-- js库要按照顺序提前加载，否则后面的js函数失效 -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>

<script type="text/javascript">

	//------------------------ 人员分页查询 ------------------------------------------------------------------------------
	function doPaging(_currentPage){
		doSubmit(_currentPage,"<%=request.getContextPath() %>/web/organization/user/index.action","userForm");
	}
	//------------------------ 用户搜索 ----------------------------------------------------------------------------------
	function doUserSearch(){
		doSubmit(null,"<%=request.getContextPath() %>/web/organization/user/index.action","userForm");
	}
	//------------------------ 批量删除用户 -------------------------------------------------------------------------------
	function doBatchDelete(){
		var selectedCount = $(".shell_item_selected").length;
		if(selectedCount<=0){
			alert('至少选择一位用户，支持批量删除！');
			return false;
		}else{
			if(window.confirm("确定删除？")){
				//循环取出选择对象id值，以“-”进行分隔
				var userIDs = "";
				$.each($(".shell_item_selected"),function(key,obj){
					obj=$(obj); //需要重新获取对象
					userIDs = userIDs + obj.attr("id") + "-";
				});
				
				document.getElementById("ids").value = userIDs.substring(0,userIDs.length-1);
				doSubmit(null,"<%=request.getContextPath() %>/web/organization/user/delete.action","userForm");
			}
		} 
	}
	//------------------------ 增加用户 -------------------------------------------------------------------------------
	function doAddUser(){
		var loadURL = "<%=request.getContextPath() %>/web/organization/user/userAdd.jsp";
		var retValue = openNewWindow(loadURL,700,300);
		if(retValue=='ok'){
			reload();
		}
	}
	//------------------------ 重新加载页面 ---------------------------------------------------------------------------
	function reload(){
		doPaging(null);
	}
	//------------------------ 更新用户-------------------------------------------------------------------------------
	function doUpdateUser(){
		var selectedCount = $(".shell_item_selected").length;
		if(selectedCount!=1){
			alert("请选择一个用户！");
			return false;
		}
		var id = $(".shell_item_selected").attr("id");
		var loadURL = "<%=request.getContextPath() %>/web/organization/user/preUpdate.action?id="+id;
		var retValue = openNewWindow(loadURL,700,300);
		if(retValue=='ok'){
			reload();
		}
	}
	
	
</script>	
	
<script type="text/javascript">
	$(document).ready(function(){
		//---------------------------选择用户面板----------------------------------------------------------------------
		$.each($(".shell_user_identity"),function(key,obj){
			obj=$(obj);
			obj.click(function(){
				rescumeCount(obj);
				obj.toggleClass("shell_item_selected");
			})
		});		
		
		//-------------------------------已选择对象个数变化函数----------------------------------------------------------
		var rescumeCount = function(obj){
			if (obj.hasClass("shell_item_selected")) {
			//	$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) - 1);
				document.getElementById("shell_view_selected_count").innerHTML = parseInt($("#shell_view_selected_count").text(), 10) - 1;
				
			} else {  //选择对象个数递增
				//$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) + 1);
				document.getElementById("shell_view_selected_count").innerHTML = parseInt($("#shell_view_selected_count").text(), 10) + 1;
			}
		};
			
			
	});

</script>	
		
</body>
</html>




