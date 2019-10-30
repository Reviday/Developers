package com.kh.developers.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.developers.member.model.vo.Member;

public class LoginAdminCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getSession().getAttribute("loginMember")!=null 
				&& ((Member)request.getSession().getAttribute("loginMember")).getMemLevel()<5) {
			request.setAttribute("msg", "페이지 접근 권한이 없습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}  else {
			return super.preHandle(request, response, handler);
		}
	}

}
