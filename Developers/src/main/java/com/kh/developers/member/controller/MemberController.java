package com.kh.developers.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.member.model.service.MemberService;
import com.kh.developers.member.model.vo.Member;

@SessionAttributes(value= {"loginMember"})
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	private static Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/member/myPage")
	public ModelAndView myPage(Member m) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("member/myPage");
		return mv;
	}
	
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session, SessionStatus s) {
		if(!s.isComplete()) {
			s.setComplete();//로그아웃
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/member/login.do") 
	public ModelAndView login(Member m, Model model) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		model.addAttribute("loginMember",result);
		mv.setViewName("member/mainPage");
		return mv;
	}
		
	@RequestMapping("/member/passwordCheck") 
	public ModelAndView passwordCheck(Member m) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		boolean flag=false;
		if(result != null) {
			if(pwEncoder.matches(m.getMemPassword(), result.getMemPassword())) {
				flag=true;
			}
		}
		mv.addObject("flag",flag);
		mv.setViewName("jsonView");
		logger.debug(m.getMemPassword());
		return mv;
	}
	
	@RequestMapping("/member/emailCheck")
	public ModelAndView emailCheck(Member m) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		logger.debug(result!=null?result.toString():"");
		boolean flag=result!=null?true:false;
		String msg=""; 
		if(result!=null&&!result.getMemStatus().equals("Y")) {
			flag=false;
			msg="현재 사용 불가능한 계정입니다. 관리자에게 문의바랍니다.";
		} 
		mv.addObject("flag",flag);
		mv.addObject("msg",msg);
		mv.setViewName("jsonView");
		return mv;
	}
	/*
	@RequestMapping("/member/enrollMember") 
	public ModelAndView enrollMember(Member m) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		
	}*/
}
