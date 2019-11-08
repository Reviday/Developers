package com.kh.developers.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.admin.model.dao.AdminDao;
import com.kh.developers.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int selectMemberCountBySearch(String value) {
		// value 값을 공백을 기준으로 검색 조건을 담는다.
		Map<String, String> searchValue=new HashMap<String, String>();
		String[] searchArr=value.split("\\s");
		for(int i=0; i<searchArr.length; i++) {
			searchValue.put(Integer.toString(i), searchArr[i]);
		};
 		return dao.selectMemberCountBySearch(session, searchValue);
	}
	
	@Override
	public List<Member> deleteMember(Member m, int cPage, int numPerPage) {
		int result=dao.deleteMember(session, m);
		List<Member> list=new ArrayList<Member>();
		if(result>0) {
			list=dao.selectMemberList(session, cPage, numPerPage);
		} else {
			list=null;
		}
		return list;
	}
	
	@Override
	public int updateMember(Member m) {
		return dao.updateMember(session, m);
	}
	
	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		return dao.selectMemberList(session, cPage, numPerPage);
	}
	
	@Override
	public int selectMemberCount() {
		return dao.selectMemberCount(session);
	}
}