<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysDepartment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新部门</title>
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css">

<%
	TblSysDepartment sysDepartment = null;
	if(request.getAttribute("tblSysDepartment")!=null){
		sysDepartment = (TblSysDepartment)request.getAttribute("tblSysDepartment");
	}
	
	
%>

</head>
<body>
	<div class="shell_form" style="margin-top: 8px;margin-left:10px;margin-right:10px;">
	
		<form action="<%=request.getContextPath() %>/web/organization/department/update.action" method="post" name="departmentUpdateForm">
			<input type="hidden" name="id"    value='<%=(sysDepartment==null) ? "" : sysDepartment.getId()%>'    />
			部门名称:	 <input name="departmentName"  value='<%=(sysDepartment==null) ? "" : sysDepartment.getDepartmentName() %>'  /><br/>
			部门类型:	 <input name="departmentType"  value='<%=(sysDepartment==null) ? "" : sysDepartment.getDepartmentType() %>' /><br/>
			所属组织:	 <input name="organizationID"  value='<%=(sysDepartment==null) ? "" : sysDepartment.getOrganizationID() %>' /><br/>
			上级部门:	 <input name="parentID"  value='<%=(sysDepartment==null) ? "" : sysDepartment.getParentID() %>' /><br/>
			是否虚拟部门:	 <input name="isVD"  value='<%=(sysDepartment==null) ? "" : sysDepartment.getIsVD() %>' /><br/>
		</form>
	
	</div>
	
	
	<div class="shell_btn_okcancle">
    	<input type="button" value="确定" onclick="javascript: doAction('ok'); " />&nbsp;&nbsp;
    	<input type="button" value="取消" onclick="javascript: doAction('cancle');" />
    </div>
    
 
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>

<script type="text/javascript">
	
	function doAction(action){
		if(action=='ok'){
			//TODO 验证表单....
			
			if(window.confirm("确定更新部门信息？")){
				doSubmit(null,"<%=request.getContextPath() %>/web/organization/department/update.action","departmentUpdateForm");
				window.returnValue = "ok";
			}
		}
		if(action=='cancle'){
			window.returnValue = 'cancle';
			window.close();
		}
	}

</script>  

</body>
</html>