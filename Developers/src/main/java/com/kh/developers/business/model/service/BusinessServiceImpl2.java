package com.kh.developers.business.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.business.model.dao.BusinessDao2;
import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.search.model.vo.Position;

@Service
public class BusinessServiceImpl2 implements BusinessService2 {
	@Autowired
	private BusinessDao2 dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int updateBusInfo(Business bus) {
		int result=dao.updateBusInfo(session, bus);
		return result;
	}

	@Override
	public int busLogoChange(Business busInfo) {
		int result=dao.busLogoChange(session, busInfo);
		return result;
	}

	@Override
	public int busImgAdd(Map map) {
		int result=dao.busImgAdd(session, map);
		return result;
	}


	@Override
	public Business selectBusOne(String busNo) {
		Business bus=dao.selectBusOne(session, busNo);
		return bus;
	}

	@Override
	public List<Integer> selectApplPoList(Map map) {
		List<Integer> list=dao.selectApplPoList(session, map);
		return list;
	}

	@Override
	public List<Applicant> selectBusAppl(Map map, int cPage, int numPerPage) {
		List<Applicant> list=dao.selectBusAppl(session, map, cPage, numPerPage);
		return list;
	}

	@Override
	public int selectBusApplCount(Map map) {
		int result=dao.selecBusApplCount(session, map);
		return result;
	}
	
	@Override
	public int insertApplicant(Map map) {
		int result=dao.insertApplicant(session, map);
		return result;
	}

	@Override
	public int deleteApplicant(Map map) {
		int result=dao.deleteApplicant(session, map);
		return result;
	}
	
	
	
	

	@Override
	public int insertApplLike(Map map) {
		int result=dao.insertApplLike(session, map);
		return result;
	}
	

	@Override
	public int deleteApplLike(Map map) {
		int result=dao.deleteApplLike(session, map);
		return result;
	}
	
	

	@Override
	public int selectCheckLike(Map map) {
		int result=dao.selectCheckLike(session, map);
		return result;
	}
	
	

	@Override
	public IntroCard selectResumeOne(int applNo) {
		IntroCard ic=dao.selectResumeOne(session, applNo);
		ic.setCareers(dao.selectCareerList(session, ic.getResumeNo()));
		ic.setEducations(dao.selectEducationList(session, ic.getResumeNo()));
		ic.setActivities(dao.selectActivitieList(session, ic.getResumeNo()));
		ic.setLanguages(dao.selectLangList(session, ic.getResumeNo()));
		ic.setLinks(dao.selectLinkList(session, ic.getResumeNo()));
		return ic;
	}

	@Override
	public Applicant selectApplOne(int applNo) {
		Applicant appl=dao.selectApplOne(session, applNo);
		return appl;
	}

	@Override
	public int updateApplOffer(int applNo) {
		int result=dao.updateApplOffer(session, applNo);
		return result;
	}

	@Override
	public Member selectApplicant(int memNo) {
		Member m=dao.selectApplicant(session, memNo);
		return m;
	}

	@Override
	public List<Position> selectPositionList(Map map) {
		List<Position> poList=dao.selectPositionList(session, map); 
		return poList;
	}
	
	
	
	
	
}
