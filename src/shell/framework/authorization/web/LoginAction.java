/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: LoginAction.java $
 * $LastChangedDate: 2012-4-29 下午9:44:47 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.authorization.web;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import shell.framework.authorization.service.LoginService;
import shell.framework.core.DefaultBeanFactory;
import com.opensymphony.xwork2.ActionSupport;

/**
 * <p> 用户登录action </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-4-29 下午9:44:47 $
 */
@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements ServletRequestAware {

	private String userCode;
	private String password;
	private HttpServletRequest request;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		
		LoginService loginService = (LoginService)DefaultBeanFactory.getBean(LoginService.BEAN_ID);
		if(!loginService.login(this.getUserCode(), this.getPassword(), request)){
			return "failure";
		}else{
			return "success";
		}
	}


	/**
	 * @return the userCode
	 */
	public String getUserCode() {
		return userCode;
	}


	/**
	 * @param userCode the userCode to set
	 */
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}


	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}


	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/* (non-Javadoc)
	 * @see org.apache.struts2.interceptor.ServletRequestAware#setServletRequest(javax.servlet.http.HttpServletRequest)
	 */
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
