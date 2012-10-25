/*
 * $Header: /var/lib/cvs/zjunicom/src/com/hollycrm/taglib/TreeViewTag.java,v 1.2 2003/12/11 03:59:15 tiankai Exp $
 * $Revision: 1.2 $
 * $Date: 2003/12/11 03:59:15 $
 * ====================================================================
 *
 * ����������������������޹�˾
 */
package shell.framework.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.beanutils.PropertyUtils;

/**
 * ��HTML��ǩ�滻Ϊ&lt;&gt;�ٽ�\n��\r��\r\n�滻Ϊ<br>
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
public class EscapeCSVTag extends BodyTagSupport {

    protected String name;
    protected String property;
    protected String scope;
    protected String str;

    public int doStartTag() throws JspException {
        Object bean = null;

        if ("page".equalsIgnoreCase(scope)) {
            bean = pageContext.getAttribute(name, PageContext.PAGE_SCOPE);
        }
        else if ("request".equalsIgnoreCase(scope)) {
            bean = pageContext.getAttribute(name, PageContext.REQUEST_SCOPE);
        }
        else if ("session".equalsIgnoreCase(scope)) {
            bean = pageContext.getAttribute(name, PageContext.SESSION_SCOPE);
        }
        else if ("application".equalsIgnoreCase(scope)) {
            bean = pageContext.getAttribute(name, PageContext.APPLICATION_SCOPE);
        }
        else {
            bean = pageContext.findAttribute(name);
        }

        if (property != null && property.trim().length() != 0) {
            try {
                str = (String) PropertyUtils.getProperty(bean, property);
            }
            catch (Exception ex) {
                throw new JspException(ex);
            }
        }
        else {
            str = bean.toString();
        }

        try {
            pageContext.getOut().print(replaceQuote2DblQuot(str));
        }
        catch (IOException ex) {
            throw new JspException(ex);
        }

        return (SKIP_BODY);
    }

    public int doEndTag() throws JspException {
        return (EVAL_PAGE);
    }

    public void release() {
        super.release();
    }

    // constants used by escapeHTMLTags
    private static final char[] QUOTE_ENCODE = "&quot;".toCharArray();
    private static final char[] AMP_ENCODE = "&amp;".toCharArray();
    private static final char[] LT_ENCODE = "&lt;".toCharArray();
    private static final char[] GT_ENCODE = "&gt;".toCharArray();
    private static final char[] APOS_ENCODE = "&apos;".toCharArray();

    /**
     * This method takes a string which may contain HTML tags (ie, &lt;b&gt;,
     * &lt;table&gt;, etc) and converts the '&lt'' and '&gt;' characters to
     * their HTML escape sequences.
     *
     * @param in the text to be converted.
     * @return the input string with the characters '&lt;' and '&gt;' replaced
     *  with their HTML escape sequences.
     */
    public static final String escapeHTMLTags(String in) {
        if (in == null) {
            return null;
        }
        char ch;
        int i=0;
        int last=0;
        char[] input = in.toCharArray();
        int len = input.length;
        StringBuffer out = new StringBuffer((int)(len*1.3));
        for (; i < len; i++) {
            ch = input[i];
            if (ch > '>') {
                continue;
            } else if (ch == '<') {
                if (i > last) {
                    out.append(input, last, i - last);
                }
                last = i + 1;
                out.append(LT_ENCODE);
            } else if (ch == '>') {
                if (i > last) {
                    out.append(input, last, i - last);
                }
                last = i + 1;
                out.append(GT_ENCODE);
            }
        }
        if (last == 0) {
            return in;
        }
        if (i > last) {
            out.append(input, last, i - last);
        }
        return out.toString();
    }

    // constants used by replaceRT2BR
    private static final String BR = "<br>";
    /**
     * ��'\"'�滻Ϊ'\"\"'
     * @param in String
     * @return String
     */
    public static final String replaceQuote2DblQuot(String in) {
        return replace(in, "\"", "\"\"");
    }

    /**
     * Replaces all instances of oldString with newString in line.
     *
     * @param line the String to search to perform replacements on
     * @param oldString the String that should be replaced by newString
     * @param newString the String that will replace all instances of oldString
     *
     * @return a String will all instances of oldString replaced by newString
     */
    public static final String replace( String line, String oldString, String newString )
    {
        if (line == null) {
            return null;
        }
        int i=0;
        if ( ( i=line.indexOf( oldString, i ) ) >= 0 ) {
            char [] line2 = line.toCharArray();
            char [] newString2 = newString.toCharArray();
            int oLength = oldString.length();
            StringBuffer buf = new StringBuffer(line2.length);
            buf.append(line2, 0, i).append(newString2);
            i += oLength;
            int j = i;
            while( ( i=line.indexOf( oldString, i ) ) > 0 ) {
                buf.append(line2, j, i-j).append(newString2);
                i += oLength;
                j = i;
            }
            buf.append(line2, j, line2.length - j);
            return buf.toString();
        }
        return line;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getProperty() {
        return property;
    }
    public void setProperty(String property) {
        this.property = property;
    }
    public String getScope() {
        return scope;
    }
    public void setScope(String scope) {
        this.scope = scope;
    }

    public static void main(String[] args) {

    }

}
