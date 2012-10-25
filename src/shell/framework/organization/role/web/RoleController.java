/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: RoleController.java $
 * $LastChangedDate: 2012-9-22 下午10:56:33 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.organization.role.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import shell.framework.core.DefaultBeanFactory;
import shell.framework.core.SystemParam;
import shell.framework.dao.support.VOResult;
import shell.framework.model.TblSysRole;
import shell.framework.organization.role.service.TblSysRoleService;
import shell.framework.organization.role.vo.TblSysRoleVO;

/**
 * <p> 角色控制器 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-9-22 下午10:56:33 $
 */
@Controller
@RequestMapping("/web/organization/role/*")
public class RoleController {

	/**
	 * 索引所有的角色
	 * @param request
	 * @param currentPage
	 * @param departmentVO
	 * @return
	 */
	@RequestMapping(value="index")
	public ModelAndView index(HttpServletRequest request,@RequestParam(required=false) Integer currentPage ,TblSysRoleVO sysRoleVO){
		TblSysRoleService tblSysRoleService = (TblSysRoleService)DefaultBeanFactory.getBean("tblSysRoleService");
		if(currentPage==null || currentPage<=0){
			currentPage = 1;
		}
		VOResult voResult = tblSysRoleService.findByPagination(currentPage, SystemParam.PAGE_SIZE, sysRoleVO);
		return new ModelAndView("web/organization/role/index","voResult",voResult);
	}
	
	
	/**
	 * 删除选定角色-假删除
	 * @param request
	 * @param sysRoleVO
	 * @return
	 */
	@RequestMapping(value="delete")
	public ModelAndView delete(HttpServletRequest request , TblSysRoleVO sysRoleVO){
		TblSysRoleService tblSysRoleService = (TblSysRoleService)DefaultBeanFactory.getBean("tblSysRoleService");
		int rowNums = 0;
		if(sysRoleVO!=null && sysRoleVO.getRole()!=null && sysRoleVO.getRole().getId()!=null){
			rowNums = tblSysRoleService.deleteByID(sysRoleVO);
		}
		return new ModelAndView("redirect:/web/organization/role/index.action");
	}
	
	
	/**
	 * 新增系统角色 
	 * @param request
	 * @param sysRoleVO
	 * @return
	 */
	@RequestMapping(value="add")
	public ModelAndView add(HttpServletRequest request , TblSysRoleVO sysRoleVO){
		TblSysRoleService tblSysRoleService = (TblSysRoleService)DefaultBeanFactory.getBean("tblSysRoleService");
		int rowNums = 0;
		if(sysRoleVO!=null && !"".equals(sysRoleVO.getRole().getName()) ) {
			rowNums = tblSysRoleService.add(sysRoleVO);
		}
		return new ModelAndView("common/ok");
	}
	
	
	/**
	 * 加载更新页面
	 * @param request
	 * @param sysRoleVO
	 * @return
	 */
	@RequestMapping(value="preUpdate",method=RequestMethod.GET)
	public ModelAndView preUpdate(HttpServletRequest request , TblSysRoleVO sysRoleVO){
		TblSysRoleService tblSysRoleService = (TblSysRoleService)DefaultBeanFactory.getBean("tblSysRoleService");
		TblSysRole sysRole = null;
		if(sysRoleVO.getRole()!=null && !"".equals(sysRoleVO.getRole().getId())){
			sysRole  = tblSysRoleService.findRoleByID(sysRoleVO.getRole().getId().trim());
		}
		return new ModelAndView("web/organization/role/roleUpdate","tblSysRole",sysRole);
	}
	
	
	/**
	 * 更新角色
	 * @param request
	 * @param sysRoleVO
	 * @return
	 */
	@RequestMapping(value="update")
	public ModelAndView update(HttpServletRequest request , TblSysRoleVO sysRoleVO){
		TblSysRoleService tblSysRoleService = (TblSysRoleService)DefaultBeanFactory.getBean("tblSysRoleService");
		int rowNums = 0;
		rowNums = tblSysRoleService.update(sysRoleVO);
		return new ModelAndView("common/ok");
	}
	
	
	/**
	 * 索引指定角色拥有的全部功能
	 * @param request
	 * @param sysRoleVO 
	 * @return
	 */
	@RequestMapping(value="functionIndex")
	public ModelAndView functionIndex(HttpServletRequest request , TblSysRoleVO sysRoleVO){
		TblSysRoleService tblSysRoleService = (TblSysRoleService)DefaultBeanFactory.getBean("tblSysRoleService");
		Map<Object,Object> resultMap = tblSysRoleService.findFunctionByRoleID(sysRoleVO);
		request.setAttribute("funcOfRoleList", resultMap.get("funcOfRoleList"));
		return new ModelAndView("web/organization/role/functionIndex","treeList",resultMap.get("funcAllList"));
	}
	
	
	/**
	 * 保存指定角色的系统功能
	 * @param request
	 * @param sysRoleVO
	 * @return
	 */
	@RequestMapping(value="saveFunctionsOfRole")
	public ModelAndView saveFunctionsOfRole(HttpServletRequest request , TblSysRoleVO sysRoleVO){
		TblSysRoleService tblSysRoleService = (TblSysRoleService)DefaultBeanFactory.getBean("tblSysRoleService");
		int updateNum = tblSysRoleService.saveFunctionsOfRole(sysRoleVO);
		return new ModelAndView("common/ok");
	}
	
	
	
	
}




