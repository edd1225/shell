<%@page import="shell.framework.model.TblSysDepartment"%>
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

<style type="text/css">
	
	
	h1 {
	    left: -15px;
	    overflow: hidden;
	    position: relative;
	}
	h1 span {
	    display: block;
	    left: 0;
	    position: absolute;
	    top: 0;
	    z-index: 1;
	}
	h1, h1 span {
	    background-image: url("logo.gif");
	    height: 109px;
	    width: 294px;
	}
	div.demolayout {
	    margin: 0 0 20px;
	    width: 100%;
	}
	ul.demolayout {
	    background: url("../../../images/pixel.gif") repeat-x scroll left bottom transparent;
	    float: left;
	    list-style-type: none;
	    width: 100%;
	}
	ul.demolayout li {
	    float: left;
	    margin: 0 2px 0 0;
	    list-style: none;
	}
	ul.demolayout a {
	    -moz-border-bottom-colors: none;
	    -moz-border-image: none;
	    -moz-border-left-colors: none;
	    -moz-border-right-colors: none;
	    -moz-border-top-colors: none;
	    background: none repeat scroll 0 0 #EEEEEE;
	    border-color: #CCCCCC #CCCCCC -moz-use-text-color;
	    border-style: solid solid none;
	    border-width: 1px 1px 0;
	    color: #666666;
	    display: block;
	    float: left;
	    font-weight: bold;
	    padding: 4px 8px;
	    text-decoration: none;
	}
	ul.demolayout a:hover {
	    background: none repeat scroll 0 0 #FFFFFF;
	}
	ul.demolayout a.active {
	    background: none repeat scroll 0 0 #FFFFFF;
	    /*color: #0000FF;*/
	    cursor: default;
	    padding-bottom: 5px;
	}
	.tabs-container {
	    -moz-border-bottom-colors: none;
	    -moz-border-image: none;
	    -moz-border-left-colors: none;
	    -moz-border-right-colors: none;
	    -moz-border-top-colors: none;
	    border-color: #CCCCCC #CCCCCC;
	    border-right: 1px solid #CCCCCC;
	    border-style: none solid solid;
	    border-width: 0 1px 1px;
	    clear: left;
	    padding: 20px 8px 0;
	    height: 80%;
	    overflow: auto;
	}
	#demo h2 {
	    font-size: 100%;
	    margin: 0 0 20px;
	}
	



