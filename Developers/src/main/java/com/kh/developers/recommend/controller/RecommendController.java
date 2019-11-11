package com.kh.developers.recommend.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/recommend/recommendPush")
	@ResponseBody
	public String recommendPush(int memNo, String name, String email, String realationship) {
		Recommend recommend = service.selectRecommend(memNo);
		Friend friend = service.selectFriend(memNo);
	}
}
