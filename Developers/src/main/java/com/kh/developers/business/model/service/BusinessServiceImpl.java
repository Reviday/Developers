package com.kh.developers.business.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.developers.business.model.dao.BusinessDao;
import com.kh.developers.business.model.vo.Advertisement;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.CareerInCard;
import com.kh.developers.business.model.vo.EducationInCard;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.common.authentication.MailHandler;
import com.kh.developers.common.authentication.TempKey;
import com.kh.developers.member.model.dao.MemberDao;
import com.kh.developers.member.model.vo.Member;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	private BusinessDao dao;
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Inject
    private JavaMailSender mailSender;
	
	
	@Override
	public int insertMember(Member m, String url) throws Exception{
		int result=dao.insertMember(session, m);
		if(result>0) {
			sendMail(m, url);
		} else {
			result=-1;
		}
		return result;
	}
	
	@Override
	public void sendMail(Member m, String url) throws Exception {
		String key = new TempKey().getKey(50,false);  // 인증키 생성
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNo", m.getMemNo());
		map.put("key", key);
		mdao.createAuthKey(session, map); //인증키 db 저장
		
		//메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Developers] 서비스 이메일 인증");
        sendMail.setText(
                new StringBuffer().append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid rgb(67,138,255); margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">")
                .append("<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">")
                .append("<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"><img src=\""+url+"developers/resources/images/Developers_black_logo.png"+"\" style=\"height:40px;\"/></span><br />")
                .append("<span style=\"color: rgb(67,138,255);\">메일인증</span> 안내입니다.</h1>")
                .append("<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">")
                .append("안녕하세요.<br />")
                .append("디벨로퍼스 블랙에 가입해 주셔서 진심으로 감사드립니다.<br />")
                .append("아래 <b style=\"color: rgb(67,138,255);\">'메일 인증'</b> 버튼을 클릭하여 회원가입을 완료해 주세요.<br />")
                .append("감사합니다.</p>")
                .append("<a style=\"color: #FFF; text-decoration: none; text-align: center;\" href=\"")
                .append(url+"developers/member/emailConfirm?memNo=")
                .append(m.getMemNo())
                .append("&memEmail=")
                .append(m.getMemEmail())
                .append("&memberAuthKey=")
                .append(key)
                .append("\" target=\"_blank\">")
                .append("<span style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background-color: rgb(67,138,255); line-height: 45px; vertical-align: middle; font-size: 16px;\">메일 인증</span></a>")
                .append("<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>")
                .toString());
        sendMail.setFrom("ysk.testacc@gmail.com", "디벨로퍼스");
        sendMail.setTo(m.getMemEmail());
        sendMail.send();
	}
	
	
    //이메일 인증 키 검증
    @Override
    public int checkAuth(Member m) {
        int result=mdao.checkAuth(session, m);
        if(result>0) {
               result=mdao.successAuth(session, m);
        }
        return result;
    }
	
	
	
//	사업장 등록 로직
	
	
	@Override
	public int insertBusiness(Business bus, int memNo) {
		int result=dao.insertBusiness(session, bus);
		if(result>0) {
			int busNo=Integer.parseInt(bus.getBusNo());
			result=dao.insertConnection(session,busNo,memNo);
			if(result>0) {
				result=dao.insertRequest(session,busNo,memNo);
				if(result>0) {
					result=dao.updateMemLevel(session,memNo);
				}
			}
		}else {
			result=-1;
		}
		return result;
	}
	
	@Override
	public Business selectBusInfo(int memberNo) {
		
		return dao.selectBusInfo(session, memberNo);
	}
	
	// 매치업  introCard 불러오기 로직
	
	@Override
	public int selectCountBasic() {
		// TODO Auto-generated method stub
		return dao.selectCountBasic(session);
	}
	
	@Override
	public List<IntroCard> selectIntroCards(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectIntroCards(session,cPage, numPerPage);
	}
	
	@Override
	public int selectCountDuties(String duties) {
		// TODO Auto-generated method stub
		return dao.selectCountDuties(session, duties);
	}
	
	@Override
	public List<IntroCard> selectIntroCards(String duties,int cPage, int numPerPage) {
		
		return dao.selectIntroCards(session, duties, cPage, numPerPage);
	}
	
	@Override
	public int selectCountBoth(String duties, String searchBox) {
		// TODO Auto-generated method stub
		return dao.selectCountBoth(session, duties, searchBox);
	}
	
	@Override
	public List<IntroCard> selectIntroCards(String duties, String searchBox,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectIntroCards(session, duties, searchBox, cPage, numPerPage);
	}
	
	@Override
	public int selectCountSearch(String searchBox) {
		// TODO Auto-generated method stub
		return dao.selectCountSearch(session, searchBox);
	}
	
	@Override
	public List<IntroCard> selectIntroCardsSearch(String searchBox,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectIntroCardsSearch(session, searchBox, cPage, numPerPage);
	}
	
	@Override
	public List<CareerInCard> selectCareers(int resumeNo) {
		// TODO Auto-generated method stub
		return dao.selectCareers(session, resumeNo);
	}
	
	@Override
	public List<EducationInCard> selectEducations(int resumeNo) {
		// TODO Auto-generated method stub
		return dao.selectEducations(session, resumeNo);
	}
	
	@Override
	public String selectFavorite(int busNo, int resumeNo) {
		// TODO Auto-generated method stub
		return dao.selectFavorite(session, busNo, resumeNo);
	}
	
	//openRoughResume 로직 
	
	@Override
	public IntroCard selectOneIntroCard(int resumeNo) {
		// TODO Auto-generated method stub
		return dao.selectOneIntroCard(session, resumeNo);
	}
	
	//클릭 Favorite 로직
	
	@Override
	public int insertFavorite(int resumeNo, int busNo) {
		// TODO Auto-generated method stub
		return dao.insertFavorite(session, resumeNo, busNo);
	}
	@Override
	public int removeFavorite(int resumeNo, int busNo) {
		// TODO Auto-generated method stub
		return dao.removeFavorite(session, resumeNo, busNo);
	}
	
	//Favorites 불러오기 로직
	@Override
	public int selectCountFav(int busNo) {
		// TODO Auto-generated method stub
		return dao.selectCountFav(session, busNo);
	}
	@Override
	public List<IntroCard> selectFavorites(int busNo,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFavorites(session,busNo, cPage, numPerPage);
	}
	
	//광고 포지션 불러오기 로직 
	@Override
	public List<Advertisement> selectPositionInfo(int busNo) {
		// TODO Auto-generated method stub
		return dao.selectPositionInfo(session, busNo);
	}
	@Override
	public List<Advertisement> selectAdvertisement(int busNo) {
		// TODO Auto-generated method stub
		return dao.selectAdvertisement(session, busNo);
	}
	
	@Override
	public String selectPositionName(int positionNo) {
		// TODO Auto-generated method stub
		return dao.selectPositionName(session, positionNo);
	}
	
	//광고 insert 로직 
	@Override
	public int insertAd(Advertisement ad) {
		// TODO Auto-generated method stub
		return dao.insertAd(session, ad);
	}
	
//	열람권 갯수 가져오기 
	@Override
	public int numOfTicket(int busNo) {
		// TODO Auto-generated method stub
		return dao.numOfTicket(session, busNo);
	}
	@Override
	public int insertTicket(int busNo, int num) {
		// TODO Auto-generated method stub
		return dao.insertTicket(session, busNo, num);
	}
	@Override
	public int useTicket(int busNo) {
		// TODO Auto-generated method stub
		return dao.useTicket(session, busNo);
	}
	
//	읽은거 불러오기
	@Override
	public int selectReaded(int busNo, int resumeNo) {
		// TODO Auto-generated method stub
		return dao.selectReaded(session, busNo, resumeNo);
	}
	@Override
	public int insertReaded(int busNo, int resumeNo, int memNo) {
		// TODO Auto-generated method stub
		return dao.insertReaded(session,busNo,resumeNo, memNo);
	}
	@Override
	public int selectMemNo(int resumeNo) {
		// TODO Auto-generated method stub
		return dao.selectMemNo(session,resumeNo);
	}
//	 @Override
//	public int insertClick(int adNo) {
//		// TODO Auto-generated method stub
//		return dao.insertClick(session,adNo);
//	}
	
	@Override
	public int selectApplNo(int busNo,int resumeNo) {
		// TODO Auto-generated method stub
		return dao.selectApplNo(session, busNo,resumeNo);
	}

}
