package com.kh.developers.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectMemberCount(SqlSessionTemplate session);
	int updateMember(SqlSessionTemplate session, Member m);
	int deleteMember(SqlSessionTemplate session, Member m);
	int selectMemberCountBySearch(SqlSessionTemplate session, Map<String, String> searchValue);
}
