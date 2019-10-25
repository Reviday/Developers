package com.kh.developers.business.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.developers.business.model.service.BusinessService;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

@Controller
public class BusinessController {
	
	private static Logger logger = LoggerFactory.getLogger(BusinessController.class);
	
//	@Autowired 
//	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private BusinessService service;
	
//	@Autowired
//	private MemberService memService;
	
	@RequestMapping("/business/employerIndex.do")
	public String empPage(){
		return "business/employerIndex";
	}
	
	@RequestMapping("/business/empEnroll.do")
	public String empEnroll(
//			@RequestParam Member m,
			Model model
			) {
//		m.setMemPassword(pwEncoder.encode(m.getMemPassword()));
//		logger.debug(""+m.getMemEmail());
//		logger.debug(""+m);
//		int result=m.insertEmployer(m);
//		logger.debug(""+result);
		
		return "business/businessEnroll";
	}
	
	@RequestMapping("/business/businessEnroll.do")
	public String businessEnroll(
			@RequestParam Business bus
			) {
		logger.debug(""+bus);
		int result=service.insertBusiness(bus);
		logger.debug("결과"+result);
		
		return "/business/businessCertify";
	}
	
//	@RequestMapping("/business/empLogin.do")
//	public String empLogin(
//			@RequestParam Member m
//			) {
//		logger.debug(""+m);
//		int result=memService.selectMemberOne(m)
//	}
	
	
	

}
