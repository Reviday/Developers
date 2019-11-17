package com.kh.developers.business.model.service;

import java.util.List;
import java.util.Map;

import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.search.model.vo.Position;

public interface BusinessService2 {
	//bus 수정
	int updateBusInfo(Business bus);
	
	//로고 바꾸기
	int busLogoChange(Business busInfo);
	
	//대표이미지 추가
	int busImgAdd(Map map);
	
	//busNo로 비지니스 정보 가져오기
	Business selectBusOne(String busNo);	
	
	Double selectAnswerRate(Map map);
	Double selectAnswerPeriod(Map map);
	
	Position selectPositionOne(int positionNo);
	//지원자 리스트
	List<Applicant> selectBusAppl(Map map, int cPage, int numPerPage);

	//지원자 리스트 카운트
	int selectBusApplCount(Map map);
	
	//지원자 insert/delete
	int insertApplicant(Map map);
	int deleteApplicant(Map map);
	
	//지원자 좋아요 insert/delete
	int insertApplLike(Map map);
	int deleteApplLike(Map map);
	
	//지원자 좋아요 유무
	int selectCheckLike(Map map);
	
	//지원자 이력서 가져오기
	IntroCard selectResumeOne(int applNo);
	
	Member selectApplicant(int memNo);
	
	
	//회사 포지션 가져오기
	List<Position> selectPositionList(Map map);
	
	Applicant selectApplOne(int applNo);
	
	int updateApplOffer(int applNo);
	int updateApplPf(Map map);
	
	
	
	int insertPosition(Map map);
	
	

	

	
}
