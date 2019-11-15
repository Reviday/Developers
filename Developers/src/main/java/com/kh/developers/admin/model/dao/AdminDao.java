package com.kh.developers.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.admin.model.vo.RequestMappingLog;
import com.kh.developers.admin.model.vo.VisitCount;
import com.kh.developers.member.model.vo.Member;

public interface AdminDao {

	int updateMember(SqlSessionTemplate session, Member m);
	int deleteMember(SqlSessionTemplate session, Member m);
	
	int selectMemberCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue);
	List<Member> selectMemberListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage, int numPerPage);
	
	int selectWithdrawMemberCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue);
	List<Member> selectWithdrawMemberListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage, int numPerPage);
	int restoreMember(SqlSessionTemplate session, Member m);
	int selectLoginLogCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue);
	List<MemberLoginLog> selectLoginLogListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage, int numPerPage);
	
	void insertRequestMappingLog(SqlSessionTemplate session, RequestMappingLog rml);
}
