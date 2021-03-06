package com.kh.developers.business.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.developers.business.model.vo.Advertisement;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.CareerInCard;
import com.kh.developers.business.model.vo.EducationInCard;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.member.model.vo.Member;

@Repository
public class BusinessDaoImpl implements BusinessDao {

	
	@Override
	public int successAuth(SqlSessionTemplate session, Member m) {
		return session.update("business.successAuth", m);
	}
	
	@Override
	public int checkAuth(SqlSessionTemplate session, Member m) {
		return session.update("business.checkAuth", m);
	}

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("business.insertMember", m);
	}
	
	@Override
	public void createAuthKey(SqlSessionTemplate session, Map<String, Object> map) {
		session.insert("business.createAuthKey", map);
	}
	
	
	
	@Override
	public int insertBusiness(SqlSessionTemplate session, Business bus) {
		
		return session.insert("business.insertBusiness",bus);
	}
	
	@Override
	public int insertConnection(SqlSessionTemplate session, int busNo, int memNo) {
		// TODO Auto-generated method stub
		Map<String,Object>values=new HashMap<String,Object>();
		values.put("busNo", busNo);
		values.put("memNo",memNo);
		return session.insert("business.insertConnection",values);
	}
	
	@Override
	public int insertRequest(SqlSessionTemplate session, int busNo, int memNo) {
		// TODO Auto-generated method stub
		Map<String,Object>values=new HashMap<String,Object>();
		values.put("busNo", busNo);
		values.put("memNo",memNo);
		return session.insert("business.insertRequest",values);
	}
	
	@Override
	public int updateMemLevel(SqlSessionTemplate session, int memNo) {
		// TODO Auto-generated method stub
		return session.update("business.updateMemLevel",memNo);
	}
	
	
	@Override
	public Business selectBusInfo(SqlSessionTemplate session, int memberNo) {

		return session.selectOne("business.selectBusInfo",memberNo);
	}
	
//	매치업 로직
	@Override
	public int selectCountBasic(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("business.selectCountBasic");
	}
	
	@Override
	public List<IntroCard> selectIntroCards(SqlSessionTemplate session,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("business.selectAllIntroCards",null,r);
	}
	
	@Override
	public int selectCountDuties(SqlSessionTemplate session,String duties) {
		// TODO Auto-generated method stub
		return session.selectOne("business.selectCountDuties",duties);
	}
	
	@Override
	public List<IntroCard> selectIntroCards(SqlSessionTemplate session, String duties,int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("business.selectIntroCards",duties,r);
	}
	
	@Override
	public int selectCountBoth(SqlSessionTemplate session, String duties, String searchBox) {
		// TODO Auto-generated method stub
		Map<String,String>values=new HashMap<String,String>();
		values.put("duties", duties);
		values.put("search",searchBox);
		return session.selectOne("business.selectCountBoth",values);
	}
	
	@Override
	public List<IntroCard> selectIntroCards(SqlSessionTemplate session, String duties, String searchBox, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		Map<String,String>values=new HashMap<String,String>();
		values.put("duties", duties);
		values.put("search",searchBox);
		return session.selectList("business.selectIntroCardsUsingTwoValues",values,r);
	}
	
	@Override
	public int selectCountSearch(SqlSessionTemplate session, String searchBox) {
		// TODO Auto-generated method stub
		return session.selectOne("business.selectCountSearch",searchBox);
	}
	
	@Override
	public List<IntroCard> selectIntroCardsSearch(SqlSessionTemplate session, String searchBox,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("business.selectIntroCardsSearch",searchBox,r);
	}
	
	@Override
	public List<CareerInCard> selectCareers(SqlSessionTemplate session, int resumeNo) {
		// TODO Auto-generated method stub
		return session.selectList("business.selectCareers",resumeNo);
	}
	
	@Override
	public List<EducationInCard> selectEducations(SqlSessionTemplate session, int resumeNo) {
		// TODO Auto-generated method stub
		return session.selectList("business.selectEducations",resumeNo);
	}
	
	@Override
	public String selectFavorite(SqlSessionTemplate session, int busNo, int resumeNo) {
		// TODO Auto-generated method stub
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("busNo",busNo);
		map.put("resumeNo",resumeNo);
		return session.selectOne("business.selectFavorite",map);
	}
	
	//openRoughResume 로직 
	@Override
	public IntroCard selectOneIntroCard(SqlSessionTemplate session, int resumeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("business.selectOneIntroCard",resumeNo);
	}
	
	//클릭 Favorite 로직
	@Override
	public int insertFavorite(SqlSessionTemplate session, int resumeNo, int busNo) {
		// TODO Auto-generated method stub
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("resumeNo",resumeNo);
		map.put("busNo",busNo);
		return session.insert("business.insertFavorite",map);
	}
	@Override
	public int removeFavorite(SqlSessionTemplate session, int resumeNo, int busNo) {
		// TODO Auto-generated method stub
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("resumeNo",resumeNo);
		map.put("busNo",busNo);
		return session.delete("business.removeFavorite",map);
	}
	
	//Favorites 불러오기 로직
	@Override
	public int selectCountFav(SqlSessionTemplate session, int busNo) {
		// TODO Auto-generated method stub
		return session.selectOne("business.selectCountFav",busNo);
	}
	@Override
	public List<IntroCard> selectFavorites(SqlSessionTemplate session, int busNo,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds r=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("business.selectFavorites",busNo,r);
	}
	
	//광고 포지션 불러오기 로직 
	@Override
	public List<Advertisement> selectPositionInfo(SqlSessionTemplate session, int busNo) {
		// TODO Auto-generated method stub
		return session.selectList("business.selectPositionInfo",busNo);
	}
	@Override
	public List<Advertisement> selectAdvertisement(SqlSessionTemplate session, int busNo) {
		// TODO Auto-generated method stub
		return session.selectList("business.selectAdvertisement",busNo);
	}
	@Override
	public String selectPositionName(SqlSessionTemplate session, int positionNo) {
		// TODO Auto-generated method stub
		return session.selectOne("business.selectPositionName",positionNo);
	}
	
	//광고 insert 로직 
	@Override
	public int insertAd(SqlSessionTemplate session, Advertisement ad) {
		// TODO Auto-generated method stub
		return session.insert("business.insertAd",ad);
	}
	
