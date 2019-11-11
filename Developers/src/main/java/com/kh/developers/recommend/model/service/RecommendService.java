package com.kh.developers.recommend.model.service;

import com.kh.developers.recommend.model.vo.Friend;
import com.kh.developers.recommend.model.vo.Recommend;

public interface RecommendService {

	//추천여부 검사
	Recommend selectRecommend(int memNo);
	//친구여부 검사
	Friend selectFriend(int memNo);
	
}
