package com.kh.developers.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface BusinessDao2 {
	int busLogoChange(SqlSession session, Business busInfo);
	
	//지원자 리스트
	List<Applicant> selectBusApplNew(SqlSession session, Map map, int cPage, int numPerPage);
	
	//지원자 리스트 카운트
	int selecBusApplNewCount(SqlSession session, Map map);
	
	//지원자 좋아요 insert/delete
	int insertApplLike(SqlSession session, Map map);
	int deleteApplLike(SqlSession session, Map map);
	
	int selectCheckLike(SqlSession session, Map map);
	
	Member selectApplicant(SqlSession session, int memNo);
	
}
