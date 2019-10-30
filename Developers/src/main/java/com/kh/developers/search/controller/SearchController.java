package com.kh.developers.search.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.developers.resume.controller.ResumeController;

@Controller
public class SearchController {

	private static Logger logger=LoggerFactory.getLogger(ResumeController.class);
	
	//탐색메뉴 눌렀을 때의 첫 회사리스트페이지(비로그인)
	@RequestMapping("/search/mainSearch.do")
	public String mainSearchList() {
		return "search/mainSearch";
	}
	
	//회사를 눌렀을 때의 회사 개인 정보 페이지(비로그인)
	@RequestMapping("/search/companyInfo.do")
	public String companyInfoList() {
		return "search/companyInfo";
	}
	
}
