package shell.framework.taglib;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;

import shell.framework.taglib.support.TreeNode;

public class TreeTag
    extends BodyTagSupport {

    protected Iterator iterator = null;

    protected String rootID = null;

    protected String name = null;

    protected String title = null;

    protected String imgfold = null;

    protected String param = null;

    protected String href = null;

    protected String target = null;

    protected String scope = null;

    public void setRootID(String rootID) {
        this.rootID = rootID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public void setImgfold(String imgfold) {
        this.imgfold = imgfold;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public String getRootID() {
        return rootID;
    }

    public String getName() {
        return name;
    }

    public String getScope() {
        return scope;
    }

    public String getTitle() {
        return title;
    }

    public String getHref() {
        return href;
    }

    public String getTarget() {
        return target;
    }

    public String getImgfold() {
        return imgfold;
    }

    public String getParam() {
        return param;
    }

    private void tree(Iterator iter, StringBuffer sb, int level) {
        while (iter.hasNext()) {
            TreeNode node = (TreeNode) iter.next();
            String nodeType = (node.getIsLeaf() == 0) ? "folder" : "file";
            String url = href + "?" + param + "=" + node.getID();
            sb.append("tree.addNode(new node('" + node.getID() + "','" +
                      node.getName() + "','" + node.getParentID() + "','" +
                      nodeType + "','" + url + "','" + target + "'));\n");
        }
    }

    public int doStartTag() throws JspException {
        Object treeDatas = null;

        if ("page".equalsIgnoreCase(scope)) {
            treeDatas = pageContext.getAttribute(name, PageContext.PAGE_SCOPE);
        }
        else if ("request".equalsIgnoreCase(scope)) {
            treeDatas = pageContext.getAttribute(name,
                                                 PageContext.REQUEST_SCOPE);
        }
        else if ("session".equalsIgnoreCase(scope)) {
            treeDatas = pageContext.getAttribute(name,
                                                 PageContext.SESSION_SCOPE);
        }
        else if ("application".equalsIgnoreCase(scope)) {
            treeDatas = pageContext.getAttribute(name,
                                                 PageContext.APPLICATION_SCOPE);
        }

        if (treeDatas == null) {
            return (SKIP_BODY);
        }

        iterator = ( (Collection) treeDatas).iterator();

        StringBuffer sb = new StringBuffer();
        sb.append("<script type='text/javascript'>\n");
        if (imgfold != null) {
            sb.append("imageDir = '" + imgfold + "';\n");
            sb.append("setImageFiles();\n");
        }
        sb.append("var tree = new tree();\n");
        sb.append("var root = new root('" + rootID + "','" + title +
                  "','','');\n");
        sb.append("tree.addRoot(root)\n");
        tree(iterator, sb, 1);
        sb.append("tree.drawRoot();\n");
        sb.append("tree.drawNodes(tree.root);\n");
        sb.append("</script>\n");

        try {
            pageContext.getOut().print(sb.toString());
        }
        catch (IOException e) {}

        return (SKIP_BODY);
    }

    public int doEndTag() throws JspException {

        return (EVAL_PAGE);
    }

    public void release() {

        super.release();

        this.iterator = null;
        this.name = null;
        this.title = null;
        this.imgfold = null;
        this.href = null;
        this.param = null;
        this.target = null;
        this.scope = null;
    }
}
