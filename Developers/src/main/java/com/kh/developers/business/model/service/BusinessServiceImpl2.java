package com.kh.developers.business.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.business.model.dao.BusinessDao2;
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
	public List<Member> selectBusApplNew() {
		List<Member> list=dao.selectBusApplNew(session);
		return list;
	}

	@Override
	public List<Member> selectBusApplStart() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> selectBusApplPass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> selectBusApplFail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> selectBusApplEnd() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectBusApplNewCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectBusApplStartCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectBusApplPassCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectBusApplFailCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectBusApplEndCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
