package com.kh.developers.recommend.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.recommend.model.dao.RecommendDao;

@Service
public class RecommendServiceImpl implements RecommendService{

	@Autowired
	private RecommendDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
}
