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
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.CareerInCard;
import com.kh.developers.business.model.vo.EducationInCard;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.common.authentication.MailHandler;
import com.kh.developers.common.authentication.TempKey;
import com.kh.developers.member.model.vo.Member;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	private BusinessDao dao;
	
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
		dao.createAuthKey(session, map); //인증키 db 저장
		
		//메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Developers] 서비스 이메일 인증");
        sendMail.setText(
                new StringBuffer().append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid rgb(67,138,255); margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">")
                .append("<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">")
                .append("<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"><img src=\""+url+"developers/resources/images/Developers_logo.png"+"\" style=\"height:40px;\"/></span><br />")
                .append("<span style=\"color: rgb(67,138,255);\">메일인증</span> 안내입니다.</h1>")
                .append("<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">")
                .append("안녕하세요.<br />")
                .append("디벨로퍼스에 가입해 주셔서 진심으로 감사드립니다.<br />")
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
        sendMail.setFrom("ysk.testacc@gmail.com", "디벨로퍼스 ");
        sendMail.setTo(m.getMemEmail());
        sendMail.send();
	}
	
	
    //이메일 인증 키 검증
    @Override
    public int checkAuth(Member m) {
        int result=dao.checkAuth(session, m);
        if(result>0) {
               result=dao.successAuth(session, m);
        }
        return result;
    }
	
	
	
//	사업장 등록 로직
	
	
	@Override
	public int insertBusiness(Business bus) {

		return dao.insertBusiness(session, bus);
	}
	
	@Override
	public Business selectBusInfo(int memberNo) {
		
		return dao.selectBusInfo(session, memberNo);
	}
	
	// 매치업  introCard 불러오기 로직
	
	@Override
	public List<IntroCard> selectIntroCards() {
		// TODO Auto-generated method stub
		return dao.selectIntroCards(session);
	}
	
	@Override
	public List<IntroCard> selectIntroCards(String duties) {
		
		return dao.selectIntroCards(session, duties);
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
	public List<IntroCard> selectIntroCardsSearch(String searchBox) {
		// TODO Auto-generated method stub
		return dao.selectIntroCardsSearch(session, searchBox);
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
	
	

}
