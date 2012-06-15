<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysUser"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新用户</title>

<%
	TblSysUser sysUser = null;
	if(request.getAttribute("tblSysUser")!=null){
		sysUser = (TblSysUser)request.getAttribute("tblSysUser");
	}
	
	
	
%>

<script type="text/javascript">

</script>
</head>
<body>
	<div class="shell_form">
	
		<form action="<%=request.getContextPath() %>/web/organization/user/update.action" method="post" name="userUpdateForm">
			<input type="hidden" name="id"    value='<%=(sysUser==null) ? "" : sysUser.getId()%>'    />
			工号:	 <input name="userCode" value='<%=(sysUser==null) ? "" : sysUser.getUserCode()%>'  /><br/>
			全名:     <input name="fullName" value='<%=(sysUser==null) ? "" : sysUser.getFullName()%>' />	<br/>
			地址:	 <input name="address"  value='<%=(sysUser==null) ? "" : sysUser.getAddress()%>' /><br/>
			性别:	 <input name="sex"      value='<%=(sysUser==null) ? "" : sysUser.getSex()%>' /><br/>
			电话:	 <input name="telephone" value='<%=(sysUser==null) ? "" : sysUser.getTelephone()%>' /><br/>
			生日:	 <input name="birthday"  value='<%=(sysUser==null) ? "" : sysUser.getBirthday()%>' /><br/>
		</form>
	
	</div>
</body>
</html>