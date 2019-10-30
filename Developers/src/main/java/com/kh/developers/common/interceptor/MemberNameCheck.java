package com.kh.developers.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.developers.member.model.vo.Member;

public class MemberNameCheck extends HandlerInterceptorAdapter {
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if(request.getSession().getAttribute("loginMember")!=null 
				&& ((Member)request.getSession().getAttribute("loginMember")).getMemName()==null) {
			String script="<script>";
			script+="var $ldcDiv=$('<div id=\"config-modal\" style=\"display: block; padding-left: 15px;\" class=\"blur info in modal\"></div>');";
			script+="var nameTag='<div class=\"modal_login_enroll\">';";
			script+="nameTag+='<div class=\"login_enroll\" style=\"width: 400px;\">';";
			script+="nameTag+='<div class=\"login_enroll_header\">';";
			script+="nameTag+='<span>회원가입</span>';";
			script+="nameTag+='<button id=\"modal_close\" type=\"button\">';";
			script+="nameTag+='<i class=\"fas fa-times\"></i>';";
			script+="nameTag+='</button>';";
			script+="nameTag+='</div>';";
			script+="nameTag+='<div class=\"modal-body\">';";
			script+="nameTag+='<div>';";
			script+="nameTag+='<h4>이름</h4>';";
			script+="nameTag+='<div class=\"form-group\">';";
			script+="nameTag+='<label class=\"control-label\">';";
			script+="nameTag+='<span style=\"display:none\">이름은 필수정보 입니다.</span>';";
			script+="nameTag+='</label>';";
			script+="nameTag+='<input type=\"text\" class=\"form-control\"></div>';";
			script+="nameTag+='<div class=\"checkbox\" >';";
			script+="nameTag+='<label class=\"\">';";
			script+="nameTag+='<input type=\"checkbox\" class=\"policy-checkbox\" style=\"top:15px;\" checked=\"\" label=\"맞춤 추천 등의 중요한 정보 받기\">';";
			script+="nameTag+='<span>맞춤 추천 등의 중요한 정보 받기</span>';";
			script+="nameTag+='</label></div>';";
			script+="nameTag+='<div class=\"modal-footer\">';";
			script+="nameTag+='<button id=\"signUpCompleteButton\" class=\"gray-button btn-block btn btn-default\" type=\"button\">완료</button></div></div></div></div>';";
			script+="nameTag+='<div role=\"presentation\" class=\"modal_area\"></div></div>';";
			script+="$ldcDiv.html(nameTag);";
			script+="$('#header').after($ldcDiv);";
			script+="</script>";
			modelAndView.addObject("script", script);
		}
		super.postHandle(request, response, handler, modelAndView);
	}

}
