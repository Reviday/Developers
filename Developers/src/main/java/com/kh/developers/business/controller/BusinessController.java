package com.kh.developers.business.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.business.model.service.BusinessService;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.service.MemberService;
import com.kh.developers.member.model.vo.Member;

@SessionAttributes(value= {"loginMember","busInfo"})

@Controller
public class BusinessController {
	
	private static Logger logger = LoggerFactory.getLogger(BusinessController.class);
	
	
	@Autowired 
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private BusinessService bService;
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/business")
	public String empPage(HttpSession session){
		//redirect 로 매핑값 서블릿으로
		if(session.getAttribute("loginMember")!=null&&session.getAttribute("busInfo")!=null) {
			return "redirect:/business/dashboard.lbc";			
		}else if(session.getAttribute("loginMember")!=null&&session.getAttribute("busInfo")==null) {
			return "business/businessEnroll";
		}else {
			return "business/welcome";			
		}
	}
	
	@RequestMapping("/business/empEnroll")
	public String empEnroll(
			
			Model model
			) {
//		m.setMemPassword(pwEncoder.encode(m.getMemPassword()));
//		logger.debug(""+m.getMemEmail());
//		logger.debug(""+m);
//		int result=m.insertEmployer(m);
//		logger.debug(""+result);
		
		return "business/businessEnroll";
	}
	
	@RequestMapping("/business/businessEnroll")
	public String businessEnroll(
			Business bus
			) {
		logger.debug(""+bus);
		int result=bService.insertBusiness(bus);
		logger.debug("결과"+result);
		//관리자 한테도 보내줘야함
		return "/business/confirming";
	}
	
	@RequestMapping("/business/empLogin")
	public ModelAndView empLogin(Member m, Model model) {
			ModelAndView mv=new ModelAndView();
			Member result=service.selectMemberOne(m);
			boolean flag=false;
			if(result != null) {
				if(pwEncoder.matches(m.getMemPassword(), result.getMemPassword())) {
					flag=true;
				}
			}
			if(flag) {
				if(result!=null&&result.getMemEmailCert().equals("N")) {
					model.addAttribute("ldc", "noemailcert"); // ldc : login Deny Code 
				}else if(result!=null&&result.getMemLevel()<3) {

					 // 아직 bussinessEnroll 안한 회원 
					model.addAttribute("loginMember",result); 
					mv.setViewName("business/businessEnroll");
				}else if(result!=null&&result.getMemLevel()>=3 && result.getMemLevel()<5){
					// businessEnroll 마친 회원
					int memberNo=result.getMemNo();
					Business bus=bService.selectBusInfo(memberNo); //사업장 정보 불러오는 로직 
					logger.debug(""+bus);
					model.addAttribute("loginMember",result); 
					model.addAttribute("busInfo",bus);
					mv.setViewName("redirect:/business/dashboard.lbc");											
			} else {
				/*로그인 로직 상, login.do를 실행할떄 비밀번호가 틀릴 수가 없기 때문*/
				mv.addObject("msg","잘못된 경로입니다.");
				mv.addObject("loc","/");
				mv.setViewName("common/msg");
				}
			}
			return mv;
	}
	
	@RequestMapping("/business/logout")
	public String logout(HttpSession session, SessionStatus s) {
		if(!s.isComplete()) {
			s.setComplete();//로그아웃
			session.invalidate();
		}
		return "redirect:/business";
	}

}
