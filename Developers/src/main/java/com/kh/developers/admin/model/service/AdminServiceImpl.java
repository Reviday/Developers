package com.kh.developers.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.developers.admin.model.dao.AdminDao;
import com.kh.developers.admin.model.vo.BusinessRequest;
import com.kh.developers.admin.model.vo.EnrollPosition;
import com.kh.developers.admin.model.vo.MappingCount;
import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.admin.model.vo.RequestMappingLog;
import com.kh.developers.business.model.vo.Business;
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
	public List<Integer> mappingAuthCounter(String authority) {
		return dao.mappingAuthCounter(session, authority);
	}
	
	@Override
	public List<Integer> mappingAuthCounter() {
		return dao.mappingAuthCounter(session);
	}
	
	@Override
	public List<Integer> mappingDivCounter() {
		return dao.mappingDivCounter(session);
	}
	
	@Override
	public List<MappingCount> mappingLogCounterSort(int order, String sort) {
		return dao.mappingLogCounterSort(session, order, sort);
	}
	
	@Override
	public List<MappingCount> mappingLogCounter() {
		return dao.mappingLogCounter(session);
	}
	
	@Override
	public List<Map<String, Integer>> selectVisitorChartData(String period, int term) {
		Map<String, Object> map=new HashMap<String, Object>();
		//period에 따른 분류(기간) - 동적쿼리에서 처리
		map.put("period", period);
		//term 값에 따른 값 전환
		switch(term) {
			case 0:term=1;break;
			case 1:term=2;break;
			case 2:term=3;break;
			case 3:term=4;break;
			case 4:term=6;break;
			case 5:term=8;break;
			case 6:term=12;break;
			case 7:term=24;break;
		};
		
		//검색용 front/back 저장
		List<Map<String, Integer>> resultList=new ArrayList<Map<String, Integer>>();
		int startTime=00;
		int maxLength=(int)(24/term);
		for(int i=0; i<maxLength; i++ ) {
			if(startTime<10) {
				map.put("front",String.valueOf("0"+(startTime-term)));
				map.put("back",String.valueOf("0"+startTime));
			} else if(startTime-term<10) {
				map.put("front",String.valueOf("0"+(startTime-term)));
				map.put("back",String.valueOf(startTime));
			} else {
				map.put("front",String.valueOf((startTime-term)));
				map.put("back",String.valueOf(startTime));
			}
			startTime+=term;
			resultList.add(dao.selectVisitorChartData(session, map));
		}
		
		System.out.println(resultList);
		return resultList;
	}
	
	@Override
	public Map<String, Object> selectHighestVisitor() {
		return dao.selectHighestVisitor(session);
	}
	
	@Override
	public List<Integer> selectVisitorStats() {
		return dao.selectVisitorStats(session);
	}
	
	@Override
	public List<Map<String, String>> selectJabField() {
		return dao.selectJabField(session);
	}
	
	@Override
	public int positionRejection(int positionNo) {
		return dao.positionRejection(session, positionNo);
	}
	
	@Override
	public int positionApproval(int positionNo) {
		return dao.positionApproval(session, positionNo);
	}
	
	@Override
	public EnrollPosition selectPositionOne(int positionNo) {
		return dao.selectPositionOne(session, positionNo);
	}
	
	@Override
	public List<EnrollPosition> selectEnrollPositionList(int cPage, int numPerPage) {
		return dao.selectEnrollPositionList(session, cPage, numPerPage);
	}
	
	@Override
	public int selectEnrollPositionCount() {
		return dao.selectEnrollPositionCount(session);
	}
	
	@Override
	@Transactional(value="transactionManager", rollbackFor=Exception.class)
	public int businessRequestRejection(int requestNo, int busNo, int memNo) throws Exception {
		int result=0;
		// 거절 처리 로직 
		// 1. 회원 레벨 1레벨로 하향
		result=dao.updateMemberLevel(session, memNo, 1);
		if(result>0) {
			// 2. businessr_request 테이블에서 해당 데이터 삭제
			result=dao.deleteBusinessRequest(session, requestNo);
			if(result>0) {
				//3. mem_bus_connection 테이블에서 연결된 데이터 삭제
				result=dao.deletMemBusConnection(session, busNo);
				if(result>0) {
					//4. business_info 테이블에서 해당 기업 정보 삭제
					result=dao.deleteBusinessInfo(session, busNo);
				}
			}
		} 
		
		// 로직 수행 후, result가 0 이하인 경우 동작이 제대로 이루어지지 않았다는 의미이므로, rollback 처리를 한다.
		if(result<=0) throw new Exception();
		
		return result;
	}
	
	@Override
	@Transactional(value="transactionManager", rollbackFor=Exception.class)
	public int businessRequestApproval(int requestNo, int busNo, int memNo) throws Exception {
		int result=0;
		// 승인 처리 로직 
		// 1. 회원 레벨 4레벨로 상승
		result=dao.updateMemberLevel(session, memNo, 4);
		if(result>0) {
			// 2. businessr_request 테이블에서 해당 데이터 삭제
			result=dao.deleteBusinessRequest(session, requestNo);
			if(result>0) {
				//3. business_info 테이블에서 status를 Y로 변경
				result=dao.updateBusinessInfoStatus(session, busNo);
			}
		} 
		
		// 로직 수행 후, result가 0 이하인 경우 동작이 제대로 이루어지지 않았다는 의미이므로, rollback 처리를 한다.
		if(result<=0) throw new Exception();
		
		return result;
	}
	
	@Override
	public Member selectMemberOne(int memNo) {
		return dao.selectMemberOne(session, memNo);
	}
	
	@Override
	public Business selectBusinessOne(int busNo) {
		return dao.selectBusinessOne(session, busNo);
	}
	
	@Override
	public int selectbusinessRequestCount() {
		return dao.selectbusinessRequestCount(session);
	}
	
	@Override
	public List<BusinessRequest> selectbusinessRequestList(int cPage, int numPerPage) {
		return dao.selectbusinessRequestList(session, cPage, numPerPage);
	}
	
	@Override
	public List<Map<String, Integer>> selectMemberStats() {
		return dao.selectMemberStats(session);
	}
	
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