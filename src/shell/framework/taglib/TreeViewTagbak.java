/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: TreeViewTag.java $
 * $LastChangedDate: 2012-9-22 下午10:56:33 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.taglib;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import org.apache.commons.beanutils.PropertyUtils;
import shell.framework.taglib.support.TreeViewObject;

/**
 * 
 * <p> 树形标签实现 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-10-7 上午10:06:53 $
 */
@SuppressWarnings("serial")
public class TreeViewTagbak  extends BodyTagSupport {

    protected Iterator<TreeViewObject> iterator = null;

    protected String name = null;

    protected String property = null;

    protected String title = null;

    protected String imgfold = null;

    protected String imgxian = null;

    protected String param = null;

    protected String href = null;

    protected String target = null;

    protected String scope = null;

    protected String onclick = null;

    protected String ondblclick = null;

    protected String onmousedown = null;

    protected int multiply = 1;

    protected String space = null;

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

    public void setImgxian(String imgxian) {
        this.imgxian = imgxian;
    }

    public void setParam(String param) {
        this.param = param;
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

    public String getImgxian() {
        return imgxian;
    }

    public String getParam() {
        return param;
    }

    /**
     * 构建超链接标签
     * @param sb
     * @param obj
     */
    private void buildSuperLink(StringBuffer sb, TreeViewObject obj) {
        sb.append("<a id=\"");
        sb.append(obj.getId());
        sb.append("\" href=\"");
        sb.append(href);
        if (param != null && param.length() != 0) {
            if (href != null && href.indexOf("?") > 0)
                sb.append("&");
            else
                sb.append("?");
            sb.append(param);
            sb.append("=");
            sb.append(obj.getId());
        }
        if (target != null && target.length() != 0) {
            sb.append("\" target =\"");
            sb.append(target);
        }
        if (onclick != null && onclick.length() != 0) {
            sb.append("\" onClick=\"");
            sb.append(onclick);
        }
        if (ondblclick != null && ondblclick.length() != 0) {
            sb.append("\" onDblClick=\"");
            sb.append(ondblclick);
        }
        if (onmousedown != null && onmousedown.length() != 0) {
            sb.append("\" onMouseDown=\"");
            sb.append(onmousedown);
        }
        sb.append("\">");
    }

    /**
     * 构建树状结构 递归实现
     * @param it iterator对象
     * @param sb 
     * @param level 节点所处的层次
     */
    private void tree(Iterator<TreeViewObject> it, StringBuffer sb, int level) {
    	
        while (it.hasNext()) {
            TreeViewObject obj = (TreeViewObject) it.next();
            
            if (obj.getLevel() < level) {
                for (int i = 0; i < (level - obj.getLevel()); i++) {
                    sb.append("</div>\n");
                }
            }

            level = obj.getLevel();
            
            //有子节点 type属性作为有无子节点标志
            if (obj.getType() == TreeViewObject.HAS_SUB_NODE) {
                sb.append("<div>\n");
                //根据level级别添加缩进的space数量
                for (int i = 0; i < level; i++) {
                    for (int j = 0; j < multiply; j++) {
                        sb.append(space);
                    }
                }
                sb.append("<img id=\"foldheader\" align=\"ABSMIDDLE\" src=\"" + imgfold + "\">\n");
                this.buildSuperLink(sb, obj);
                sb.append(obj.getName());
                sb.append("</a>\n");
                sb.append("</div>\n");
                
                if (level == TreeViewObject.INIT_LEVEL) {
                    sb.append("<div>\n");
                }
                else {
                    sb.append("<div style=\"display:block\">\n");
                }
                this.tree(it, sb, level);
            }
            else {
                for (int i = 0; i < obj.getLevel(); i++) {
                    for (int j = 0; j < multiply; j++) {
                        sb.append(space);
                    }
                }
                sb.append("<img align=\"ABSMIDDLE\" src=\"" + imgxian + "\">\n");
                this.buildSuperLink(sb, obj);
                sb.append(obj.getName());
                sb.append("</a>\n");
                sb.append("<br>\n");
                this.tree(it, sb, level);
            }
        }
    }

    @SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
        Object it = null;

        if ("page".equalsIgnoreCase(scope)) {
            it = pageContext.getAttribute(name, PageContext.PAGE_SCOPE);
        }
        else if ("request".equalsIgnoreCase(scope)) {
            it = pageContext.getAttribute(name, PageContext.REQUEST_SCOPE);
        }
        else if ("session".equalsIgnoreCase(scope)) {
            it = pageContext.getAttribute(name, PageContext.SESSION_SCOPE);
        }
        else if ("application".equalsIgnoreCase(scope)) {
            it = pageContext.getAttribute(name, PageContext.APPLICATION_SCOPE);
        }

        if (property != null) {
            try {
                it = PropertyUtils.getProperty(it, property);
            }
            catch (Exception e) {
                throw new JspException(e);
            }
        }

        if (it == null) {
        	try {
				pageContext.getOut().print("集合为空!");
			} catch (IOException e) {
				e.printStackTrace();
			}
            return (SKIP_BODY);
        }

        if (space == null || space.trim().length() == 0) {
            this.space = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        }

        iterator = ( (Collection) it).iterator();

        StringBuffer sb = new StringBuffer();
        sb.append("<div>\n");
        sb.append(title);
        tree(iterator, sb, 1);
        sb.append("</div>\n");

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
        this.imgxian = null;
        this.href = null;
        this.param = null;
        this.target = null;
        this.scope = null;
        this.onclick = null;
        this.ondblclick = null;
        this.onmousedown = null;
        this.multiply = 1;
        this.space = null;
    }

    public String getOnclick() {
        return onclick;
    }

    public void setOnclick(String onclick) {
        this.onclick = onclick;
    }

    public String getOndblclick() {
        return ondblclick;
    }

    public void setOndblclick(String ondblclick) {
        this.ondblclick = ondblclick;
    }

    public String getOnmousedown() {
        return onmousedown;
    }

    public void setOnmousedown(String onmousedown) {
        this.onmousedown = onmousedown;
    }

    public int getMultiply() {
        return multiply;
    }

    public void setMultiply(int multiply) {
        this.multiply = multiply;
    }

    public String getSpace() {
        return space;
    }

    public void setSpace(String space) {
        this.space = space;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }
}
