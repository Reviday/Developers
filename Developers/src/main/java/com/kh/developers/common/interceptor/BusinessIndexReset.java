package com.kh.developers.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.developers.member.model.vo.Member;

public class BusinessIndexReset extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(request.getHeader("referer")==null) {
			request.getSession().setAttribute("applIndex",0);
			request.getSession().setAttribute("applcPage",1);
		}else if(request.getHeader("referer")!=null&&request.getRequestURL().indexOf("appl")<0) {
			request.getSession().setAttribute("applIndex",0);
			request.getSession().setAttribute("applcPage",1);
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
}
