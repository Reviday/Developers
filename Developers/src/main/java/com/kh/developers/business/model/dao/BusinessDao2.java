package com.kh.developers.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface BusinessDao2 {
	//bus 수정
	int updateBusInfo(SqlSession session, Business bus);
	
	//로고 이미지 바꾸기
	int busLogoChange(SqlSession session, Business busInfo);
	
	//대표 이미지 추가
	int busImgAdd(SqlSession session, Map map);
	
	//bus가져오기 번호로
	Business selectBusOne(SqlSession session, String busNo);
	
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
	
	Member selectApplicant(SqlSession session, int memNo);
	
}
