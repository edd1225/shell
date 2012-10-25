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
			<div id="content" class="content">
			
			<div id="contentWrap" class="contentWrap">
			
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
											<div class="uiTypeahead">
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
					
					<!-- 主数据显示区域 开始 -->	
					<div class="shell_grid">
					
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
					                  	<input type="checkbox" id="checkAll" onclick="javascript:selectAll('checkAll','checkedDepartment');" /> 
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
					                          	<input type="checkbox" name="checkedDepartment" value="<%=department.getId() %>" 
					                          		   onclick="javascript:checkGroupAllSync('checkedDepartment','checkAll');"/>
					                          </td>
					                          <td width="20%" align=left class="a1">
					                          	<a href="javascript:void(0);" id="<%=department.getId() %>" onclick="javascript:doLoadData(this);" >
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
					
					<div style="height: 10px;"></div>	
						
					<!-- 标签数据显示区 开始 -->
					<div id="tab-container" style="border: solid 0px; overflow:hidden;width:100%; ">
					
						<ul id="tab-container-nav"  class="shell_tab_container_nav">
						    <li><a href="#tab1">人员</a></li>
						    <li><a href="#tab2">岗位</a></li>
						    <li><a href="#tab3">角色</a></li>
					    </ul>
						<div class="shell_tabs_container">
						
						    <div class="tab" id="tab1">
							    <iframe id="userTabIfame" name="tabIfame" src="<%=request.getContextPath() %>/web/organization/department/departmentInfo.html" scrolling="no" frameborder="0" marginwidth="0" marginheight="0" 
							    		style="border: 0px solid; width: 100%; overflow: auto;">
							    </iframe>
						    </div>
						    <div class="tab" id="tab2">
							    <iframe id="positionTabIfame" name="tabIfame" src="<%=request.getContextPath() %>/web/organization/department/departmentInfo.html" scrolling="no" frameborder="0" marginwidth="0" marginheight="0" 
							    		style="border: 0px solid; width: 100%; overflow: auto;">
							    </iframe>
						    </div>
						    <div class="tab" id="tab3">
								<iframe id="roleTabIfame" name="tabIfame" src="<%=request.getContextPath() %>/web/organization/department/departmentInfo.html" scrolling="no" frameborder="0" marginwidth="0" marginheight="0" 
							    		style="border: 0px solid; width: 100%; overflow:auto; ">
							    </iframe>
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
		
		</div>
		
	</div>

<!-- js库要按照顺序提前加载，否则后面的js函数失效 受限加载jquery，在加载其他基于jquery的js -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_util.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/yetii.js"></script>

<!-- 页面主内容区域可随意上下滚动，其他位置不动 -->
<SCRIPT LANGUAGE="JavaScript">
	<!--
	function _resize(){
		var size = GetClientSize();
		document.getElementById("bodyMenu").style.height=(size[1]-102)+"px";
		document.getElementById("contentWrap").style.height=(size[1]-102)+"px";
	}
	
	if(document.addEventListener) {
		window.addEventListener("resize", _resize, false); //FF
	} else if(document.attachEvent) {
		window.attachEvent("onresize", _resize); //IE
	}
		
	function GetClientSize(){
		if(document.documentElement.clientWidth){
			return [document.documentElement.clientWidth, document.documentElement.clientHeight];
		}else{
			return [document.body.clientWidth, document.body.clientHeight];
		}
	}
	
	_resize();

	//-->
</SCRIPT>

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
	function doLoadData(obj){
		//先获取当前部门id值，后面代码会覆盖掉该obj值
		var id = obj.id;
		if(obj){
			while(obj.tagName!=null && obj.tagName!="TR"){
				obj = obj.parentNode;
			}
			if(obj.tagName!="TR"){
				alert("对象有误！不存在TR对象！");
				return false;
			}
			var checkBoxObj = recursionGetCheckBox(obj);
			if(checkBoxObj && (checkBoxObj.checked==false)){
				checkBoxObj.checked = true;
			}
			//同步全选按钮状态
			checkGroupAllSync("checkedDepartment","checkAll");
		}
		
		document.getElementById("currentDepartmentID").value = id;
		var userIframe = document.getElementById("userTabIfame");
		userIframe.src = '<%=request.getContextPath() %>/web/organization/department/userIndex.action?id='+id;
		tabber.show(1);
	}
	
	
	//---------------------- 批量删除部门 ------------------------------------------------------------------------------------
	function doBatchDeleteDepartment(){
		if(!isCheckBoxSelected("checkedDepartment")){
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
		var retValue = openNewWindow(loadURL,700,300);
		if(retValue=='ok'){
			reload();
		}
	}
	function reload(){
		doPaging(null);
	}
	
	//------------------------ 更新系统部门 ------------------------------------------------------------------------
    function doUpdateDepartment(){	
		if(checkBoxSelectedCount("checkedDepartment")!=1){
			alert('请选择一个部门！');
			return false;
		}
		var id = getCheckBoxSingleValue("checkedDepartment");
		var loadURL = '<%=request.getContextPath() %>/web/organization/department/preUpdate.action?id='+id;
		var retValue = openNewWindow(loadURL,700,300);
		if(retValue=='ok'){
			reload();
		}
    }
	
    
	//---------------------- tab js---------------------------------------------------------------------------------------
	var tabber = new Yetii({
			id: 'tab-container',
			callback: preLoadDataFunc
		});   
	//---------------------- 标签单击函数 ----------------------------------------------------------------------
	function preLoadDataFunc(tabNumber){
		if(tabNumber==1){
			//loadDataFunc('<%=request.getContextPath() %>/web/organization/department/userIndex.action','tab1');
		}
		if(tabNumber==2){
			var positionIframe = document.getElementById("positionTabIfame");
		}
		if(tabNumber==3){
			var roleIframe = document.getElementById("roleTabIfame");
			var id = document.getElementById("currentDepartmentID").value;
			if(roleIframe.src && id!=""){
				roleIframe.src = '<%=request.getContextPath() %>/web/organization/department/roleIndex.action?id='+id;
			}
		}
	}
	
</script>

</body>
</html>




