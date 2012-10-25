/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: PopulateUtil.java $
 * $LastChangedDate: 2012-5-2 下午2:38:38 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.jdbc.support.JdbcUtils;


/**
 * <p>
 * bean注入工具类
 * 源数据来自 ResultSet 或者 Request 
 * </p>
 * 
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-2 下午2:38:38 $
 */
public class PopulateUtil {

	private static Logger logger = Logger.getLogger(PopulateUtil.class);
	
	
	/**
	 * 从单条结果集中注入数据到javabean，要求属性名称和列名称相同，不区分大小写
	 * 不同名称但意义相同的属性名和列名可以通过synonymousPropertyMap参数指定对应关系
	 * 形如：userName <----> USER_NAME 
	 * 格式：synonymousPropertyMap<目标javabean属性，源结果集列名称>
	 * 只针对简单的javabean属性与单条记录的映射，不支持javabean属性为array list map等复杂类型
	 * @param destObj 目标javabean
	 * @param originRS 源结果集
	 * @param synonymousPropertyMap 同义属性关系对照map <目标javabean属性，源结果集列名称>
	 * @return 布尔值
	 */
	public static boolean populate(Object destObj,java.sql.ResultSet originRS, Map<String, String> synonymousPropertyMap) {
		
		if(destObj==null ){
			logger.info("NO DESTOBJ SPECIFIED !");
			return false;
		}
		if(originRS==null){
			logger.info("NO ORIGINRS SPECIFIED !");
			return false;
		}
		
		Map<String, Object> rowsMap = new HashMap<String, Object>();
		int columnNum = 0;
		try {
			columnNum = originRS.getMetaData().getColumnCount();
			for (int i = 1; i <= columnNum; i++) {
				//将记录的列名称和对应的值放入map中,所有的列名都统一为大写
				rowsMap.put(JdbcUtils.lookupColumnName(originRS.getMetaData(), i).toUpperCase(),
						JdbcUtils.getResultSetValue(originRS, i));
			}
		} catch (SQLException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		
		//开始计时
		/*long startMill = System.currentTimeMillis();
		System.out.println(startMill);*/

		//置换不同名称相同含义的属性，置换后统一放入rowsMap中
		if(synonymousPropertyMap!=null && synonymousPropertyMap.size()>0){
			Set<String> keys = synonymousPropertyMap.keySet();
			for(Iterator<String> iter = keys.iterator();iter.hasNext();){
				//目标属性名称
				String destPropertyName = iter.next();
				//源属性名称--结果集记录列名
				String originPropertyName = synonymousPropertyMap.get(destPropertyName);
				if(rowsMap.containsKey(originPropertyName.toUpperCase())){
					rowsMap.put(destPropertyName, rowsMap.get(originPropertyName.toUpperCase()));
					rowsMap.remove(originPropertyName.toUpperCase());
				}
			}
		}
		
		_superPopulate(destObj,rowsMap);
		
		//结束计时
		/*long endMill = System.currentTimeMillis();
		System.out.println(endMill);
		System.out.println(endMill - startMill);*/
		
		/*for(Iterator iter = rowsMap.keySet().iterator();iter.hasNext();){
			String key = (String)iter.next();
			System.out.println("KEY:" + key + " -> " + "VALUE:" + rowsMap.get(key));
		}*/
		
		return true;
	}
	
	
	/**
	 * 屏蔽记录集的列名称与javabean属性名称的大小写不同问题
	 * commons-beanutils的BeanUtils.populate(bean , map) 方法只针对具有相同属性名和列名称的注入
	 * @param bean
	 * @param rows
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	protected static void _superPopulate(Object bean , Map<String, Object> rows) {
		Map<String,String> beanPropertyMap = new HashMap<String,String>();
		if(bean==null || rows==null){
			return;
		}
		
		//将javabean的属性放入map中 <大写属性名，原属性名>
		Field[] fields = bean.getClass().getDeclaredFields();
		//考虑bean的父类中的fields属性
		Field[] superFileds = bean.getClass().getSuperclass().getDeclaredFields();
		
		if(superFileds.length>0){
			Field[] mixFields = new Field[fields.length+superFileds.length];
			System.arraycopy(superFileds, 0, mixFields, 0, superFileds.length);
			System.arraycopy(fields, 0, mixFields, superFileds.length, fields.length);
			
			for(Field fieldName : mixFields){
				beanPropertyMap.put(fieldName.getName().toUpperCase(), fieldName.getName());
			}
		}else{
			for(Field fieldName : fields){
				beanPropertyMap.put(fieldName.getName().toUpperCase(), fieldName.getName());
			}
		}
		
		
		//屏蔽记录行的列名大小写
		Iterator<String> names = rows.keySet().iterator();
		while(names.hasNext()){
			String name = names.next();
			if(name==null){
				continue;
			}
			Object value = rows.get(name);
			if(beanPropertyMap.containsKey(name.toUpperCase())){
				name = beanPropertyMap.get(name.toUpperCase());
			}else{
				//结果集记录的列名在bean中没有对应的属性，忽略掉
				continue;
			}
			
			try {
				BeanUtils.setProperty(bean, name, value);
			} catch (IllegalAccessException e) {
				logger.error(e.getMessage());
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				logger.error(e.getMessage());
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
