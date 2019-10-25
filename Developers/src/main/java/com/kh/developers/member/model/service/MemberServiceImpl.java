package com.kh.developers.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.member.model.dao.MemberDao;
import com.kh.developers.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Member selectMemberOne(Member m) {
		return dao.selectMemberOne(session, m);
	}
}
