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
	public List<Map<String, Integer>> selectLoginLogChartData(String data) {
		if(!(data.equals("Y")||data.equals("N"))) data=null;
		return dao.selectLoginLogChartData(session, data);
	}
	
	@Override
	public List<Integer> selectLoginLogStats() {
		return dao.selectLoginLogStats(session);
	}
	
	@Override
	public int tagRejection(int tagNo) {
		return dao.deleteTagOpinion(session, tagNo);
	}
	
	@Override
	public int tagApproval(int tagNo, int busNo, String tagOpinion) {
		//태그를 정상적으로 tag 테이블에 삽입 하기위하여
		//문자열 처리되어있는 태그들을 분할하여 배열에 담아둔다.
		String[] tags=tagOpinion.split(",");
		//해당 태그를 tag 테이블에 insert 하는 작업을 거친다.
		for(String tag: tags) {
			dao.insertTag(session, tag, busNo);
		}
		
		//끝으로 태그를 삭제처리한다.
		return dao.deleteTagOpinion(session, tagNo);
	}
	
	@Override
	public List<Map<String, Object>> selectTagOpinionList(int cPage, int numPerPage) {
		return dao.selectTagOpinionList(session, cPage, numPerPage);
	}
	
	@Override
	public int selectTagOpinionCount() {
		return dao.selectTagOpinionCount(session);
	}
	
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