<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加部门</title>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="shell_form">
	
		<form action="<%=request.getContextPath() %>/web/organization/department/add.action" method="post" name="departmentAddForm">
			
			部门名称:	 <input name="departmentName" /><br/>
			部门类型:	 <input name="departmentType" /><br/>
			所属组织: <input name="organizationID" />	<input type="button" value="..." name="organization" style="width: 30px;" /> <br/>
			上级部门:	 <input name="parentID" /> <input type="button" value="..."  name="parentDepartment" style="width: 30px;"/> <br/>
			虚拟部门:	  
			<select name="isVD">
				<option value="T">是</option>
				<option value="F">否</option>
			</select> <br/>
	
		</form>		
	
	</div>
</body>
</html>