package com.kh.developers.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.member.model.vo.Member;

public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectMemberOne(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberOne", m);
	}
}
