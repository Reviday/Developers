package com.kh.developers.admin.model.service;

import java.util.List;

import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.member.model.vo.Member;

public interface AdminService {
	
	List<Member> selectMemberList(int cPage, int numPerPage);
	int selectMemberCount();
	int updateMember(Member m);
	int deleteMember(Member m);
	int selectMemberCountBySearch(String value);
	List<Member> selectMemberListBySearch(String value, int cPage, int numPerPage);
	int selectMemberCountBySearchLevel(String value, int searchLevel);
	List<Member> selectMemberListBySearchLevel(String value, int searchLevel, int cPage, int numPerPage);
	int selectWithdrawMemberCount();
	List<Member> selectWithdrawMemberList(int cPage, int numPerPage);
	int selectWithdrawMemberCountBySearch(String value);
	List<Member> selectWithdrawMemberListBySearch(String value, int cPage, int numPerPage);
	int restoreMember(Member m);
	int selectloginLogCount();
	List<MemberLoginLog> selectLoginLogList(int cPage, int numPerPage);
}
