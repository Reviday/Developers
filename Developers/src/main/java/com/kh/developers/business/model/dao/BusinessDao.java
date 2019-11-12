package com.kh.developers.business.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

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

	//openRoughResume 로직 
	IntroCard selectOneIntroCard(SqlSessionTemplate session, int resumeNo);
	
	//클릭 Favorite 로직
	int insertFavorite(SqlSessionTemplate session, int resumeNo, int busNo);
	int removeFavorite(SqlSessionTemplate session, int resumeNo, int busNo);
	
}
