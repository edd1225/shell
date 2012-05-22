package shell.framework.dao.test;

import java.util.Date;
import java.util.List;

import shell.framework.dao.impl.HibernateBaseDaoTemplate;
import shell.framework.dao.support.VOResult;
//import shell.framework.model.Page;
import junit.framework.Assert;

/**
 * hibernate基础Dao模板测试用例
 * @author yangchangming
 *
 */
public class HibernateBaseDaoTestCase extends SpringContextBaseTestCase {

	private HibernateBaseDaoTemplate hibernateBaseDao = null;
		
	@Override
	/**
	 * 每次测试用例执行时，都先执行该方法 
	 */
	protected void onSetUpInTransaction() throws Exception {
		hibernateBaseDao = (HibernateBaseDaoTemplate)this.getApplicationContext().getBean("baseDaoTemplate.Hibernate");
	}
		
	/**
	 * 测试find方法
	 */
	public void testFind(){
		String queryString = "from Page";
		List<?> resultList = hibernateBaseDao.find(queryString);
		Assert.assertEquals(7, resultList.size());
	}
	
	public void testSave(){
//		Page page = new Page();
//		page.setBody("body");
//		page.setId(44);
//		page.setPermalink("permalink");
//		page.setTitle("title");
//		page.setCreatedTime(new Date());
//		page.setUpdatedTime(new Date());
//		hibernateBaseDao.save(page);
	}
	
	public void testDelete(){
//		Page page = new Page();
//		page.setBody("body");
//		page.setId(44);
//		page.setPermalink("permalink");
//		page.setTitle("title");
//		page.setCreatedTime(new Date());
//		page.setUpdatedTime(new Date());
//		hibernateBaseDao.delete(page);
	}
	
	public void testDeleteByClazz(){
//		hibernateBaseDao.delete(Page.class, 7);
	}
	
	
	/**
	 * 分页查询--不带参数
	 */
	public void testFindByPaginate(){
		String queryString = "from Page";
		VOResult voResult = hibernateBaseDao.find(queryString, 0, 4);
		System.out.println("pageSize=" + voResult.getPageSize() + 
							"\n totalRows=" + voResult.getTotalRows() + 
							"\n totalPages=" + voResult.getTotalPages() + 
							"\n resultList.size=" +	voResult.getResultList().size() + 
							"\n currentPage=" + voResult.getCurrentPage());
				
	}
	
	/**
	 * 分页查询-带参数
	 */
	public void testFindByParamPaginate(){
		String queryString = "from Page where id = ? and title = ?";
		VOResult voResult = hibernateBaseDao.find(queryString, new Object[]{5,"PHP Page"}, 0, 3);
		System.out.println("pageSize=" + voResult.getPageSize() + 
				"\n totalRows=" + voResult.getTotalRows() + 
				"\n totalPages=" + voResult.getTotalPages() + 
				"\n resultList.size=" + voResult.getResultList().size() + 
				"\n currentPage=" + voResult.getCurrentPage());
		
	}
	
	
	public void testLoad(){
//		Object obj = hibernateBaseDao.load(18, Page.class);
//		System.out.println(obj==null?null:((Page)obj).getTitle());
	}
	
	
	
	@Override
	protected void onTearDownInTransaction() throws Exception {
		hibernateBaseDao = null;
	}
	
}
