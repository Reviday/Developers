package com.kh.developers.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.admin.model.vo.BusinessRequest;
import com.kh.developers.admin.model.vo.EnrollPosition;
import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.admin.model.vo.RequestMappingLog;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

public interface AdminDao {

	int updateMember(SqlSessionTemplate session, Member m);
	int deleteMember(SqlSessionTemplate session, Member m);
	int selectMemberCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue);
	List<Member> selectMemberListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage, int numPerPage);
	int selectWithdrawMemberCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue);
	List<Member> selectWithdrawMemberListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage, int numPerPage);
	int restoreMember(SqlSessionTemplate session, Member m);
	int selectLoginLogCountBySearch(SqlSessionTemplate session, Map<String, Object> searchValue);
	List<MemberLoginLog> selectLoginLogListBySearch(SqlSessionTemplate session, Map<String, Object> searchValue, int cPage, int numPerPage);
	void insertRequestMappingLog(SqlSessionTemplate session, RequestMappingLog rml);
	int selectTagOpinionCount(SqlSessionTemplate session);
	List<Map<String, Object>> selectTagOpinionList(SqlSessionTemplate session, int cPage, int numPerPage);
	int deleteTagOpinion(SqlSessionTemplate session, int tagNo);
	int insertTag(SqlSessionTemplate session, String tag, int busNo);
	List<Integer> selectLoginLogStats(SqlSessionTemplate session);
	List<Map<String, Integer>> selectLoginLogChartData(SqlSessionTemplate session, String data);
	List<Map<String, Integer>> selectMemberStats(SqlSessionTemplate session);
	int selectbusinessRequestCount(SqlSessionTemplate session);
	List<BusinessRequest> selectbusinessRequestList(SqlSessionTemplate session, int cPage, int numPerPage);
	Business selectBusinessOne(SqlSessionTemplate session, int busNo);
	Member selectMemberOne(SqlSessionTemplate session, int memNo);
	int updateMemberLevel(SqlSessionTemplate session, int memNo, int level);
	int deleteBusinessRequest(SqlSessionTemplate session, int requestNo);
	int updateBusinessInfoStatus(SqlSessionTemplate session, int busNo);
	int deleteBusinessInfo(SqlSessionTemplate session, int busNo);
	int deletMemBusConnection(SqlSessionTemplate session, int busNo);
	int selectEnrollPositionCount(SqlSessionTemplate session);
	List<EnrollPosition> selectEnrollPositionList(SqlSessionTemplate session, int cPage, int numPerPage);
	EnrollPosition selectPositionOne(SqlSessionTemplate session, int positionNo);
	int positionApproval(SqlSessionTemplate session, int positionNo);
	int positionRejection(SqlSessionTemplate session, int positionNo);
	List<Map<String, String>> selectJabField(SqlSessionTemplate session);
	List<Integer> selectVisitorStats(SqlSessionTemplate session);
	Map<String, Object> selectHighestVisitor(SqlSessionTemplate session);
 }
