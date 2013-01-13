<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="shell.framework.dao.support.VOResult"%>
<%@ page import="shell.framework.model.TblSysFunction" %>
<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>function index page</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css" />

	<%
		Object obj = request.getAttribute("voResult");
        VOResult voResult = null;
        java.util.List resultList = null;
		if(obj != null){
            voResult = (VOResult)obj;
			resultList = (List)voResult.getResultList();
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
		      	<img src="../../../images/holly-11-10t.gif" border=0 alt="" />
		      </td>
		      <td bgcolor="E3EDFF" width="100%">
		        <table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td height="4" colspan="9"></td>
		          </tr>
		          <tr>
		            <td width="10%" style="text-align: right;">
                         <span onclick="doAddURLAuthority();" style="cursor: pointer;">
                            <img src="../../../images/docnew.gif" alt="" />增加</span>
		            </td>
		            <td width="10%" style="text-align: right;">
                         <span onclick="doUnAssignURLAuthority();" style="cursor: pointer;">
                            <img src="../../../images/docdelete.gif" alt="" />回收</span>
		            </td>

		            <td width="5%" style="text-align: center;">
		            </td>
		            <td width="10%">
		            	<!-- 搜索div开始 -->
						<div>
						<form name="roleFunctionForm" method="post" action="">
							<input type="hidden" id="currentPage" name="currentPage" value="1" />
							<input type="hidden" id="ids" name="function.id" value="" />
							<input type="hidden" id="roleID" name="role.id" value="<%=request.getParameter("role.id") %>" />
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
	<div  class="shell_grid">

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
                                            <input type="checkbox" id="checkAll" onclick="selectAll('checkAll','checkedAuthority');" />
                                        </th>
                                        <th width="30%" align=left bgcolor=#E3EDFF class="a1">权限ID</th>
                                        <th width="30%" align=left bgcolor=#E3EDFF class="a1">权限名称</th>
                                        <th width="30%" align=left bgcolor=#E3EDFF class="a1">URL</th>
                                    </tr>

                                    <%	if(resultList!=null){
                                        for(int j=0;j<resultList.size();j++){
                                            TblSysFunction function = (TblSysFunction)resultList.get(j);
                                    %>

                                    <tr onclick="doChangeColor('color<%=j %>');" id="color<%=j %>" bgcolor="#FFFFFF" >
                                        <td width="10%" align=left  class="a1">
                                            <input type="checkbox" name="checkedAuthority" value="<%=function.getId() %>"
                                                   onclick="javascript:checkGroupAllSync('checkedAuthority','checkAll');" />
                                        </td>
                                        <td width="30%" align=left class="a1"><%=function.getId() %></td>
                                        <td width="30%" align=left  class="a1"><%=function.getFunctionName() %></td>
                                        <td width="30%" align=left class="a1"><%=function.getFunctionURL() %></td>
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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_util.js"></script>

<script type="text/javascript">

    /**
     * 鼠标单击事件
     */
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
	
    /**
     * 刷新列表(手动提交)
     */
    function reload(){
        doSubmit(null,"<%=request.getContextPath() %>/web/organization/role/urlAuthorityIndex.action","roleFunctionForm");
    }

	/**
	 * 增加url权限
     */
    function doAddURLAuthority(){
		document.getElementById("roleID").value ='<%=request.getParameter("role.id") %>';
        var loadURL = "<%=request.getContextPath() %>/web/organization/role/unAssignURLAuthorityIndex.action?role.id="+document.getElementById("roleID").value;
        var returnVal = openNewWindow(loadURL,700,300);
        if(returnVal=='ok'){
            reload();
        }
	}

	
    /**
     * 回收url权限资源
     * @return {boolean}
     */
	function doUnAssignURLAuthority(){
        var selectedCount =  checkBoxSelectedCount('checkedAuthority');
        if(selectedCount<=0){
            alert('至少选择一条记录！');
            return false;
        }else{
            if(window.confirm("确定回收此权限?")){
                //循环取出选择对象id值，以“-”进行分隔
                getcheckBoxAllValue("checkedAuthority","ids");
                doSubmit(null,"<%=request.getContextPath() %>/web/organization/role/unAssignURLAuthority.action","roleFunctionForm");
                window.returnValue = 'ok';
            }
        }
		return true;
	}


    /**
     * 角色下权限搜索
     */
	function doDepartmentRoleSearch(){
		document.getElementById("ids").value = window.parent.document.getElementById("currentDepartmentID").value;
		doSubmit(null,"<%=request.getContextPath() %>/web/organization/role/roleIndex.action","roleFunctionForm");
	}
	
</script>

<!-- 这个要保留，使父iframe的高度自动适应加载的页面高度 -->
<script for=window EVENT=onload language="JavaScript" type="text/javascript">
    parent.document.getElementById('urlTabIframe').style.height=document.body.scrollHeight;
</script>

</body>
</html>
