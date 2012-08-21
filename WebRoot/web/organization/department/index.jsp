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

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/cuheXhkBDkh.css" />
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
				
				<!-- 登录个人信息 -->
				<div align="right" style="padding-top: 7px;padding-right: 5px; font-size: small;font-weight: normal;">
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

				<div class="clear"></div>
			</div>
		</div>
		<!-- 顶行菜单导航结束 -->

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
				<div id="bodyText" class="bodyText">
					
					<div class="shell_toolBar">
						<div class="shell_tool_btn shell_inline_block" style="float:left;">全部部门(<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>)</div>
						<div class="shell_tool_btn shell_inline_block" style="float:left;"> 已选择(<div class="shell_inline_block" id="shell_view_selected_count">0</div>)</div>

						<div>
							<!-- 搜索div开始 -->
							<div class="shell_inline_block">
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
									
							<div class="shell_tool_btn shell_inline_block" onclick="javascript:doAddDepartment();">+&nbsp;增加</div>
							<div class="shell_tool_btn shell_inline_block" onclick="javascript:doBatchDeleteDepartment();">-&nbsp;删除</div>
							<div class="shell_tool_btn shell_inline_block" onclick="javascript:doUpdateDepartment();">U&nbsp;更新</div>
							<div class="shell_tool_btn shell_inline_block">+&nbsp;更多操作</div>
						</div>
					</div>
					
					<!-- 主数据显示区域 开始 -->			 		
					<div style="border: solid 0px #555555; overflow: auto;" class="shell_grid">
					
						<!-- 标题 -->
						<div class="shell_grid_head" style="overflow:auto; width: 100%;">
						<table cellpadding="0" cellspacing="0">
						<!-- 
						 -->	
							<tr style="height: 0px;"> 
								<td style="padding:0;border:0;margin:0;height:0px;width:40px;"></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
							</tr>
							<tr>
								<th> 
									<input type="checkbox" id="checkAll" onclick="javascript:checkBoxAll();" /> 
								</th>
								<th>部门名称</th>
								<th>部门类型</th>
								<th>所属组织</th>
								<th>创建时间</th>
							</tr>
						</table>
						</div>
						
						
						<div class="shell_grid_data" style="overflow:auto; border: solid 0px #aaa; width: 100%;">
						<table cellpadding="0" cellspacing="0">	
							<tr style="height: 0px;"> 
								<td style="padding:0;border:0;margin:0;height:0px;width:40px;"></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
							</tr>
						 
						<%	if(resultList!=null){			
								for(int j=0;j<resultList.size();j++){
									TblSysDepartment department = (TblSysDepartment)resultList.get(j);									
						%>	
										
							<tr>
								<td>
								 	<input type="checkbox" name="checkedDepartment" value="<%=department.getId() %>" /> 
								</td>
								<td><a href="#" id="<%=department.getId() %>" onclick="javascript:doLoadUser(this);" >
									<%=department.getDepartmentName() %></a>
								</td>
								<td ><%=department.getDepartmentType() %></td>
								<td ><%=department.getOrganizationID() %></td>
								<td ><%=department.getCreateTime() %></td>
							</tr>
	
						  <%}}%>
							
						</table>
						</div>	
						
					<!-- 翻页 紧跟数据区下方 -->
					<shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>" 
											   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />

					</div>
					<!-- 主数据显示区域 结束 -->	
					
					<div> <span>&nbsp;&nbsp;</span>	</div>
						
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




