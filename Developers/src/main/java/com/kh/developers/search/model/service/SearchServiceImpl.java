package com.kh.developers.search.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.search.model.dao.SearchDao;
import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.Position;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	//직업분야리스트
	@Override
	public List<JobField> jobfieldList() {
		
		List<JobField> list = dao.jobfieldList(session);	
		return list;
	}
	//직업분야리스트(Ajax)
	
	@Override
	public List<JobField> jobfieldAjaxList(String jobName) {
		
		List<JobField> list = dao.jobfieldAjaxList(session, jobName);
		return list;
	}
	
	@Override
	public List<Position> positionList() {
		List<Position> psList = dao.positionList(session);
		return null;
	}
	
}