</style>



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
			//out.println("obj=NULL" );
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
							<li><a href="<%=request.getContextPath() %>/web/organization/user/index.action">
									<div class="navSectionTitle">人员管理</div> </a></li>
							<li><a class="selected" href="<%=request.getContextPath() %>/web/organization/department/index.action">
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
						<div class="shell_tool_btn shell_inline_block" style="float:left;">全部部门(<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>)</div>
						<div class="shell_tool_btn shell_inline_block" style="float:left;"> 已选择(<div class="shell_inline_block" id="shell_view_selected_count">0</div>)</div>

						<div style="float: right;">
							<!-- 搜索div开始 -->
							<div class="shell_inline_block">
								<form name="departmentForm" method="post" action="">
									<input type="hidden" id="currentPage" name="currentPage" value="1" />
									<input type="hidden" id="ids" name="id" value="fuck you." />
									<div class="uiTypeahead" id="u362713_2">
										<div class="wrap">
											<div class="innerWrap">
												<span class="shell_tool_search textInput"> 
													<span>
													 <input	type="text" class="inputtext DOMControl_placeholder"
														name="departmentName" value="<%=request.getParameter("departmentName")==null?"":request.getParameter("departmentName") %>" title="键入搜索条件" />
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
					
					<!-- 主数据显示区域 开始 -->			 		
					<div style="border: solid 0px #cccccc ; height: 40%; overflow:auto;">
						
						<table style="width: 100%">
							<tr style="background-color: #627aad">
								<th> 
									<input type="checkbox" id="checkAll" /> 
								</th>
								<th>部门名称</th>
								<th>部门类型</th>
								<th>所属组织</th>
								<th>创建时间</th>
							</tr>


						
						<%	if(resultList!=null){			
								for(int j=0;j<resultList.size();j++){
									TblSysDepartment department = (TblSysDepartment)resultList.get(j);									
						%>					
	
						<div>
							<tr id="<%=department.getId() %>">
								<td>
								 	<input type="checkbox" name="checkedDepartment" id="<%=department.getId() %>" > 
								</td>
								<td><a href="#" onclick="loadDataFunc('<%=request.getContextPath() %>/web/organization/department/userIndex.action?id=<%=department.getId() %>','tab1'); tabber1.show(1);return false;  "><%=department.getDepartmentName() %></a></td>
								<td><%=department.getDepartmentType() %></td>
								<td><%=department.getOrganizationID() %></td>
								<td><%=department.getCreateTime() %></td>
							</tr>
						</div>		
	
						   <%}}%>
						</table>	
					<!-- 翻页 紧跟数据区下方 -->
					<shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>" 
											   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />

					</div>
					<!-- 主数据显示区域 结束 -->	


						
					<!-- 级联数据显示区 开始 -->
					<div id="tab-container-1" style="border: solid 0px;height: 30%; overflow:auto; ">
					
						<ul id="tab-container-1-nav"  class="demolayout">
						    <li><a href="#tab1">人员</a></li>
						    <li><a href="#tab2">岗位</a></li>
					    </ul>
						<div class="tabs-container">
						    <div class="tab" id="tab1">
							    <h2>人员列表信息</h2>
							    <p> 这里展现部门下所有的人员列表信息.  </p>
						    </div>
						    
						    <div class="tab" id="tab2">
							    <h2>岗位列表信息</h2>
							    <p>这里展现部门下的所有的岗位列表信息.</p>
						    </div>
						</div>

					</div>
						
					<!-- 级联数据显示区 结束 -->
			
			
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

