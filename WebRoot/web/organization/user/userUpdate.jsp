<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysUser"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新用户</title>


<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css">

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
			工号: <input name="userCode" value='<%=(sysUser==null) ? "" : sysUser.getUserCode()%>'  />
			密码: <input name="password" value='<%=(sysUser==null) ? "" : sysUser.getPassword()%>' />  <br/>
			全名:     <input name="fullName" value='<%=(sysUser==null) ? "" : sysUser.getFullName()%>' />	
			密码有效时间:	 <input name="passwordDuration" value='<%=(sysUser==null) ? "" : sysUser.getPasswordDuration()%>' /><br/>
			地址:	 <input name="address"  value='<%=(sysUser==null) ? "" : sysUser.getAddress()%>' />
			性别:	 <input name="sex"      value='<%=(sysUser==null) ? "" : sysUser.getSex()%>' /><br/>
			教育程度： <input name="education" value='<%=(sysUser==null) ? "" : sysUser.getEducation()%>' />   
			电子邮件： <input name="email" value='<%=(sysUser==null) ? "" : sysUser.getEmail()%>' /> <br/>
			电话:	 <input name="telephone" value='<%=(sysUser==null) ? "" : sysUser.getTelephone()%>' />
			移动电话:	 <input name="mobile" value='<%=(sysUser==null) ? "" : sysUser.getMobile()%>' /><br/>
			邮编：	<input name="postCode" value='<%=(sysUser==null) ? "" : sysUser.getPostCode()%>' />   
			照片:	 <input name="photo" value='<%=(sysUser==null) ? "" : sysUser.getPhoto()%>' /><br/>
			状态：	<input name="status" value='<%=(sysUser==null) ? "" : sysUser.getStatus()%>' />
			离职时间:	 <input name="hireDate" value='<%=(sysUser==null) ? "" : sysUser.getHireDate()%>' /><br/>
			生日:	 <input name="birthday"  value='<%=(sysUser==null) ? "" : sysUser.getBirthday()%>' />
			备注:	 <input name="remark" value='<%=(sysUser==null) ? "" : sysUser.getRemark()%>' /> <br/>
			<br/>
		</form>
	
	</div>
	
	
	<div class=shell_btn_okcancle>
    	<input type="button" value="确定" onclick="javascript: doAction('ok'); " />&nbsp;&nbsp;
    	<input type="button" value="取消" onclick="javascript: doAction('cancle');" />
    </div>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
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

</body>
</html>