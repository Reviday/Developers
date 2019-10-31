package com.kh.developers.search.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.search.model.vo.JobField;

public interface SearchDao {

	List<JobField> jobfieldList(SqlSessionTemplate session);
	
}
