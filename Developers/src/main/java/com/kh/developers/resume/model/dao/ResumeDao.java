package com.kh.developers.resume.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.member.model.vo.Member;

public interface ResumeDao {
	int insertResume(SqlSessionTemplate session,Member m);
}
