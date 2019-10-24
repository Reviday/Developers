package com.kh.developers.business.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.developers.business.model.service.BusinessService;

@Controller
public class BusinessController {
	
	private static Logger logger = LoggerFactory.getLogger(BusinessController.class);
	
//	@Autowired 
//	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private BusinessService service;
	
	@RequestMapping("/business/employerIndex.do")
	public String empPage(){
		return "business/employerIndex";
	}
	
	@RequestMapping("/business/empEnroll.do")
	public String insertEmployer(
			@RequestParam Map map,
			Model model
			) {
//		map.setChargePassword(pwEncoder.encode(map.getChargePassword()));
		logger.debug(""+map);
		logger.debug(""+map.get("busName"));
		int result=service.insertEmployer(map);
		logger.debug(""+result);
		
		return "business/businessEnroll";
	}
//	
//	@RequestMapping("/business/AddiBusEnroll.do")
//	public String addiInsertCharger() {
//		
//		
//		return "/";
//	}
	
	

}
