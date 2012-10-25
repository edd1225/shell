package shell.framework.taglib;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;

import shell.framework.taglib.support.TreeNode;

/**
 * ��ɷֲ�ε������б�
 * ��ɵ��б�����
 * ROOT
 *   NODE1
 *      NODE11
 *      NODE12
 *   NODE2
 *      NODE21
 *      NODE22
 *
 * User: yejy
 * Date: 2003-10-15
 * Time: 17:47:20
 * To change this template use Options | File Templates.
 */
public class TreeListTag
    extends BodyTagSupport {

    protected Iterator iterator = null;

    protected String rootID = null;

    protected String name = null;

    protected String param = null;

    protected String scope = null;
    protected String id = null; //�����б���name
    protected String showChar = "--"; //�ָ��ַ�
    protected String showItemId = null; //��ʾ�������б���id��
    protected String showDefault = "0"; //�Ƿ���ʾ��Ϊ���е�Ĭ����   1����ʾ 0������ʾ

    public String getShowItemId() {
        return showItemId;
    }

    public void setShowItemId(String showItemId) {
        this.showItemId = showItemId;
    }

    public String getShowDefault() {
        return showDefault;
    }

    public void setShowDefault(String showDefault) {
        this.showDefault = showDefault;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getShowChar() {
        return showChar;
    }

    public void setShowChar(String showChar) {
        this.showChar = showChar;
    }

    public void setRootID(String rootID) {
        this.rootID = rootID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setScope(String scope) {
        this.scope = scope;
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

    public String getParam() {
        return param;
    }

    /**
     * ȡ�ø�ڵ�
     * ��ڵ�������� node.getParentId().equals("1");
     * @param treeDatas
     * @return
     */
    private TreeNode getRootNode(Collection treeDatas, String parentId) {
        Iterator iter = ( (Collection) treeDatas).iterator();

        while (iter.hasNext()) {
            TreeNode node = (TreeNode) iter.next();
            if (node.getParentID().equals(parentId)) {
                return node;
            }
        }
        return null;
    }

    private void getChild(String id, StringBuffer sb) {

    }

    /*private void tree(Collection treeDatas, StringBuffer sb, String parentID) {
        Iterator iter = ((Collection) treeDatas).iterator();
        //TreeNode rootNode=getRootNode(parentID);
        while (iter.hasNext()) {
            TreeNode node = (TreeNode) iter.next();
            if (node.getParentID().equals(parentID)) {
                sb.append("<option value=\"" + node.getID() + "\">" + node.getName() + "</option>");
                tree(treeDatas, sb, node.getID());
            } else {

            }
        }
        return;
         }*/

    private void tree(Collection treeDatas, StringBuffer sb, String parentID,
                      String strSpace) {
        Iterator iter = ( (Collection) treeDatas).iterator();
        //TreeNode rootNode=getRootNode(parentID);
        String strTemp = strSpace;
        while (iter.hasNext()) {
            strSpace = strTemp;
            TreeNode node = (TreeNode) iter.next();
            if (node.getParentID().equals(parentID)) {
                strSpace = strSpace + showChar;
                sb.append("<option value=\"" + node.getID() + "\" " +
                          (showItemId.equals(node.getID()) ? "selected" : "") +
                          " >" + strSpace + node.getName() + "</option>");
                tree(treeDatas, sb, node.getID(), strSpace);
            }
            else {

            }
        }
        strSpace = "";
        return;
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

        StringBuffer sb = new StringBuffer();
        String strSpace = ""; // ÿ���ڵ��ǰ���ַ�
        //ȡ�ø�ڵ�,��ڵ�ĸ��ڵ���"1"

        sb.append("<select name=\"" + id + "\">");
        TreeNode rootNode = getRootNode( (Collection) treeDatas, "1");
        if (rootNode != null) {
            if (showDefault.equals("1")) {
                sb.append("<option value=\"\">ѡ��</option>");
            }
            //sb.append("<option value=\"" + rootNode.getID() + "\">" + strSpace + rootNode.getName() + "</option>");
            // tree((Collection) treeDatas, sb, "100","");
            iterator = ( (Collection) treeDatas).iterator();
            while (iterator.hasNext()) {
                TreeNode node = (TreeNode) iterator.next();
                if (node.getParentID().equals(rootNode.getID())) { //ȡ�ø�ڵ�ĵ�һ���ӽڵ�
                    strSpace = showChar;
                    sb.append("<option value=\"" + node.getID() + "\" " +
                              (showItemId.equals(node.getID()) ? "selected" :
                               "") + " >" + strSpace + node.getName() +
                              "</option>");
                    tree( (Collection) treeDatas, sb, node.getID(), strSpace);
                }
                else {
                    strSpace = showChar;
                }
            }
        }
        else {
            sb.append("<option value=\"\"></option>");
        }
        sb.append("</select>");
        try {
            pageContext.getOut().print(sb.toString());
        }
        catch (IOException e) {
        }

        return (SKIP_BODY);
    }

    public int doEndTag() throws JspException {

        return (EVAL_PAGE);
    }

    public void release() {

        super.release();

        this.iterator = null;
        this.name = null;
        this.param = null;
        this.scope = null;
    }

}
