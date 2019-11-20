package com.kh.developers.business.model.service;

import java.util.List;

import com.kh.developers.business.model.vo.Advertisement;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.CareerInCard;
import com.kh.developers.business.model.vo.EducationInCard;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.member.model.vo.Member;

public interface BusinessService {

	int insertMember(Member m, String url) throws Exception;
	
	int checkAuth(Member m);
	
	void sendMail(Member m, String url) throws Exception;
	
	int insertBusiness(Business bus, int memNo);
	
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
	
	String selectFavorite (int busNo, int resumeNo);
	
	
	//openRoughResume 로직 
	
	IntroCard selectOneIntroCard(int resumeNo);
	
	//Favorite클릭 로직 
	int insertFavorite(int resumeNo, int busNo);
	int removeFavorite(int resumeNo, int busNo);
	
	//Favorites 불러오기 로직
	int selectCountFav(int busNo);
	List<IntroCard>selectFavorites(int busNo,int cPage, int numPerPage);
	
	//광고 포지션 불러오기 로직 
	List<Advertisement>selectPositionInfo(int busNo);
	List<Advertisement>selectAdvertisement(int busNo);
	String selectPositionName(int positionNo);
	
	//광고 insert 로직 
	int insertAd(Advertisement ad);
	
//	열람권 갯수 가져오기 
	int numOfTicket(int busNo);
	
//	열람권 insert 
	int insertTicket(int busNo, int num);
//	열람권 사용 
	int useTicket(int busNo);
	
//	읽은것들 불어오기 
	String selectReaded(int busNo,int resumeNo);
}
