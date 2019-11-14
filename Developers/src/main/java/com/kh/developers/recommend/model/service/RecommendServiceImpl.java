package com.kh.developers.recommend.model.service;

import java.util.List;

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
	
	@Override
	public List<Recommend> selectRecommendList(int memNo) {
		List<Recommend> list = dao.selectRecommendList(session, memNo);
		return list;
	}
	
	@Override
	public List<Friend> selectFriendList(int memNo) {
		List<Friend> list = dao.selectFriendList(session, memNo);
		return list;
	}
	
	@Override
	public List<Recommend> selectMyRecommendList(int memNo) {
		List<Recommend> list = dao.selectMyRecommendList(session, memNo);
		return list;
	}
	
	@Override
	public int deleteRecommend(int memNo, int recommendNo) {
		int delete = dao.deleteRecommend(session, memNo, recommendNo);
		return delete;
	}
	
	@Override
	public int insertChoochunsa(int memNo, int recommendNo, String text) {
		int insert = dao.insertChoochunsa(session, memNo, recommendNo, text);
		return insert;
	}
	
	@Override
	public Member selectMember(String recommendEmail) {
		Member m = dao.selectMember(session, recommendEmail);
		return m;
	}
	
}
