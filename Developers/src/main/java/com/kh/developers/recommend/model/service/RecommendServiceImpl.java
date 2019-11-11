package com.kh.developers.recommend.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.recommend.model.dao.RecommendDao;
import com.kh.developers.recommend.model.vo.Friend;
import com.kh.developers.recommend.model.vo.Recommend;

@Service
public class RecommendServiceImpl implements RecommendService{

	@Autowired
	private RecommendDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Recommend selectRecommend(int memNo) {
		Recommend recommend = dao.selectRecommmend(session, memNo);
		return recommend;
	}
	@Override
	public Friend selectFriend(int memNo) {
		Friend friend = dao.selectFriend(session, memNo);
		return friend;
	}
	
	
	
}
