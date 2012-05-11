/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: LoginFilter.java $
 * $LastChangedDate: 2012-5-6 下午12:47:57 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.authorization.web;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import shell.framework.authorization.service.LoginService;
import shell.framework.core.DefaultBeanFactory;

/**
 * <p> 1.验证用户请求资源时是否已经登录系统 
 * 	   2.验证用户是否具有访问该资源的权限
 * </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-6 下午12:47:57 $
 */
public class LoginFilter implements Filter {

	private String loginPage = "/index.jsp";
	
	private Logger logger = Logger.getLogger(LoginFilter.class);
	
	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {}

	
	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) 
			throws IOException, ServletException {
	
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		//根据sessionID获取当前浏览器对应session
		HttpSession session = req.getSession();
		if(session==null){
			logger.warn("NO SESSION SPECIFIED!");
			this.doLogin(req, resp, filterChain);
			return;
		}
		
		Object userInfo=null;
		Object userCode = session.getAttribute("userCode")==null ? req.getParameter("userCode") : 
			session.getAttribute("userCode");
		
		if(userCode!=null){
			userInfo = session.getAttribute((String)userCode);
		}else{
			this.doLogin(req, resp, filterChain);
			return;
		}
		
		if(userInfo==null){
			//从url串获取用户名和密码
			String pwd = req.getParameter("password");
			if(userCode!=null && pwd!=null && !userCode.equals("") && !"".equals(pwd)){
				LoginService loginService = (LoginService)DefaultBeanFactory.getBean(LoginService.BEAN_ID);
				//检查用户，登录操作
				if(!loginService.login((String)userCode,pwd,req)){
					this.doLogin(req, resp, filterChain);
					return;
				}
			}else{
				//转向登录页面
				this.doLogin(req, resp, filterChain);
				return;
			}
		}
		
		//TODO 获取改用户权限，验证是否具有访问该资源权限
		
		filterChain.doFilter(req, resp);
	}

	
	/**
	 * 验证失败，转向登录页面
	 * @param request
	 * @param response
	 * @param filterChain
	 */
	public void doLogin(ServletRequest request, ServletResponse response, FilterChain filterChain){
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		try {
			
//			req.getRequestDispatcher(loginPage).forward(req, resp);
			resp.sendRedirect(req.getContextPath()+loginPage);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		if(filterConfig.getInitParameter("loginPage")!=null && !"".equals(filterConfig.getInitParameter("loginPage"))){
			loginPage = filterConfig.getInitParameter("loginPage");
		}
	}

}
