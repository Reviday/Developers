package com.kh.developers.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	
	
	@Override
	public int insertInterests(SqlSessionTemplate session, Interests i) {
		// TODO Auto-generated method stub
		return session.insert("member.insertInterests",i);
	}

	@Override
	public int lastStepEnrollEnd(SqlSessionTemplate session, Member m) {
		return session.update("member.lastStepEnrollEnd", m);
	}
	
	@Override
	public int successAuth(SqlSessionTemplate session, Member m) {
		return session.update("member.successAuth", m);
	}
	
	@Override
	public int checkAuth(SqlSessionTemplate session, Member m) {
		return session.update("member.checkAuth", m);
	}

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("member.insertMember", m);
	}
	
	@Override
	public void createAuthKey(SqlSessionTemplate session, Map<String, Object> map) {
		session.insert("member.createAuthKey", map);
	}
	
	@Override
	public Member selectMemberOne(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberOne", m);
	}
	
	@Override
	public int insertFilter(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("member.insertFilter");
	}
}
