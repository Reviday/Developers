package com.kh.developers.search.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.resume.controller.ResumeController;
import com.kh.developers.search.model.service.SearchService;
import com.kh.developers.search.model.vo.Filter;
import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;

	private static Logger logger = LoggerFactory.getLogger(ResumeController.class);

	// 탐색메뉴 눌렀을 때의 첫 회사리스트페이지(비로그인)
	@RequestMapping("/search/mainSearch.do")
	public String mainSearchList(Model model) {
		// 적극채용중인 회사
		List<Position> firstPsList = service.firstPsList();
		model.addAttribute("firstPsList", firstPsList);
		// 일반 리스트
		List<JobField> list = service.jobfieldList();
		List<Position> psList = service.positionList();
		model.addAttribute("list", list);
		model.addAttribute("psList", psList);
		return "search/mainSearch";
	}
	// 탐색메뉴 눌렀을 때의 첫 회사리스트페이지(로그인)
	@RequestMapping("/search/mainSearch.lmc")
	public String mainSearchLoginList(Model model, int memNo) {
		// 적극채용중인 회사
		List<Position> firstPsList = service.firstPsList();
		model.addAttribute("firstPsList", firstPsList);
		// 직무 리스트
		List<JobField> list = service.jobfieldList();
		model.addAttribute("list", list);
		// 필터  정보
		Filter filter = service.SelectMemberFilter(memNo);
		model.addAttribute("filter", filter);
		// 필터 적용한 포지션리스트
		List<Position> psList = service.positionLoginList(filter);
		model.addAttribute("psList", psList);
		return "search/mainSearchLogin";
	}

	// 회사를 눌렀을 때의 회사 개인 정보 페이지(로그인시)
	@RequestMapping("/search/companyInfo.do")
	public String companyInfoList(int positionNo, int memNo, Model model) {

		Position p = service.companyInfoList(positionNo);
		int likeId = p.getLike_id();
		List<LikeMember> list = service.likeMemberList(likeId);
		LikeMember lm = service.selectLikeMemberOne(memNo, likeId);
		model.addAttribute("lm", lm);
		model.addAttribute("p", p);
		model.addAttribute("list", list);
		return "search/companyInfo";
	}
	// 회사를 눌렀을 때의 회사 개인 정보 페이지(비로그인시)
	@RequestMapping("/search/companyInfo1.do")
	public String companyInfoList(int positionNo, Model model) {

		Position p = service.companyInfoList(positionNo);
		int likeId = p.getLike_id();
		List<LikeMember> list = service.likeMemberList(likeId);
		model.addAttribute("p", p);
		model.addAttribute("list", list);
		return "search/companyInfo";
	}

	// 탐색 -> 직무클릭했을 때의 페이지 전환(비로그인)
	@RequestMapping(value = "/search/changeJobAjax", produces = "application/text; charset=utf8")
	public ModelAndView changeJobAjax(String jobName, ModelAndView mv) {
		List<Position> firstPsList = service.firstPsList();
		List<JobField> list = service.jobfieldAjaxList(jobName);	
		List<Position> psList = service.positionAjaxList(jobName);
	
		mv.addObject("psList", psList);
		mv.addObject("firstPsList", firstPsList);
		mv.setViewName("search/ajax/changeJobAjax");
		mv.addObject("jobName", jobName);
		mv.addObject("list", list);
		return mv;
	}
	// 탐색 -> 직무클릭했을 때의 페이지 전환(로그인)
	@RequestMapping(value = "/search/changeJobLoginAjax", produces = "application/text; charset=utf8")
	public ModelAndView changeJobLoginAjax(String jobName, int memNo, ModelAndView mv) {
		List<Position> firstPsList = service.firstPsList();
		List<JobField> list = service.jobfieldAjaxList(jobName);
		Filter filter = service.SelectMemberFilter(memNo);
		List<Position> psList = service.positionAjaxLoginList(jobName, filter);
		
		mv.addObject("psList", psList);
		mv.addObject("filter", filter);
		mv.addObject("firstPsList", firstPsList);
		mv.setViewName("search/ajax/changeJobLoginAjax");
		mv.addObject("jobName", jobName);
		mv.addObject("list", list);
		return mv;
	}
	//좋아요버튼 눌렀을 때의 Ajax
	@RequestMapping(value = "/search/changeLikeAjax", produces = "application/text; charset=utf8")
	public ModelAndView changeLikeAjax(int positionNo, int memNo, int likeId, ModelAndView mv) {
		LikeMember lm1 = service.selectLikeMemberOne(memNo, likeId);
		if(lm1 == null) { 
			int insert = service.insertLikeButton(memNo, likeId); 
			Position p = service.companyInfoList(positionNo);
			List<LikeMember> list = service.likeMemberList(likeId);
			LikeMember lm = service.selectLikeMemberOne(memNo, likeId);
			mv.addObject("lm", lm);
			mv.addObject("p", p);
			mv.addObject("list", list);
		}else { 
			int delete = service.deleteLikeButton(memNo, likeId); 
			Position p = service.companyInfoList(positionNo);
			List<LikeMember> list = service.likeMemberList(likeId);
			LikeMember lm = service.selectLikeMemberOne(memNo, likeId);
			mv.addObject("lm", lm);
			mv.addObject("p", p);
			mv.addObject("list", list);
		} 
		mv.setViewName("search/ajax/changeLikeAjax");
		return mv;
	}
}
