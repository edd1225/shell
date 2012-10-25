<%@page import="shell.framework.model.TblSysAgentCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新部门</title>
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css">

<%
	TblSysAgentCode sysAgentCode = null;
	if(request.getAttribute("tblSysAgentCode")!=null){
		sysAgentCode = (TblSysAgentCode)request.getAttribute("tblSysAgentCode");
	}
	
%>

</head>
<body>
	<div class="shell_form" style="margin-top: 8px;margin-left:10px;margin-right:10px;">
	
		<form action="<%=request.getContextPath() %>/web/organization/department/update.action" method="post" name="departmentUpdateForm">
			<input type="hidden" name="id"    value='<%=(sysAgentCode==null) ? "" : sysAgentCode.getId()%>'    />
			工号:	 <input name="departmentName"  value='<%=(sysAgentCode==null) ? "" : sysAgentCode.getAgentCode() %>'  /><br/>
			VAC:	 <input name="parentID"  value='<%=(sysAgentCode==null) ? "" : sysAgentCode.getIsVac() %>' /><br/>
			备注:	 <input name="isVD"  value='<%=(sysAgentCode==null) ? "" : sysAgentCode.getRemark() %>' /><br/>
		</form>
	
	</div>
	
	
	<div class="shell_btn_okcancle">
    	<input type="button" value="确定" onclick="javascript: doAction('ok'); " />&nbsp;&nbsp;
    	<input type="button" value="取消" onclick="javascript: doAction('cancle');" />
    </div>
    
 
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
   
<script type="text/javascript">
	
	function doAction(action){
		if(action=='ok'){
			//TODO 验证表单....
			
			if(window.confirm("确定更新部门信息？")){
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath() %>/web/organization/department/update.action",
					data: {
						id: $("input[name='id']").attr("value"),
						departmentName: $("input[name='departmentName']").attr("value"),
						departmentType: $("input[name='departmentType']").attr("value"),
						organizationID: $("input[name='organizationID']").attr("value"),
						parentID: $("input[name='parentID']").attr("value"),
						isVD: $("input[name='isVD']").attr("value")
					},
					success: function(returnData){
						window.parent.$.fn.destory();
					}
				});
				
			}
		}else{
			window.parent.$.fn.destory();
		}
	}

</script>  

<script for=window EVENT=onload language="JavaScript" type="text/javascript">
    parent.document.getElementById('innerIframe').style.height=document.body.scrollHeight;
    parent.document.getElementById('jquery-jmodal').style.height = document.body.scrollHeight;
    //alert(document.body.scrollHeight);
</script> 
 
</body>
</html>