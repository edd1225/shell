/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: UserAction.java $
 * $LastChangedDate: 2012-4-30 上午7:36:43 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.organization.user.web;

import org.springframework.web.bind.annotation.RequestMapping;

import com.opensymphony.xwork2.ActionSupport;

/**
 * <p>  </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-4-30 上午7:36:43 $
 */
@SuppressWarnings("serial")
public class UserAction extends ActionSupport {

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		return "success";
	}
	
}
