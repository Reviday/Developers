package com.kh.developers.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectMemberOne(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberOne", m);
	}
}
