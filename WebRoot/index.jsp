<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shell-services" uri="http://taglib.shell/shell-services.tld"  %>

<HTML>
<HEAD>
<TITLE>SHELL</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type="text/css">
<!--
.a1 {	FONT-SIZE: 9pt; LINE-HEIGHT: 16px; TEXT-DECORATION: none}
-->
</STYLE>
<link href="css/common/bj.css" rel="stylesheet" type="text/css">

<script language="javascript" src="js/common/shell_util.js"></script>
<script language="javascript" src="js/common/alert.js"></script>

<script language='javascript'>

//alert(yesOrNoConfirm("发"));

function testPop(obj){
	
	testMessageBox(obj);
	
}

//登录验证
function checkUser(){
	with(document.LoginForm){
		if(trim(userCode.value) == ''){
			alert('用户名不能为空！');
			userCode.focus();
			return false;
		}
		if(trim(password.value) == ''){
			alert('密码不能为空！');
			password.focus();
			return false;
		}
		submit();
	}
}

</script>

</HEAD>
<BODY leftMargin=0 background="<%=request.getContextPath() %>/images/shell_bgimg.gif" topMargin=0 marginheight="0" marginwidth="0" >
<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
  <TBODY>
  <TR>
	<TD align=middle valign="top">
       
       <form name="LoginForm" action="login.action" method="post" >
       
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
            <td background="<%=request.getContextPath() %>/images/holly-bg.gif" width="35%"><img src="<%=request.getContextPath() %>/images/holly-logo.gif" height="42" width="386"></td>
            <td width="63%" background="<%=request.getContextPath() %>/images/holly-bg.gif" align="right">
            	<img src="<%=request.getContextPath() %>/images/holly-11-11.gif" width="393" height="42"></td>
            <td width="2%" background="<%=request.getContextPath() %>/images/holly-bg.gif">&nbsp;</td>
          </tr>
        </table>
		<table border=0 cellpadding=0 cellspacing=0 width="100%">
          <tbody>
            <tr>
              <td align=left valign=top width="79%" background="<%=request.getContextPath() %>/images/holly-11-11c.gif">&nbsp;</td>
              <td align=right valign=top width="4%"><img src="<%=request.getContextPath() %>/images/holly-11-11a.gif" width="188" height="39"></td>
              <td align=right background="<%=request.getContextPath() %>/images/holly-11-11b.gif" width="17%">&nbsp;</td>
            </tr>
          </tbody>		
        </table>
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="60">&nbsp;</td>
          </tr>
        </table>
		<TABLE cellSpacing=0 cellPadding=0 width=632 align=center border=0>
		<TBODY>
		<TR>
		  <TD vAlign=top><FONT size=5><!--<IMG height=286 src="images/new-2.gif">--></FONT></TD></TR>
		<TR>
		  <TD height="196" background="<%=request.getContextPath() %>/images/unicom_login.gif">
			  <TABLE width="212" height="150" border=0 align=center cellPadding=5 cellSpacing=3 class=a1>
				<TBODY>
				<TR align="center">
				  <TD class=a1 colSpan=2 height=15>&nbsp;</TD>
				</TR>
				<TR>
				  <TD class=a1 width="37%" height="1" nowrap><FONT color=#55728a>用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;ID：</FONT></TD>
				  <TD width="63%">
					<input type="text" name="userCode" size="15" maxlength="15" style="WIDTH: 100%" />
				  </TD>
				</TR>
				<TR>
				  <TD nowrap height="1"><font color="#55728a">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</font></TD>
				  <TD>
					<input type="password" name="password" maxlength="16" style="WIDTH: 100%" />
				  </TD>
				</TR>
				
				<TR>
				  <TD height="25" colspan="2">
					  <font color="#FF0000">
					  	<%-- <html:messages id="msg" message="true">
					    	<li><%= pageContext.getAttribute("msg") %></li>
					 	 </html:messages>--%>
					  </font>
				</TD>
				</TR>
				
				<TD align=middle valign="middle"><input style="WIDTH: 70px; HEIGHT: 30px" type="button" value='登录' onclick="checkUser()"></TD>
				<TD align=middle valign="middle"><input style="WIDTH: 70px; HEIGHT: 30px" type='reset' value='重置'></TD>
				
				<TD align=middle valign="middle">
					<input style="WIDTH: 70px; HEIGHT: 30px" type='reset' value='pop' onclick="testPop(this);">
				</TD>
				</TR>
				
				</TBODY>
			  </TABLE>
			</TD>
		</TR>
		
		  </TBODY></TABLE>
		  </form>

 		  
</TD>
  </TR></TBODY></TABLE>
</BODY>
</HTML>
