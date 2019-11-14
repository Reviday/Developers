package com.kh.developers.recommend.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.recommend.model.service.RecommendService;
import com.kh.developers.recommend.model.vo.Friend;
import com.kh.developers.recommend.model.vo.Recommend;
import com.kh.developers.resume.controller.ResumeController;
@Controller
public class RecommendController {
	@Autowired
	private RecommendService service;

	private static Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	//헤더 -> 추천 누르면 가는 페이지(로그인)
	@RequestMapping("/recommend/recommendMain.lmc")
	public String recommendMainLogin(int memNo, Model model) {
		model.addAttribute("memNo", memNo);
		return "recommend/recommend";
	}
	//추천하기 -> 추천 로직
	@RequestMapping(value = "/recommend/recommendPush", produces = "application/text; charset=utf8")
	@ResponseBody
	public String recommendPush(int memNo, String name, String email, String realationship) {
		String result = "";
		Member recommendMember = service.selectRecommendMember(email);
		if(recommendMember != null) {		
			Recommend recommend = service.selectRecommend(memNo, recommendMember.getMemNo());
			Friend friend = service.selectFriend(memNo, recommendMember.getMemNo());
			if(recommend != null) {
				result = "이미 추천한 친구입니다.";
			}else {			
				if(friend != null) {					
					int insert = service.insertRecommend(memNo, recommendMember.getMemNo(), name, realationship);
					result = "추천추가";
				}else {
					int insert = service.insertRecommend(memNo, recommendMember.getMemNo(), name, realationship);
					int insertFriend = service.insertFriend(memNo, recommendMember.getMemNo());
					result = "추천친구추가";
				}						
			}
		}else {
			result = "추천받는 사람이 Developers회원이 아닙니다.";
		}	
		return result;
	}
	//추천 -> 내가 받은 추천
	@RequestMapping(value = "/recommend/recommendRecieve", produces = "application/text; charset=utf8")
	public ModelAndView recommendRecieve(int memNo, ModelAndView mv) {
		List<Recommend> list = service.selectRecommendList(memNo);
		mv.addObject("list", list);
		mv.addObject("memNo", memNo);
		mv.setViewName("recommend/recommendRecieve");
		return mv;
	}
	//추천 -> 내가 한 추천
	@RequestMapping(value = "/recommend/myrecommend", produces = "application/text; charset=utf8")
	public ModelAndView myrecommend(int memNo, ModelAndView mv) {
		List<Recommend> list = service.selectMyRecommendList(memNo);
		mv.addObject("list", list);
		mv.addObject("memNo", memNo);
		mv.setViewName("recommend/myrecommend");
		return mv;
	}
	//추천 -> 내가 한 추천 -> 추천취소
	@RequestMapping(value = "/recommend/canclerecommend", produces = "application/text; charset=utf8")
	public ModelAndView canclerecommend(int memNo, int recommendNo, ModelAndView mv) {
		int delete = service.deleteRecommend(memNo, recommendNo);
		List<Recommend> list = service.selectMyRecommendList(memNo);
		mv.addObject("list", list);
		mv.addObject("memNo", memNo);
		mv.setViewName("recommend/myrecommend");
		return mv;
	}
	//내가 한 추천 -> 추천사 작성페이지
	@RequestMapping("/recommend/choochunsa")
	public String Choochunsa(int memNo, int recommendNo, Model model) {
		Recommend recommend = service.selectRecommend(memNo, recommendNo);
		model.addAttribute("recommend", recommend);
		return "/recommend/choochunsa";
	}
	//추천사작성페이지 -> 추천사insert 후 내가 한 추천페이지로 이동
	@RequestMapping("/recommend/insertchoochunsa")
	public String insertChoochunsa(int memNo, int recommendNo, String text, Model model) {
		int insert = service.insertChoochunsa(memNo, recommendNo, text);
		model.addAttribute("memNo", memNo);
		return "recommend/recommend";
	}
	//추천하기 모달 -> 추천사 작성페이지
	@RequestMapping("/recommend/choochunsaFirst")
	public String choochunsaFirst(int memNo, String recommendEmail, Model model) {
		Member m = service.selectMember(recommendEmail);
		Recommend recommend = service.selectRecommend(memNo, m.getMemNo());
		model.addAttribute("recommend", recommend);
		return "/recommend/choochunsa";
	}
}
