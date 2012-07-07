<%@page import="shell.framework.model.TblSysUser"%>
<%@page import="shell.framework.organization.user.service.TblSysUserService"%>
<%@page import="shell.framework.dao.support.VOResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="@SHELL 是一个企业级开发的基础平台，集成了SH框架，提供企业级开发的基础功能部分，用户在此基础平台上可以搭建自己的业务平台！">

<title>@SHELL</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/cuheXhkBDkh.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/p_e4y6WmY0P.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/eExuUYovHyE.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/jquery/jquery.noty.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/jquery/noty_theme_default.css" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/jquery/jquery.jmodal.css" />


	<%
		Object obj = request.getAttribute("voResult");
		VOResult voResult = null;
		java.util.List resultList = null;
		int totalPages = 0;
		int totalRaws = 0;
		
		if(obj != null){
			voResult = (VOResult)obj;
			resultList = voResult.getResultList();
			totalPages = voResult.getTotalPages();
			totalRaws = voResult.getTotalRows();
			//out.println("size=" + resultList.size());			
		}else{
			out.println("obj=NULL" );
		}
		
	%>


</head>

<!-- 文档body部分开始 -->

<body class="safari4 Locale_zh_CN" >

	<div class="devsitePage">
		<!-- 顶行菜单导航开始 -->
		<div class="menu">
				<a class="logo" href="<%=request.getContextPath() %>"> 
					<img class="img" src="<%=request.getContextPath() %>/images/facebook_developer_logo.png" alt="Facebook" width="166" height="17">
			    </a> 
			    
			<div class="content">
				<a class="l" href="<%=request.getContextPath() %>/web/defaultFrame/mainFrame.jsp">主面板</a>
				<a class="l" href="http://developers.facebook.com/module/">组织机构</a>
				<a class="l" href="http://developers.facebook.com/blog/">权限管理</a> 
				<a class="l" href="https://developers.facebook.com/apps">编码设置</a>
				<a class="l" href="https://developers.facebook.com/apps">设置</a>
				
				<!-- 登录个人信息 -->
				<div align="right" style="padding-top: 7px;padding-right: 5px; font-size: small;font-weight: normal;">
					<span style="padding-left: 5px;">
						<%=request.getSession().getAttribute("userCode")!=null ? request.getSession().getAttribute("userCode") : "游客" %>	
					</span>
					<span style="padding-left: 5px;">
						设置
					</span>
					<span style="padding-left: 5px;">
						注销
					</span>
				</div>	

				<div class="clear"></div>
			</div>
		</div>
		<!-- 顶行菜单导航结束 -->

		<div class="body nav">
		
			<!-- 左侧导航栏 -->
				<div id="bodyMenu" class="bodyMenu">
					<div class="toplevelnav">
						<ul>
							<li><a class="selected" href="<%=request.getContextPath() %>/web/organization/user/index.action">
									<div class="navSectionTitle">人员管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/department/index.action">
									<div class="navSectionTitle">部门管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/agentCode/index.action">
									<div class="navSectionTitle">工号管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/position/index.action">
									<div class="navSectionTitle">岗位管理</div> </a></li>
							<li><a href="<%=request.getContextPath() %>/web/organization/role/index.action">
									<div class="navSectionTitle">角色管理</div> </a></li>
						</ul>
					</div>
				</div>
		
			<!-- 右侧内容主显示区域 -->
			<div class="content">
				<div id="bodyText" class="bodyText">
					
					<div class="shell_toolBar">
						<div class="shell_tool_btn shell_inline_block" style="float:left;">全部用户(<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>人)</div>
						<div class="shell_tool_btn shell_inline_block" style="float:left;"> 已选择(<div class="shell_inline_block" id="shell_view_selected_count">0</div>)</div>
						<div style="float: right;">
								

							<!-- 搜索div开始 -->
							<div class="shell_inline_block">
					<form name="userForm" method="post" action="">
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
						<input type="hidden" id="ids" name="id" value="fuck you." />
									<div class="uiTypeahead" id="u362713_2">
										<div class="wrap">
											<div class="innerWrap">
												<span class="shell_tool_search textInput"> 
													<span>
													 <input	type="text" class="inputtext DOMControl_placeholder"
														name="fullName" value="<%=request.getParameter("fullName")==null?"":request.getParameter("fullName") %>" title="键入搜索条件" />
														<button type="button" title="Search for documentation" onclick="doSubmit(0);"></button> 
													</span>
												</span>
											</div>
										</div>
									</div>
					</form>
							</div>
							<!-- 搜索div结束 -->
								
							<div class="shell_tool_btn shell_inline_block shell_tool_btn_add">+&nbsp;增加</div>
							<div class="shell_tool_btn shell_inline_block" onclick="doDelete();">-&nbsp;删除</div>
							<div class="shell_tool_btn shell_inline_block shell_tool_btn_update">U&nbsp;更新</div>
							<div class="shell_tool_btn shell_inline_block">+&nbsp;更多操作</div>
						</div>
					</div>
					
				
			 		
					<div>
						
						<%
							if(resultList!=null){
								//行数
								int rowNums = (voResult.getPageSize()/6) + ((voResult.getPageSize()%6)==0?0:1);
										
								for(int i=0;i<rowNums;i++){
						%>			
								<div>
						<% 			
									for(int j=0;j<6;j++){
										int indexNum = i*6+j;
										if(indexNum>=voResult.getResultList().size()) break;
										TblSysUser user = (TblSysUser)resultList.get(indexNum);									
										//out.println(request.getAttribute("preRequestURL"));
										//user.getFullName();
						%>					
	
						<div id="<%=user.getId() %>" class="shell_user_identity shell_inline_block" tabindex="0" role="link"  >
							<img class="shell_user_identity_img" src="<%=request.getContextPath() %>/images/shell_identify_default_img.jpg"  >
							<div class="shell_user_identity_intro"><%=user.getFullName() %>  </div>
						</div>
	
						<%			}
						%>
							 	</div>		
						<%
								}
							}
						%>
						
					</div>
					
					<!-- 翻页 -->
					<shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>" 
											   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />
			
				</div>
				<div class="clear"></div>
			</div>
		</div>



		<!-- 页脚div 开始 -->
		<div class="footer">
			<div class="content">
				<div class="copyright">SHELL &copy; 2012</div>
				<div class="links">
					<a href="http://www.facebook.com/platform">关于</a> <a
						href="http://developers.facebook.com/policy/">平台政策</a> <a
						href="http://www.facebook.com/policy.php">隐私政策</a> <a
						href="http://www.facebook.com/policy.php">自定义页脚</a>
				</div>
			</div>
		</div>
		<!-- 页脚div 结束 -->
	</div>

