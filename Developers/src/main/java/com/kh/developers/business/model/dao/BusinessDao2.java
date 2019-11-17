package com.kh.developers.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.CareerInCard;
import com.kh.developers.business.model.vo.EducationInCard;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
import com.kh.developers.search.model.vo.Position;

public interface BusinessDao2 {
	//bus 수정
	int updateBusInfo(SqlSession session, Business bus);
	
	//로고 이미지 바꾸기
	int busLogoChange(SqlSession session, Business busInfo);
	
	//대표 이미지 추가
	int busImgAdd(SqlSession session, Map map);
	
	//bus가져오기 번호로
	Business selectBusOne(SqlSession session, String busNo);
	
	double selectAnswerRate(SqlSession session, Map map);
	double selectAnswerPeriod(SqlSession session, Map map);
	
	Position selectPositionOne(SqlSession session, int positionNo);
	
	//지원자 리스트
	List<Applicant> selectBusAppl(SqlSession session, Map map, int cPage, int numPerPage);
	
	//지원자 리스트 카운트
	int selecBusApplCount(SqlSession session, Map map);
	
	//지원자 insert/delete
	int insertApplicant(SqlSession session, Map map);
	int deleteApplicant(SqlSession session, Map map);
	
	//지원자 좋아요 insert/delete
	int insertApplLike(SqlSession session, Map map);
	int deleteApplLike(SqlSession session, Map map);
	
	int selectCheckLike(SqlSession session, Map map);
	
	IntroCard selectResumeOne(SqlSession session, int applNo);
	List<CareerInCard> selectCareerList(SqlSession session, int resumeNo);
	List<EducationInCard> selectEducationList(SqlSession session, int resumeNo);
	List<Activitie> selectActivitieList(SqlSession session, int resumeNo);
	List<Lang> selectLangList(SqlSession session, int resumeNo); 
	List<Links> selectLinkList(SqlSession session, int resumeNo); 
	
	Member selectApplicant(SqlSession session, int memNo);
	
	Applicant selectApplOne(SqlSession session, int applNo);
	
	int updateApplOffer(SqlSession session, int applNo);
	int updateApplPf(SqlSession session, Map map);
	
	List<Position> selectPositionList(SqlSession session, Map map);
	
	int insertPosition(SqlSession session, Map map);
}
