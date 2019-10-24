package com.kh.developers.business.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.business.model.dao.BusinessDao;

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

}