<!-- js库要按照顺序提前加载，否则后面的js函数失效 -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.noty.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.jmodal.js"></script>

<script type="text/javascript">
	//------------------------用户表单提交----------------------------------------------------------------------------------
	function doSubmit(currentPage){
		if(currentPage!=null && currentPage>0){
			document.getElementById("currentPage").value = currentPage;
		}
		var userForm = document.forms["userForm"];
		with(userForm){
			action = "<%=request.getContextPath() %>/web/organization/user/index.action";
			submit();
		}
	}
</script>	
	
<script type="text/javascript">

	//----------------------批量删除用户------------------------------------------------------------------------------------
	function doDelete(){
		var selectedCount = parseInt($("#shell_view_selected_count").text(),10);
		if(selectedCount<=0){
			alert('至少选择一位用户，支持批量删除！');
			return false;
		}else{
			if(window.confirm("确定删除？")){
				//循环取出选择对象id值，以“-”进行分隔
				var userIDs = "";
				$.each($(".shell_item_selected"),function(key,obj){
					obj=$(obj); //需要重新获取对象
					userIDs = userIDs + obj.attr("id") + "-";
				});
				
				$("#ids").attr("value",userIDs.substring(0,userIDs.length-1));
				
				var userForm = document.forms["userForm"];
				with(userForm){
					action = "<%=request.getContextPath() %>/web/organization/user/delete.action";
					submit();
				}
			}
		} 
	}
	//---------------------------------------------------------------------------------------------------------------
	
	$(document).ready(function(){
		//---------------------------选择用户面板----------------------------------------------------------------------
		$.each($(".shell_user_identity"),function(key,obj){
			obj=$(obj);
			obj.click(function(){
				rescumeCount(obj);
				obj.toggleClass("shell_item_selected");
			})
		});		
		
		//-------------------------------已选择对象个数变化函数----------------------------------------------------------
		var rescumeCount = function(obj){
			if (obj.hasClass("shell_item_selected")) {
				$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) - 1);
			} else {  //选择对象个数递增
				$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) + 1);
			}
		};
		
		
		//----------测试通知效果 bug-----------------------------------------------------------------------------------
		var SYS_MESSAGE_TXT = "<%=session.getAttribute("SYS_MESSAGE_VALUE") %>";
		var SYS_MESSAGE_TYPE = "<%=session.getAttribute("SYS_MESSAGE_TYPE") %>";

		//if(SYS_MESSAGE_TYPE == null){
			//SYS_MESSAGE_TYPE = "information";
		//}
		//alert(SYS_MESSAGE_TYPE);
		//有bug
		if(SYS_MESSAGE_TXT!=null && SYS_MESSAGE_TXT!=""){
			var noty_id = noty({
				  "text": SYS_MESSAGE_TXT,
				  "layout": "top",
				  "type": SYS_MESSAGE_TYPE,
				  "animateOpen":{"height":"toggle"},
				  "animateClose":{"height":"toggle"},
				  "speed":500,
				  "timeout":1000,
				  "closeButton":false,
				  "closeOnSelfClick":false,
				  "closeOnSelfOver":false,
				  "modal":false,
				  "onClose": function(){
					  //alert('mmmm');
					}
			});
		}
		//----------------------------------------------------------------------------------------------------------
		
	});

