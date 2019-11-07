package com.kh.developers.business.model.service;

import java.util.List;
import java.util.Map;

import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface BusinessService2 {

	int busLogoChange(Business busInfo);
	
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
	
	Member selectApplicant(int memNo);
	
	
	

	

	
}