//	열람권 갯수 가져오기 
	@Override
	public int numOfTicket(SqlSessionTemplate session, int busNo) {
		// TODO Auto-generated method stub
		return session.selectOne("business.selectTicket",busNo);
	}
	@Override
	public int insertTicket(SqlSessionTemplate session, int busNo, int num) {
		// TODO Auto-generated method stub
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("busNo",busNo);
		map.put("ticket",num);
		return session.update("business.insertTicket",map);
	}
	@Override
	public int useTicket(SqlSessionTemplate session, int busNo) {
		// TODO Auto-generated method stub
		return session.update("business.useTicket",busNo);
	}
	
//	읽은거 불러오기 
		@Override
		public int selectReaded(SqlSessionTemplate session, int busNo, int resumeNo) {
		// TODO Auto-generated method stub
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("busNo",busNo);
		map.put("resumeNo",resumeNo);
		return session.selectOne("business.selectReaded",map);
	}
		@Override
		public int insertReaded(SqlSessionTemplate session, int busNo, int resumeNo, int memNo) {
			// TODO Auto-generated method stub
			Map<String,Object>map=new HashMap<String,Object>();
			map.put("busNo",busNo);
			map.put("resumeNo",resumeNo);
			map.put("memNo", memNo);
			session.insert("business.insertReaded",map);
			return (int) map.get("APPL_NO");
		}
		@Override
		public int selectMemNo(SqlSessionTemplate session, int resumeNo) {
			// TODO Auto-generated method stub
			return session.selectOne("business.selectMemNo",resumeNo);
		}
		@Override
		public int insertClick(SqlSessionTemplate session, int adNo) {
			// TODO Auto-generated method stub
			return session.update("business.insertClick",adNo);
		}
		
		@Override
		public int selectApplNo(SqlSessionTemplate session, int busNo, int resumeNo) {
			// TODO Auto-generated method stub
			Map<String,Object>map=new HashMap<String,Object>();
			map.put("busNo",busNo);
			map.put("resumeNo",resumeNo);
			return session.selectOne("business.selectApplNo",map);
		}

}
