/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * ClassName: AuthorityTag.java
 * CreatedTime: 12-12-14 下午4:20
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.taglib;

import shell.framework.authorization.service.AuthorizationService;
import shell.framework.authorization.vo.LoginInfo;
import shell.framework.core.DefaultBeanFactory;
import shell.framework.core.SystemParam;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;

/**
 * <p> @SHELL 页面权限资源标注自定义标签实现类
 *     1.通过此标签可以标注页面元素为权限资源
 *     2.可以对包含其中的body元素进行操作，如隐藏、只读、可操作
 * </p>
 *
 * @author changming.Y
 * @version 1.0   12-12-14 下午4:20
 */
public class AuthorityTag extends BodyTagSupport {

    //权限资源唯一ID
    private String authorityID;
    //权限资源类型 - PAGE COMMAND CLASS
    private String type;
    //权限资源的操作
    private String operate;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAuthorityID() {
        return authorityID;
    }

    public void setAuthorityID(String authorityID) {
        this.authorityID = authorityID;
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate;
    }

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = pageContext.getOut();
        try {
            AuthorizationService authService = (AuthorizationService) DefaultBeanFactory.getBean(AuthorizationService.BEAN_ID);
            Object loginInfo = this.pageContext.getSession().getAttribute(SystemParam.SESSIOIN_ID_LOGIN_INFO);
            if(loginInfo == null || ((LoginInfo) loginInfo).getRoleList() == null) {
                out.println("NO ROLE DATA!");
                return SKIP_BODY;
            }
            if(!authService.hasAuthority(((LoginInfo)loginInfo).getRoleList(),null,getAuthorityID())) return SKIP_BODY;

        } catch (IOException e) {
            e.printStackTrace();
        }
        return EVAL_BODY_INCLUDE;
    }

    @Override
    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }

    @Override
    public void release() {
        super.release();
        this.authorityID = null;
        this.type = null;
        this.operate = null;
    }

    @Override
    public void doInitBody() throws JspException {
        //TODO something...
    }

    @Override
    public int doAfterBody() throws JspException {
        //TODO something...
        return 0;
    }
}
