<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysDepartment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新部门</title>

<%
	TblSysDepartment sysDepartment = null;
	if(request.getAttribute("tblSysDepartment")!=null){
		sysDepartment = (TblSysDepartment)request.getAttribute("tblSysDepartment");
	}
	
	
	
%>

<script type="text/javascript">

</script>
</head>
<body>
	<div class="shell_form">
	
		<form action="<%=request.getContextPath() %>/web/organization/department/update.action" method="post" name="departmentUpdateForm">
			<input type="hidden" name="id"    value='<%=(sysDepartment==null) ? "" : sysDepartment.getId()%>'    />
			部门名称:	 <input name="departmentName"  value='<%=(sysDepartment==null) ? "" : sysDepartment.getDepartmentName() %>'  /><br/>
			部门类型:	 <input name="departmentType"  value='<%=(sysDepartment==null) ? "" : sysDepartment.getDepartmentType() %>' /><br/>
			所属组织:	 <input name="organizationID"  value='<%=(sysDepartment==null) ? "" : sysDepartment.getOrganizationID() %>' /><br/>
		</form>
	
	</div>
</body>
</html>