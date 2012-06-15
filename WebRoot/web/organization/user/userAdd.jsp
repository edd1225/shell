<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加用户</title>
<script type="text/javascript">
	function doTest() {
		alert($("#test").attr("onclick"));
	}
</script>
</head>
<body>
	<div class="shell_form">
	
		<form action="<%=request.getContextPath() %>/web/organization/user/add.action" method="post" name="userAddForm">
			工号:	 <input name="userCode" /><br/>
			密码:	 <input name="password" /><br/>
			全名:     <input name="fullName" />	<br/>
			地址:	 <input name="address" /><br/>
			性别:	 <input name="sex" /><br/>
			电话:	 <input name="telephone" /><br/>
			生日:	 <input name="birthday" /><br/>
		
		</form>
	
	</div>
</body>
</html>