package com.kh.developers.salary.model.service;

import java.util.List;

import com.kh.developers.salary.model.vo.Salary;
import com.kh.developers.search.model.vo.Position;

public interface SalaryService {

	List<Salary> salarySelectList(String jobField);

	int selectedJobYears(Salary s);

	List<Position> salaryRecommandPositionList(String type);

}
