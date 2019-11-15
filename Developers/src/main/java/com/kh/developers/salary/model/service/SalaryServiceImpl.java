package com.kh.developers.salary.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.salary.model.dao.SalaryDao;
import com.kh.developers.salary.model.vo.Salary;

@Service
public class SalaryServiceImpl implements SalaryService {
	
	@Autowired
	private SalaryDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Salary> salarySelectList(String jobField) {
		// TODO Auto-generated method stub
		return dao.salarySelectList(session,jobField);
	}

	@Override
	public int selectedJobYears(Salary s) {
		// TODO Auto-generated method stub
		return dao.selectedJobYears(session,s);
	}
	
	
	
	

}
