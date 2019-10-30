package com.kh.developers.resume.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Resume;

@Repository
public class ResumeDaoImpl implements ResumeDao {
	
	
	
	
	
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
	public int insertCareer(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("resume.insertCareer",m);
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
