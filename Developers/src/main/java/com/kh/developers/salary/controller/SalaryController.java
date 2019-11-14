package com.kh.developers.salary.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.developers.salary.model.service.SalaryService;
import com.kh.developers.salary.model.vo.Salary;

@SessionAttributes(value= {"jobField", "salaryList"})

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
	
	@RequestMapping("/salary/salarySelectList.do")
	public String salarySelectList(Salary s,Model model) {
		
		
		
		String jobField=s.getJobField();
		
		List<Salary> list=service.salarySelectList(jobField);
		
		System.out.println(jobField);
		System.out.println(list);
		
		List<Integer> salaryList=new ArrayList<Integer>();
		
		for (int i = 0; i < list.size(); i++) {
			
			salaryList.add(i,list.get(i).getJobAvgSalary());
			
		}
	
		model.addAttribute("salaryList",salaryList);
		model.addAttribute("jobField",jobField);
		
		return "salary/salaryView";
	}
	
	
	

}
