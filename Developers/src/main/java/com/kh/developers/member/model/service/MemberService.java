package com.kh.developers.member.model.service;

import java.util.List;

import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.member.model.vo.MyApp;
import com.kh.developers.member.model.vo.Point;
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
	void insertLoginLog(MemberLoginLog mll);
	int updateInterests(Interests i);
	List<Applicant> selectApplicant(Member m);
	Business selectBusOne(String busNo);
	int applAns(int memNo,int number);
	List<Position> selectBookMark(Member m);
	List<MyApp> selectMemAppl(Member m,int cPage,int numPerPage);
	int selectMemApplCount(Member m);
	Member selectMemNo(int memNo);
	List<MyApp> selectMa(MyApp ma,int cPage,int numPerPage);
	int selectMaCount(MyApp ma);
	List<Point> selectMyPoint(Member m);
	int addPoint(Point p);
	
}
