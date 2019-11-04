package com.kh.developers.admin.model.service;

import java.util.List;

import com.kh.developers.member.model.vo.Member;

public interface AdminService {
	
	List<Member> selectMemberList(int cPage, int numPerPage);
	int selectMemberCount();

}
