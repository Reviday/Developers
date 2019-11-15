package com.kh.developers.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.CareerInCard;
import com.kh.developers.business.model.vo.EducationInCard;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
import com.kh.developers.search.model.vo.Position;

@Repository
public class BusinessDaoImpl2 implements BusinessDao2 {

	@Override
	public int updateBusInfo(SqlSession session, Business bus) {
		return session.update("business2.updateBusInfo", bus);
	}


	@Override
	public int busLogoChange(SqlSession session, Business busInfo) {
		return session.update("business2.busLogoChange", busInfo);
	}
	

	@Override
	public int busImgAdd(SqlSession session, Map map) {
		return session.update("business2.busImgAdd", map);
	}

	@Override
	public Business selectBusOne(SqlSession session, String busNo) {
		return session.selectOne("business2.selectBusOne", busNo);
	}
	
	@Override
	public double selectAnswerRate(SqlSession session, Map map) {
		return session.selectOne("business2.selectAnswerRate", map);
	}


	@Override
	public double selectAnswerPeriod(SqlSession session, Map map) {
		return session.selectOne("business2.selectAnswerPeriod", map);
	}

	@Override
	public Position selectPositionOne(SqlSession session, int positionNo) {
		return session.selectOne("business2.selectPositionOne", positionNo);
	}


	@Override
	public List<Applicant> selectBusAppl(SqlSession session, Map map,  int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("business2.selectBusAppl", map, row);
	}


	@Override
	public int selecBusApplCount(SqlSession session, Map map) {
		return session.selectOne("business2.selectBusApplCount", map);
	}
	
	@Override
	public int insertApplicant(SqlSession session, Map map) {
		return session.insert("business2.insertApplicant", map);
	}

	@Override
	public int deleteApplicant(SqlSession session, Map map) {
		return session.update("business2.deleteApplicant", map);
	}

	
	
	
	@Override
	public int insertApplLike(SqlSession session, Map map) {
		return session.insert("business2.insertApplLike", map);
	}
	

	@Override
	public int deleteApplLike(SqlSession session, Map map) {
		return session.insert("business2.deleteApplLike", map);
	}
	

	@Override
	public int selectCheckLike(SqlSession session, Map map) {
		return session.selectOne("business2.selectCheckLike", map);
	}

	
	@Override
	public IntroCard selectResumeOne(SqlSession session, int applNo) {
		return session.selectOne("business2.selectResumeOne", applNo);
	}
	

	@Override
	public List<CareerInCard> selectCareerList(SqlSession session, int resumeNo) {
		return session.selectList("business2.selectCareerList", resumeNo);
	}


	@Override
	public List<EducationInCard> selectEducationList(SqlSession session, int resumeNo) {
		return session.selectList("business2.selectEducationList", resumeNo);
	}


	@Override
	public List<Activitie> selectActivitieList(SqlSession session, int resumeNo) {
		return session.selectList("business2.selectActivitieList", resumeNo);
	}


	@Override
	public List<Lang> selectLangList(SqlSession session, int resumeNo) {
		return session.selectList("business2.selectLangList", resumeNo);
	}


	@Override
	public List<Links> selectLinkList(SqlSession session, int resumeNo) {
		return session.selectList("business2.selectLinkList", resumeNo);
	}


	@Override
	public Member selectApplicant(SqlSession session, int memNo) {
		return session.selectOne("business2.selectApplicant", memNo);
	}

	@Override
	public Applicant selectApplOne(SqlSession session, int applNo) {
		return session.selectOne("business2.selectApplOne", applNo);
	}

	
	@Override
	public int updateApplOffer(SqlSession session, int applNo) {
		return session.update("business2.updateApplOffer", applNo);
	}


	@Override
	public int updateApplPf(SqlSession session, Map map) {
		return session.update("business2.updateApplPf",map);
	}


	@Override
	public List<Position> selectPositionList(SqlSession session, Map map) {
		return session.selectList("business2.selectPositionList", map);
	}
	

	
	
	
}
