package com.kh.developers.member.model.service;

import java.util.List;

import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.member.model.vo.MyLike;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;

public interface MemberService {
	
	Member selectMemberOne(Member m);
	int insertMember(Member m, String url) throws Exception;
	int checkAuth(Member m);
	void sendMail(Member m, String url) throws Exception;
	Member lastStepEnrollEnd(Member m);
	int insertFilter();
	int insertInterests(Interests i);
	Interests selectInterests(String memEmail);
	List<Position> selectPositionList();
	List<Position> selectInterPositionList(Interests inter);
	List<Position> selectWeekPositionList(); 
	int memberUpdate(Member m);
	int busLogoChange(Member memInfo);
	List<Position> selectLike(Member m);
	
}
