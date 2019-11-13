package com.kh.developers.resume.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.member.model.vo.Interests;
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
	public int updateResume(Resume r) {
		// TODO Auto-generated method stub
		return dao.updateResume(session,r);
	}

	@Override
	public int deleteResume(Resume r) {
		// TODO Auto-generated method stub
		return dao.deleteResume(session,r);
	}

	@Override
	public int updateInterestsRno(Resume r) {
		// TODO Auto-generated method stub
		return dao.updateInterestsRno(session,r);
	}

	@Override
	public int insertMathupCareer(Resume r) {
		// TODO Auto-generated method stub
		return dao.insertMathupCareer(session,r);
	}

	@Override
	public int insertMathupEd(Resume r) {
		// TODO Auto-generated method stub
		return dao.insertMathupEd(session,r);
	}

	@Override
	public int insertMathupResume(Member m) {
		// TODO Auto-generated method stub
		return dao.insertMathupResume(session,m);
	}

	@Override
	public Interests selectInter(Member m) {
		// TODO Auto-generated method stub
		return dao.selectInter(session,m);
	}

	@Override
	public Resume selectMathUpResume(Member m) {
		// TODO Auto-generated method stub
		return dao.selectMathUpResume(session,m);
	}

	@Override
	public int updateAct(Activitie a) {
		// TODO Auto-generated method stub
		return dao.updateAct(session,a);
	}

	@Override
	public int updateLang(Lang l) {
		// TODO Auto-generated method stub
		return dao.updateLang(session,l);
	}

	@Override
	public int updateLinks(Links l) {
		// TODO Auto-generated method stub
		return dao.updateLinks(session,l);
	}

	@Override
	public int updateEd(Education e) {
		// TODO Auto-generated method stub
		return dao.updateEd(session,e);
	}

	@Override
	public int updateCareer(Career c) {
		// TODO Auto-generated method stub
		return dao.updateCareer(session,c);
	}

	@Override
	public int deleteEd(int deleteNo) {
		// TODO Auto-generated method stub
		return dao.deleteEd(session,deleteNo);
	}

	@Override
	public int deleteAc(int deleteNo) {
		// TODO Auto-generated method stub
		return dao.deleteAc(session,deleteNo);
	}

	@Override
	public int deleteLa(int deleteNo) {
		// TODO Auto-generated method stub
		return dao.deleteLa(session,deleteNo);
	}

	@Override
	public int deleteLi(int deleteNo) {
		// TODO Auto-generated method stub
		return dao.deleteLi(session,deleteNo);
	}

	@Override
	public int deleteCareer(int deleteNo) {
		// TODO Auto-generated method stub
		return dao.deleteCareer(session,deleteNo);
	}

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
