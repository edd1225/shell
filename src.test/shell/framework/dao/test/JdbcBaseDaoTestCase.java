/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: JdbcBaseDaoTestCase.java $
 * $LastChangedDate: 2012-4-20 下午3:58:17 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.dao.test;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.JdbcUtils;

import shell.framework.dao.impl.JdbcBaseDaoTemplate;
import shell.framework.dao.support.VOResult;

/**
 * <p>  </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-4-20 下午3:58:17 $
 */
public class JdbcBaseDaoTestCase extends SpringContextBaseTestCase {

	private JdbcBaseDaoTemplate jdbcBaseDao ;
	
	/* (non-Javadoc)
	 * @see org.springframework.test.AbstractTransactionalSpringContextTests#onSetUpInTransaction()
	 */
	@Override
	protected void onSetUpInTransaction() throws Exception {
		jdbcBaseDao = (JdbcBaseDaoTemplate)this.getApplicationContext().getBean("baseDaoTemplate.Jdbc");
	}
	
	
	public void testQueryByRowMapper(){
		String sql = "select * from pages";
		List result = jdbcBaseDao.query(sql);
		if(result!=null){
			for(int i=0;i<result.size();i++){
				Map columnMap = (Map)result.get(i);
				Set keySet = columnMap.keySet();
				for(Object key : keySet){
					System.out.println(key + " : " + columnMap.get((String)key));
				}
				System.out.println("====================================================================================");
			}
		}
	}
	
	
	public void testQueryByPagination(){
		String sql = "select id,title,permalink,body from pages where body like ? " ;
		
		//VOResult voResult  = jdbcBaseDao.query(sql, new RowMapper<Object>(){
		
		VOResult voResult  = jdbcBaseDao.query(sql, new Object[]{"%this is%"} , new RowMapper<Object>(){	
			
			/* (non-Javadoc)
			 * @see org.springframework.jdbc.core.RowMapper#mapRow(java.sql.ResultSet, int)
			 */
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String,Object> rowsMap = new HashMap<String,Object>();
				int columnNum = rs.getMetaData().getColumnCount();
				for(int i=1;i<=columnNum;i++){
					rowsMap.put(JdbcUtils.lookupColumnName(rs.getMetaData(), i), JdbcUtils.getResultSetValue(rs, i));
				}
				
				return rowsMap;
			}
			
		}, 1, 3);
		
		if(voResult!=null){
			System.out.println("result size=" + voResult.getResultList().size());
			System.out.println("total Pages=" + voResult.getTotalPages());
		
			System.out.println("total rows=" + voResult.getTotalRows());
			
			System.out.println("current Page=" + voResult.getCurrentPage());
		
			System.out.println("page size=" + voResult.getPageSize());
			
			System.out.println("=========================================");
			
			for(Object map : voResult.getResultList()){
				Set keySet = ((HashMap)map).keySet();
				for(Object key : keySet){
					System.out.println(key + " : " + ((HashMap)map).get((String)key));
				}
				System.out.println("///////////////////////////////////");
			}
			
		}
	}
	
	
	
	public void testUpdate(){
//		String sql = "insert into pages values(1,'c_pages','c_pages','this is body text',null,null)";
//		String sql = "delete from pages where  body like '%this is%' ";
		
		String sql = "update pages set body = 'php language is be useful for web' where body like ?";
		int numbers = jdbcBaseDao.update(sql,new Object[]{"%javascript%"});
		System.out.println("the updated rows is :" + numbers);
	}
	
	
	public void testBatchUpdate(){
		String sql = "insert into pages values(?,?,?,?,?,?)";
//		final List<Page> pages = new ArrayList<Page>();
		for(int i=20;i<30;i++){
//			Page page = new Page();
//			page.setTitle(i+"_title");
//			page.setPermalink(i + "_permalink");
//			page.setBody(i + "_body");
//			page.setCreatedTime(null);
//			page.setUpdatedTime(null);
//			page.setId(i);
//			pages.add(page);
		}
		
		
//		int[] rowNums  =  jdbcBaseDao.batchUpdate(sql, pages , new BatchPreparedStatementSetter(){
			
			/* (non-Javadoc)
			 * @see org.springframework.jdbc.core.BatchPreparedStatementSetter#getBatchSize()
			 */
//			public void getBatchSize() {
//				return null;
//				return pages.size();
//			}
			
			/* (non-Javadoc)
			 * @see org.springframework.jdbc.core.BatchPreparedStatementSetter#setValues(java.sql.PreparedStatement, int)
			 */
//			public void setValues(PreparedStatement ps, int index)	throws SQLException {
//				Page page = pages.get(index);
//				ps.setInt(1, page.getId());
//				ps.setString(2,page.getTitle());
//				ps.setString(3, page.getPermalink());
//				ps.setString(4, page.getBody());
//				ps.setDate(5, null);
//				ps.setDate(6, null);
//			}
//		);
		
//		System.out.println("Batch updated rows is :" + rowNums.length);
		
	}
	
	
	
}
