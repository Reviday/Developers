package com.kh.developers.salary.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.salary.model.vo.Salary;

@Repository
public class SalaryDaoImpl implements SalaryDao {

	@Override
	public List<Salary> salarySelectList(SqlSessionTemplate session,String jobField) {
		// TODO Auto-generated method stub
		return session.selectList("salary.salarySelectList",jobField);
	}
	
	

}
