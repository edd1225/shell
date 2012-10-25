/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: TblSysRoleService.java $
 * $LastChangedDate: 2012-9-23 下午1:15:15 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.organization.role.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import shell.framework.dao.support.VOResult;
import shell.framework.model.TblSysRole;
import shell.framework.organization.role.vo.TblSysRoleVO;

/**
 * <p> 系统角色服务类接口声明 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-9-23 下午1:15:15 $
 */
public interface TblSysRoleService {

	/**
	 * 分页查询角色
	 * @param currentPage
	 * @param pageSize
	 * @param sysRoleVO 角色值对象
	 * @return 分页对象
	 */
	public VOResult findByPagination(int currentPage,int pageSize,TblSysRoleVO sysRoleVO);
	
	/**
	 * 根据id查询角色对象
	 * @param id 
	 * @return 角色对象
	 */
	public TblSysRole findRoleByID(Serializable id);
	
	/**
	 * 删除
	 * @param sysRoleVO
	 * @return 删除的记录数
	 */
	public int deleteByID(TblSysRoleVO sysRoleVO);
	
	/**
	 * 增加
	 * @param sysRoleVO
	 * @return 增加的记录数
	 */
	public int add(TblSysRoleVO sysRoleVO);
	
	/**
	 * 更新
	 * @param sysRoleVO
	 * @return 更新的记录数
	 */
	public int update(TblSysRoleVO sysRoleVO);
	
	/**
	 * 列出指定角色包含的所有功能
	 * @param sysRoleVO
	 * @return
	 */
	public Map<Object,Object> findFunctionByRoleID(TblSysRoleVO sysRoleVO);
	
	/**
	 * 保存指定角色拥有的系统功能
	 * @param sysRoleVO function.id 形如：id1-id2-id3-id4....
	 * @return 更新记录数
	 */
	public int saveFunctionsOfRole(final TblSysRoleVO sysRoleVO);
	
}
