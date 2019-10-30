package com.kh.developers.resume.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Resume;

public interface ResumeDao {
	int insertResume(SqlSessionTemplate session,Member m);
	List<Resume> selectResume(SqlSessionTemplate session,Member m2);
	int insertCareer(SqlSessionTemplate session,Member m);
	Resume selectResumeOne(SqlSessionTemplate session,Resume r);
	List<Career> selectCareer(SqlSessionTemplate session,Resume r);
}
