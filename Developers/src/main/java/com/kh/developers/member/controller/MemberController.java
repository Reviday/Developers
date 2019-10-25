package com.kh.developers.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.member.model.service.MemberService;
import com.kh.developers.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	private static Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/member/emailCheck")
	public ModelAndView emailCheck(Member m) {
		logger.debug("계정 값 잘 들어오는지 :" +m.toString());
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
}
