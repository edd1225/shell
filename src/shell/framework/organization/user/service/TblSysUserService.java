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

/**
 * <p> 系统用户管理服务类 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-17 下午4:22:37 $
 */
public interface TblSysUserService {

	public VOResult findByPagination(int currentPage , int pageSize);
	
	public TblSysUser findUserByID(Serializable id);
	
	
}