<!-- js库要按照顺序提前加载，否则后面的js函数失效 受限加载jquery，在加载其他基于jquery的js -->	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.noty.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.jmodal.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/yetii.js"></script>
<script type="text/javascript" language="JavaScript">
	
	//----------------------tag js---------------------------------------------------------------------------------------
	var tabber1 = new Yetii({
		id: 'tab-container-1',
		callback: preLoadDataFunc
		});   

	//----------------------标签单击函数 此函数可以不要----------------------------------------------------------------------
	function preLoadDataFunc(tabNumber){
		if(tabNumber==1){
			//loadDataFunc('<%=request.getContextPath() %>/web/organization/department/userIndex.action','tab1');
		}
		if(tabNumber==2){
			//alert('you clicked tab2');
		}
	}

	//-------------------------JQuery Ajax 加载数据到指定区域--------------------------------------------------------------
	function loadDataFunc(url,htmlID){
		$('#'+htmlID).load(url);
	}
	
	//-------------------------------已选择对象个数变化函数----------------------------------------------------------
	var rescumeCount = function(obj){
		if(obj.checked == false){
			$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) - 1);
		} else { 
			$("#shell_view_selected_count").text(parseInt($("#shell_view_selected_count").text(), 10) + 1);
		}
	};
	
	//-------------------------全选 全取消 列表数据-------------------------------------------------------------------------
	$('#checkAll').click(function(){
		$("input[name='checkedDepartment']").attr("checked",this.checked);
		var selectedCheckboxNum =  $("input[name='checkedDepartment']:checked").length;
		$("#shell_view_selected_count").text(selectedCheckboxNum);
	});
	//-------------------------复选框按钮单击 触发事件------------------------------------------------------------------------
	$("input[name='checkedDepartment']").click(function(){
		var $subs = $("input[name='checkedDepartment']");
	    $("#checkAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
		//alert(this.checked);
	    rescumeCount(this);
	});
	
	//--作废，暂时保留-----
	$.each($("#selectedDepartment"),function(key,obj){
			//alert(key);
		obj=$(obj);
		obj.click(function(){
			//alert(obj.prop("checked"));	
			
			//rescumeCount(obj);
			//obj.toggleClass("shell_item_selected");
		})
	});	
	
</script>


<script type="text/javascript">
	//------------------------部门表单提交----------------------------------------------------------------------------------
	function doSubmit(currentPage){
		if(currentPage!=null && currentPage>0){
			document.getElementById("currentPage").value = currentPage;
		}
		var form = document.forms["departmentForm"];
		with(form){
			action = "<%=request.getContextPath() %>/web/organization/department/index.action";
			submit();
		}
	}
</script>	
	
<script type="text/javascript">
	$(document).ready(function(){
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
		
	});

</script>	
	
<!-- 各种CRUD操作 -->	
<script type="text/javascript">

        $(document).ready(function() {
          	var pageWidth = $(document).width();  
          	var initWidthValue =  2*(pageWidth/3);
        	//------------------------增加部门-----------------------------------------------------------------------
            $('.shell_tool_btn_add').click(function() {
                $.fn.jmodal({
                    //data: { innerText: $(this).text() },
                    //嵌入页面的表单提交
                    data: { callBack: function(){
                    	var someForm = document.forms["departmentAddForm"];
                    	with(someForm){
                    		submit();
                    	}
                    } },
                    title: '增加系统部门',
                    content: function(e) { 
                        e.html('加载中...');
                        e.load('<%=request.getContextPath() %>/web/organization/department/departmentAdd.jsp');
                    },
                    buttonText: { ok: '确定', cancel: '取消' },
                    initWidth:initWidthValue,
                    fixed: true,
                    okEvent: function(obj, args) {
                    	obj.callBack(); //实际表单提交函数调用
                    	args.complete(); //隐藏弹出窗口
                    }
                    
                });
            });

            //------------------------更新系统部门------------------------------------------------------------------------
            $('.shell_tool_btn_update').click(function() {
        		var selectedCount =  $("input[name='checkedDepartment']:checked").length;
				if(selectedCount!=1){
					alert('请选择一位用户！');
					return false;
				}
				//弹出更新用户窗口
                $.fn.jmodal({
					data: { callBack: function(){
                		//alert($(".shell_item_selected").attr("id"));
                		var userUpdateForm = document.forms["departmentUpdateForm"];
                    	with(userUpdateForm){
                    		action = "<%=request.getContextPath() %>/web/organization/department/update.action";
                    		submit();
                    	}
					}},

                	title: '更新系统用户',
                    content: function(e) {
                        e.html('Loading...');
                        var id = $("input[name='checkedDepartment']:checked").attr("id");
                        e.load('<%=request.getContextPath() %>/web/organization/department/preUpdate.action?id='+id);
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
        
        
      //----------------------批量删除部门------------------------------------------------------------------------------------
    	function doDelete(){
    		//var selectedCount = parseInt($("#shell_view_selected_count").text(),10);
    		var selectedCount =  $("input[name='checkedDepartment']:checked").length;
    		if(selectedCount<=0){
    			alert('至少选择一位用户，支持批量删除！');
    			return false;
    		}else{
    			if(window.confirm("确定删除？")){
    				//循环取出选择对象id值，以“-”进行分隔
    				var departmentIDs = "";
    				$.each($("input[name='checkedDepartment']:checked"),function(key,obj){
    					obj=$(obj); //需要重新获取对象
    					departmentIDs = departmentIDs + obj.attr("id") + "-";
    				});
    				
    				$("#ids").attr("value",departmentIDs.substring(0,departmentIDs.length-1));
    				var form = document.forms["departmentForm"];
    				with(form){
    					action = "<%=request.getContextPath() %>/web/organization/department/delete.action";
    					submit();
    				}
    			}
    		} 
    	}
        
</script>	
		
</body>
</html>




