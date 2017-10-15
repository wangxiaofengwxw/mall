package com.situ.mall.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.situ.mall.pojo.User;

public class LoginFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String uri = req.getRequestURI();
		String requestPath = uri.substring(uri.lastIndexOf("/") + 1, uri.length());
		if (requestPath.equals("toLogin.shtml") 
				|| requestPath.equals("login.shtml")) {
			chain.doFilter(request, response);
		} else {
			HttpSession  session = req.getSession();
			User user = (User) session.getAttribute("isUser");
			if (user == null) {
				System.out.println(req.getContextPath());
				resp.sendRedirect(req.getContextPath()+"/index/toLogin.shtml");
				return;
			}
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {
		
	}

}
