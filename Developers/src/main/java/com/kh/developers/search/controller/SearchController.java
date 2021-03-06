package com.kh.developers.search.controller;

import java.util.ArrayList;
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

import com.kh.developers.business.model.service.BusinessServiceImpl;
import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.recommend.model.vo.Recommend;
import com.kh.developers.resume.controller.ResumeController;
import com.kh.developers.search.model.service.SearchService;
import com.kh.developers.search.model.vo.AdCompany;
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
import com.kh.developers.search.model.vo.ResumeSearch;
import com.kh.developers.search.model.vo.SearchCompany;
import com.kh.developers.search.model.vo.Tag;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;

	private static Logger logger = LoggerFactory.getLogger(ResumeController.class);

	// 탐색메뉴 눌렀을 때의 첫 회사리스트페이지(비로그인)
	@RequestMapping("/search/mainSearch.do")
	public String mainSearchList(Model model) {
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
		String jobName1 = "";
		switch(jobName) {
			case "서버 개발자" : jobName1 = "D1"; break;
			case "프론트엔드 개발자" : jobName1 = "D2"; break;
			case "자바 개발자" : jobName1 = "D3"; break;
			case "안드로이드 개발자" : jobName1 = "D4"; break;
			case "iOS 개발자" : jobName1 = "D5"; break;
			case "파이썬 개발자" : jobName1 = "D6"; break;
			case "데이터 엔지니어" : jobName1 = "D7"; break;
			case "시스템,네트워크 관리자" : jobName1 = "D8"; break;
			case "DevOps/시스템 관리자" : jobName1 = "D9"; break;
			case "Node.js 개발자" : jobName1 = "D10"; break;
			case "C,C++ 개발자" : jobName1 = "D11"; break;
			case "데이터 사이언티스트" : jobName1 = "D12"; break;
			case "개발 매니저" : jobName1 = "D13"; break;
			case "PHP 개발자" : jobName1 = "D14"; break;
			case "기술지원" : jobName1 = "D15"; break;
			case "머신러닝 엔지니어" : jobName1 = "D16"; break;
			case "보안 엔지니어" : jobName1 = "D17"; break;
			case "QA,테스트 엔지니어" : jobName1 = "D18"; break;
			case "프로덕트 매니저" : jobName1 = "D19"; break;
			case "빅데이터 엔지니어" : jobName1 = "D20"; break;
			case "루비온레일즈 개발자" : jobName1 = "D21"; break;
			case ".NET 개발자" : jobName1 = "D22"; break;
			case "웹 퍼블리셔" : jobName1 = "D23"; break;
			case "임베디드 개발자" : jobName1 = "D24"; break;
			case "블록체인 플랫폼 엔지니어" : jobName1 = "D25"; break;
			case "하드웨어 엔지니어" : jobName1 = "D26"; break;
			case "CTO,Chief Technology Officer" : jobName1 = "D27"; break;
			case "영상,음성 엔지니어" : jobName1 = "D28"; break;
			case "BI 엔지니어" : jobName1 = "D29"; break;
			case "그래픽스 엔지니어" : jobName1 = "D30"; break;
			case "CIO, Chief Information Officer" : jobName1 = "D31"; break;
		}
		// 적극채용중인 회사
		List<AdCompany> firstPsList = service.firstPsList(jobName1);
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
		map.put("jobName", jobName1);
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
		List<Position> rcList = service.recommandPositionList(p);
		List<Tag> tagList = service.companyTagList(p.getBus_no());
		int likeId = p.getLike_id();
		List<LikeMember> list = service.likeMemberList(likeId);
		LikeMember lm = service.selectLikeMemberOne(memNo, likeId);
		Member m = service.SelectMember(memNo);
		List<ResumeSearch> rList = service.selectResume(m.getMemEmail());
		List<Recommend> reList = service.selectRecommendList(memNo);
		model.addAttribute("reList", reList);
		model.addAttribute("rList", rList);
		model.addAttribute("m", m);
		model.addAttribute("rcList", rcList);
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
		String jobName1 = "";
		switch(jobName) {
			case "서버 개발자" : jobName1 = "D1"; break;
			case "프론트엔드 개발자" : jobName1 = "D2"; break;
			case "자바 개발자" : jobName1 = "D3"; break;
			case "안드로이드 개발자" : jobName1 = "D4"; break;
			case "iOS 개발자" : jobName1 = "D5"; break;
			case "파이썬 개발자" : jobName1 = "D6"; break;
			case "데이터 엔지니어" : jobName1 = "D7"; break;
			case "시스템,네트워크 관리자" : jobName1 = "D8"; break;
			case "DevOps/시스템 관리자" : jobName1 = "D9"; break;
			case "Node.js 개발자" : jobName1 = "D10"; break;
			case "C,C++ 개발자" : jobName1 = "D11"; break;
			case "데이터 사이언티스트" : jobName1 = "D12"; break;
			case "개발 매니저" : jobName1 = "D13"; break;
			case "PHP 개발자" : jobName1 = "D14"; break;
			case "기술지원" : jobName1 = "D15"; break;
			case "머신러닝 엔지니어" : jobName1 = "D16"; break;
			case "보안 엔지니어" : jobName1 = "D17"; break;
			case "QA,테스트 엔지니어" : jobName1 = "D18"; break;
			case "프로덕트 매니저" : jobName1 = "D19"; break;
			case "빅데이터 엔지니어" : jobName1 = "D20"; break;
			case "루비온레일즈 개발자" : jobName1 = "D21"; break;
			case ".NET 개발자" : jobName1 = "D22"; break;
			case "웹 퍼블리셔" : jobName1 = "D23"; break;
			case "임베디드 개발자" : jobName1 = "D24"; break;
			case "블록체인 플랫폼 엔지니어" : jobName1 = "D25"; break;
			case "하드웨어 엔지니어" : jobName1 = "D26"; break;
			case "CTO,Chief Technology Officer" : jobName1 = "D27"; break;
			case "영상,음성 엔지니어" : jobName1 = "D28"; break;
			case "BI 엔지니어" : jobName1 = "D29"; break;
			case "그래픽스 엔지니어" : jobName1 = "D30"; break;
			case "CIO, Chief Information Officer" : jobName1 = "D31"; break;
		}
		List<AdCompany> firstPsList = service.firstPsList(jobName1);
		List<JobField> list = service.jobfieldAjaxList(jobName);	
		List<Position> psList = service.positionAjaxList(jobName1);
	
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
		String jobName1 = "";
		switch(jobName) {
			case "서버 개발자" : jobName1 = "D1"; break;
			case "프론트엔드 개발자" : jobName1 = "D2"; break;
			case "자바 개발자" : jobName1 = "D3"; break;
			case "안드로이드 개발자" : jobName1 = "D4"; break;
			case "iOS 개발자" : jobName1 = "D5"; break;
			case "파이썬 개발자" : jobName1 = "D6"; break;
			case "데이터 엔지니어" : jobName1 = "D7"; break;
			case "시스템,네트워크 관리자" : jobName1 = "D8"; break;
			case "DevOps/시스템 관리자" : jobName1 = "D9"; break;
			case "Node.js 개발자" : jobName1 = "D10"; break;
			case "C,C++ 개발자" : jobName1 = "D11"; break;
			case "데이터 사이언티스트" : jobName1 = "D12"; break;
			case "개발 매니저" : jobName1 = "D13"; break;
			case "PHP 개발자" : jobName1 = "D14"; break;
			case "기술지원" : jobName1 = "D15"; break;
			case "머신러닝 엔지니어" : jobName1 = "D16"; break;
			case "보안 엔지니어" : jobName1 = "D17"; break;
			case "QA,테스트 엔지니어" : jobName1 = "D18"; break;
			case "프로덕트 매니저" : jobName1 = "D19"; break;
			case "빅데이터 엔지니어" : jobName1 = "D20"; break;
			case "루비온레일즈 개발자" : jobName1 = "D21"; break;
			case ".NET 개발자" : jobName1 = "D22"; break;
			case "웹 퍼블리셔" : jobName1 = "D23"; break;
			case "임베디드 개발자" : jobName1 = "D24"; break;
			case "블록체인 플랫폼 엔지니어" : jobName1 = "D25"; break;
			case "하드웨어 엔지니어" : jobName1 = "D26"; break;
			case "CTO,Chief Technology Officer" : jobName1 = "D27"; break;
			case "영상,음성 엔지니어" : jobName1 = "D28"; break;
			case "BI 엔지니어" : jobName1 = "D29"; break;
			case "그래픽스 엔지니어" : jobName1 = "D30"; break;
			case "CIO, Chief Information Officer" : jobName1 = "D31"; break;
		}
		List<AdCompany> firstPsList = service.firstPsList(jobName1);
		List<JobField> list = service.jobfieldAjaxList(jobName);
		Filter filter = service.SelectMemberFilter(memNo);
		List<Position> psList = service.positionAjaxLoginList(jobName1, filter);
		
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
			Member m = service.SelectMember(memNo);
			List<ResumeSearch> rList = service.selectResume(m.getMemEmail());
			List<Recommend> reList = service.selectRecommendList(memNo);
			BookMark bmList = service.selectBookMark(memNo, positionNo);
			mv.addObject("bmList", bmList);
			mv.addObject("reList", reList);
			mv.addObject("rList", rList);
			mv.addObject("m", m);
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
			Member m = service.SelectMember(memNo);
			List<ResumeSearch> rList = service.selectResume(m.getMemEmail());
			List<Recommend> reList = service.selectRecommendList(memNo);
			BookMark bmList = service.selectBookMark(memNo, positionNo);
			mv.addObject("bmList", bmList);
			mv.addObject("reList", reList);
			mv.addObject("rList", rList);
			mv.addObject("m", m);
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
			Member m = service.SelectMember(memNo);
			List<ResumeSearch> rList = service.selectResume(m.getMemEmail());
			List<Recommend> reList = service.selectRecommendList(memNo);
			mv.addObject("reList", reList);
			mv.addObject("rList", rList);
			mv.addObject("m", m);
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
			Member m = service.SelectMember(memNo);
			List<ResumeSearch> rList = service.selectResume(m.getMemEmail());
			List<Recommend> reList = service.selectRecommendList(memNo);
			mv.addObject("reList", reList);
			mv.addObject("rList", rList);
			mv.addObject("m", m);
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
	//탐색 -> 회사소개페이지로 전환
	@RequestMapping("/search/companyAllInfo11")
	public String companyAllInfo(int busNo, int click, Model model) {
		int update = service.insertClick(click);
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
	//포지션 지원(추천인 있음)
	@RequestMapping(value = "/search/positionRecommendSubmit", produces = "application/text; charset=utf8")
	@ResponseBody
	public String positionSubmit(int busNo, int memNo, int positionNo, int resumeNo, int recommendId) {
		String result = "";
		Applicant appl = service.selectApplicant(memNo, positionNo);
		if(appl != null) {
			result = "이미 지원하신 포지션입니다.";
		}else {
			Map map = new HashMap();
			map.put("busNo", busNo);
			map.put("memNo", memNo);
			map.put("positionNo", positionNo);
			map.put("resumeNo", resumeNo);
			map.put("recommendId", recommendId);
			int insert = service.insertPositionRecommend(map);
			result = "포지션에 지원이 완료되었습니다.";
		}
		return result;
	}
	//포지션 지원(추천인 없음)
	@RequestMapping(value = "/search/positionSubmit", produces = "application/text; charset=utf8")
	@ResponseBody
	public String positionSubmit(int busNo, int memNo, int positionNo, int resumeNo) {
		String result = "";
		Applicant appl = service.selectApplicant(memNo, positionNo);
		if(appl != null) {
			result = "이미 지원하신 포지션입니다.";
		}else {
			Map map = new HashMap();
			map.put("busNo", busNo);
			map.put("memNo", memNo);
			map.put("positionNo", positionNo);
			map.put("resumeNo", resumeNo);
			int insert = service.insertPosition(map);
			result = "포지션에 지원이 완료되었습니다.";
		}
		return result;
	}
	//헤더 검색 -> 검색 모달(첫 클릭)
	@RequestMapping(value = "/mainSearch/mainSearchModal", produces = "application/text; charest=utf-8")
	public ModelAndView mainSearchModal(ModelAndView mv) {
		List<Tag> list = service.selectTagList();
		mv.addObject("list", list);
		mv.setViewName("common/search");
		return mv;
	}
	//헤더 검색 -> 페이지 전환
	@RequestMapping("/mainSearch/changePage")
	public String mainSearchChangePage(String text, Model model) {
		if(text.substring(0,1).equals("#")) {
			//태그검색(회사만 검색)
			//태그가 있는 회사의 회사번호리스트 검색
			List<Integer> busNoList = service.selectCompanyTagList(text.substring(1));
			//태그가 포함되어있는 회사 태그리스트 검색
			List<Tag> tagList = service.selectTagCompanyList(busNoList);
			//추천할 태그 5개 검색
			List<Tag> reList = service.selectTagList();
			//태그가 있는 회사리스트 검색
			List<Company> cList = new ArrayList();
			for(Integer i : busNoList) {
				cList.add(service.selectCompanyList(i));
			}
			model.addAttribute("reList", reList);
			model.addAttribute("tag", text);
			model.addAttribute("tagList", tagList);
			model.addAttribute("cList", cList);
			return "common/tagSearch";
		}else {
			//회사, 포지션, 키워드 검색(회사, 포지션 검색)
			//회사 리스트 검색(회사이름, 회사키워드)
			List<SearchCompany> cList = service.companyKeywordList(text);
			//포지션리스트 검색(포지션이름)
			List<Position> pList = service.positionKeywordList(text);
			model.addAttribute("cList", cList);
			model.addAttribute("pList", pList);
			model.addAttribute("text", text);
			return "common/otherSearch";
		}
	}
}
