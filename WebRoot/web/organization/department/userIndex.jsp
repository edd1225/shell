<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysUser"%>
<%@page import="shell.framework.dao.support.VOResult"%>

<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>user index page</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css" />

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/jquery/jquery.jmodal.css"/>

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
  
  <body style="background: url('');">
  
	<!-- 工具栏 -->
	<div class="shell_toolBar">
		<div class="shell_tool_btn shell_inline_block" style="float:left;">全部人员 (<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>)</div>
		<div class="shell_tool_btn shell_inline_block" style="float:left;"> 已选择(<div class="shell_inline_block" id="shell_view_departmentuser_selected_count">0</div>)</div>

		<div>
			<!-- 搜索div开始 -->
			<div class="shell_inline_block">
				<form name="departmentUserForm" method="post" action="">
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
					<input type="hidden" id="ids" name="id" value="" />
					<input type="hidden" id="userIDs" name="user.id" value="" />
					
					<div class="uiTypeahead" id="u362713_2">
						<div class="wrap">
							<div class="innerWrap">
								<span class="shell_tool_search textInput"> 
									<span>
									 <input	type="text" class="inputtext DOMControl_placeholder"
										name="user.fullName" value="<%=request.getParameter("user.fullName")==null?"":request.getParameter("user.fullName") %>" title="键入搜索条件" />
										<button type="button" title="Search for documentation" onclick="javascript:doDepartmentUserSearch();"></button> 
									</span>
								</span>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- 搜索div结束 -->
					
			<div class="shell_tool_btn shell_inline_block" onclick="javascript:doAddUserofDepartment();">+&nbsp;增加人员</div>
			<div class="shell_tool_btn shell_inline_block" onclick="javascript:doBatchDeleteUser();">-&nbsp;解除人员</div>
			<div class="shell_tool_btn shell_inline_block">&nbsp;导出全部</div>
		</div>
	</div>
	
	<!-- 主数据显示区域 开始 -->			 		
	<div style="border: solid 0px #555555 ;  overflow:auto;" class="shell_grid">
	
		<!-- 标题 -->
		<div class="shell_grid_head" style="overflow:auto; width: 100%;">
		<table cellpadding="0" cellspacing="0">
			<tr style="height: 0px;"> 
								<td style="padding:0;border:0;margin:0;height:0px;width:40px;"></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:50px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:50px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:50px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
			</tr>
		
			<tr>
				<th>
					<input type="checkbox" id="checkDUAll" onclick="doCheckAll(this);" /> 
				</th>
				<th>全名</th>
				<th>性别</th>
				<th>工号</th>
				<th>地址</th>
				<th>电话</th>
				<th>生日</th>
			</tr>
		</table>
		</div>
		
		
		<div style="overflow:auto;border: solid 0px #333 ;" class="shell_grid_data">	
		<table cellpadding="0" cellspacing="0">	
		<tr style="height: 0px;"> 
								<td style="padding:0;border:0;margin:0;height:0px;width:40px;"></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:50px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:50px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:50px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
								<td style="padding:0;border:0;margin:0;height:0px;width:100px;" ></td>
		</tr>
		
		
		<%	if(resultList!=null){			
				for(int j=0;j<resultList.size();j++){
					TblSysUser user = (TblSysUser)resultList.get(j);									
		%>					
	
			<tr id="<%=user.getId() %>">
				<td>
					<input type="checkbox" name="checkedDepartmentUser" value="<%=user.getId() %>" /> 
				</td>
				<td><%=user.getFullName() %></td>
				<td><%=user.getSex() %></td>
				<td><%=user.getUserCode() %></td>
				<td><%=user.getAddress() %></td>
				<td><%=user.getTelephone() %></td>
				<td><%=user.getBirthday() %></td>
			</tr>
												   
		   <%}}%>
		</table>	
		</div>		

		<!-- 翻页 -->
		<shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>" 
								   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />
	
	</div>
	<!-- 主数据显示区域 结束 -->	

	
<!-- js库要按照顺序提前加载，否则后面的js函数失效 受限加载jquery，在加载其他基于jquery的js -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_util.js"></script>


<script type="text/javascript">
	function reload(){
		doDepartmentUserSearch();
	}
	//------------------------ 增加部门下人员 -----------------------------------------------------------------------
	function doAddUserofDepartment(){
		var loadURL = "<%=request.getContextPath() %>/web/organization/department/unbindUserIndex.action";
		var titleTXT = "增加人员";
		window.parent.popWindow(loadURL,titleTXT, reload);
	}

	//------------------------ 解除部门下人员 -----------------------------------------------------------------------
	function doBatchDeleteUser(){
		var selectedCount = checkBoxSelectedCount("checkedDepartmentUser");
		if(selectedCount<=0){
			alert('至少选择一个人员，支持批量删除！');
			return false;
		}else{
			if(window.confirm("确定解除？")){
				getcheckBoxAllValue("checkedDepartmentUser","userIDs");
				document.getElementById("ids").value = window.parent.document.getElementById("currentDepartmentID").value;
			
				//ajax post invoke the service of unbindUser
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath() %>/web/organization/department/unbindUser.action",
					data: {
						"id": document.getElementById("ids").value,
						"user.id": document.getElementById("userIDs").value
					},
					success: function(returnData){
						doDepartmentUserSearch();
					}
				});
				
			}
		}
	}

	//------------------------ 部门下人员分页查询 ---------------------------------------------------------------------
	function doPaging(_currentPage){
		document.getElementById("ids").value = window.parent.document.getElementById("currentDepartmentID").value;
		doSubmit(_currentPage,"<%=request.getContextPath() %>/web/organization/department/userIndex.action","departmentUserForm");
	}
	
	//------------------------ 部门下人员搜索 ---------------------------------------------------------------------
	function doDepartmentUserSearch(){
		document.getElementById("ids").value = window.parent.document.getElementById("currentDepartmentID").value;
		doSubmit(null,"<%=request.getContextPath() %>/web/organization/department/userIndex.action","departmentUserForm");
	}
	
	
	//------------------------- 复选框全选 -------------------------------------------------------------------------
	function doCheckAll(obj){
		selectAll("checkDUAll","checkedDepartmentUser");
		//更新选择对象个数
		var selectedCheckboxNum = checkBoxSelectedCount("checkedDepartmentUser");
		document.getElementById("shell_view_departmentuser_selected_count").innerHTML = selectedCheckboxNum;
	}
	
	//------------------------- 复选框按钮单击事件 ------------------------------------------------------------------------
	$("input[name='checkedDepartmentUser']").click(function(){
		var $subs = $("input[name='checkedDepartmentUser']");
	    $("#checkDUAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
	    rescumeCount(this);
	});
	//------------------------------- 已选择对象个数变化函数 ----------------------------------------------------------
	var rescumeCount = function(obj){
		if(obj.checked == false){
			$("#shell_view_departmentuser_selected_count").text(parseInt($("#shell_view_departmentuser_selected_count").text(), 10) - 1);
		} else { 
			$("#shell_view_departmentuser_selected_count").text(parseInt($("#shell_view_departmentuser_selected_count").text(), 10) + 1);
		}
	};
	
	
	
</script>

<script for=window EVENT=onload language="JavaScript" type="text/javascript">
    parent.document.getElementById('tabIfame').style.height=document.body.scrollHeight;
    //alert(document.body.scrollHeight);
</script>


  </body>
</html>
