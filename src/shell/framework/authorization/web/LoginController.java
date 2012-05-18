/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: LoginController.java $
 * $LastChangedDate: 2012-5-15 下午3:11:58 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.authorization.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import shell.framework.authorization.service.LoginService;
import shell.framework.authorization.support.AuthorizationException;
import shell.framework.core.DefaultBeanFactory;

/**
 * <p> 系统登录控制器 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-15 下午3:11:58 $
 */
@Controller
public class LoginController {

	@RequestMapping("/login")
	public String login(String userCode,String password,HttpServletRequest request){
		if(userCode==null || password==null){
			throw new AuthorizationException("NO USERCODE OR PASSWORD SPECIFIED!");
		}
		LoginService loginService = (LoginService)DefaultBeanFactory.getBean(LoginService.BEAN_ID);
		if(!loginService.login(userCode, password, request)){
			return "redirect:index.jsp";
		}else{
			return "web/defaultFrame/mainFrame";
		}
	}
	
	
}
