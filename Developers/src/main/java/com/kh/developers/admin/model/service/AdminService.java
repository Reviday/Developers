package com.kh.developers.admin.model.service;

import java.util.List;

import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.admin.model.vo.VisitCount;
import com.kh.developers.member.model.vo.Member;

public interface AdminService {
	
	int updateMember(Member m);
	int deleteMember(Member m);
	int selectWithdrawMemberCountBySearch(String value);
	List<Member> selectWithdrawMemberListBySearch(String value, int cPage, int numPerPage);
	int restoreMember(Member m);
	int selectLoginLogCountBySearch(String value, String mllSuccess);
	List<MemberLoginLog> selectLoginLogListBySearch(String value, String mllSuccess, int cPage, int numPerPage);
	
	int selectMemberCountBySearch(String value, int searchLevel);
	List<Member> selectMemberListBySearch(String value, int searchLevel, int cPage, int numPerPage);
}
