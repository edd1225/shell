<%@page import="shell.framework.model.TblSysDepartment"%>
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
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css">

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/jquery/jquery.noty.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/jquery/noty_theme_default.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/jquery/jquery.jmodal.css" />

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
<body class="safari4 Locale_zh_CN" >

	<div class="shellPage">
	
		<!-- 顶行菜单导航开始 -->
		<div class="menu">
		
	 	<div class="logo">
			<a href="<%=request.getContextPath() %>"> 
				<img class="img" src="<%=request.getContextPath() %>/images/facebook_developer_logo.png" alt="Facebook" width="166" height="17">
		    </a>
	 	</div>
			<div class="topNav">
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
				
				<div style="clear: both;"></div>
		
			</div>
		</div>
		<!-- 顶行菜单导航结束 -->

		<div style="clear: both;"></div>

		<div class="body nav">
		
			<!-- 左侧导航栏 -->
				<div id="bodyMenu" class="bodyMenu">
					<div class="toplevelnav">
						<ul>
							<li><a href="<%=request.getContextPath() %>/web/organization/user/index.action">
									<div class="navSectionTitle">人员管理</div> </a></li>
							<li><a class="selected" href="<%=request.getContextPath() %>/web/organization/department/index.action">
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
		
			<!-- 右侧内容主显示区域 -->
			<div class="content">
			
			<div class="contentWrap">
			
				<div id="bodyText" class="bodyText">
					
					<!-- 工具栏 -->
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
						          <%--
						            <td width="4%" align="center">
							            <b><font color="127BC4">
							            	 <img src="../../../images/icon_next.gif">
							            </font></b>
						            </td>
						           --%>
						            
						            
						            <td width="5%" style="text-align: right;">
						           	 <span onclick="javascript:doAddDepartment();" style="cursor: pointer;">
						            	<img src="../../../images/docnew.gif">
						            	增加</span>
						            </td>
						            <td width="5%" style="text-align: right;">
						           	 <span onclick="javascript:doBatchDeleteDepartment();" style="cursor: pointer;">
						            	<img src="../../../images/docdelete.gif">
						            	删除</span>
						            </td>
						            <td width="5%" style="text-align: right;">
							            <span onclick="javascript:doUpdateDepartment();" style="cursor: pointer;">
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
										<form name="departmentForm" method="post" action="">
											<input type="hidden" id="currentPage" name="currentPage" value="1" />
											<input type="hidden" id="ids" name="id" value="" />
											<input type="hidden" name="currentDepartmentID" id="currentDepartmentID" value="" />
											<div class="uiTypeahead" id="u362713_2">
												<div class="wrap">
													<div class="innerWrap">
														<span class="shell_tool_search textInput"> 
															<span>
															 <input	type="text" class="inputtext DOMControl_placeholder"
																name="departmentName" value="<%=request.getParameter("departmentName")==null?"":request.getParameter("departmentName") %>" title="键入搜索条件" />
																<button type="button" title="Search for documentation" onclick="javascript:doDepartmentSearch();"></button> 
															</span>
														</span>
													</div>
												</div>
											</div>
										</form>
										</div>
									<!-- 搜索div结束 -->
						            </td>
						            <td width="55%" align="right">
						            
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
					
					<div style="height: 0px;width: 100%;"></div>	
		
					<!-- 主数据显示区域 开始 -->	
					<div class="shell_grid" style="border: solid 0px #555555; overflow: auto;">
					
					 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					          <tr>
					            <td bgcolor="808080" valign="top">
					              <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="100%">
					                <tr>
					                  <td nowrap bgcolor="#B5BCCE" valign="top" align="center">
					                    <table cellspacing=1 cellpadding=2 width="100%" border="0">
					                      <tbody>
								<!-- 标题 -->
					            <tr>
					             	 <th width="10%" align=left bgcolor=#E3EDFF class="a1">
					                  	<input type="checkbox" id="checkAll" onclick="javascript:checkBoxAll();" /> 
					                 </th>
					                 <th width="20%" align=left bgcolor=#E3EDFF class="a1">部门名称 </th>
					                 <th width="20%" align=left bgcolor=#E3EDFF class="a1">部门类型</th>
					                 <th width="20%" align=left bgcolor=#E3EDFF class="a1">所属组织</th>
					                 <th width="30%" align=left bgcolor=#E3EDFF class="a1">创建时间</th>
					            </tr>             
					                  
											<%	if(resultList!=null){			
													for(int j=0;j<resultList.size();j++){
														TblSysDepartment department = (TblSysDepartment)resultList.get(j);									
											%>	
												 
					                        <tr onclick="doChangeColor('color<%=j %>');" id="color<%=j %>" bgcolor="#FFFFFF" >
					                          <td width="10%" align=center  class="a1">
					                          	<input type="checkbox" name="checkedDepartment" value="<%=department.getId() %>" />
					                          </td>
					                          <td width="20%" align=left class="a1">
					                          	<a href="#" id="<%=department.getId() %>" onclick="javascript:doLoadUser(this);" >
														<%=department.getDepartmentName() %>
												</a>
					                          </td>
					                          <td width="20%" align=center  class="a1"><%=department.getDepartmentType() %></td>
					                          <td width="20%" align=left class="a1"><%=department.getOrganizationID() %></td>
					                          <td width="30%" align=center class="a1"><%=department.getCreateTime() %></td>
					                        </tr>
						
											 <%}}%>
					                        
					                      </tbody>
					                  </table></td>
					                </tr>
					            </table></td>
					          </tr>
					   </table>
					
					</div>	
					<!-- 主数据显示区域 结束 -->			
					<!-- 翻页 紧跟数据区下方 -->
					<shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>" 
											   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />
			
					
					<div style="height: 5px;width: 100%;"></div>			
				
			<%--  暂时保留		
			<!-- 主数据显示区域 开始 -->			 		
					<div class="shell_grid" style="border: solid 0px #555555; overflow: auto;">
						<!-- 标题 -->
						<div class="shell_grid_head" style="overflow:auto; width: 100%;">
						</div>
						<div class="shell_grid_data" style="overflow:auto; border: solid 0px #aaa; width: 100%;">
						</div>	
					</div>
			<!-- 主数据显示区域 结束 -->	
			--%>		
					<div style="height: 8px;width: 100%;"></div>	
						
					<!-- 标签数据显示区 开始 -->
					<div id="tab-container" style="border: solid 0px; overflow:hidden;width:100%; ">
					
						<ul id="tab-container-nav"  class="shell_tab_container_nav">
						    <li><a href="#tab1">人员</a></li>
						    <li><a href="#tab2">岗位</a></li>
						    <li><a href="#tab3">角色</a></li>
					    </ul>
						<div class="shell_tabs_container">
						
						    <div class="tab" id="tab1">
							    <iframe id="tabIfame" name="tabIfame" scrolling="no" marginwidth="0" marginheight="0" 
							    				style="border: solid 0px;width: 100%; overflow: auto;">
								   <%-- 
								    <h2>人员列表信息</h2>
								    <p> 这里展现部门下所有的人员列表信息.  </p>
								    --%>
							    </iframe>
						    </div>
						    <div class="tab" id="tab1">
								    <h2>岗位列表信息</h2>
								    <p> 这里展现部门下所有的岗位列表信息.  </p>
						    </div>
						    <div class="tab" id="tab1">
								    <h2>角色列表信息</h2>
								    <p> 这里展现部门下所有的角色列表信息.  </p>
						    </div>
						</div>

					</div>
					<!-- 标签数据显示区 结束 -->
			
			
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
		</div>
		
	</div>

