package com.kh.developers.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.member.model.vo.Member;

public interface MemberDao {

	Member selectMemberOne(SqlSessionTemplate session, Member m);
}
