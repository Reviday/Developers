package com.kh.developers.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.member.model.vo.MyLike;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;

public interface MemberDao {

   Member selectMemberOne(SqlSessionTemplate session, Member m);
   int insertMember(SqlSessionTemplate session, Member m);
   void createAuthKey(SqlSessionTemplate session, Map<String, Object> map);
   int checkAuth(SqlSessionTemplate session, Member m);
   int successAuth(SqlSessionTemplate session, Member m);
   int lastStepEnrollEnd(SqlSessionTemplate session, Member m);
   int insertFilter(SqlSessionTemplate session);
   int insertInterests(SqlSessionTemplate session,Interests i);
   Interests selectInterests(SqlSessionTemplate session, String memEmail);
   List<Position> selectPositionList(SqlSessionTemplate session);
   List<Position> selectInterPositionList(SqlSessionTemplate session, Interests inter);
   List<Position> selectWeekPositionList(SqlSessionTemplate session);
   int memberUpdate(SqlSessionTemplate session,Member m);
   int busLogoChange(SqlSessionTemplate session,Member memInfo);
   List<Position> selectLike(SqlSessionTemplate session, Member m);
   void insertLoginLog(SqlSessionTemplate session, MemberLoginLog mll);
   int updateInterests(SqlSessionTemplate session, Interests i);
   
}