package com.kh.developers.business.model.service;

import java.util.List;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface BusinessService2 {

	int busLogoChange(Business busInfo);
	
	//지원자 리스트
	List<Member> selectBusApplNew(int cPage, int numPerPage);
	List<Member> selectBusApplStart(int cPage, int numPerPage);
	List<Member> selectBusApplPass(int cPage, int numPerPage);
	List<Member> selectBusApplFail(int cPage, int numPerPage);
	List<Member> selectBusApplEnd(int cPage, int numPerPage);
	//지원자 리스트 카운트
	int selectBusApplNewCount();
	int selectBusApplStartCount();
	int selectBusApplPassCount();
	int selectBusApplFailCount();
	int selectBusApplEndCount();
	

	
}
