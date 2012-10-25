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
		            	全部部门(<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>)
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
						<form name="agentCodeUserAddForm" method="post" action="">
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
						<input type="hidden" id="ids" name="sysUser.id" value="" />
						<input type="hidden" id="agentCodeID" name="sysAgentCode.agentCode" value="<%=request.getParameter("sysAgentCode.agentCode") %>" />
						<div class="uiTypeahead" id="u362713_2">
							<div class="wrap">
								<div class="innerWrap">
									<span class="shell_tool_search textInput"> 
										<span>
										 <input	type="text" class="inputtext DOMControl_placeholder"
											name="sysUser.fullName" value="<%=request.getParameter("sysUser.fullName")==null?"":request.getParameter("sysUser.fullName") %>" title="键入搜索条件" />
											<button type="button" title="Search for documentation" onclick="javascript:doAgentCodeUnbindUserSearch();"></button> 
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
	                  	<input type="checkbox" id="checkUSERAll" onclick="javascript:selectAll('checkUSERAll','checkedUser');" /> 
	                 </th>
	                 <th width="10%" align=left bgcolor=#E3EDFF class="a1">全名 </th>
	                 <th width="10%" align=left bgcolor=#E3EDFF class="a1">性别</th>
	                 <th width="10%" align=left bgcolor=#E3EDFF class="a1">工号</th>
	                 <th width="3%" align=left bgcolor=#E3EDFF class="a1">地址</th>
					 <th width="15%" align=left bgcolor=#E3EDFF class="a1">电话</th>
					 <th width="20%" align=left bgcolor=#E3EDFF class="a1">生日</th>
				
	            </tr>             
	                  
							<%	if(resultList!=null){			
									for(int j=0;j<resultList.size();j++){
										TblSysUser user = (TblSysUser)resultList.get(j);									
							%>	
								 
	                         <tr onclick="doChangeColor('color<%=j %>');" id="color<%=j %>" bgcolor="#FFFFFF">
	                          <td width="5%" align=center  class="a1">
	                          	<input type="checkbox" name="checkedUser" value="<%=user.getId() %>" 
	                          		   onclick="javascript:checkGroupAllSync('checkedUser','checkUSERAll');" /> 
	                          </td>
	                          <td width="10%" align=left class="a1">
	                          	<%=user.getFullName() %>
	                          </td>
	                          <td width="10%" align=center class="a1"><%=user.getSex() %></td>
	                          <td width="10%" align=left  class="a1"><%=user.getUserCode() %></td>
	                          <td width="30%" align=center class="a1"><%=user.getAddress() %></td>
							  <td width="15%" align=center class="a1"><%=user.getTelephone() %></td>
							  <td width="20%" align=center  class="a1"><%=user.getBirthday() %></td>
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
			var selectedCount =  checkBoxSelectedCount('checkedUser');
			if(selectedCount<=0){
				alert('至少选择一位用户！');
				return false;
			}else{
				if(window.confirm("确定增加该工号下人员？")){
					//循环取出选择对象id值，以“-”进行分隔
					getcheckBoxAllValue("checkedUser","ids");
					doSubmit(null,"<%=request.getContextPath() %>/web/organization/agentCode/assignSysUser.action","agentCodeUserAddForm");
					window.returnValue = 'ok';
				}
			}
		}
		if(action=='cancle'){
			window.returnValue = 'cancle';
			window.close();
		}
	}	
	
	//---------------------- 未绑定人员搜索 -------------------------------------------------------------------------
	function doAgentCodeUnbindUserSearch(){
		var _action = "<%=request.getContextPath() %>/web/organization/agentCode/unbindUserIndex.action";
		doSubmit(null,_action,"agentCodeUserAddForm");	
		window.returnValue = 'ok';
	}
		
	//------------------------ 人员分页查询 ---------------------------------------------------------------------
	function doPaging(_currentPage){
		var _action = "<%=request.getContextPath() %>/web/organization/agentCode/unbindUserIndex.action";
		doSubmit(_currentPage,_action,"agentCodeUserAddForm");
		//window.returnValue = 'ok';
	}
	
</script>
	
</body>
</html>