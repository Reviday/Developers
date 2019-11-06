package com.kh.developers.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;

public interface MemberDao {

	Member selectMemberOne(SqlSessionTemplate session, Member m);
	int insertMember(SqlSessionTemplate session, Member m);
	void createAuthKey(SqlSessionTemplate session, Map<String, Object> map);
	int checkAuth(SqlSessionTemplate session, Member m);
	int successAuth(SqlSessionTemplate session, Member m);
	int lastStepEnrollEnd(SqlSessionTemplate session, Member m);
	int insertFilter(SqlSessionTemplate session);
	int insertInterests(SqlSessionTemplate session,Interests i);
}
