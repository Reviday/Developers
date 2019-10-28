package com.kh.developers.search.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.developers.resume.controller.ResumeController;

@Controller
public class SearchController {

	private static Logger logger=LoggerFactory.getLogger(ResumeController.class);
	
	@RequestMapping("/search/mainSearch.do")
	public String resumeList() {
		return "search/mainSearch";
	}
	
}
