package com.kh.developers.recommend.model.service;

import java.util.List;

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
	//내가받은 추천리스트 조회
	List<Recommend> selectRecommendList(int memNo);
	//내 친구 조회
	List<Friend> selectFriendList(int memNo);
	//내가 한 추천 리스트
	List<Recommend> selectMyRecommendList(int memNo);
	//내가 한 추천 삭제
	int deleteRecommend(int memNo, int recommendNo);
	//추천사 추가
	int insertChoochunsa(int memNo, int recommendNo, String text);
	//추천하기-> 추천사
	Member selectMember(String recommendEmail);
}
