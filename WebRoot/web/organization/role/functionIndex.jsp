<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysFunction"%>
<%@page import="shell.framework.dao.support.VOResult"%>
<%@ taglib prefix="shell_tree" uri="http://taglib.shell/shell-tree.tld" %>
									
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>function index page</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css" />

	<%
		Object obj = request.getAttribute("funcOfRoleList");
		java.util.List funcOfRoleList = null;
		if(obj != null){
			funcOfRoleList = (List)obj;
			//out.println("size=" + funcOfRoleList.size());			
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
		           	 <span onclick="javascript:doSaveFunctionsofRole();" style="cursor: pointer;">
		            	<img src="../../../images/docnew.gif">
		            	保存</span>
		            </td>
		            <td width="10%" style="text-align: right;">
		           	 <span onclick="javascript:doReset();" style="cursor: pointer;">
		            	<img src="../../../images/docdelete.gif">
		            	重置</span>
		            </td>
		            <td width="5%" style="text-align: right;">
		            </td>
		            <td width="10%" style="text-align: center;">
		            </td>
		            <td width="10%">
		            	<!-- 搜索div开始 -->
						<div>
						<form name="roleFunctionForm" method="post" action="">
							<input type="hidden" id="currentPage" name="currentPage" value="1" />
							<input type="hidden" id="ids" name="function.id" value="" />
							<input type="hidden" id="roleID" name="role.id" value="" />
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
	<div  class="shell_grid" style="border: solid 0px #555555; overflow:auto;">
		
		<table>
			<tr>
			<table width="100%" border="0px">
				<tr>
					
			<td nowrap="true" valign="top" align="center">
				<fieldset  style="border:1px solid #ccc; width: 200px; height:300px; text-align: left;" >
				<legend>全部系统功能</legend>
				
				<shell_tree:treeview title="" href="#" param="functionId" imgfold="../../../framework/images/tree_minus.gif"  
									imgxian="../../../framework/images/xian.gif" 
									name="treeList"  onclick="doClick()" ondblclick="doDblclick()" 
									onmousedown="doMousedown()" scope="request"/>
				</fieldset>
			
			</td>
			<td  nowrap="true" valign="center" align="center">
				<p>
					<img src="<%=request.getContextPath() %>/framework/images/arrow-right.png"  style="cursor: pointer;"/>
				</p>
				<p onclick="delSelectedOption(document.getElementById('selRoleFuns'))">
					<img src="<%=request.getContextPath() %>/framework/images/arrow-left.png"  style="cursor: pointer;" />
				</p>
			</td>
			<td nowrap="true" valign="top" align="center">
				<fieldset style="border:1px solid #ccc; width: 200px; height:300px; text-align: left;" >
				<legend>角色[&nbsp;<b><%=request.getParameter("role.name") %></b>&nbsp;]的功能权限</legend>
			
				<div id="roleFunctionsID" >

					<select name="right" size="10" id="selRoleFuns" multiple style="width: 190px; height:250px; border: 0px solid ;" >
						<%
							if(funcOfRoleList!=null){			
								for(int j=0;j<funcOfRoleList.size();j++){
									TblSysFunction function = (TblSysFunction)funcOfRoleList.get(j);
						%>
						<option value="<%=function.getId() %>" ondblclick="delSelectedOption(document.getElementById('selRoleFuns'));"><%=function.getFunctionName() %></option>
						<% }} %>
					</select>
				
				</div>
				
				</fieldset>
			</td>	
			
				</tr>
			</table>
			</tr>
		</table>

	</div>
	<!-- 主数据显示区域 结束 -->	

	
<!-- js库要按照顺序提前加载，否则后面的js函数失效 受限加载jquery，在加载其他基于jquery的js -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_util.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/framework/js/shell_tree.js"></script>

<script type="text/javascript">

	//-----------------------------------节点鼠标按下事件----------------------------------------------
	function doMousedown() {
		var srcElement = getSrcElement();
		var imgElement = getSrcElement().previousSibling.previousSibling;
		//选择了子节点
	    if (imgElement.id != "foldheader") {
			returnName = srcElement.innerHTML;
	        findAncestors(srcElement);
	        var returnValue = srcElement.id + "|" + returnName;
	        
	        try{
	        	var hasElement = false;
		        var element = document.createElement("option");
		        element.text = returnName;
		        element.value = srcElement.id;
		        element.ondblclick = function(){delSelectedOption(document.getElementById('selRoleFuns'));  };
		        var options = document.getElementById("selRoleFuns").options;
		        for(var i=0;i<options.length;i++){
		        	if(options[i].text==element.text && options[i].value==element.value){
		        		hasElement = true;
		        		break;
		        	}
		        }
			    if(!hasElement){
			        document.getElementById("selRoleFuns").add(element);
			    }
	        }catch(e){
	        	alert(e.message);
	        }
		}else {
			alert("请选择具体系统功能.");
		}
	}
	
	
	//------------------------ 保存给角色分配的系统功能 -----------------------------------------------------------------------
	function doSaveFunctionsofRole(){
		document.getElementById("roleID").value ='<%=request.getParameter("role.id") %>';
		var functionIDs = "";
		var options = document.getElementById("selRoleFuns").options;
        for(var i=0;i<options.length;i++){
        	functionIDs = functionIDs + options[i].value + "-";
        }
        if (functionIDs.length > 0) {
        	functionIDs = functionIDs.substring(0, functionIDs.length - 1);
    	}
		document.getElementById("ids").value = functionIDs;
		if(confirm("确定保存？")){
			doSubmit(null,"<%=request.getContextPath() %>/web/organization/role/saveFunctionsOfRole.action","roleFunctionForm");
		}
	}

	
	//------------------------ 重置 -----------------------------------------------------------------------
	function doReset(){
		document.forms["roleFunctionForm"].reset();
		alert('未实现!');
		return false;
	}
	
	//------------------------ 部门下角色搜索 ---------------------------------------------------------------------
	function doDepartmentRoleSearch(){
		document.getElementById("ids").value = window.parent.document.getElementById("currentDepartmentID").value;
		doSubmit(null,"<%=request.getContextPath() %>/web/organization/department/roleIndex.action","roleFunctionForm");
	}
	
</script>

<!-- 这个要保留，使父iframe的高度自动适应加载的页面高度 -->
<script for=window EVENT=onload language="JavaScript" type="text/javascript">
    parent.document.getElementById('functionTabIframe').style.height=document.body.scrollHeight;
</script>

  </body>
</html>
