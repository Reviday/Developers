package com.kh.developers.resume.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.dao.ResumeDao;
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Education;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
import com.kh.developers.resume.model.vo.Resume;

@Service
public class ResumeServiceImpl implements ResumeService {
	@Autowired
	private ResumeDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	
	
	@Override
	public int insertEd(Resume r2) {
		// TODO Auto-generated method stub
		return dao.insertEd(session,r2);
	}

	@Override
	public int insertAct(Resume r2) {
		// TODO Auto-generated method stub
		return dao.insertAct(session,r2);
	}
	@Override
	public int insertLang(Resume r2) {
		// TODO Auto-generated method stub
		return dao.insertLang(session,r2);
	}

	@Override
	public int insertLink(Resume r2) {
		// TODO Auto-generated method stub
		return dao.insertLink(session,r2);
	}

	@Override
	public List<Education> selectEd(Resume r) {
		// TODO Auto-generated method stub
		return dao.selectEd(session,r);
	}

	@Override
	public List<Activitie> selectAc(Resume r) {
		// TODO Auto-generated method stub
		return dao.selectAc(session,r);
	}

	@Override
	public List<Lang> selectLang(Resume r) {
		// TODO Auto-generated method stub
		return dao.selectLang(session,r);
	}

	@Override
	public List<Links> selectLinks(Resume r) {
		// TODO Auto-generated method stub
		return dao.selectLinks(session,r);
	}

	@Override
	public Resume selectResumeViewOne(Resume r) {
		// TODO Auto-generated method stub
		return dao.selectResumeViewOne(session,r);
	}

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
	public int insertCareer(Resume r2) {
		// TODO Auto-generated method stub
		return dao.insertCareer(session,r2);
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
