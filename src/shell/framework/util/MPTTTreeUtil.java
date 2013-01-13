/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: AbstractTreeUtil.java $
 * $LastChangedDate: 2012-10-6 下午1:00:54 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import org.springframework.jdbc.core.RowMapper;
import shell.framework.dao.IJdbcBaseDao;
import shell.framework.taglib.support.TreeViewObject;

/**
 * <p> 基于MPTT(先序遍历)存储结构树 工具类 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-10-6 下午1:00:54 $
 */
public class MPTTTreeUtil {
	
	/**
	 * 先序遍历树
	 * @param treeNodeID 树某一个节点ID
	 * @return 
	 */
	public static List<TreeViewObject> preOrderTraversal(String treeNodeID){
		return null;
	}
	
	
	/**
	 * 索引树的某个节点及其下所有的子节点
	 * 按照先序遍历从数据库中查询出结果 使用 order by LFT ASC进行排序即可
	 * @param treeNodeID 树中某个节点ID
	 * @param jdbcBaseDao dao层实现类
	 * @return List 按LFT字段升序排列的TreeViewObject对象
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public static List<?> retrieveAllTree(String treeNodeID , IJdbcBaseDao jdbcBaseDao) throws SQLException {
		String sql = "select LFT,RGT from TBL_SYS_FUNCTION where ID='" + treeNodeID + "'";
		
		List<?> rootList = jdbcBaseDao.query(sql);
		Map<String,Object> map = new HashMap<String,Object>();
		if(rootList!=null && !rootList.isEmpty()){
			map = (Map<String,Object>)rootList.get(0);
		}
		
		sql = "select * from TBL_SYS_FUNCTION where LFT between " + (Integer)map.get("LFT") + " and " + (Integer)map.get("RGT") +
              " order by LFT ASC" ;
		List<?> treeNodeList = jdbcBaseDao.query(sql, new RowMapper<Object>(){
			
			/* (non-Javadoc)
			 * @see org.springframework.jdbc.core.RowMapper#mapRow(java.sql.ResultSet, int)
			 */
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				TreeViewObject treeViewObject = new TreeViewObject();
				Map<String,String> propertyMap = new HashMap<String,String>();
				propertyMap.put("name" , "FUNCTION_NAME");
				propertyMap.put("functionURL" , "FUNCTION_URL");
				propertyMap.put("functionType" , "FUNCTION_TYPE");
				propertyMap.put("parentFunID" , "PARENT_FUN_ID");
				propertyMap.put("orderNO" , "ORDER_NO");
				PopulateUtil.populate(treeViewObject, rs ,propertyMap);
				return treeViewObject;
			}
			
		});
		return _calculateLevel(treeNodeList);
	}
	
	
	/**
	 * 使用栈计算每个树节点的缩进层次
	 * @param treeNodeList 存储树节点的list
	 * @return 存储树节点的list
	 */
	private static List<?> _calculateLevel(List<?> treeNodeList){
		Stack<Integer> rightStack = new Stack<Integer>();
		for(Object treeNode : treeNodeList){
			TreeViewObject treeViewObject = (TreeViewObject)treeNode;
			if(rightStack.size()>0){
				int current = rightStack.peek();
				while(treeViewObject.getRgt()>current){
					rightStack.pop();
					current = rightStack.peek();
				}
			}
			treeViewObject.setLevel(rightStack.size());
			rightStack.push(treeViewObject.getRgt());
			//设置每个树节点是否包含子节点
			treeViewObject.setType( ((treeViewObject.getRgt()-treeViewObject.getLft()-1)/2)>0 ? TreeViewObject.HAS_SUB_NODE : TreeViewObject.NO_SUB_NODE );
		}
		return treeNodeList;
	}
	
}
	
	
