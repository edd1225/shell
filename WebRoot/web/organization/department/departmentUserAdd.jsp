<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysUser"%>
<%@page import="shell.framework.dao.support.VOResult"%>

<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加人员</title>
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
			//out.println("totalRecord=" + voResult.getTotalRows());
		}else{
			//out.println("obj=NULL" );
		}
		
	%>


</head>
<body>
	
	<div style="margin-top: 8px;margin-left:10px;margin-right:10px;">
	<!-- 工具栏 -->
	<div class="shell_toolBar">
		<div class="shell_tool_btn shell_inline_block" style="float:left;">全部人员 (<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>)</div>
		<div class="shell_tool_btn shell_inline_block" style="float:left;"> 已选择(<div class="shell_inline_block" id="shell_view_departmentuser_selected_count">0</div>)</div>

		<div>
			<!-- 搜索div开始 -->
			<div class="shell_inline_block">
				<form name="departmentUserAddForm" method="post" action="">
					<input type="hidden" id="currentPage" name="currentPage" value="1" />
					<input type="hidden" id="ids" name="user.id" value="" />
					<input type="hidden" id="departmentID" name="id" value="" />
					<div class="uiTypeahead" id="u362713_2">
						<div class="wrap">
							<div class="innerWrap">
								<span class="shell_tool_search textInput"> 
									<span>
									 <input	type="text" class="inputtext DOMControl_placeholder"
										name="user.fullName" value="<%=request.getParameter("user.fullName")==null?"":request.getParameter("user.fullName") %>" title="键入搜索条件" />
										<button type="button" title="Search for documentation" onclick="javascript:doDepartmentUnbindUserSearch();"></button> 
									</span>
								</span>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- 搜索div结束 -->
					
		</div>
	</div>


	<!-- 主数据显示区域 开始 -->			 		
	<div style="border: solid 0px #cccccc ; height: 100%;" class="shell_grid">
		<table style="width: 100%;">
			<tr style="background-color: #627aad">
				<th>
					<input type="checkbox" id="checkUSERAll" onclick="doCheckAll(this);" /> 
				</th>
				<th>全名</th>
				<th>性别</th>
				<th>工号</th>
				<th>地址</th>
				<th>电话</th>
				<th>生日</th>
			</tr>
	
	
		
		<%	if(resultList!=null){			
				for(int j=0;j<resultList.size();j++){
					TblSysUser user = (TblSysUser)resultList.get(j);									
		%>					
	
		<div>
			<tr>
				<td>
					<input type="checkbox" name="checkedUser" value="<%=user.getId() %>" /> 
				</td>
				<td><%=user.getFullName() %></td>
				<td><%=user.getSex() %></td>
				<td><%=user.getUserCode() %></td>
				<td><%=user.getAddress() %></td>
				<td><%=user.getTelephone() %></td>
				<td><%=user.getBirthday() %></td>
			</tr>
		</div>		
												   
		   <%}}%>
		</table>	
			<!-- 翻页 -->
			<shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>" 
									   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />
	</div>
	<!-- 主数据显示区域 结束 -->
	<br/>
	
	</div>
	
	
	<div class="shell_btn_okcancle">
    	<input type="button" value="确定" onclick="javascript: doAction('ok'); " />&nbsp;&nbsp;
    	<input type="button" value="取消" onclick="javascript: doAction('cancle');" />
    </div>
	
	
	
<!-- js库要按照顺序提前加载，否则后面的js函数失效 受限加载jquery，在加载其他基于jquery的js -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_util.js"></script>	
	
<script type="text/javascript">
	
	function doAction(action){
		//获取当前选择的部门ID值
		document.getElementById("departmentID").value = window.parent.document.getElementById("currentDepartmentID").value;
		if(action == 'ok'){
			var selectedCount =  checkBoxSelectedCount('checkedUser');
			if(selectedCount<=0){
				alert('至少选择一位用户！');
				return false;
			}else{
				if(window.confirm("确定增加该部门下人员？")){
					//循环取出选择对象id值，以“-”进行分隔
					getcheckBoxAllValue("checkedUser","ids");
					doSubmit(null,"<%=request.getContextPath() %>/web/organization/department/assignSysUser.action","departmentUserAddForm");
				}
			}
		}
		window.parent.$.fn.destory();
	}	
	
	//---------------------- 未绑定人员搜索 -------------------------------------------------------------------------
	function doDepartmentUnbindUserSearch(){
		var _action = "<%=request.getContextPath() %>/web/organization/department/unbindUserIndex.action";
		doSubmit(null,_action,"departmentUserAddForm");	
	}
		
	//------------------------ 人员分页查询 ---------------------------------------------------------------------
	function doPaging(_currentPage){
		var _action = "<%=request.getContextPath() %>/web/organization/department/unbindUserIndex.action";
		doSubmit(_currentPage,_action,"departmentUserAddForm");
	}
	
	
	//------------------------- 复选框全选 全取消 列表数据 -------------------------------------------------------------------------
	function doCheckAll(obj){
		selectAll("checkUSERAll","checkedUser");
		//更新选择对象个数
		var selectedCheckboxNum = checkBoxSelectedCount("checkedUser");
		document.getElementById("shell_view_departmentuser_selected_count").innerHTML = selectedCheckboxNum;
	}
	
	//------------------------- 复选框按钮单击 触发事件 ------------------------------------------------------------------------
	$("input[name='checkedUser']").click(function(){
		var $subs = $("input[name='checkedUser']");
	    $("#checkUSERAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
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
   parent.document.getElementById('innerIframe').style.height=document.body.scrollHeight;
   parent.document.getElementById('jquery-jmodal').style.height = document.body.scrollHeight;
</script> 
	
</body>
</html>