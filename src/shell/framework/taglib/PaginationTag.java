/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: PaginationTag.java $
 * $LastChangedDate: 2012-5-24 下午3:03:18 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.taglib;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * <p> @SHELL 翻页自定义标签实现类 </p>
 * <shell_services:pagination currentPageNO="xxx" totalPages="xxx"></shell_services:pagination>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-5-24 下午3:03:18 $
 */
@SuppressWarnings("serial")
public class PaginationTag extends TagSupport {

	private int currentPageNO;
	private int totalPages;
	private PageContext pageContext;
	
	/**
	 * 将父类中的pageContext设置到自定义tag中
	 */
	public void setPageContext(PageContext pageContext) {
		this.pageContext = pageContext;
	}
	
	/**
	 * @return the currentPageNO
	 */
	public int getCurrentPageNO() {
		return currentPageNO;
	}


	/**
	 * @param currentPageNO the currentPageNO to set
	 */
	public void setCurrentPageNO(int currentPageNO) {
		this.currentPageNO = currentPageNO;
	}


	/**
	 * @return the totalPages
	 */
	public int getTotalPages() {
		return totalPages;
	}


	/**
	 * @param totalPages the totalPages to set
	 */
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}


	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagSupport#doStartTag()
	 */
	@Override
	public int doStartTag() throws JspException {
		
		try{
			JspWriter out = this.pageContext.getOut();
			if(this.currentPageNO<=0){
				out.println("NO CURRENTPAGENO SPECIFIED!");
				return SKIP_BODY;
			}
			if(this.totalPages<0){
				out.println("NO TOTALPAGES SPECIFIED!");
				return SKIP_BODY;
			}

			if(currentPageNO>totalPages){
				out.println("");
				return SKIP_BODY;
			}
			
			
			out.println("<div class='shell_pagination_navi'>");
			out.println("<ul>");
			
			//判断是否是首页
			if(currentPageNO<=1){
				out.println("<li class='disablepage'>&lt;&lt;</li>");
			}else{
				out.println("<li class='nextpage'><a href='javascript:void(0);' onclick='doPaging("+ ((currentPageNO-1)<=0?1:currentPageNO-1) +");'>" + "&lt;&lt;</a></li>");
			}
			
			
			//总页数大于10页
			if(totalPages>10){
				//当前页大于第5页	
				if(currentPageNO>5){
					//-----------------------------------前面页码-----------------------------
					int tempData = currentPageNO/10;
					if(tempData==0){
						showPaginationTag(out,1,1);
					}else if(tempData>=1){
						if(currentPageNO%10>1){
							out.println("<li>...</li>");
						}
						
						int tempCurrentPageNO = 1;
						//TODO 前面页码标签太多，应该控制在4个以内，与后续页码个数相同
						for(int j=0;j<tempData;j++){
							tempCurrentPageNO = j*10 + (currentPageNO%10);
							int tempD = (tempCurrentPageNO==0)? 1 : tempCurrentPageNO;
							showPaginationTag(out,tempD,tempD);
						}
					}
					
					//-----------------------------------中间页码-----------------------------
					out.println("<li>...</li>");
					showPaginationTag(out,currentPageNO-2,currentPageNO);
					if((currentPageNO+4)<totalPages){
						showPaginationTag(out,currentPageNO+1,currentPageNO+2);
					}else{
						// 列出从当前页的下一页到最后一页页码
						showPaginationTag(out,currentPageNO+1,totalPages);
					}
				}else {
					// 列出前面5条页码
					showPaginationTag(out,1,5);
				}
				//----------------------------------------后续页码-----------------------------
				if((currentPageNO+4)<totalPages){
					out.println("<li>...</li>");
					int tempData = (totalPages-currentPageNO)/10;
					if(tempData==0){
						showPaginationTag(out,totalPages,totalPages);
					}else if(tempData>=1){
						//列出后续页码大于当前页码10条以上的页码
						int tempCurrentPageNO = currentPageNO;
						for(int j=1;j<=tempData;j++){
							//在当前页码之上加10得出新页码数，最多列出4个页码
							if(j>4) break;
							tempCurrentPageNO = tempCurrentPageNO + 10;
							showPaginationTag(out,tempCurrentPageNO,tempCurrentPageNO);
						}
						if(tempCurrentPageNO<totalPages){
							out.println("<li>...</li>");
						}
					}
				}
				
				
				
				
			}else{
				// 循环列出10页以内页码
				showPaginationTag(out,1,totalPages);
			}
			
			if(currentPageNO<totalPages){
				out.println("<li class='nextpage'><a href='javascript:void(0);' onclick='doPaging("+ (currentPageNO+1) +");'>" + "&gt;&gt;</a></li>");
			}else{
				out.println("<li class='disablepage'>&gt;&gt;</li>");
			}
			out.println("</ul></div>");
			
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
	
	/**
	 * 组装页码HTML
	 * @param out
	 * @param startWithPageNO
	 * @param endWithPageNO
	 */
	private void showPaginationTag(JspWriter out,int startWithPageNO,int endWithPageNO){
		for(int pageNO=startWithPageNO;pageNO<=endWithPageNO;pageNO++){
			try {
				//当前页
				if(currentPageNO==pageNO){
					out.println("<li class='currentpage'>" + pageNO + "</li>");
				}else{
					out.println("<li><a href='javascript:void(0);' onclick='doPaging("+ pageNO +");'>" + pageNO +"</a></li>");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
