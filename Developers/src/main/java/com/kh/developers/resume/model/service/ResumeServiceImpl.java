package com.kh.developers.resume.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.dao.ResumeDao;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Resume;

@Service
public class ResumeServiceImpl implements ResumeService {
	@Autowired
	private ResumeDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Career> selectCareer(Resume r) {
		// TODO Auto-generated method stub
		return dao.selectCareer(session,r);
	}

	@Override
	public Resume selectResumeOne(Resume r) {
		// TODO Auto-generated method stub
		return dao.selectResumeOne(session,r);
	}

	@Override
	public int insertCareer(Member m) {
		// TODO Auto-generated method stub
		return dao.insertCareer(session,m);
	}

	@Override
	public List<Resume> selectResume(Member m2) {
		// TODO Auto-generated method stub
		return dao.selectResume(session,m2);
	}

	@Override
	public int insertResume(Member m) {
		// TODO Auto-generated method stub
		return dao.insertResume(session,m);
	}
	
}
