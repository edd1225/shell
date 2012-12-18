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
import shell.framework.model.TblSysUser;

/**
 * <p> 鉴权模块测试用例 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-2 上午11:14:39 $
 */
public class AuthorizationTestCase extends SpringContextBaseTestCase {

	private LoginService authService = null;
	
	/* (non-Javadoc)
	 * @see org.springframework.test.AbstractTransactionalSpringContextTests#onSetUpInTransaction()
	 */
	@Override
	protected void onSetUpInTransaction() throws Exception {
		authService = (LoginService)this.getApplicationContext().getBean(LoginService.BEAN_ID);
	}
	
	
	public void testLogin(){
		TblSysUser user = new TblSysUser();
		user.setId("3984ufjwoiwuf23");
		user.setUserCode("9999");
		user.setPassword("9999");
		user.setFullName("GOOGLE PLUS");
		
		boolean result = authService.login(user.getUserCode(),user.getPassword(),null);
		
		Assert.assertEquals(false, result);
		
	}
	
	
}
