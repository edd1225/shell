<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加用户</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/cuheXhkBDkh.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/p_e4y6WmY0P.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/eExuUYovHyE.css" />

</head>
<body>
	<div class="shell_form">
	
		<form action="<%=request.getContextPath() %>/web/organization/user/add.action" method="post" name="userAddForm">
			工号:	 <input name="userCode" />     密码:	 <input name="password" />  <br/>
			全名:     <input name="fullName" />	   密码有效时间:	 <input name="passwordDuration" />  <br/>
			地址:	 <input name="address" />	   性别:	 <input name="sex" />  	<br/>
			教育程度： <input name="education" />    电子邮件： <input name="email" /> <br/>
			电话:	 <input name="telephone" />    移动电话:	 <input name="mobile" /><br/>
			邮编：	<input name="postCode" />      照片:	 <input name="photo" /><br/>
			状态：	<input name="status" />        离职时间:	 <input name="hireDate" /><br/>
			生日:	 <input name="birthday" />     备注:	 <input name="remark" />   <br/>
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
			
			if(window.confirm("确定增加用户？")){
				//ajax实现提交表单
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath() %>/web/organization/user/add.action",
					data: {
						userCode: $("input[name='userCode']").attr("value"),
						password: $("input[name='password']").attr("value"),
						passwordDuration: $("input[name='passwordDuration']").attr("value"),
						fullName: $("input[name='fullName']").attr("value"),
						address: $("input[name='address']").attr("value"),
						sex: $("input[name='sex']").attr("value"),
						education: $("input[name='education']").attr("value"),
						email: $("input[name='email']").attr("value"),
						telephone: $("input[name='telephone']").attr("value"),
						mobile: $("input[name='mobile']").attr("value"),
						postCode: $("input[name='postCode']").attr("value"),
						photo: $("input[name='photo']").attr("value"),
						status: $("input[name='status']").attr("value"),
						hireDate: $("input[name='hireDate']").attr("value"),
						remark: $("input[name='remark']").attr("value"),
						birthday: $("input[name='birthday']").attr("value")
					},
					success: function(returnData){
						window.parent.$.fn.destory();
					}
				});
			}
		}
		window.parent.$.fn.destory();
	}
	
	
</script>    
    	
<script for=window EVENT=onload language="JavaScript" type="text/javascript">
    parent.document.getElementById('innerIframe').style.height=document.body.scrollHeight;
    parent.document.getElementById('jquery-jmodal').style.height = document.body.scrollHeight;
</script> 	
	
	
	
</body>
</html>