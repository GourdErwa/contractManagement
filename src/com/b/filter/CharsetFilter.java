package com.b.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * @author wei.Li by 16/3/10
 */
public class CharsetFilter implements Filter {

    private FilterConfig filterConfig;
    private String charset = "utf-8";

    @Override
    public void destroy() {
        filterConfig = null;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(charset);
        //response.setContentType("text/html;charset='" + charset + "'");
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig config) throws ServletException {
        this.filterConfig = config;
        String s = filterConfig.getInitParameter("encoding");
        if (s != null) {
            charset = s;
        }
    }

}
