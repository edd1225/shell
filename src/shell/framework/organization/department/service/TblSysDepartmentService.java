/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: TblSysDepartmentService.java $
 * $LastChangedDate: 2012-6-26 下午5:30:26 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.organization.department.service;

import java.io.Serializable;

import shell.framework.dao.support.VOResult;
import shell.framework.model.TblSysDepartment;
import shell.framework.organization.department.vo.TblSysDepartmentVO;

/**
 * <p> 系统部门服务类接口定义 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-6-26 下午5:30:26 $
 */
public interface TblSysDepartmentService {

	/**
	 * 分页查询
	 * @param currentPage 当前查询起始页码
	 * @param pageSize 每页显示记录条数
	 * @param departmentVO 系统部门值对象
	 * @return 分页对象
	 */
	public VOResult findByPagination(int currentPage , int pageSize, TblSysDepartmentVO departmentVO);
	
	/**
	 * 查询单个系统部门记录，根据记录id
	 * @param id 记录唯一id
	 * @return 系统部门对象
	 */
	public TblSysDepartment findDepartmentByID(Serializable id);
	
	/**
	 * 根据系统部门ID删除部门，支持批量删除
	 * @param departmentVO 系统部门值对象 ，删除时使用id字段值存储所有id值，以“-”分割
	 * 形如 id1-id2-id3-id4-id5-id6-id7
	 * @return 受影响记录个数
	 */
	public int deleteByID(TblSysDepartmentVO departmentVO);
	
	/**
	 * 增加系统部门
	 * @param departmentVO 系统部门值对象
	 * @return 受影响记录数
	 */
	public int add(TblSysDepartmentVO departmentVO);
	
	/**
	 * 更新系统部门
	 * @param departmentVO 系统部门值对象
	 * @return 受影响记录数
	 */
	public int update(TblSysDepartmentVO departmentVO);
	
	/**
	 * 查询部门下所有的岗位信息
	 * @param currentPage 当前页码
	 * @param pageSize 每页记录条数
	 * @param departmentId 部门ID
	 * @return 分页对象-存储岗位对象
	 */
	public VOResult findPositionByPagination(int currentPage , int pageSize, Serializable departmentId);
	
	/**
	 * 给部门设立岗位，批量设置
	 * @param departmentId 部门ID
	 * @param positionIds 岗位id-数组
	 */
	public int assignPosition(final String departmentId , String[] positionIds);
	
	/**
	 * 分页查询部门人员
	 * @param currentPage
	 * @param pageSize
	 * @param departmentId 部门id
	 * @return 分页对象-人员
	 */
	public VOResult findUserByPagination(int currentPage , int pageSize, Serializable departmentId);
	
	/**
	 * 按照数组次序重新给部门进行排序
	 * @param departmentIds 部门id数组
	 */
	public void reOrder(String[] departmentIds);
	
}