package com.kh.developers.search.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.recommend.model.vo.Recommend;
import com.kh.developers.search.model.vo.BookMark;
import com.kh.developers.search.model.vo.Company;
import com.kh.developers.search.model.vo.Filter;
import com.kh.developers.search.model.vo.FilterCareer;
import com.kh.developers.search.model.vo.FilterCountry;
import com.kh.developers.search.model.vo.FilterLocation;
import com.kh.developers.search.model.vo.FilterOrderType;
import com.kh.developers.search.model.vo.JobField;
import com.kh.developers.search.model.vo.LikeMember;
import com.kh.developers.search.model.vo.Position;
import com.kh.developers.search.model.vo.ResumeSearch;
import com.kh.developers.search.model.vo.Tag;

@Repository
public class SearchDaoImpl implements SearchDao {

	@Override
	public List<JobField> jobfieldList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.jobfieldList");
	}
	
	@Override
	public List<JobField> jobfieldAjaxList(SqlSessionTemplate session, String jobName) {
		// TODO Auto-generated method stub
		return session.selectList("search.jobfieldAjaxList", jobName);
	}
	
	@Override
	public List<Position> positionList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.positionList");
	}

	@Override
	public Position companyInfoList(SqlSessionTemplate session, int positionNo) {
		// TODO Auto-generated method stub
		return session.selectOne("search.companyInfoList", positionNo);
	}

	@Override
	public List<LikeMember> likeMemberList(SqlSessionTemplate session, int likeNo) {
		// TODO Auto-generated method stub
		return session.selectList("search.likeMemberList", likeNo);
	}
	
	@Override
	public List<Position> firstPsList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.firstPsList");
	}
	
	@Override
	public LikeMember selectLikeMemberOne(SqlSessionTemplate session, int memNo, int likeId) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("likeId", likeId);
		return session.selectOne("search.selectLikeMemberOne", map);
	}
	
	@Override
	public int insertLikeButton(SqlSessionTemplate session, int memNo, int likeId) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("likeId", likeId);
		return session.insert("search.insertLikeButton", map);
	}
	
	@Override
	public int selectLikeCount(SqlSessionTemplate session, int likeId) {
		// TODO Auto-generated method stub
		return session.selectOne("search.selectLikeCount", likeId);
	}
	
	@Override
	public int deleteLikeButton(SqlSessionTemplate session, int memNo, int likeId) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("likeId", likeId);
		return session.delete("search.deleteLikeButton", map);
	}
	
	@Override
	public List<Position> positionAjaxList(SqlSessionTemplate session, String jobName) {
		// TODO Auto-generated method stub
		return session.selectList("search.positionAjaxList", jobName);
	}
	
	@Override
	public Filter SelectMemberFilter(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectOne("search.SelectMemberFilter", memNo);
	}
	
	@Override
	public List<Position> positionLoginList(SqlSessionTemplate session, Filter filter) {
		// TODO Auto-generated method stub
		return session.selectList("search.positionLoginList", filter);
	}
	
	@Override
	public List<Position> positionAjaxLoginList(SqlSessionTemplate session, String jobName, Filter filter) {
		Map map = new HashMap();
		map.put("jobName", jobName);
		map.put("filter", filter);
		return session.selectList("search.positionAjaxLoginList", map);
	}

	@Override
	public List<FilterOrderType> selectFilterOrderType(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectFilterOrderType");
	}

	@Override
	public List<FilterCountry> selectFilterCountry(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectFilterCountry");
	}

	@Override
	public List<FilterLocation> selectFilterLocation(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectFilterLocation");
	}

	@Override
	public List<FilterCareer> selectFilterCareer(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectFilterCareer");
	}

	@Override
	public List<Position> positionLoginFilterList(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.selectList("search.positionLoginFilterList", map);
	}

	@Override
	public int updateMemFilter(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.update("search.updateMemFilter", map);
	}
	
	@Override
	public List<Position> positionLoginFilterJobNameList(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.selectList("search.positionLoginFilterJobNameList", map);
	}
	
	
	@Override
	public List<Position> recommandPositionList(SqlSessionTemplate session, Position p) {
		// TODO Auto-generated method stub
		return session.selectList("search.recommandPositionList", p);
	}

	@Override
	public List<Position> companyPositionList(SqlSessionTemplate session, int busNo) {
		// TODO Auto-generated method stub
		return session.selectList("search.companyPositionList", busNo);
	}

	@Override
	public List<Tag> companyTagList(SqlSessionTemplate session, int busNo) {
		// TODO Auto-generated method stub
		return session.selectList("search.companyTagList", busNo);
	}

	@Override
	public Company companyInfo(SqlSessionTemplate session, int busNo) {
		// TODO Auto-generated method stub
		return session.selectOne("search.companyInfo", busNo);
	}
	
	@Override
	public BookMark selectBookMark(SqlSessionTemplate session, int memNo, int positionNo) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("positionNo", positionNo);
		return session.selectOne("search.selectBookMark", map);
	}

	@Override
	public int insertBookMark(SqlSessionTemplate session, int memNo, int positionNo) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("positionNo", positionNo);
		return session.insert("search.insertBookMark", map);
	}

	@Override
	public int deleteBookMark(SqlSessionTemplate session, int memNo, int positionNo) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("positionNo", positionNo);
		return session.delete("search.deleteBookMark", map);
	}
	
	@Override
	public int insertTagOpinion(SqlSessionTemplate session, int busNo, String tag) {
		Map map = new HashMap();
		map.put("busNo", busNo);
		map.put("tag", tag);
		return session.insert("search.insertTagOpinion", map);
	}
	
	@Override
	public Member SelectMember(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectOne("search.SelectMember", memNo);
	}
	
	@Override
	public List<ResumeSearch> selectResume(SqlSessionTemplate session, String memEmail) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectResume", memEmail);
	}
	
	@Override
	public List<Recommend> selectRecommendList(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectRecommendList", memNo);
	}
	
	@Override
	public Applicant selectApplicant(SqlSessionTemplate session, int memNo, int positionNo) {
		Map map = new HashMap();
		map.put("memNo", memNo);
		map.put("positionNo", positionNo);
		return session.selectOne("search.selectApplicant", map);
	}

	@Override
	public int insertPositionRecommend(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.insert("search.insertPositionRecommend", map);
	}

	@Override
	public int insertPosition(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.insert("search.insertPosition", map);
	}
	
	@Override
	public List<Tag> selectTagList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectTagList");
	}
	
	@Override
	public List<Tag> selectCompanyTagList(SqlSessionTemplate session, String text) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectCompanyTagList", text);
	}
}
