package com.kh.developers.search.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.search.model.vo.JobField;

@Repository
public class SearchDaoImpl implements SearchDao {

	@Override
	public List<JobField> jobfieldList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.jobfieldList");
	}
	
}
