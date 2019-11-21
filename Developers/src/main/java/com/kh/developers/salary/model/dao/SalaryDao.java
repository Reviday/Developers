package com.kh.developers.salary.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.salary.model.vo.Salary;
import com.kh.developers.search.model.vo.Position;

public interface SalaryDao {

	List<Salary> salarySelectList(SqlSessionTemplate session, String jobField);

	int selectedJobYears(SqlSessionTemplate session, Salary s);

	List<Position> salaryRecommandPositionList(SqlSessionTemplate session, String jobName1);

}
