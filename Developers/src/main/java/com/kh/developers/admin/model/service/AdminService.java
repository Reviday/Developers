package com.kh.developers.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.developers.admin.model.vo.BusinessRequest;
import com.kh.developers.admin.model.vo.EnrollPosition;
import com.kh.developers.admin.model.vo.MappingCount;
import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.admin.model.vo.RequestMappingLog;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface AdminService {
	
	int updateMember(Member m);
	int deleteMember(Member m);
	int selectWithdrawMemberCountBySearch(String value);
	List<Member> selectWithdrawMemberListBySearch(String value, int cPage, int numPerPage);
	int restoreMember(Member m);
	int selectLoginLogCountBySearch(String value, String mllSuccess);
	List<MemberLoginLog> selectLoginLogListBySearch(String value, String mllSuccess, int cPage, int numPerPage);
	int selectMemberCountBySearch(String value, int searchLevel);
	List<Member> selectMemberListBySearch(String value, int searchLevel, int cPage, int numPerPage);
	void insertRequestMappingLog(RequestMappingLog rml);
	int selectTagOpinionCount();
	List<Map<String, Object>> selectTagOpinionList(int cPage, int numPerPage);
	int tagApproval(int tagNo, int busNo, String tagOpinion);
	int tagRejection(int tagNo);
	List<Integer> selectLoginLogStats();
	List<Map<String, Integer>> selectLoginLogChartData(String data);
	List<Map<String, Integer>> selectMemberStats();
	int selectbusinessRequestCount();
	List<BusinessRequest> selectbusinessRequestList(int cPage, int numPerPage);
	Business selectBusinessOne(int busNo);
	Member selectMemberOne(int memNo);
	int businessRequestApproval(int requestNo, int busNo, int memNo) throws Exception;
	int businessRequestRejection(int requestNo, int busNo, int memNo) throws Exception;
	int selectEnrollPositionCount();
	List<EnrollPosition> selectEnrollPositionList(int cPage, int numPerPage);
	EnrollPosition selectPositionOne(int positionNo);
	int positionApproval(int positionNo);
	int positionRejection(int positionNo);
	List<Map<String, String>> selectJabField();
	List<Integer> selectVisitorStats();
	Map<String, Object> selectHighestVisitor();
	List<Map<String, Integer>> selectVisitorChartData(String period, int term);
	List<MappingCount> mappingLogCounter();
	List<MappingCount> mappingLogCounterSort(int order, String sort);
	List<Integer> mappingDivCounter();
	List<Integer> mappingAuthCounter();
	List<Integer> mappingAuthCounter(String authority);
	List<Map<String,Object>> mappingAuthUsedCounter(String authority);
}
