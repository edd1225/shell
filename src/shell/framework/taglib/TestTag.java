/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: TestTag.java $
 * $LastChangedDate: 2012-4-27 下午3:51:15 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * <p> 测试自定义标签TESTTAG </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-4-27 下午3:51:15 $
 */
@SuppressWarnings("serial")
public class TestTag extends TagSupport {

	private String key;
	
	/**
	 * @return the key
	 */
	public String getKey() {
		return key;
	}


	/**
	 * @param key the key to set
	 */
	public void setKey(String key) {
		this.key = key;
	}


	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagSupport#doStartTag()
	 */
	@Override
	public int doStartTag() throws JspException {
		try{
			
		JspWriter out = this.pageContext.getOut();
		
		if(key==null || "".equals(key)){
			out.println("no KEY be found!");
			return SKIP_BODY;
		}
		
		out.println("<table width='500px' border='1' align='center'>");

        out.println("<tr>");

        out.println("<td width='20%'>Username:</td>");

        out.println("<td>" + "username" + "</td>");

        out.println("</tr>");

        out.println("<tr>");

        out.println("<td>KEY:</td>");

        out.println("<td>" + getKey() + "</td>");

        out.println("</tr>");

        out.println("<tr>");

        out.println("<td>Email:</td>");

        out.println("<td>" + "useremail" + "</td>");

        out.println("</tr>");

        out.println("</table>");
		
		}catch(Exception e){
			e.printStackTrace();
			throw new JspException(e.getMessage());
		}
		
		return SKIP_BODY;
	}
	
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagSupport#doEndTag()
	 */
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
	
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagSupport#release()
	 */
	@Override
	public void release() {
		super.release();
	}
	
	
}
