package com.kh.developers.resume.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.member.model.vo.Member;

@Repository
public class ResumeDaoImpl implements ResumeDao {

	@Override
	public int insertResume(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("resume.insertResume", m);
	}

	
	


}
