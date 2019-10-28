package com.kh.developers.resume.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.dao.ResumeDao;

@Service
public class ResumeServiceImpl implements ResumeService {
	@Autowired
	private ResumeDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Override
	public int insertResume(Member m) {
		// TODO Auto-generated method stub
		return dao.insertResume(session,m);
	}
	
}
