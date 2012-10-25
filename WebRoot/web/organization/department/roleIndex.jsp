<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysRole"%>
<%@page import="shell.framework.dao.support.VOResult"%>

<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>user index page</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css" />

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
  
  <body >
  
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
		            <td width="10%" style="text-align: right;">
		           	 <span onclick="javascript:doAddRoleOfDepartment();" style="cursor: pointer;">
		            	<img src="../../../images/docnew.gif">
		            	分配角色</span>
		            </td>
		            <td width="10%" style="text-align: right;">
		           	 <span onclick="javascript:doBatchDeleteUser();" style="cursor: pointer;">
		            	<img src="../../../images/docdelete.gif">
		            	回收角色</span>
		            </td>
		            <td width="5%" style="text-align: right;">
		            </td>
		            <td width="10%" style="text-align: center;">
		            	<span style="cursor: pointer;">
		            	<img  src="../../../images/shapeTriangle.gif">
		            	导出全部</span>
		            </td>
		            <td width="10%">
		            	<!-- 搜索div开始 -->
						<div>
						<form name="departmentRoleForm" method="post" action="">
							<input type="hidden" id="currentPage" name="currentPage" value="1" />
							<input type="hidden" id="ids" name="id" value="" />
							<input type="hidden" id="roleIDs" name="role.role.id" value="" />
							
							<div class="uiTypeahead" id="u362713_2">
								<div class="wrap">
									<div class="innerWrap">
										<span class="shell_tool_search textInput"> 
											<span>
											 <input	type="text" class="inputtext DOMControl_placeholder"
												name="role.role.name" value="<%=request.getParameter("role.role.name")==null?"":request.getParameter("role.role.name") %>" title="键入搜索条件" />
												<button type="button" title="Search for documentation" onclick="javascript:doDepartmentRoleSearch();"></button> 
											</span>
										</span>
									</div>
								</div>
							</div>
						</form>
						</div>
					<!-- 搜索div结束 -->
		            </td>
		            <td width="50%" align="right">
		            
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
	<div  class="shell_grid" style="border: solid 0px #555555 ;  overflow:auto;">
	
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
	             	 <th width="5%" align=left bgcolor=#E3EDFF class="a1">
	                  	<input type="checkbox" id="checkRoleAll"  onclick="javascript:selectAll('checkRoleAll','checkedDepartmentRole');" /> 
	                 </th>
	                 <th width="10%" align=left bgcolor=#E3EDFF class="a1">角色名称 </th>
	                 <th width="10%" align=left bgcolor=#E3EDFF class="a1">虚拟角色</th>
	                 <th width="30%" align=left bgcolor=#E3EDFF class="a1">创建时间</th>
	                 <th width="30%" align=left bgcolor=#E3EDFF class="a1">更新时间</th>
					 <th width="15%" align=left bgcolor=#E3EDFF class="a1">创建人</th>
				
	            </tr>             
	                  
							<%	if(resultList!=null){			
								for(int j=0;j<resultList.size();j++){
									TblSysRole role = (TblSysRole)resultList.get(j);									
							%>	
								 
	                        <tr onclick="doChangeColor('color<%=j %>');" id="color<%=j %>" bgcolor="#FFFFFF">
	                          <td width="5%" align=center  class="a1">
	                          	<input type="checkbox" name="checkedDepartmentRole" value="<%=role.getId() %>" 
	                          	 onclick="javascript:checkGroupAllSync('checkedDepartmentRole','checkRoleAll');" /> 
	                          </td>
	                          <td width="10%" align=left class="a1">
	                          	<%=role.getName() %>
	                          </td>
	                          <td width="10%" align=left class="a1"><%=role.getIsVirtual() %></td>
	                          <td width="30%" align=left   class="a1"><%=role.getCreateTime() %></td>
	                          <td width="30%" align=left class="a1"><%=role.getUpdateTime() %></td>
							  <td width="15%" align=left class="a1"><%=role.getCreator() %></td>
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
		<!-- 翻页 -->
		<shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>" 
								   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />
	

	
<!-- js库要按照顺序提前加载，否则后面的js函数失效 受限加载jquery，在加载其他基于jquery的js -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_util.js"></script>

<script type="text/javascript">
	//------------------------ 分配部门下角色 -----------------------------------------------------------------------
	function doAddRoleOfDepartment(){
		document.getElementById("ids").value = window.parent.document.getElementById("currentDepartmentID").value;
		var loadURL = "<%=request.getContextPath() %>/web/organization/department/unAssignRoleIndex.action?id=" + document.getElementById("ids").value;
		var retValue = openNewWindow(loadURL,900,450);
		if(retValue=='ok'){
			doDepartmentRoleSearch();
		}
	}

	//------------------------ 解除部门下角色 -----------------------------------------------------------------------
	function doBatchDeleteUser(){
		var selectedCount = checkBoxSelectedCount("checkedDepartmentRole");
		if(selectedCount<=0){
			alert('至少选择一个角色，支持批量删除！');
			return false;
		}else{
			if(window.confirm("确定解除？")){
				getcheckBoxAllValue("checkedDepartmentRole","roleIDs");
				document.getElementById("ids").value = window.parent.document.getElementById("currentDepartmentID").value;
			
				//ajax post invoke the service of unbindUser
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath() %>/web/organization/department/unAssignSysRole.action",
					data: {
						"id": document.getElementById("ids").value,
						"role.role.id": document.getElementById("roleIDs").value
					},
					success: function(returnData){
						doDepartmentRoleSearch();
					}
				});
				
			}
		}
	}

	//------------------------ 部门下角色分页查询 ---------------------------------------------------------------------
	function doPaging(_currentPage){
		document.getElementById("ids").value = window.parent.document.getElementById("currentDepartmentID").value;
		doSubmit(_currentPage,"<%=request.getContextPath() %>/web/organization/department/roleIndex.action","departmentRoleForm");
	}
	
	//------------------------ 部门下角色搜索 ---------------------------------------------------------------------
	function doDepartmentRoleSearch(){
		document.getElementById("ids").value = window.parent.document.getElementById("currentDepartmentID").value;
		doSubmit(null,"<%=request.getContextPath() %>/web/organization/department/roleIndex.action","departmentRoleForm");
	}
	
</script>

<!-- 这个要保留，使父iframe的高度自动适应加载的页面高度 -->
<script for=window EVENT=onload language="JavaScript" type="text/javascript">
	//alert(document.body.scrollHeight);	
    parent.document.getElementById('roleTabIfame').style.height=document.body.scrollHeight;
</script>

  </body>
</html>
