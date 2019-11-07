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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.resume.controller.ResumeController;
import com.kh.developers.search.model.service.SearchService;
import com.kh.developers.search.model.vo.BookMark;
import com.kh.developers.search.model.vo.Company;
import com.kh.developers.search.model.vo.Filter;
import com.kh.developers.search.model.vo.FilterCareer;
import com.kh.developers.search.model.vo.FilterCountry;
import com.kh.developers.search.model.vo.FilterLocation;
import com.kh.developers.search.model.vo.FilterOrderType;
import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;
import com.kh.developers.search.model.vo.Tag;

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
		// 회원 필터  정보
		Filter filter = service.SelectMemberFilter(memNo);
		model.addAttribute("filter", filter);
		// 필터 적용한 포지션리스트
		List<Position> psList = service.positionLoginList(filter);
		model.addAttribute("psList", psList);
		// 필터 리스트 정보
		List<FilterOrderType> fot = service.selectFilterOrderType();
		List<FilterCountry> fCountry = service.selectFilterCountry();
		List<FilterLocation> fl = service.selectFilterLocation();
		List<FilterCareer> fCareer = service.selectFilterCareer();
		model.addAttribute("fot", fot);
		model.addAttribute("fCountry", fCountry);
		model.addAttribute("fl", fl);
		model.addAttribute("fCareer", fCareer);
		return "search/mainSearchLogin";
	}
	// 회원필터 적용한 탐색 리스트(로그인)
	@RequestMapping(value = "/search/changeFilterLoginAjax", produces = "application/text; charset=utf8")
	public ModelAndView changeFilterLoginAjax(int memNo, String order, String career, String filtersave, String country, String location, ModelAndView mv) {
		// 적극채용중인 회사
		List<Position> firstPsList = service.firstPsList();
		mv.addObject("firstPsList", firstPsList);
		// 직무 리스트
		List<JobField> list = service.jobfieldList();
		mv.addObject("list", list);
		// 회원 필터  정보
		if(filtersave.equals("off")) {			
			Filter filter = service.SelectMemberFilter(memNo);
			mv.addObject("filter", filter);
		}else {
			Map map = new HashMap();
			map.put("memNo", memNo);
			map.put("order", order);
			map.put("career", career);
			map.put("country", country);
			map.put("location", location);
			int result = service.updateMemFilter(map);
			Filter filter = service.SelectMemberFilter(memNo);
			mv.addObject("filter", filter);
		}
		// 필터 적용한 포지션리스트
		Map map = new HashMap();
		map.put("order", order);
		map.put("career", career);
		map.put("country", country);
		map.put("location", location);
		List<Position> psList = service.positionLoginFilterList(map);
		mv.addObject("psList", psList);
		// 필터 리스트 정보
		List<FilterOrderType> fot = service.selectFilterOrderType();
		List<FilterCountry> fCountry = service.selectFilterCountry();
		List<FilterLocation> fl = service.selectFilterLocation();
		List<FilterCareer> fCareer = service.selectFilterCareer();
		mv.addObject("fot", fot);
		mv.addObject("fCountry", fCountry);
		mv.addObject("fl", fl);
		mv.addObject("fCareer", fCareer);
		// 필터 적용 정보
		mv.addObject("order", order);
		mv.addObject("career", career);
		mv.addObject("country", country);
		mv.addObject("location", location);
		mv.setViewName("search/ajax/changeFilterLoginAjax");
		return mv;
	}
	// 회원필터와 직무분야 적용한 탐색 리스트(로그인)
	@RequestMapping(value = "/search/changeFilterJobNameLoginAjax", produces = "application/text; charset=utf8")
	public ModelAndView changeFilterJobNameLoginAjax(int memNo, String jobName, String order, String career, String filtersave, String country, String location, ModelAndView mv) {
		// 적극채용중인 회사
		List<Position> firstPsList = service.firstPsList();
		mv.addObject("firstPsList", firstPsList);
		// 직무 리스트
		List<JobField> list = service.jobfieldAjaxList(jobName);
		mv.addObject("list", list);
		// 회원 필터  정보
		if(filtersave.equals("off")) {			
			Filter filter = service.SelectMemberFilter(memNo);
			mv.addObject("filter", filter);
		}else {
			Map map = new HashMap();
			map.put("memNo", memNo);
			map.put("order", order);
			map.put("career", career);
			map.put("country", country);
			map.put("location", location);
			int result = service.updateMemFilter(map);
			Filter filter = service.SelectMemberFilter(memNo);
			mv.addObject("filter", filter);
		}
		// 필터 적용한 포지션리스트
		Map map = new HashMap();
		map.put("jobName", jobName);
		map.put("order", order);
		map.put("career", career);
		map.put("country", country);
		map.put("location", location);
		List<Position> psList = service.positionLoginFilterJobNameList(map);
		mv.addObject("psList", psList);
		// 필터 리스트 정보
		List<FilterOrderType> fot = service.selectFilterOrderType();
		List<FilterCountry> fCountry = service.selectFilterCountry();
		List<FilterLocation> fl = service.selectFilterLocation();
		List<FilterCareer> fCareer = service.selectFilterCareer();
		mv.addObject("fot", fot);
		mv.addObject("fCountry", fCountry);
		mv.addObject("fl", fl);
		mv.addObject("fCareer", fCareer);
		// 필터 적용 정보
		mv.addObject("order", order);
		mv.addObject("career", career);
		mv.addObject("country", country);
		mv.addObject("location", location);
		mv.addObject("jobName", jobName);
		mv.setViewName("search/ajax/changeFilterJobNameLoginAjax");
		return mv;
	}
	// 회사를 눌렀을 때의 포지션 정보 페이지(로그인시)
	@RequestMapping("/search/companyInfo.do")
	public String companyInfoList(int positionNo, int memNo, Model model) {
		BookMark bmList = service.selectBookMark(memNo, positionNo);
		Position p = service.companyInfoList(positionNo);
		List<Tag> tagList = service.companyTagList(p.getBus_no());
		int likeId = p.getLike_id();
		List<LikeMember> list = service.likeMemberList(likeId);
		LikeMember lm = service.selectLikeMemberOne(memNo, likeId);
		model.addAttribute("tagList", tagList);
		model.addAttribute("bmList", bmList);
		model.addAttribute("lm", lm);
		model.addAttribute("p", p);
		model.addAttribute("list", list);
		return "search/companyInfo";
	}
	// 회사를 눌렀을 때의 포지션정보 페이지(비로그인시)
	@RequestMapping("/search/companyInfo1.do")
	public String companyInfoList(int positionNo, Model model) {

		Position p = service.companyInfoList(positionNo);
		List<Tag> tagList = service.companyTagList(p.getBus_no());
		List<Position> rcList = service.recommandPositionList(p);
		int likeId = p.getLike_id();
		List<LikeMember> list = service.likeMemberList(likeId);
		model.addAttribute("tagList", tagList);
		model.addAttribute("p", p);
		model.addAttribute("list", list);
		model.addAttribute("rcList", rcList);
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
			List<Tag> tagList = service.companyTagList(p.getBus_no());
			List<LikeMember> list = service.likeMemberList(likeId);
			LikeMember lm = service.selectLikeMemberOne(memNo, likeId);
			mv.addObject("tagList", tagList);
			mv.addObject("lm", lm);
			mv.addObject("p", p);
			mv.addObject("list", list);
		}else { 
			int delete = service.deleteLikeButton(memNo, likeId); 
			Position p = service.companyInfoList(positionNo);
			List<Tag> tagList = service.companyTagList(p.getBus_no());
			List<LikeMember> list = service.likeMemberList(likeId);
			LikeMember lm = service.selectLikeMemberOne(memNo, likeId);
			mv.addObject("tagList", tagList);
			mv.addObject("lm", lm);
			mv.addObject("p", p);
			mv.addObject("list", list);
		} 
		mv.setViewName("search/ajax/changeLikeAjax");
		return mv;
	}
	//북마크 눌렀을 때의 Ajax
	@RequestMapping(value = "/search/changeBookMarkAjax", produces = "application/text; charset=utf8")
	public ModelAndView changeBookMarkAjax(int memNo, int positionNo, int likeId, ModelAndView mv) {
		BookMark bmList1 = service.selectBookMark(memNo, positionNo);
		System.out.println(bmList1);
		if(bmList1 == null) {
			int result = service.insertBookMark(memNo, positionNo);
			Position p = service.companyInfoList(positionNo);
			List<Tag> tagList = service.companyTagList(p.getBus_no());
			List<LikeMember> list = service.likeMemberList(likeId);
			LikeMember lm = service.selectLikeMemberOne(memNo, likeId);
			BookMark bmList = service.selectBookMark(memNo, positionNo);
			mv.addObject("tagList", tagList);
			mv.addObject("lm", lm);
			mv.addObject("p", p);
			mv.addObject("list", list);
			mv.addObject("bmList", bmList);
		}else {
			int result = service.deleteBookMark(memNo, positionNo);
			Position p = service.companyInfoList(positionNo);
			List<Tag> tagList = service.companyTagList(p.getBus_no());
			List<LikeMember> list = service.likeMemberList(likeId);
			LikeMember lm = service.selectLikeMemberOne(memNo, likeId);
			BookMark bmList = service.selectBookMark(memNo, positionNo);
			mv.addObject("tagList", tagList);
			mv.addObject("lm", lm);
			mv.addObject("p", p);
			mv.addObject("list", list);
			mv.addObject("bmList", bmList);
		}
		mv.setViewName("search/ajax/changeBookMarkAjax");
		return mv;
	}
	//탐색 -> 회사소개페이지로 전환
	@RequestMapping("/search/companyAllInfo")
	public String companyAllInfo(int busNo, Model model) {
		//회사 포지션 리스트
		List<Position> psList = service.companyPositionList(busNo);
		model.addAttribute("psList", psList);
		//회사 태그 리스트
		List<Tag> tagList = service.companyTagList(busNo);
		model.addAttribute("tagList", tagList);
		//회사소개 정보 
		Company company = service.companyInfo(busNo);
		model.addAttribute("company", company);
		return "search/companyAllInfo";
	}
	//회사소개페이지에서의 태그모달창 태그버튼생성
	@RequestMapping(value = "/search/newTagButton", produces = "application/text; charset=utf8")
	@ResponseBody
	public String newTagButton(String newTag) {
		String result = "<div class='newTagContent'>" + newTag + "<button type='button' class='tagclose'><i class='fas fa-times' style='font-size: 14px;'></i></button></div>";
		return result;	
	}
	//회사소개페이지에서 태그의견전달
	@RequestMapping(value = "/search/newTagSubmit", produces = "application/text; charset=utf8")
	@ResponseBody
	public String newTagSubmit(String[] tagArr, int busNo) {
		String tag = "";
		for(int i = 0; i < tagArr.length; i++) {
			if(i < tagArr.length - 1) {
			tag += tagArr[i] + ",";
			}else {
				tag += tagArr[i];
			}
		}
		int insert = service.insertTagOpinion(busNo, tag);
		
		String result = "태그 의견을 전송했습니다.";
		return result;	
	}
}
