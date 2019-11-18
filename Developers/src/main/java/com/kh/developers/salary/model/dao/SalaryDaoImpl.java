package com.kh.developers.salary.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.salary.model.vo.Salary;
import com.kh.developers.search.model.vo.Position;

@Repository
public class SalaryDaoImpl implements SalaryDao {

	@Override
	public List<Salary> salarySelectList(SqlSessionTemplate session,String jobField) {
		// TODO Auto-generated method stub
		return session.selectList("salary.salarySelectList",jobField);
	}

	@Override
	public int selectedJobYears(SqlSessionTemplate session, Salary s) {
		// TODO Auto-generated method stub
		return session.selectOne("salary.selectedJobYears",s);
	}

	@Override
	public List<Position> salaryRecommandPositionList(SqlSessionTemplate session, String type) {
		// TODO Auto-generated method stub
		return session.selectList("salary.salaryRecommandPositionList",type);
	}
	
	

}
