package com.kh.developers.recommend.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.recommend.model.vo.Friend;
import com.kh.developers.recommend.model.vo.Recommend;

public interface RecommendDao {

	Recommend selectRecommend(SqlSessionTemplate session, int memNo);
	Friend selectFriend(SqlSessionTemplate session, int memNo);
	
}
