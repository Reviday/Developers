package com.kh.developers.business.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.business.model.dao.BusinessDao2;
import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

@Service
public class BusinessServiceImpl2 implements BusinessService2 {
	@Autowired
	private BusinessDao2 dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int busLogoChange(Business busInfo) {
		int result=dao.busLogoChange(session, busInfo);
		return result;
	}

	@Override
	public List<Applicant> selectBusAppl(Map map, int cPage, int numPerPage) {
		List<Applicant> list=dao.selectBusApplNew(session, map, cPage, numPerPage);
		return list;
	}

	@Override
	public int selectBusApplCount(Map map) {
		int result=dao.selecBusApplNewCount(session, map);
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
	public Member selectApplicant(int memNo) {
		Member m=dao.selectApplicant(session, memNo);
		return m;
	}
	
	
	
}
