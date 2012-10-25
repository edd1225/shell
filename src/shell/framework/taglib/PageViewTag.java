/*
 * $Header: /var/lib/cvs/zjunicom/src/com/hollycrm/taglib/PageViewTag.java,v 1.2 2003/12/11 03:59:15 tiankai Exp $
 * $Revision: 1.2 $
 * $Date: 2003/12/11 03:59:15 $
 * ====================================================================
 *
 * ����������������������޹�˾
 */

package shell.framework.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.beanutils.PropertyUtils;

import shell.framework.taglib.support.PageViewObject;
/**
 * <pre>
 * ��ǩ�࣬������ʾ��ҳ���������
 * ���壺holly-page.tld
 * </pre>
 *
 * @author tiankai
 * @version $Revision: 1.2 $
 */

public class PageViewTag
    extends BodyTagSupport {

    protected String name = null;

    protected String rowListId = null;

    protected String totalPage = null;

    protected String totalCount = null;

    protected String currentName = null;

    protected String currentProperty = null;

    protected String currentPage = null;

    protected String scope = null;

    protected int perPageCount = 0;

    public int doStartTag() throws JspException {

        PageViewObject pageView = null;

        if ("page".equalsIgnoreCase(scope)) {
            pageView = (PageViewObject) pageContext.getAttribute(name,
                PageContext.PAGE_SCOPE);
        }
        else if ("request".equalsIgnoreCase(scope)) {
            pageView = (PageViewObject) pageContext.getAttribute(name,
                PageContext.REQUEST_SCOPE);
        }
        else if ("session".equalsIgnoreCase(scope)) {
            pageView = (PageViewObject) pageContext.getAttribute(name,
                PageContext.SESSION_SCOPE);
        }
        else if ("application".equalsIgnoreCase(scope)) {
            pageView = (PageViewObject) pageContext.getAttribute(name,
                PageContext.APPLICATION_SCOPE);
        }
        else {
            pageView = (PageViewObject) pageContext.findAttribute(name);
        }

        if (pageView != null) {

            if (rowListId != null) {
                pageContext.setAttribute(rowListId, pageView.getRowList());

            }
            if (currentName != null) {

                Object currentPageBean = pageContext.findAttribute(currentName);

                if (currentProperty != null) {
                    try {
                        currentPage = PropertyUtils.getSimpleProperty(
                            currentPageBean, currentProperty).toString();
                    }
                    catch (Exception ex) {
                        JspException e = new JspException(
                            "no currentProperty : " + currentProperty +
                            " ex : " + ex.getMessage());
                        throw e;
                    }
                }
                else {
                    currentPage = currentPageBean.toString();
                }

            }

            totalCount = "" + pageView.getTotalCount();
            totalPage = "" + pageView.getTotalPage();
            perPageCount = pageView.getPerPageCount();

            pageContext.setAttribute("PageViewTag", this);

            return (EVAL_BODY_INCLUDE);

        }

        return (SKIP_BODY);

    }

    public int doAfterBody() throws JspException {

//        if (true) {
//            return (EVAL_BODY_AGAIN);
//        } else {
//            return (SKIP_BODY);
//        }

        return super.doAfterBody();

    }

    public int doEndTag() throws JspException {

        // Clean up our started state
        pageContext.removeAttribute("PageViewTag", PageContext.PAGE_SCOPE);

        if (rowListId != null) {
            pageContext.removeAttribute(rowListId, PageContext.PAGE_SCOPE);

        }
        currentPage = null;
        totalCount = null;
        totalPage = null;

        // Continue processing this page
        return (EVAL_PAGE);

    }

    public void release() {

        super.release();

        name = null;
        rowListId = null;
        currentName = null;
        currentProperty = null;

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRowListId() {
        return rowListId;
    }

    public void setRowListId(String rowListId) {
        this.rowListId = rowListId;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getCurrentName() {
        return currentName;
    }

    public void setCurrentName(String currentName) {
        this.currentName = currentName;
    }

    public String getCurrentProperty() {
        return currentProperty;
    }

    public void setCurrentProperty(String currentProperty) {
        this.currentProperty = currentProperty;
    }

}
