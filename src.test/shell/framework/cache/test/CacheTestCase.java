/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: CacheTestCase.java $
 * $LastChangedDate: 2012-4-13 下午4:43:11 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.cache.test;

import shell.framework.cache.SystemCacheInitializer;
import shell.framework.cache.support.CacheUtil;
import shell.framework.dao.test.SpringContextBaseTestCase;

/**
 * <p> 缓存测试类 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-4-13 下午4:43:11 $
 */
public class CacheTestCase extends SpringContextBaseTestCase {

	private CacheUtil cacheUtil =  null;
	private SystemCacheInitializer systemCacheInitializer = null;

	/* (non-Javadoc)
	 * @see org.springframework.test.AbstractTransactionalSpringContextTests#onSetUpInTransaction()
	 */
	@SuppressWarnings("deprecation")
	@Override
	protected void onSetUpInTransaction() throws Exception {
		cacheUtil = (CacheUtil)this.getApplicationContext().getBean("cacheUtil");
        systemCacheInitializer = (SystemCacheInitializer)this.getApplicationContext().getBean("sys.cacheInitializer");
	}
	
	public void testPutValue(){
		cacheUtil.putValue("loginInfoCache", "user", "zhangsan");
	}
	
	public void testGetValue(){
		Object obj = cacheUtil.getValue("loginInfoCache", "user");
		System.out.println("+++++++" + obj);
	}
	
	
	public void testGetCacheNames(){
		String[] names = CacheUtil.getCacheNames();
//		String[] names = cacheUtil.getCacheNames();
		for(String name : names){
			System.out.println("=====" + name);
		}
		
		System.out.println("****************clearCaches begin***********************");
		cacheUtil.clearCaches();
		System.out.println("****************clearCaches end***********************");
		
		String[] namess = CacheUtil.getCacheNames();
		
//		String[] namess = ((CacheUtil)DefaultBeanFactory.getBean("cacheUtil")).getCacheNames();
//		String[] namess = cacheUtil.getCacheNames();
		
		for(String name : namess){
			System.out.println("....." + name);
		}
	}


    public void testSysCacheInitializer(){
         systemCacheInitializer.userRoleInitial();
    }

}
