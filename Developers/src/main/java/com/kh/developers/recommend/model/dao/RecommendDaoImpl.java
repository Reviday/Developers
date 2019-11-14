package com.kh.developers.recommend.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.recommend.model.vo.Friend;
import com.kh.developers.recommend.model.vo.Recommend;

@Repository
public class RecommendDaoImpl implements RecommendDao {

	@Override
	public Recommend selectRecommend(SqlSessionTemplate session, int memNo, int recommendNo) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("recommendNo", recommendNo);
		return session.selectOne("recommend.selectRecommend", map);
	}

	@Override
	public Friend selectFriend(SqlSessionTemplate session, int memNo, int friendNo) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("friendNo", friendNo);
		return session.selectOne("recommend.selectFriend", map);
	}

	@Override
	public Member selectRecommendMember(SqlSessionTemplate session, String email) {
		// TODO Auto-generated method stub
		return session.selectOne("recommend.selectRecommendMember", email);
	}
	
	@Override
	public int insertRecommend(SqlSessionTemplate session, int memNo, int recommendNo, String name,
			String realationship) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("recommendNo", recommendNo);
		map.put("name", name);
		map.put("realationship", realationship);
		return session.insert("recommend.insertRecommend", map);
	}
	
	@Override
	public int insertFriend(SqlSessionTemplate session, int memNo, int friendNo) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("friendNo", friendNo);
		return session.insert("recommend.insertFriend", map);
	}
	
	@Override
	public List<Recommend> selectRecommendList(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectList("recommend.selectRecommendList", memNo);
	}
	
	@Override
	public List<Friend> selectFriendList(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectList("recommend.selectFriendList", memNo);
	}
	
	@Override
	public List<Recommend> selectMyRecommendList(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectList("recommend.selectMyRecommendList", memNo);
	}
	
	@Override
	public int deleteRecommend(SqlSessionTemplate session, int memNo, int recommendNo) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("recommendNo", recommendNo);
		return session.delete("recommend.deleteRecommend", map);
	}
	
	@Override
	public int insertChoochunsa(SqlSessionTemplate session, int memNo, int recommendNo, String text) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("recommendNo", recommendNo);
		map.put("text", text);
		return session.insert("recommend.insertChoochunsa", map);
	}
	
	@Override
	public Member selectMember(SqlSessionTemplate session, String recommendEmail) {
		// TODO Auto-generated method stub
		return session.selectOne("recommend.selectMember", recommendEmail);
	}
}
