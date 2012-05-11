package shell.framework.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 字符编码过滤器-统一所有request请求时的字符编码
 * @author yangchangming
 * @version 1.0
 *
 */
public class RequestEncodingFilter implements Filter {

	private String characterEncoding = "UTF-8";
	
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if(request.getCharacterEncoding()==null){
			request.setCharacterEncoding(this.characterEncoding);
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException {
		if(config!=null && config.getInitParameterNames().hasMoreElements()){
			characterEncoding = config.getInitParameter("characterEncoding");
		}
	}

}
