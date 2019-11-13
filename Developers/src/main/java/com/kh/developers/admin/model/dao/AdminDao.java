package com.kh.developers.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.admin.model.vo.VisitCount;
import com.kh.developers.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectMemberCount(SqlSessionTemplate session);
	int updateMember(SqlSessionTemplate session, Member m);
	int deleteMember(SqlSessionTemplate session, Member m);
	int selectMemberCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue);
	List<Member> selectMemberListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage, int numPerPage);
	int selectMemberCountBySearchLevel(SqlSessionTemplate session, Map<String, Object> searchValue);
	List<Member> selectMemberListBySearchLevel(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage, int numPerPage);
	int selectWithdrawMemberCount(SqlSessionTemplate session);
	List<Member> selectWithdrawMemberList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectWithdrawMemberCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue);
	List<Member> selectWithdrawMemberListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage, int numPerPage);
	int restoreMember(SqlSessionTemplate session, Member m);
	int selectloginLogCount(SqlSessionTemplate session);
	List<MemberLoginLog> selectLoginLogList(SqlSessionTemplate session, int cPage, int numPerPage);
}
