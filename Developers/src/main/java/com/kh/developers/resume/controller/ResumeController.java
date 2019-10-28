package com.kh.developers.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ResumeController {
	
	private static Logger logger=LoggerFactory.getLogger(ResumeController.class);
	
	@RequestMapping("/resume/resumeList.do")
	public String resumeList() {
		return "resume/resumeList";
	}
	
	
}
