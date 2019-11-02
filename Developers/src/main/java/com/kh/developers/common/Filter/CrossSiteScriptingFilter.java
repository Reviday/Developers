package com.kh.developers.common.Filter;

import org.springframework.web.filter.OncePerRequestFilter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CrossSiteScriptingFilter extends OncePerRequestFilter {
	@Override
	protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			FilterChain filterChain) throws ServletException, IOException {
		if (httpServletRequest.getMethod().equals("GET") || httpServletRequest.getMethod().equals("POST")) {
			filterChain.doFilter(new RequestWrapperForXssFiltering(httpServletRequest), httpServletResponse);
		} else {
			filterChain.doFilter(httpServletRequest, httpServletResponse);
		}
	}
}
