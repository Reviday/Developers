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
	List<IntroCard>selectIntroCards(SqlSessionTemplate session);
	
	List<IntroCard>selectIntroCards(SqlSessionTemplate session, String duties);
	
	List<IntroCard>selectIntroCards(SqlSessionTemplate session, String duties, String searchBox);
	
	List<IntroCard>selectIntroCardsSearch(SqlSessionTemplate session, String searchBox);
	
	List<CareerInCard>selectCareers(SqlSessionTemplate session, int resumeNo);
	
	List<EducationInCard>selectEducations(SqlSessionTemplate session, int resumeNo);
	
}
