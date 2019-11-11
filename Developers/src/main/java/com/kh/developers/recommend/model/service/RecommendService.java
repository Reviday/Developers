package com.kh.developers.recommend.model.service;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.recommend.model.vo.Friend;
import com.kh.developers.recommend.model.vo.Recommend;

public interface RecommendService {

	//추천여부 검사
	Recommend selectRecommend(int memNo, int recommendNo);
	//친구여부 검사
	Friend selectFriend(int memNo, int friendNo);
	//추천인 회원여부 검사
	Member selectRecommendMember(String email);
	//추천 등록
	int insertRecommend(int memNo, int recommendNo, String name, String realationship);
	//친구 등록
	int insertFriend(int memNo, int friendNo);
	
}
