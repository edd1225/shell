<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="shell.framework.organization.user.vo.TblSysUserDetailVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>


<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css">

<%
	TblSysUserDetailVO sysUser = null;
	if(request.getAttribute("tblSysUser")!=null){
		sysUser = (TblSysUserDetailVO)request.getAttribute("tblSysUser");
	}
%>

<script type="text/javascript">

</script>
</head>
<body>
	<div class="shell_form">
	
		<form action="<%=request.getContextPath() %>/web/organization/user/update.action" method="post" name="userUpdateForm">
			<input type="hidden" name="id" value='<%=(sysUser==null) ? "" : sysUser.getId()%>'    />
			工号: <input name="userCode" readonly="readonly" value='<%=(sysUser==null) ? "" : sysUser.getUserCode()%>'  />
			密码: <input name="password" readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getPassword()%>' />  <br/>
			全名:     <input name="fullName" readonly="readonly" value='<%=(sysUser==null) ? "" : sysUser.getFullName()%>' />	
			密码有效时间:	 <input name="passwordDuration" readonly="readonly" value='<%=(sysUser==null) ? "" : sysUser.getPasswordDuration()%>' /><br/>
			地址:	 <input name="address"  readonly="readonly" value='<%=(sysUser==null) ? "" : sysUser.getAddress()%>' />
			性别:	 <input name="sex"    readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getSex()%>' /><br/>
			教育程度： <input name="education" readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getEducation()%>' />   
			电子邮件： <input name="email" readonly="readonly" value='<%=(sysUser==null) ? "" : sysUser.getEmail()%>' /> <br/>
			电话:	 <input name="telephone" readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getTelephone()%>' />
			移动电话:	 <input name="mobile" readonly="readonly" value='<%=(sysUser==null) ? "" : sysUser.getMobile()%>' /><br/>
			邮编：	<input name="postCode" readonly="readonly" value='<%=(sysUser==null) ? "" : sysUser.getPostCode()%>' />   
			照片:	 <input name="photo" readonly="readonly" value='<%=(sysUser==null) ? "" : sysUser.getPhoto()%>' /><br/>
			状态：	<input name="status" readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getStatus()%>' />
			离职时间:	 <input name="hireDate"  readonly="readonly" value='<%=(sysUser==null) ? "" : sysUser.getHireDate()%>' /><br/>
			生日:	 <input name="birthday" readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getBirthday()%>' /><br/>
			<hr/>
			部门:<input name="department_name" readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getDepartmentName()%>' />
			部门类型:<input name="department_type" readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getDepartmentType()%>' /> <br/>  
			<hr/>
			岗位:<input name="position_name" readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getPositionName()%>' />
			角色:<input name="role_name" readonly="readonly"  value='<%=(sysUser==null) ? "" : sysUser.getRoleName()%>' />
			
			
			
		</form>
	
	</div>
	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/shell_globle.js"></script>
<script type="text/javascript">
	
	function doAction(action){
		if(action=='ok'){
			//TODO 验证表单....
			
			if(window.confirm("确定更新用户信息？")){
				doSubmit(null,"<%=request.getContextPath() %>/web/organization/user/update.action","userUpdateForm");
				window.returnValue = "ok";
			}
		}
		if(action=='cancle'){
			window.returnValue = "cancle";
			window.close();
		}
	}

</script> 

<!-- 这个要保留，使父iframe的高度自动适应加载的页面高度 -->
<script for=window EVENT=onload language="JavaScript" type="text/javascript">
	//alert(document.body.scrollHeight);	
    parent.document.getElementById('userDetailTabIframe').style.height=document.body.scrollHeight;
</script>

</body>
</html>