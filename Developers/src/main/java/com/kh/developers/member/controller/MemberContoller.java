package com.kh.developers.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.member.model.service.MemberService;
import com.kh.developers.member.model.vo.Member;

@Controller
public class MemberContoller {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/member/emailCheck")
	public ModelAndView emailCheck(Member m) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		boolean flag=result!=null?false:true;
		
		mv.addObject("flag",flag);
		mv.setViewName("jsonView");
		return mv;
	}
}
