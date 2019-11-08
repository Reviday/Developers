package com.kh.developers.admin.model.service;

import java.util.List;

import com.kh.developers.member.model.vo.Member;

public interface AdminService {
	
	List<Member> selectMemberList(int cPage, int numPerPage);
	int selectMemberCount();
	int updateMember(Member m);
	List<Member> deleteMember(Member m, int cPage, int numPerPage);
	int selectMemberCountBySearch(String value);
}
