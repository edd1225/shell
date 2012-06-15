/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: UserController.java $
 * $LastChangedDate: 2012-5-15 下午4:41:28 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.organization.user.web;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import shell.framework.core.DefaultBeanFactory;
import shell.framework.dao.support.VOResult;
import shell.framework.model.TblSysUser;
import shell.framework.organization.user.service.TblSysUserService;
import shell.framework.organization.user.vo.TblSysUserVO;

/**
 * <p> 人员管理控制器 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-15 下午4:41:28 $
 */
@Controller
@RequestMapping("/web/organization/user/*")
public class UserController {
	
	/**
	 * 索引所有的系统用户，分页查询
	 * @param request http请求
	 * @param currentPage 当前页
	 * @return 跳转的url
	 */
	@RequestMapping(value="index")
	public String index(HttpServletRequest request ,@RequestParam(required=false) Integer currentPage , TblSysUserVO userVO){
		TblSysUserService tblSysUserService = (TblSysUserService)DefaultBeanFactory.getBean("tblSysUserService");
		
		if(currentPage==null || currentPage<=0){
			currentPage = 1;
		}
		//二维表格方式，每页展现数据较多
		int pageSize =30;
		
		VOResult voResult = tblSysUserService.findByPagination(currentPage, pageSize, userVO);
		
		request.setAttribute("voResult", voResult);
		return "web/organization/user/index";
	}
	
	
	/**
	 * 删除系统用户，支持批量删除
	 * @param request
	 * @param userVO 系统用户值对象 ，删除时使用id字段值存储所有id值，以“-”分割
	 * 形如 id1-id2-id3-id4-id5-id6-id7
	 * @return 跳转链接
	 */
	@RequestMapping(value="delete")
	public String delete(HttpServletRequest request , TblSysUserVO userVO){
		TblSysUserService tblSysUserService = (TblSysUserService)DefaultBeanFactory.getBean("tblSysUserService");
		int rowNums = 0;
		if(userVO.getId()!=null && !"".equals(userVO.getId().trim())){
			rowNums = tblSysUserService.deleteByID(userVO);
		}
		//TODO 加入统一消息通知功能
		request.getSession().removeAttribute("SYS_MESSAGE_VALUE");
		request.getSession().removeAttribute("SYS_MESSAGE_TYPE");
		request.getSession().setAttribute("SYS_MESSAGE_TYPE","success");
		//TODO SYS_MESSAGE_VALUE中的值不能是字符串？，需要优化
		request.getSession().setAttribute("SYS_MESSAGE_VALUE", rowNums);
		return  "redirect:/web/organization/user/index.action";
	}
	
	
	@RequestMapping(value="add")
	public String add(HttpServletRequest request , TblSysUserVO userVO){
		TblSysUserService tblSysUserService = (TblSysUserService)DefaultBeanFactory.getBean("tblSysUserService");
		int rowNums = 0;
		if(userVO!=null && !"".equals(userVO.getUserCode()) && !"".equals(userVO.getPassword()) 
															&& !"".equals(userVO.getFullName())  ){
			rowNums = tblSysUserService.add(userVO);
		}
		
		//TODO 加入统一消息通知功能 成功 失败 提醒 各种通知信息框
		request.getSession().removeAttribute("SYS_MESSAGE_VALUE");
		request.getSession().removeAttribute("SYS_MESSAGE_TYPE");
		request.getSession().setAttribute("SYS_MESSAGE_TYPE","success");
		request.getSession().setAttribute("SYS_MESSAGE_VALUE", rowNums);
		
		return "redirect:/web/organization/user/index.action";
	}
	
	
	@RequestMapping(value="preUpdate",method=RequestMethod.GET)
	public String preUpdate(HttpServletRequest request , TblSysUserVO userVO){
		TblSysUserService tblSysUserService = (TblSysUserService)DefaultBeanFactory.getBean("tblSysUserService");
		TblSysUser sysUser = null;
		if(userVO.getId()!=null && !"".equals(userVO.getId())){
			sysUser  = tblSysUserService.findUserByID(userVO.getId());
		}
		request.setAttribute("tblSysUser", sysUser);
		return "web/organization/user/userUpdate";
	}
	
	
	@RequestMapping(value="update")
	public String update(HttpServletRequest request , TblSysUserVO userVO){
		TblSysUserService tblSysUserService = (TblSysUserService)DefaultBeanFactory.getBean("tblSysUserService");
		int rowNums = 0;
		rowNums = tblSysUserService.update(userVO);
		
		//TODO 加入统一消息通知功能 成功 失败 提醒 各种通知信息框
		request.getSession().removeAttribute("SYS_MESSAGE_VALUE");
		request.getSession().removeAttribute("SYS_MESSAGE_TYPE");
		request.getSession().setAttribute("SYS_MESSAGE_TYPE","success");
		request.getSession().setAttribute("SYS_MESSAGE_VALUE", rowNums);
		
		return "redirect:/web/organization/user/index.action";
	}
	
	
}