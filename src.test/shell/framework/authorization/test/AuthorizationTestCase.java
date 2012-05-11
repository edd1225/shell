/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: AuthorizationTestCase.java $
 * $LastChangedDate: 2012-5-2 上午11:14:39 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.authorization.test;

import junit.framework.Assert;
import shell.framework.authorization.service.LoginService;
import shell.framework.dao.test.SpringContextBaseTestCase;
import shell.framework.model.User;

/**
 * <p> 权限模块测试用例 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-2 上午11:14:39 $
 */
public class AuthorizationTestCase extends SpringContextBaseTestCase {

	private LoginService loginService = null;
	
	/* (non-Javadoc)
	 * @see org.springframework.test.AbstractTransactionalSpringContextTests#onSetUpInTransaction()
	 */
	@Override
	protected void onSetUpInTransaction() throws Exception {
		loginService = (LoginService)this.getApplicationContext().getBean(LoginService.BEAN_ID);
	}
	
	
	public void testLogin(){
		User user = new User();
		user.setId("3984ufjwoiwuf23");
		user.setUserCode("9999");
		user.setPassword("9999");
		user.setFullName("GOOGLE PLUS");
		
		boolean result = loginService.login(user.getUserCode(),user.getPassword(),null);
		
		Assert.assertEquals(false, result);
		
	}
	
	
}