<!-- js库要按照顺序提前加载，否则后面的js函数失效 受限加载jquery，在加载其他基于jquery的js -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.noty.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.jmodal.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/yetii.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_util.js"></script>

<script type="text/javascript" language="JavaScript">

	//------------------------ 部门搜索 ----------------------------------------------------------------------------------
	function doDepartmentSearch(){
		doSubmit(null,"<%=request.getContextPath() %>/web/organization/department/index.action","departmentForm");
	}
	
	//------------------------ 部门分页查询 ------------------------------------------------------------------------------
	function doPaging(_currentPage){
		doSubmit(_currentPage,"<%=request.getContextPath() %>/web/organization/department/index.action","departmentForm");
	}
	
	//------------------------ 加载部门下人员 ------------------------------------------------------------------------------
	function doLoadUser(obj){
		var id = obj.id;
		var userIframe = document.getElementById("tabIfame");
		userIframe.src = '<%=request.getContextPath() %>/web/organization/department/userIndex.action?id='+id;
		tabber.show(1);
		document.getElementById("currentDepartmentID").value = id;
	}
	
	
	//---------------------- 批量删除部门 ------------------------------------------------------------------------------------
	function doBatchDeleteDepartment(){	
		if(checkBoxSelected("checkedDepartment") == false){
			alert('至少选择一位用户，支持批量删除！');
			return false;
		}else{
			if(window.confirm("确定删除？")){
				var departmentIDs = getcheckBoxAllValue("checkedDepartment","ids");
				doSubmit(null,"<%=request.getContextPath() %>/web/organization/department/delete.action","departmentForm");
			}
		} 
	}
	
	//------------------------ 增加部门 -----------------------------------------------------------------------
	function doAddDepartment(){
		var loadURL = "<%=request.getContextPath() %>/web/organization/department/departmentAdd.jsp";
		var titleTXT = "增加系统部门";
		popWindow(loadURL,titleTXT,   reload);
	}
	function reload(){
		doPaging(null);
	}
	
	//------------------------ 更新系统部门 ------------------------------------------------------------------------
    function doUpdateDepartment(){	
		if(checkBoxSelectedCount("checkedDepartment")!=1){
			alert('请选择一位用户！');
			return false;
		}
		var id = checkBoxSelected("checkedDepartment");
		var loadURL = '<%=request.getContextPath() %>/web/organization/department/preUpdate.action?id='+id;
		var titleTXT = "更新部门";
		popWindow(loadURL,titleTXT,reload);
    }
	
    
	//---------------------- tab js---------------------------------------------------------------------------------------
	var tabber = new Yetii({
			id: 'tab-container',
			callback: preLoadDataFunc
		});   
	//---------------------- 标签单击函数 此函数可以不要 ----------------------------------------------------------------------
	function preLoadDataFunc(tabNumber){
		if(tabNumber==1){
			//loadDataFunc('<%=request.getContextPath() %>/web/organization/department/userIndex.action','tab1');
		}
		if(tabNumber==2){
			//alert('you clicked tab2');
		}
	}
	
	//------------------------- 复选框全选 -------------------------------------------------------------------------
	function checkBoxAll(){
		selectAll("checkAll","checkedDepartment");
		//更新选择对象个数
		var selectedCheckboxNum =  checkBoxSelectedCount("checkedDepartment");
		document.getElementById("shell_view_selected_count").innerHTML = selectedCheckboxNum;
	}

	//------------------------- 复选按钮单击事件 ------------------------------------------------------------------------
	$("input[name='checkedDepartment']").click(function(){
		var $subs = $("input[name='checkedDepartment']");
	    $("#checkAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
	    rescumeCount(this);
	});
	//------------------------------- 已选择对象个数变化函数 ----------------------------------------------------------
	var rescumeCount = function(obj){
		if(obj.checked == false){
			$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) - 1);
		} else { 
			$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) + 1);
		}
	};
	
</script>








<script type="text/javascript">

	$(document).ready(function(){
		//---------- 测试通知效果 bug -----------------------------------------------------------------------------------
		var SYS_MESSAGE_TXT = "<%=session.getAttribute("SYS_MESSAGE_VALUE") %>";
		var SYS_MESSAGE_TYPE = "<%=session.getAttribute("SYS_MESSAGE_TYPE") %>";

		//有bug
		//if(SYS_MESSAGE_TXT!=null && SYS_MESSAGE_TXT!=""){
			if(true==false){
			var noty_id = noty({
				  "text": SYS_MESSAGE_TXT,
				  "layout": "top",
				  "type": SYS_MESSAGE_TYPE,
				  "animateOpen":{"height":"toggle"},
				  "animateClose":{"height":"toggle"},
				  "speed":500,
				  "timeout":1000,
				  "closeButton":false,
				  "closeOnSelfClick":false,
				  "closeOnSelfOver":false,
				  "modal":false,
				  "onClose": function(){
					  //alert('mmmm');
					}
			});
		}
		
	});

</script>	
		
</body>
</html>




