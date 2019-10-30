package com.kh.developers.resume.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Education;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
import com.kh.developers.resume.model.vo.Resume;

@Repository
public class ResumeDaoImpl implements ResumeDao {
	
	
	
	
	
	@Override
	public int insertEd(SqlSessionTemplate session, Resume r2) {
		// TODO Auto-generated method stub
		return session.insert("resume.insertEd",r2);
	}

	@Override
	public int insertAct(SqlSessionTemplate session, Resume r2) {
		// TODO Auto-generated method stub
		return session.insert("resume.insertAct",r2);
	}

	@Override
	public int insertLang(SqlSessionTemplate session, Resume r2) {
		// TODO Auto-generated method stub
		return session.insert("resume.insertLang",r2);
	}

	@Override
	public int insertLink(SqlSessionTemplate session, Resume r2) {
		// TODO Auto-generated method stub
		return session.insert("resume.insertLink",r2);
	}

	@Override
	public List<Education> selectEd(SqlSessionTemplate session, Resume r) {
		// TODO Auto-generated method stub
		return session.selectList("resume.selectEd",r);
	}

	@Override
	public List<Activitie> selectAc(SqlSessionTemplate session, Resume r) {
		// TODO Auto-generated method stub
		return session.selectList("resume.selectAc",r);
	}

	@Override
	public List<Lang> selectLang(SqlSessionTemplate session, Resume r) {
		// TODO Auto-generated method stub
		return session.selectList("resume.selectLang",r);
	}

	@Override
	public List<Links> selectLinks(SqlSessionTemplate session, Resume r) {
		// TODO Auto-generated method stub
		return session.selectList("resume.selectLinks",r);
	}

	@Override
	public Resume selectResumeViewOne(SqlSessionTemplate session, Resume r) {
		// TODO Auto-generated method stub
		return session.selectOne("resume.selectResumeViewOne",r);
	}

	@Override
	public List<Career> selectCareer(SqlSessionTemplate session, Resume r) {
		// TODO Auto-generated method stub
		return session.selectList("resume.selectCareer",r);
	}

	@Override
	public Resume selectResumeOne(SqlSessionTemplate session, Resume r) {
		// TODO Auto-generated method stub
		return session.selectOne("resume.selectResumeOne",r);
	}

	@Override
	public int insertCareer(SqlSessionTemplate session, Resume r2) {
		// TODO Auto-generated method stub
		return session.insert("resume.insertCareer",r2);
	}

	@Override
	public List<Resume> selectResume(SqlSessionTemplate session, Member m2) {
		// TODO Auto-generated method stub
		return session.selectList("resume.selectResume",m2);
	}

	@Override
	public int insertResume(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("resume.insertResume", m);
	}

	
	


}
