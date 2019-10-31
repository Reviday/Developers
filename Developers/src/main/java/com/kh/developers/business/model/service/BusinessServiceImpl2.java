package com.kh.developers.business.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.business.model.dao.BusinessDao2;
import com.kh.developers.business.model.vo.Business;

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

}
