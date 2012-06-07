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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import shell.framework.dao.IJdbcBaseDao;
import shell.framework.dao.support.VOResult;
import shell.framework.model.TblSysUser;
import shell.framework.organization.user.service.TblSysUserService;
import shell.framework.organization.user.vo.TblSysUserVO;
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
	public VOResult findByPagination(int currentPage , int pageSize , TblSysUserVO userVO) {
		StringBuffer sql = new StringBuffer("select * from TBL_SYS_USER user");
		//组装查询条件
		if(userVO!=null){
			sql.append(" where 1=1");
			//系统用户全称
			if(userVO.getFullName()!=null && !"".equals(userVO.getFullName())){
				sql.append(" and user.FULLNAME like '%" + userVO.getFullName().trim() +"%'");
			}
			//系统用户登录ID
			if(userVO.getUserCode()!=null && !"".equals(userVO.getUserCode())){
				sql.append(" and user.USERCODE='" + userVO.getUserCode().trim() +"'");
			}
			//系统用户手机号
			if(userVO.getTelephone()!=null && !"".equals(userVO.getTelephone())){
				sql.append(" and user.TELEPHONE='" + userVO.getTelephone().trim() +"'");
			}
		}
		
		VOResult voResult = jdbcBaseDao.query(sql.toString(), new RowMapper<Object>(){

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
		
System.out.println(sql.toString());		
		
		return voResult;
	}

	
	/* (non-Javadoc)
	 * @see shell.framework.organization.user.service.TblSysUserService#findUserByID(java.io.Serializable)
	 */
	public TblSysUser findUserByID(Serializable id) {
		return null;
	}

	
	/* (non-Javadoc)
	 * @see shell.framework.organization.user.service.TblSysUserService#delete(shell.framework.organization.user.vo.TblSysUserVO)
	 */
	public int deleteByID(TblSysUserVO userVO) {
		String sql = "delete from TBL_SYS_USER where ID = ?";
		final List<String> idList = new ArrayList<String>();
		String ids[] = userVO.getId().split("-");
		for(String id : ids){
			idList.add(id);
		}
		
		int[] deleteNumbers = jdbcBaseDao.batchUpdate(sql, idList, new BatchPreparedStatementSetter(){
			
			/* (non-Javadoc)
			 * @see org.springframework.jdbc.core.BatchPreparedStatementSetter#getBatchSize()
			 */
			public int getBatchSize() {
				return idList.size();
			}
			
			/* (non-Javadoc)
			 * @see org.springframework.jdbc.core.BatchPreparedStatementSetter#setValues(java.sql.PreparedStatement, int)
			 */
			public void setValues(PreparedStatement ps, int index)	throws SQLException {
				String id = idList.get(index);
				ps.setString(1, id);
			}
		});
		
		return deleteNumbers.length;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
