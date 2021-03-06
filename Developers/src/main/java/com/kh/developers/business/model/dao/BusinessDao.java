package com.kh.developers.business.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.business.model.vo.Advertisement;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.CareerInCard;
import com.kh.developers.business.model.vo.EducationInCard;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.member.model.vo.Member;

public interface BusinessDao {
	
	int insertMember(SqlSessionTemplate session, Member m);
	
	void createAuthKey(SqlSessionTemplate session, Map<String, Object> map);
	
	int checkAuth(SqlSessionTemplate session, Member m);
	
	int successAuth(SqlSessionTemplate session, Member m);
	
	
//	사업장 로직
	int insertBusiness (SqlSessionTemplate session, Business bus);
	
	int insertConnection (SqlSessionTemplate session,int busNo,int memNo);
	
	int insertRequest(SqlSessionTemplate session, int busNo, int memNo);
	
	int updateMemLevel(SqlSessionTemplate session, int memNo);
	
	Business selectBusInfo (SqlSessionTemplate session, int memberNo);
	
	
	//	매치업 로직
	int selectCountBasic(SqlSessionTemplate session);
	List<IntroCard>selectIntroCards(SqlSessionTemplate session,int cPage, int numPerPage);
	
	int selectCountDuties(SqlSessionTemplate session, String duties);
	List<IntroCard>selectIntroCards(SqlSessionTemplate session, String duties,int cPage, int numPerPage);
	
	int selectCountBoth(SqlSessionTemplate session, String duties, String searchBox);
	List<IntroCard>selectIntroCards(SqlSessionTemplate session, String duties, String searchBox, int cPage, int numPerPage);
	
	int selectCountSearch(SqlSessionTemplate session, String searchBox);
	List<IntroCard>selectIntroCardsSearch(SqlSessionTemplate session, String searchBox,int cPage, int numPerPage);
	
	List<CareerInCard>selectCareers(SqlSessionTemplate session, int resumeNo);
	
	List<EducationInCard>selectEducations(SqlSessionTemplate session, int resumeNo);
	
	String selectFavorite(SqlSessionTemplate session, int busNo, int resumeNo);

	//openRoughResume 로직 
	IntroCard selectOneIntroCard(SqlSessionTemplate session, int resumeNo);
	
	//클릭 Favorite 로직
	int insertFavorite(SqlSessionTemplate session, int resumeNo, int busNo);
	int removeFavorite(SqlSessionTemplate session, int resumeNo, int busNo);
	
	//Favorites 불러오기 로직
	int selectCountFav(SqlSessionTemplate session, int busNo);
	List<IntroCard>selectFavorites(SqlSessionTemplate session, int busNo,int cPage, int numPerPage);
	
	//광고 포지션 불러오기 로직 
	List<Advertisement>selectPositionInfo(SqlSessionTemplate session, int busNo);
	List<Advertisement>selectAdvertisement(SqlSessionTemplate session, int busNo);
	String selectPositionName(SqlSessionTemplate session, int positionNo);
	
	//광고 insert 로직 
	int insertAd(SqlSessionTemplate session, Advertisement ad);
	
//	열람권 갯수 가져오기 
	int numOfTicket(SqlSessionTemplate session, int busNo);
	int insertTicket(SqlSessionTemplate sesion, int busNo, int num);
	int useTicket(SqlSessionTemplate session, int busNo);
	
//	읽은거 가져오기 
	int selectReaded(SqlSessionTemplate session,int busNo, int resumeNo);
	int insertReaded(SqlSessionTemplate session,int busNo, int resumeNo, int memNo);
	int selectMemNo(SqlSessionTemplate session, int resumeNo);
	
	int insertClick(SqlSessionTemplate session, int adNo);
	
//	applNo 가져오기 
	int selectApplNo(SqlSessionTemplate session, int busNo,int resumeNo);
}
