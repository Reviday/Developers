package com.kh.developers.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.developers.resume.controller.ResumeController;
import com.kh.developers.search.model.service.SearchService;
import com.kh.developers.search.model.vo.JobField;

@Controller
public class SearchController {

	@Autowired 
	private SearchService service;
	
	private static Logger logger=LoggerFactory.getLogger(ResumeController.class);
	
	//탐색메뉴 눌렀을 때의 첫 회사리스트페이지(비로그인)
	@RequestMapping("/search/mainSearch.do")
	public String mainSearchList(Model model, String jobName) {
		
		List<JobField> list = service.jobfieldList();
		model.addAttribute("list", list);
		return "search/mainSearch";
	}
	
	//회사를 눌렀을 때의 회사 개인 정보 페이지(비로그인)
	@RequestMapping("/search/companyInfo.do")
	public String companyInfoList() {
		return "search/companyInfo";
	}
	

//	@RequestMapping(value="/search/changeJobAjax", produces = "application/text; charset=utf8")
//	@ResponseBody
//	public String changeJobAjax(String jobName, HttpServletResponse res) {
//		res.setContentType("application/json;charset=utf-8");
//		return jobName;
//	}
	
	@RequestMapping(value="/search/changeJobAjax", produces = "application/text; charset=utf8")
	public ModelAndView changeJobAjax(String jobName, ModelAndView mv) {
		List<JobField> list = service.jobfieldAjaxList(jobName);
		mv.setViewName("search/ajax/changeJobAjax");
		mv.addObject("jobName", jobName);
		mv.addObject("list", list);
		return mv;
	}
	
}
