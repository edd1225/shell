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
	
	@RequestMapping(value="index")
	public String listAll(HttpServletRequest request){
		TblSysUserService tblSysUserService = (TblSysUserService)DefaultBeanFactory.getBean("tblSysUserService");
		VOResult voResult = tblSysUserService.findByPagination(1, 6);
		request.setAttribute("voResult", voResult);
		return "web/organization/user/index";
	}
}