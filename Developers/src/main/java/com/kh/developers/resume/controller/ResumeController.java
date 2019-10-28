package com.kh.developers.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.service.ResumeService;


@Controller
public class ResumeController {
	
	private static Logger logger=LoggerFactory.getLogger(ResumeController.class);
	@Autowired
	private ResumeService service;
	
	
	@RequestMapping("/resume/resumeList.do")
	public String resumeList() {
		return "resume/resumeList";
	}
	@RequestMapping("/resume/insertResumepage.do")
	public String insertResume(Member m) {
		
		int result=service.insertResume(m);
		return "resume/insertResume";
	}
	
	
}
