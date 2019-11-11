package com.kh.developers.recommend.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
