<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysRole"%>
<%@page import="shell.framework.dao.support.VOResult"%>

<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加角色</title>
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
		            <td width="20%" style="text-align: right;">
		           	 <span onclick="javascript:doAddDepartment();" style="cursor: pointer;">
		            	全部角色(<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>人)
		            </span>
		            </td>
		            <td width="10%" style="text-align: right;">
		           	 <span onclick="javascript:doBatchDeleteDepartment();" style="cursor: pointer;">
		            	 已选择(<span id="shell_view_departmentuser_selected_count">0</span>)
		             </span>
		            </td>
		            <td width="10%" style="text-align: center;">
		            </td>
		            <td width="10%">
		            	<!-- 搜索div开始 -->
						<div>
						<form name="userRoleAddForm" method="post" action="">
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
						<input type="hidden" id="ids" name="role.id" value="" />
						<input type="hidden" id="id" name="id" value="<%=request.getParameter("id") %>" />
						<div class="uiTypeahead" id="u362713_2">
							<div class="wrap">
								<div class="innerWrap">
									<span class="shell_tool_search textInput"> 
										<span>
										 <input	type="text" class="inputtext DOMControl_placeholder"
											name="role.name" value="<%=request.getParameter("role.name")==null?"":request.getParameter("role.name") %>" title="键入搜索条件" />
											<button type="button" title="Search for documentation" onclick="javascript:doUserUnAssignRoleSearch();"></button> 
										</span>
									</span>
								</div>
							</div>
						</div>
						</form>
						</div>
						<!-- 搜索div结束 -->
		            </td>
		            <td width="45%" align="right">
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
	<div style="border: solid 0px #cccccc ; height: 100%;" class="shell_grid">
	
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
	                  	<input type="checkbox" id="checkRoleAll" onclick="javascript:selectAll('checkRoleAll','checkedRole');" /> 
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
	                          <td width="5%" align=left  class="a1">
	                          	<input type="checkbox" name="checkedRole" value="<%=role.getId() %>" 
	                          		   onclick="javascript:checkGroupAllSync('checkedRole','checkRoleAll');" /> 
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
	</div>
	<div class="shell_btn_okcancle">
    	<input type="button" value="确定" onclick="javascript: doAction('ok'); " />&nbsp;&nbsp;
    	<input type="button" value="取消" onclick="javascript: doAction('cancle');" />
    </div>
	
	
	
<!-- js库要按照顺序提前加载，否则后面的js函数失效 受限加载jquery，在加载其他基于jquery的js -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_util.js"></script>	
	
<script type="text/javascript">
	
	function doAction(action){
		if(action == 'ok'){
			var selectedCount =  checkBoxSelectedCount('checkedRole');
			if(selectedCount<=0){
				alert('至少选择一个角色！');
				return false;
			}else{
				if(window.confirm("确定分配角色给该用户？")){
					//循环取出选择对象id值，以“-”进行分隔
					getcheckBoxAllValue("checkedRole","ids");
					doSubmit(null,"<%=request.getContextPath() %>/web/organization/user/assignSysRole.action","userRoleAddForm");
					window.returnValue = 'ok';
				}
			}
		}
		if(action=='cancle'){
			window.returnValue = 'cancle';
			window.close();
		}
	}	
	
	//---------------------- 未绑定角色搜索 -------------------------------------------------------------------------
	function doUserUnAssignRoleSearch(){
		var _action = "<%=request.getContextPath() %>/web/organization/user/unAssignRoleIndex.action";
		doSubmit(null,_action,"userRoleAddForm");	
		window.returnValue = 'ok';
	}
		
	//------------------------ 角色分页查询 ---------------------------------------------------------------------
	function doPaging(_currentPage){
		var _action = "<%=request.getContextPath() %>/web/organization/user/unAssignRoleIndex.action";
		doSubmit(_currentPage,_action,"userRoleAddForm");
		window.returnValue = 'ok';
	}
	
</script>
	
</body>
</html>