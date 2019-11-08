package com.kh.developers.business.model.service;

import java.util.List;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.CareerInCard;
import com.kh.developers.business.model.vo.EducationInCard;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.member.model.vo.Member;

public interface BusinessService {

	int insertMember(Member m, String url) throws Exception;
	
	int checkAuth(Member m);
	
	void sendMail(Member m, String url) throws Exception;
	
	int insertBusiness(Business bus);
	
	Business selectBusInfo(int memberNo);
	
	
	// 매치업  introCard 불러오기 로직

	int selectCountBasic();
	List<IntroCard> selectIntroCards(int cPage, int numPerPage);
	
	int selectCountDuties(String duties);
	List<IntroCard> selectIntroCards(String duties,int cPage, int numPerPage);
	
	int selectCountBoth(String duties, String searchBox);
	List<IntroCard> selectIntroCards(String duties, String searchBox, int cPage, int numPerPage);
	
	int selectCountSearch(String searchBox);
	List<IntroCard> selectIntroCardsSearch(String searchBox,int cPage, int numPerPage);
	
	List<CareerInCard> selectCareers(int resumeNo);
	
	List<EducationInCard> selectEducations(int resumeNo);
}
