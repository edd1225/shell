/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: DepartmentController.java $
 * $LastChangedDate: 2012-6-28 下午9:08:37 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.organization.department.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import shell.framework.core.DefaultBeanFactory;
import shell.framework.core.SystemParam;
import shell.framework.dao.support.VOResult;
import shell.framework.model.TblSysDepartment;
import shell.framework.model.TblSysUser;
import shell.framework.organization.department.service.TblSysDepartmentService;
import shell.framework.organization.department.vo.TblSysDepartmentVO;
import shell.framework.organization.user.service.TblSysUserService;
import shell.framework.organization.user.vo.TblSysUserVO;

/**
 * <p> 部门控制器 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-6-28 下午9:08:37 $
 */
@Controller
@RequestMapping("/web/organization/department/*")
public class DepartmentController {

	/**
	 * 索引所有的部门-分页
	 * @param request
	 * @param currentPage
	 * @param departmentVO 部门值对象
	 * @return ModelAndView对象
	 */
	@RequestMapping(value="index")
	public ModelAndView index(HttpServletRequest request,@RequestParam(required=false) Integer currentPage , TblSysDepartmentVO departmentVO){
		TblSysDepartmentService departmentService = (TblSysDepartmentService)DefaultBeanFactory.getBean("tblSysDepartmentService");
		if(currentPage==null || currentPage<=0){
			currentPage = 1;
		}
		VOResult voResult = departmentService.findByPagination(currentPage, SystemParam.PAGE_SIZE, departmentVO);
		return new ModelAndView("web/organization/department/index","voResult",voResult);
	}
	
	
	/**
	 * 索引部门下的所有的用户
	 * @param currentPage
	 * @param departmentVO
	 * @return
	 */
	@RequestMapping(value="userIndex")
	public ModelAndView userIndex(@RequestParam(required=false) Integer currentPage , TblSysDepartmentVO departmentVO){
		TblSysDepartmentService departmentService = (TblSysDepartmentService)DefaultBeanFactory.getBean("tblSysDepartmentService");
		if(currentPage==null || currentPage<=0){
			currentPage = 1;
		}
		VOResult voResult = departmentService.findUserByPagination(currentPage, SystemParam.PAGE_SIZE, departmentVO.getId());
		return new ModelAndView("web/organization/department/userIndex","voResult",voResult);
	}
	
	
	/**
	 * 增加部门
	 * @param request
	 * @param userVO
	 * @return
	 */
	@RequestMapping(value="add")
	public ModelAndView add(HttpServletRequest request , TblSysDepartmentVO departmentVO){
		TblSysDepartmentService departmentService = (TblSysDepartmentService)DefaultBeanFactory.getBean("tblSysDepartmentService");
		int rowNums = 0;
		if(departmentVO!=null && !"".equals(departmentVO.getDepartmentName()) && !"".equals(departmentVO.getDepartmentType()) 
		   && !"".equals(departmentVO.getParentID()) && !"".equals(departmentVO.getOrganizationID()) ){
			//TODO 这里设置默认值
			departmentVO.setIsValid(SystemParam.IS_VALID);
			rowNums = departmentService.add(departmentVO);
		}
		request.getSession().setAttribute("SYS_MESSAGE_TYPE","success");
		request.getSession().setAttribute("SYS_MESSAGE_VALUE", "成功添加"+rowNums+"条记录.");
		return new ModelAndView("redirect:/web/organization/department/index.action");
	}
	
	
	/**
	 * 删除部门,根据部门id，支持批量删除
	 * @param request
	 * @param departmentVO
	 * @return
	 */
	@RequestMapping(value="delete")
	public ModelAndView delete(HttpServletRequest request , TblSysDepartmentVO departmentVO){
		TblSysDepartmentService departmentService = (TblSysDepartmentService)DefaultBeanFactory.getBean("tblSysDepartmentService");
		int rowNums = 0;
		if(departmentVO.getId()!=null && !"".equals(departmentVO.getId().trim())){
			rowNums = departmentService.deleteByID(departmentVO);
		}
		request.getSession().setAttribute("SYS_MESSAGE_TYPE","success");
		request.getSession().setAttribute("SYS_MESSAGE_VALUE", "成功删除"+rowNums+"条记录.");
		return new ModelAndView("redirect:/web/organization/department/index.action");
	}
	
	
	/**
	 * 加载更新页面
	 * @param request
	 * @param userVO
	 * @return
	 */
	@RequestMapping(value="preUpdate",method=RequestMethod.GET)
	public ModelAndView preUpdate(HttpServletRequest request , TblSysDepartmentVO departmentVO){
		TblSysDepartmentService departmentService = (TblSysDepartmentService)DefaultBeanFactory.getBean("tblSysDepartmentService");
		TblSysDepartment sysDepartment = null;
		if(departmentVO.getId()!=null && !"".equals(departmentVO.getId())){
			sysDepartment  = departmentService.findDepartmentByID(departmentVO.getId());
		}
		return new ModelAndView("web/organization/department/departmentUpdate","tblSysDepartment",sysDepartment);
	}
	
	
	/**
	 * 更新系统部门
	 * @param request
	 * @param userVO
	 * @return
	 */
	@RequestMapping(value="update")
	public ModelAndView update(HttpServletRequest request , TblSysDepartmentVO departmentVO){
		TblSysDepartmentService departmentService = (TblSysDepartmentService)DefaultBeanFactory.getBean("tblSysDepartmentService");
		int rowNums = 0;
		rowNums = departmentService.update(departmentVO);
		request.getSession().setAttribute("SYS_MESSAGE_TYPE","success");
		request.getSession().setAttribute("SYS_MESSAGE_VALUE", "成功更新"+rowNums+"条记录.");
		return new ModelAndView("redirect:/web/organization/department/index.action");
	}
	
}
