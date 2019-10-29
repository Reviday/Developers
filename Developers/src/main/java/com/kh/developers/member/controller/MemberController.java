package com.kh.developers.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.developers.common.authentication.TempKey;
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
		logger.debug("passwordCheck : "+m);
		System.out.println("passwordCheck : "+m);
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
		if(result!=null&&result.getMemStatus().equals("N")) {
			flag=false;
			msg="현재 사용 불가능한 계정입니다. 관리자에게 문의바랍니다.";
		} 
		mv.addObject("flag",flag);
		mv.addObject("msg",msg);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/member/enrollMember") 
	public ModelAndView enrollMember(Member m, HttpServletRequest req, RedirectAttributes rttr) {
		ModelAndView mv=new ModelAndView();
		System.out.println(m);
		//비밀번호 암호화
		m.setMemPassword(pwEncoder.encode(m.getMemPassword()));
		
		String url=req.getRequestURL().toString();
		int target=url.indexOf("developers");
		String frontUrl=url.substring(0,target);
		int result=0;
		String msg="";
		try {
			result=service.insertMember(m, frontUrl);
		} catch (Exception e) {
			msg="회원가입에 실패하였습니다. 다시 확인해주시기 바랍니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/");
		}
		if(result>0) {
			msg="기입된 이메일로 인증 메일이 전송되었습니다.";
			mv.addObject("msg",msg);
			mv.setViewName("jsonView");
		} else if(result<0) {
			msg="인증메일 전송에 실패하였습니다. 다시 시도해 주시기 바랍니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/");
		} else {
			msg="회원가입 도중 에러가 발생하였습니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	//이메일 인증 코드 검증
    @RequestMapping(value = "/member/emailConfirm", method = RequestMethod.GET)
    public String emailConfirm(Member m,Model model,RedirectAttributes rttr) throws Exception { 
        int result=service.checkAuth(m);
        if(result <= 0) {
            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
            return "redirect:/";
        }
        Member loginMember=service.selectMemberOne(m);
        model.addAttribute("loginMember",loginMember);
        return "member/mainPage";
    }
}
