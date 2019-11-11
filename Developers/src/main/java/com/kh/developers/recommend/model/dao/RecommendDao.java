package com.kh.developers.recommend.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.recommend.model.vo.Friend;
import com.kh.developers.recommend.model.vo.Recommend;

public interface RecommendDao {

	Recommend selectRecommend(SqlSessionTemplate session, int memNo, int recommendNo);
	Friend selectFriend(SqlSessionTemplate session, int memNo, int friendNo);
	Member selectRecommendMember(SqlSessionTemplate session, String email);
	int insertRecommend(SqlSessionTemplate session, int memNo, int recommendNo, String  name, String realationship);
	int insertFriend(SqlSessionTemplate session, int memNo, int friendNo);
}
