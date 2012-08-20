<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加部门</title>
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/cuheXhkBDkh.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/p_e4y6WmY0P.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/eExuUYovHyE.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />

</head>
<body>
	<div class="shell_form" style="margin-top: 10px;margin-left:10px;margin-right:10px;">
	
		<form name="departmentAddForm" action="" method="post" >
			部门名称:	 <input name="departmentName" /><br/>
			部门类型:	 <input name="departmentType" /><br/>
			所属组织: <input name="organizationID" />	
				<input type="button" value="..." name="organization" style="width: 30px;" /> <br/>
			上级部门:	 <input name="parentID" /> 
				<input type="button" value="..."  name="parentDepartment" style="width: 30px;"/> <br/>
			虚拟部门:	  
			<select name="isVD">
				<option value="T">是</option>
				<option value="F">否</option>
			</select> <br/>
	
		</form>		
	
	</div>
	
	<br/>
	
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
			
			if(window.confirm("确定增加部门？")){
				//ajax实现提交表单
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath() %>/web/organization/department/add.action",
					data: {
						departmentName: $("input[name='departmentName']").attr("value"),
						departmentType: $("input[name='departmentType']").attr("value"),
						organizationID: $("input[name='organizationID']").attr("value"),
						parentID: $("input[name='parentID']").attr("value"),
						isVD: $("input[name='isVD']").attr("value")
					},
					success: function(returnData){
						//$(".shell_form").html(returnData);
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