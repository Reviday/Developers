package com.kh.developers.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.developers.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Member> selectMemberList(SqlSessionTemplate sessionint, int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("member.selectMemberList", null, r);
	}
}
