/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: UserController.java $
 * $LastChangedDate: 2012-5-15 下午4:41:28 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.organization.user.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shell.framework.core.DefaultBeanFactory;
import shell.framework.dao.support.VOResult;
import shell.framework.organization.user.service.TblSysUserService;
import shell.framework.organization.user.service.impl.TblSysUserService4JdbcImpl;

/**
 * <p> 人员管理控制器 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-15 下午4:41:28 $
 */
@Controller
@RequestMapping("/web/organization/user/*")
public class UserController {
	
	/**
	 * 索引所有的系统用户，分页查询
	 * @param request http请求
	 * @param currentPage 当前页
	 * @return 跳转的url
	 */
	@RequestMapping(value="index")
	public String index(HttpServletRequest request,int currentPage){
		TblSysUserService tblSysUserService = (TblSysUserService)DefaultBeanFactory.getBean("tblSysUserService");
		
		if(currentPage<=0){
			currentPage = 1;
		}
		//二维表格方式，每页展现数据较多
		int pageSize =30;
		
		
		VOResult voResult = tblSysUserService.findByPagination(currentPage, pageSize);
		//上次调转时的请求url，分页tag中需要使用
		request.setAttribute("preRequestURL", request.getRequestURL().toString());
		request.setAttribute("voResult", voResult);
		return "web/organization/user/index";
	}
}