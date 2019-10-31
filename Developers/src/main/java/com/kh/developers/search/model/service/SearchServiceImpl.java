package com.kh.developers.search.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.search.model.dao.SearchDao;
import com.kh.developers.search.model.vo.JobField;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<JobField> jobfieldList() {
		
		List<JobField> list = dao.jobfieldList(session);
		
		return list;
	}
	
}
