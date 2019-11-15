package com.kh.developers.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.developers.admin.model.service.AdminService;
import com.kh.developers.admin.model.vo.RequestMappingLog;
import com.kh.developers.member.model.vo.Member;

public class InsertRequestMappingLog extends HandlerInterceptorAdapter{
	
	@Autowired
	private AdminService service;
	private RequestMappingLog rml;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		rml=new RequestMappingLog();
		// loginMember 정보가 있으면 정보를 저장한다.
		Member m=(Member)request.getSession().getAttribute("loginMember");
		if(m!=null) {
			rml.setRmlMemNo(m.getMemNo());
			rml.setRmlUserEmail(m.getMemEmail());
		} else {
			rml.setRmlMemNo(00000);
			rml.setRmlUserEmail("비회원");
		}
		// 나머지 request 정보를 저장하도록 한다.
		// ip
		rml.setRmlIp(request.getRemoteAddr());
		// useragent
		rml.setRmlUseragent(request.getHeader("User-Agent"));
		// url&referer
		// 일반 로컬서버용과 학원서버용 두가지 가능성을 나눠서 처리해야함.
		// 일반 로컬 서버에서는 /developers 
		// 학원서버용은 /19PM_Developers_final
		String check="";
		if(request.getRequestURI().indexOf("/developers")>=0) {
			//일반 로컬 서버
			check="/developers";
			
		} else if(request.getRequestURI().indexOf("/19PM_Developers_final")>=0) {
			//학원 서버용
			check="/19PM_Developers_final";
		} else {
			//보통 있을 수 없지만 만약 위 두가지 중 예외가 존재한다면 
			//server에서 설정을 기본값인 spring으로 했을 경우. 
			check="/spring";
			//위가 아닌 다른 예외 상황이 온다고 한다면, 기록은 하되 조인할때 기타 값이 null로 출력될 것임.
		}
		rml.setRmlUrl(request.getRequestURI().replace(check, ""));
		rml.setRmlReferer((request.getHeader("referer").substring(request.getHeader("referer").indexOf(check))).replace(check, ""));
		service.insertRequestMappingLog(rml);
		super.postHandle(request, response, handler, modelAndView);
	}
}
