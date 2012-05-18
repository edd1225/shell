/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: TblSysUserServiceImpl.java $
 * $LastChangedDate: 2012-5-17 下午4:44:14 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.organization.user.service.impl;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import org.springframework.jdbc.core.RowMapper;
import shell.framework.dao.IJdbcBaseDao;
import shell.framework.dao.support.VOResult;
import shell.framework.model.TblSysUser;
import shell.framework.organization.user.service.TblSysUserService;
import shell.framework.util.PopulateUtil;

/**
 * <p> 系统用户管理服务类JDBC实现 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-17 下午4:44:14 $
 */
public class TblSysUserService4JdbcImpl implements TblSysUserService {

	private IJdbcBaseDao jdbcBaseDao;
	
	/**
	 * @return the jdbcBaseDao
	 */
	public IJdbcBaseDao getJdbcBaseDao() {
		return jdbcBaseDao;
	}

	/**
	 * @param jdbcBaseDao the jdbcBaseDao to set
	 */
	public void setJdbcBaseDao(IJdbcBaseDao jdbcBaseDao) {
		this.jdbcBaseDao = jdbcBaseDao;
	}

	/* (non-Javadoc)
	 * @see shell.framework.organization.user.service.TblSysUserService#listAll()
	 */
	public VOResult findByPagination(int currentPage , int pageSize) {
		String sql = "select * from TBL_SYS_USER";
		VOResult voResult = jdbcBaseDao.query(sql, new RowMapper<Object>(){

			/* (non-Javadoc)
			 * @see org.springframework.jdbc.core.RowMapper#mapRow(java.sql.ResultSet, int)
			 */
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				TblSysUser user = new TblSysUser();	
				Map<String,String> propertyMap = new HashMap<String,String>();
				propertyMap.put("createdTime" , "CREATE_TIME");
				propertyMap.put("updatedTime" , "UPDATE_TIME");
				PopulateUtil.populate(user, rs ,propertyMap);
				return user;
			}
			
		}, currentPage, pageSize);
		
		return voResult;
	}

	/* (non-Javadoc)
	 * @see shell.framework.organization.user.service.TblSysUserService#findUserByID(java.io.Serializable)
	 */
	public TblSysUser findUserByID(Serializable id) {
		
		return null;
	}

}
