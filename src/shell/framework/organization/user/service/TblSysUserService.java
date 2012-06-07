/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: UserService.java $
 * $LastChangedDate: 2012-5-17 下午4:22:37 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.organization.user.service;

import java.io.Serializable;
import shell.framework.dao.support.VOResult;
import shell.framework.model.TblSysUser;
import shell.framework.organization.user.vo.TblSysUserVO;

/**
 * <p> 系统用户管理服务类 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-17 下午4:22:37 $
 */
public interface TblSysUserService {

	/**
	 * 分页查询
	 * @param currentPage 当前查询起始页码
	 * @param pageSize 每页显示记录条数
	 * @param userVO 系统用户值对象
	 * @return 分页对象
	 */
	public VOResult findByPagination(int currentPage , int pageSize, TblSysUserVO userVO);
	
	public TblSysUser findUserByID(Serializable id);
	
	/**
	 * 根据系统用户ID，支持批量删除
	 * @param userVO 系统用户值对象
	 * @return 受影响记录个数
	 */
	public int deleteByID(TblSysUserVO userVO);
}
