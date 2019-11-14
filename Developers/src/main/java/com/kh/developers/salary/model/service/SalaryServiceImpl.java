package com.kh.developers.salary.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.salary.model.dao.SalaryDao;

@Service
public class SalaryServiceImpl implements SalaryService {
	
	@Autowired
	private SalaryDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	

}
