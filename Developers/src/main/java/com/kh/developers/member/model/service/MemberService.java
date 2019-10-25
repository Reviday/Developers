package com.kh.developers.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.developers.member.model.dao.MemberDao;
import com.kh.developers.member.model.vo.Member;

public interface MemberService {
	
	Member selectMemberOne(Member m);
}
