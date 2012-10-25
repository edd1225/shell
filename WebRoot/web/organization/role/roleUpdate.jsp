<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="shell.framework.model.TblSysRole"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新角色</title>
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css">

<%
	TblSysRole sysRole = null;
	if(request.getAttribute("tblSysRole")!=null){
		sysRole = (TblSysRole)request.getAttribute("tblSysRole");
	}
%>

</head>
<body>
	<div class="shell_form" style="margin-top: 8px;margin-left:10px;margin-right:10px;">
	
		<form action="<%=request.getContextPath() %>/web/organization/role/update.action" method="post" name="roleUpdateForm">
			<input type="hidden" name="role.id"    value='<%=(sysRole==null) ? "" : sysRole.getId()%>'    />
			角色名称:	 <input name="role.name"  value='<%=(sysRole==null) ? "" : sysRole.getName() %>'  /><br/>
			是否虚拟角色:	 <input name="role.isVirtual"  value='<%=(sysRole==null) ? "" : sysRole.getIsVirtual() %>' /><br/>
			是否有效:	 <input name="role.isValid"  value='<%=(sysRole==null) ? "" : sysRole.getIsValid() %>' /><br/>
			备注:	 <input name="role.remark"  value='<%=(sysRole==null) ? "" : sysRole.getRemark() %>' /><br/>
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
				doSubmit(null,"<%=request.getContextPath() %>/web/organization/role/update.action","roleUpdateForm");
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