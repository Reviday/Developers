package com.kh.developers.recommend.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.member.model.vo.Member;
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
	public Recommend selectRecommend(int memNo, int recommendNo) {
		Recommend recommend = dao.selectRecommend(session, memNo, recommendNo);
		return recommend;
	}
	@Override
	public Friend selectFriend(int memNo, int friendNo) {
		Friend friend = dao.selectFriend(session, memNo, friendNo);
		return friend;
	}
	
	@Override
	public Member selectRecommendMember(String email) {
		Member m = dao.selectRecommendMember(session, email);
		return m;
	}
	
	@Override
	public int insertRecommend(int memNo, int recommendNo, String name, String realationship) {
		int result = dao.insertRecommend(session, memNo, recommendNo, name, realationship);
		return result;
	}
	
	@Override
	public int insertFriend(int memNo, int friendNo) {
		int result = dao.insertFriend(session, memNo, friendNo);
		return result;
	}
	
}
