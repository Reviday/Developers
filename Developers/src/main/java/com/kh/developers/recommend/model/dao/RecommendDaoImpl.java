package com.kh.developers.recommend.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.recommend.model.vo.Friend;
import com.kh.developers.recommend.model.vo.Recommend;

@Repository
public class RecommendDaoImpl implements RecommendDao {

	@Override
	public Recommend selectRecommend(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectOne("recommend.selectRecommend", memNo);
	}

	@Override
	public Friend selectFriend(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectOne("recommend.selectFriend", memNo);
	}

	
	
}
