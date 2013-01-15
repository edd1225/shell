<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="shell.framework.core.SystemParam" %>
<%@ page import="shell.framework.dao.support.VOResult"%>
<%@ page import="shell.framework.authorization.vo.LoginInfo" %>
<%@ page import="shell.framework.model.TblSysAuthority" %>
<%@ taglib prefix="shell_services" uri="http://taglib.shell/shell-services.tld" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="description" content="@SHELL 是一个企业级开发的基础平台，集成SPIRNG、HIBERNATE框架，提供企业级开发的基础功能部分，用户在此基础平台上可以搭建自己的业务平台！">
    <title>@SHELL</title>
    <link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_globle.css" />
    <link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/shell_framework.css">

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
<body>

    <div class="shellPage">

        <!-- 顶行菜单导航开始 -->
        <div class="menu">
            <div class="topNav">
                <div class="topNavWrapper">
                    <a class="l" href="<%=request.getContextPath() %>/web/defaultFrame/mainFrame.jsp">主面板</a>
                    <a class="l" href="http://developers.facebook.com/module/">组织机构</a>
                    <a class="l" href="http://developers.facebook.com/blog/">权限管理</a>
                    <a class="l" href="https://developers.facebook.com/apps">编码设置</a>
                    <a class="l" href="https://developers.facebook.com/apps">设置</a>
                    <!-- 登录个人信息 -->
                    <div align="right" style="float:right; padding-top: 7px;padding-right: 5px;font-size: 12px; ">
						<span style="padding-left: 5px;">
                            <%=request.getSession().getAttribute(SystemParam.SESSIOIN_ID_LOGIN_INFO)!=null ? ((LoginInfo)request.getSession().getAttribute(SystemParam.SESSIOIN_ID_LOGIN_INFO)).getUser().getFullName() : "游客" %>
						</span>
						<span style="padding-left: 5px;">
							设置
						</span>
						<span style="padding-left: 5px;">
							注销
						</span>
                    </div>
                </div>
                <div style="clear: both;"></div>
            </div>
            <div class="logo">
                <a href="<%=request.getContextPath() %>">
                    <!--	<img class="img" src="<%=request.getContextPath() %>/images/facebook_developer_logo.png" alt="Facebook" width="166" height="17"> -->
                </a>
            </div>
        </div>
        <!-- 顶行菜单导航结束 -->

        <div style="clear: both;"></div>

        <!-- 页面下部内容区域 begining-->
        <div class="body nav">

            <!-- 右侧内容主显示区域 begining -->
            <div id="content" class="content">
                <div id="contentWrap" class="contentWrap">
                    <!-- bodyText 定义了主数据区域的边框线css样式 -->
                    <div id="bodyText" class="bodyText">

                        <!-- 工具栏 begining -->
                        <div class="shell_toolBar">
                            <!-- 题头开始 -->
                            <table cellspacing=0 cellpadding=0 width=100% border=0 align="center">
                                <tbody>
                                <tr>
                                    <td width=20 valign="top" bgcolor="E3EDFF" >
                                        <img src="../../../images/holly-11-10t.gif" border=0>
                                    </td>
                                    <td bgcolor="E3EDFF" width="100%">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="4" colspan="9"></td>
                                            </tr>
                                            <tr>
                                                <td width="10%" style="text-align: right;">
                                                    <span> 已选择(<span id="shell_view_selected_count">0</span>)</span>
                                                </td>
                                                <td width="10%" style="text-align: right;">
                                                    <span>全部权限(<font color="red"><%=(voResult==null)?0:voResult.getTotalRows() %></font>)</span>
                                                </td>

                                                <td width="5%" style="text-align: right;">
						           	 <span onclick="javascript:doAddUser();" style="cursor: pointer;">
						            	<img src="../../../images/docnew.gif">
						            	增加</span>
                                                </td>
                                                <td width="5%" style="text-align: right;">
                                        <span onclick="javascript:doBatchDelete();" style="cursor: pointer;">
						            	<img src="../../../images/docdelete.gif">
						            	删除</span>
                                                </td>
                                                <td width="5%" style="text-align: right;">
							            <span onclick="javascript:doUpdateUser();" style="cursor: pointer;">
						            	<img src="../../../images/docedit.gif">
						            	更新</span>
                                                </td>
                                                <td width="10%" style="text-align: center;">
						            	<span style="cursor: pointer;">
						            	<img  src="../../../images/shapeTriangle.gif">
						            	更多操作</span>
                                                </td>
                                                <td width="10%">
                                                    <!-- 搜索div开始 -->
                                                    <div>
                                                        <form name="userForm" method="post" action="">
                                                            <input type="hidden" id="currentPage" name="currentPage" value="1" />
                                                            <input type="hidden" id="ids" name="id" value="fuck you." />
                                                            <input type="hidden" id="currentUserID" name="currentUserID" value="" />
                                                            <div class="uiTypeahead">
                                                                <div class="wrap">
                                                                    <div class="innerWrap">
															<span class="shell_tool_search textInput">
																<span>
																 <input	type="text" class="inputtext DOMControl_placeholder"
                                                                           name="fullName" value="<%=request.getParameter("fullName")==null?"":request.getParameter("fullName") %>" title="键入搜索条件" />
																	<button type="button" title="Search for documentation" onclick="javascript:doUserSearch();"></button>
																</span>
															</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <!-- 搜索div结束 -->
                                                </td>
                                                <td width="35%" align="right">

                                                </td>
                                                <td width="10" align="right"><b><img src="../../../images/holly-x.gif" height="12"></b></td>
                                                <td width="10" align="center"><b><img src="../../../images/holly-s.gif" height="12"></b></td>

                                            </tr>
                                        </table>
                                        <b></b>
                                    </td>
                                    <td align="right" valign="top" bgcolor="E3EDFF"><img src="../../../images/holly-11-10v.gif" border=0></td>
                                </tr>
                                <tr>
                                    <td colspan="3" valign="top" height="2" bgcolor="2865A2"></td>
                                </tr>
                                </tbody>
                            </table>
                            <!-- 题头结束 -->
                        </div>
                        <!-- 工具栏 ending -->

                        <!-- 主数据显示区域 开始 -->
                        <div class="shell_grid">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td bgcolor="808080" valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="100%">
                                            <tr>
                                                <td nowrap bgcolor="#B5BCCE" valign="top" align="center">
                                                    <table cellspacing=1 cellpadding=2 width="100%" border="0">
                                                        <tbody>
                                                        <!-- 标题 -->
                                                        <tr>
                                                            <th width="10%" align=left bgcolor=#E3EDFF class="a1">
                                                                <input type="checkbox" id="checkAll" onclick="selectAll('checkAll','checkedDepartment');" />
                                                            </th>
                                                            <th width="30%" align=left bgcolor=#E3EDFF class="a1">权限ID</th>
                                                            <th width="20%" align=left bgcolor=#E3EDFF class="a1">权限名称</th>
                                                            <th width="10%" align=left bgcolor=#E3EDFF class="a1">权限类型</th>
                                                            <th width="30%" align=left bgcolor=#E3EDFF class="a1">权限URL</th>
                                                        </tr>

                                                        <%	if(resultList!=null){
                                                            for(int j=0;j<resultList.size();j++){
                                                                TblSysAuthority authority = (TblSysAuthority)resultList.get(j);
                                                        %>

                                                        <tr onclick="doChangeColor('color<%=j %>');" id="color<%=j %>" bgcolor="#FFFFFF" >
                                                            <td width="10%" align=left class="a1">
                                                                <input type="checkbox" name="checkedDepartment" value="<%=authority.getId() %>"
                                                                       onclick="checkGroupAllSync('checkedDepartment','checkAll');"/>
                                                            </td>
                                                            <td width="30%" align=left class="a1">
                                                                <a href="javascript:void(0);" onclick="doLoadData(this);" >
                                                                    <%=authority.getId() %>
                                                                </a>
                                                            </td>
                                                            <td width="20%" align=left  class="a1"><%=authority.getFunctionName() %></td>
                                                            <td width="10%" align=left class="a1"><%=authority.getFunctionType() %></td>
                                                            <td width="30%" align=left class="a1"><%=authority.getFunctionURL() %></td>
                                                        </tr>

                                                        <%}}%>

                                                        </tbody>
                                                    </table></td>
                                            </tr>
                                        </table></td>
                                </tr>
                            </table>
                        </div>
                        <!-- 主数据显示区域 结束 -->
                        <!-- 翻页 紧跟数据区下方 -->
                        <shell_services:pagination totalPages="<%=(voResult==null)?0:voResult.getTotalPages() %>"
                                                   currentPageNO="<%=(voResult==null)?0:voResult.getCurrentPage() %>" />


                    </div>
                </div>

                <!-- 页脚div begining -->
                <div class="footer">
                    <div class="footerWrap">
                        <div class="copyright">SHELL&copy;2013</div>
                        <div class="links">
                            <a href="http://www.facebook.com/platform">关于</a>
                            <a href="http://developers.facebook.com/policy/">平台政策</a>
                            <a href="http://www.facebook.com/policy.php">隐私政策</a>
                        </div>
                    </div>
                </div>
                <!-- 页脚div ending -->

            </div>
            <!-- 右侧内容主显示区域 ending -->

            <!-- 左侧导航栏-必须放在右侧主内容区域下面 begining -->
            <div id="bodyMenu" class="bodyMenu">
                <div class="toplevelnav">
                    <ul>
                        <li><a href="<%=request.getContextPath() %>/web/organization/user/index.action">
                            <div class="navSectionTitle">人员管理</div> </a></li>
                        <li><a href="<%=request.getContextPath() %>/web/organization/department/index.action">
                            <div class="navSectionTitle">部门管理</div> </a></li>
                        <li><a href="<%=request.getContextPath() %>/web/organization/agentCode/index.action">
                            <div class="navSectionTitle">工号管理</div> </a></li>
                        <li><a href="<%=request.getContextPath() %>/web/organization/position/index.action">
                            <div class="navSectionTitle">岗位管理</div> </a></li>
                        <li><a href="<%=request.getContextPath() %>/web/organization/role/index.action">
                            <div class="navSectionTitle">角色管理</div> </a></li>
                        <li><a class="selected"  href="<%=request.getContextPath() %>/web/organization/authority/index.action">
                            <div class="navSectionTitle">权限管理</div> </a></li>
                    </ul>
                </div>
            </div>
            <!-- 左侧导航栏 ending -->

        </div>
        <!-- 页面下部内容区域 ending-->

    </div>



</body>
</html>