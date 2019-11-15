package com.kh.developers.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.developers.admin.model.dao.AdminDao;
import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.admin.model.vo.RequestMappingLog;
import com.kh.developers.common.util.SearchValuesTemplate;
import com.kh.developers.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	@Autowired
	private SqlSessionTemplate session;
	private SearchValuesTemplate svt;
	
	@Override
	public void insertRequestMappingLog(RequestMappingLog rml) {
		dao.insertRequestMappingLog(session, rml);
	}
	
	@Override
	public List<Member> selectMemberListBySearch(String value, int searchLevel, int cPage, int numPerPage) {
		Map<String, Object> searchValue=new HashMap<String, Object>();
		if(value != null && !value.equals("")) {
			svt=new SearchValuesTemplate(value);
			searchValue=svt.getSearchValue();
		}
		if(searchLevel>=0) {
			searchValue.put("searchLevel",searchLevel);
		}
 		return dao.selectMemberListBySearch(session, searchValue, cPage, numPerPage);
	}
	
	@Override
	public int selectMemberCountBySearch(String value, int searchLevel) {
		//검색조건을 위함
		Map<String, Object> searchValue=new HashMap<String, Object>();
		if(value != null && !value.equals("")) {
			svt=new SearchValuesTemplate(value);
			searchValue=svt.getSearchValue();
		}
		if(searchLevel>=0) {
			searchValue.put("searchLevel",searchLevel);
		}
 		return dao.selectMemberCountBySearch(session, searchValue);
	}
	
	@Override
	public List<MemberLoginLog> selectLoginLogListBySearch(String value, String mllSuccess, int cPage, int numPerPage) {
		Map<String, Object> searchValue=new HashMap<String, Object>();
		if(value != null && !value.equals("")) {
			svt=new SearchValuesTemplate(value);
			searchValue=svt.getSearchValue();
		}
		if(!(mllSuccess.equals("A") || mllSuccess.equals("R")) ) {
			searchValue.put("mllSuccess",mllSuccess);
		}
 		return dao.selectLoginLogListBySearch(session, searchValue, cPage, numPerPage);
	}
	
	@Override
	public int selectLoginLogCountBySearch(String value, String mllSuccess) {
		Map<String, Object> searchValue=new HashMap<String, Object>();
		if(value != null && !value.equals("")) {
			svt=new SearchValuesTemplate(value);
			searchValue=svt.getSearchValue();
		}
		if(!(mllSuccess.equals("A") || mllSuccess.equals("R")) ) {
			searchValue.put("mllSuccess",mllSuccess);
		}
 		return dao.selectLoginLogCountBySearch(session, searchValue);
	}
	
	@Override
	public int restoreMember(Member m) {
		return dao.restoreMember(session, m);
	}
	
	@Override
	public List<Member> selectWithdrawMemberListBySearch(String value, int cPage, int numPerPage) {
		svt=new SearchValuesTemplate(value);
		Map<String, Object> searchValue=svt.getSearchValue();
 		return dao.selectWithdrawMemberListBySearch(session, searchValue, cPage, numPerPage);
	}
	
	@Override
	public int selectWithdrawMemberCountBySearch(String value) {
		svt=new SearchValuesTemplate(value);
		Map<String, Object> searchValue=svt.getSearchValue();
 		return dao.selectWithdrawMemberCountBySearch(session, searchValue);
	}
	
	@Override
	public int deleteMember(Member m) {
		return dao.deleteMember(session, m);
	}
	
	@Override
	public int updateMember(Member m) {
		return dao.updateMember(session, m);
	}
	
}