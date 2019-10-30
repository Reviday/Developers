package com.kh.developers.business.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.business.model.dao.BusinessDao;
import com.kh.developers.business.model.vo.Business;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	private BusinessDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertEmployer(Map map) {
		
		return dao.insertEmployer(session, map);
	}
	
	@Override
	public int insertBusiness(Business bus) {

		return dao.insertBusiness(session, bus);
	}
	
	@Override
	public Business selectBusInfo(int memberNo) {
		
		return dao.selectBusInfo(session, memberNo);
	}

}
