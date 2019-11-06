package com.kh.developers.business.model.service;

import java.util.List;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.member.model.vo.Member;

public interface BusinessService {

	int insertMember(Member m, String url) throws Exception;
	
	int checkAuth(Member m);
	
	void sendMail(Member m, String url) throws Exception;
	
	int insertBusiness(Business bus);
	
	Business selectBusInfo(int memberNo);
	
	List<IntroCard> selectIntroCards(String duties);
}
