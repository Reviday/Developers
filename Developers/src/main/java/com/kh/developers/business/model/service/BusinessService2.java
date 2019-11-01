package com.kh.developers.business.model.service;

import java.util.List;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface BusinessService2 {

	int busLogoChange(Business busInfo);
	
	//지원자 리스트
	List<Member> selectBusApplNew();
	List<Member> selectBusApplStart();
	List<Member> selectBusApplPass();
	List<Member> selectBusApplFail();
	List<Member> selectBusApplEnd();
	//지원자 리스트 카운트
	int selectBusApplNewCount();
	int selectBusApplStartCount();
	int selectBusApplPassCount();
	int selectBusApplFailCount();
	int selectBusApplEndCount();
	

	
}
