package com.kh.developers.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.developers.member.model.vo.Member;

public class BusinessIndexReset extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println(request.getHeader("referer").indexOf("business"));
		if(request.getHeader("referer").indexOf("business")<0) {
			System.out.println("dd");
			request.getSession().setAttribute("applIndex",0);
		}
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(request.getHeader("referer").indexOf("business")<0) {
			System.out.println("dd");
			request.getSession().setAttribute("applIndex",0);
		}
		super.postHandle(request, response, handler, modelAndView);
	}

}
