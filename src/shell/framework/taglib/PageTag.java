/*
 * $Header: /var/lib/cvs/zjunicom/src/com/hollycrm/taglib/PageTag.java,v 1.2 2003/12/11 03:59:15 tiankai Exp $
 * $Revision: 1.2 $
 * $Date: 2003/12/11 03:59:15 $
 * ====================================================================
 *
 * ����������������������޹�˾
 */

package shell.framework.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * <pre>
 * ��ǩ�࣬������ʾ������ͼ������
 * ���壺btcc-logic.tld
 * </pre>
 *
 * @author ����
 * @version $Revision: 1.2 $
 */

public class PageTag
    extends BodyTagSupport {

    protected String eval = null;

    private int index;

    public int doStartTag() throws JspException {

        PageViewTag pageViewTag = (PageViewTag) pageContext.getAttribute(
            "PageViewTag");

        if (pageViewTag == null) {
            throw new JspException("no found pageViewTag in the scope.");
        }

        String evalRs = null;

        int current = Integer.parseInt(pageViewTag.currentPage);
        int totalPage = Integer.parseInt(pageViewTag.totalPage);
        int per = pageViewTag.perPageCount;

        if ("current".equalsIgnoreCase(eval)) {
            evalRs = (totalPage == 0 ? "" + 0 : pageViewTag.currentPage);
        }
        else if ("".equalsIgnoreCase(eval)) {
            evalRs = pageViewTag.totalCount;
        }
        else if ("totalPage".equalsIgnoreCase(eval)) {
            evalRs = pageViewTag.totalPage;
        }
        else if ("totalCount".equalsIgnoreCase(eval)) {
            evalRs = pageViewTag.totalCount;
        }
        else if ("next".equalsIgnoreCase(eval)) {
            int page = Math.min(current + 1, totalPage);
            evalRs = "" + page;
        }
        else if ("prev".equalsIgnoreCase(eval)) {
            int page = Math.max(current - 1, 1);
            evalRs = "" + page;
        }
        else if ("first".equalsIgnoreCase(eval)) {
            int page = (totalPage == 0 ? 0 : 1);
            evalRs = "" + page;
        }
        else if ("last".equalsIgnoreCase(eval)) {
            int page = totalPage;
            evalRs = "" + page;
        }
        else if ("index".equalsIgnoreCase(eval)) {
            int idx = index;
            evalRs = "" + (idx + (current - 1) * per + 1);
        }

        try {
            pageContext.getOut().print(evalRs);
        }
        catch (IOException ex) {
        }

        return (SKIP_BODY);
    }

    public int doEndTag() throws JspException {
        return (EVAL_PAGE);
    }

    public void release() {

        eval = null;

    }

    public String getEval() {
        return eval;
    }

    public void setEval(String eval) {
        this.eval = eval;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

}
