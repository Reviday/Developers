package com.kh.developers.member.model.service;

import com.kh.developers.member.model.vo.Member;

public interface MemberService {
	
	Member selectMemberOne(Member m);
	int insertMember(Member m, String url) throws Exception;
	int checkAuth(Member m);
	void sendMail(Member m, String url) throws Exception;
	Member lastStepEnrollEnd(Member m);
	int insertFilter();
}
