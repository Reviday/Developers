package com.kh.developers.recommend.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.developers.recommend.model.service.RecommendService;
import com.kh.developers.resume.controller.ResumeController;
@Controller
public class RecommendController {
	@Autowired
	private RecommendService service;

	private static Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	//헤더 -> 추천 누르면 가는 페이지(로그인)
	@RequestMapping("/recommend/recommendMain.lmc")
	public String recommendMainLogin(int memNo) {
		return "recommend/recommend";
	}
}
