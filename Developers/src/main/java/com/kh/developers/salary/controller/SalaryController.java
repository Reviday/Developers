package com.kh.developers.salary.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.developers.salary.model.service.SalaryService;

@Controller
public class SalaryController {
	
	private static Logger logger=LoggerFactory.getLogger(SalaryController.class);
	
	@Autowired
	private SalaryService service;
	
	
	@RequestMapping("/salary/salaryView.do")
	public String salaryView() {
		
		System.out.println("연봉 뷰 실행");
		
		return "salary/salaryView";
	}
	
	
	
	
	

}