</script>	
	
<!-- 各种CRUD操作 -->	
<script type="text/javascript">
        $(document).ready(function() {
          	var pageWidth = $(document).width();  
          	var initWidthValue =  2*(pageWidth/3);
        	//------------------------增加用户-----------------------------------------------------------------------
            $('.shell_tool_btn_add').click(function() {
                $.fn.jmodal({
                    //data: { innerText: $(this).text() },
                    //嵌入页面的表单提交
                    data: { callBack: function(){
                    	var userAddForm = document.forms["userAddForm"];
                    	with(userAddForm){
                    		submit();
                    	}
                    } },
                    title: '增加系统用户',
                    content: function(e) { 
                        e.html('加载中...');
                        e.load('<%=request.getContextPath() %>/web/organization/user/userAdd.jsp');
                    },
                    buttonText: { ok: '确定', cancel: '取消' },
                    initWidth:initWidthValue,
                    fixed: true,
                    okEvent: function(obj, args) {
                    	obj.callBack();
                    	args.complete();
                    }
                    
                });
            });

            //------------------------更新系统用户------------------------------------------------------------------------
            $('.shell_tool_btn_update').click(function() {
        		var selectedCount = parseInt($("#shell_view_selected_count").text(),10);
				if(selectedCount!=1){
					alert('请选择一位用户！');
					return false;
				}
				//弹出更新用户窗口
                $.fn.jmodal({
					data: { callBack: function(){
                		//alert($(".shell_item_selected").attr("id"));
                		
                		var userUpdateForm = document.forms["userUpdateForm"];
                    	with(userUpdateForm){
                    		action = "<%=request.getContextPath() %>/web/organization/user/update.action";
                    		submit();
                    	}
					}},

                	title: '更新系统用户',
                    content: function(e) {
                        e.html('loading...');
                        var id = $(".shell_item_selected").attr("id");
                        e.load('<%=request.getContextPath() %>/web/organization/user/preUpdate.action?id='+id);
                    },
                    buttonText: { ok: '更新', cancel: '取消' },
                    initWidth:initWidthValue,
                    okEvent: function(obj, args) {
                    	obj.callBack();    //实际的更新函数调用
                    	args.complete();   //隐藏弹出层窗口
                    }
                });
            });
            
            
        });
</script>	
		
</body>
</html>




