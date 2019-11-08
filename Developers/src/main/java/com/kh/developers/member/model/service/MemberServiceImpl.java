package com.kh.developers.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.developers.common.authentication.MailHandler;
import com.kh.developers.common.authentication.TempKey;
import com.kh.developers.member.model.dao.MemberDao;
import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.search.model.vo.Position;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Inject
    private JavaMailSender mailSender;
	
	
	
	@Override
	public int busLogoChange(Member memInfo) {
		// TODO Auto-generated method stub
			int result=dao.busLogoChange(session,memInfo);
				return result;
	}

	@Override
	public int memberUpdate(Member m) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(session,m);
	}

	@Override
	public int insertInterests(Interests i) {
		// TODO Auto-generated method stub
		return dao.insertInterests(session,i);
	}

	@Override
	public Member lastStepEnrollEnd(Member m) {
		int result=dao.lastStepEnrollEnd(session, m);
		Member member=null;
		if(result>0) {
			member=dao.selectMemberOne(session, m);
		}
		return member;
	}
	
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
	
	
	@Override
	public Member selectMemberOne(Member m) {
		return dao.selectMemberOne(session, m);
	}
	//멤버생성 시 필터테이블 추가
	@Override
	public int insertFilter() {
		// TODO Auto-generated method stub
		return dao.insertFilter(session);
	}
	
	@Override
	public Interests selectInterests(String memEmail) {
		Interests inter = dao.selectInterests(session, memEmail);
		return inter;
	}
	
	@Override
	public List<Position> selectPositionList() {
		List<Position> psList = dao.selectPositionList(session);
		return psList;
	}
	
	@Override
	public List<Position> selectInterPositionList(Interests inter) {
		List<Position> psList = dao.selectInterPositionList(session, inter);
		return psList;
	} 
	
	@Override
	public List<Position> selectWeekPositionList() {
		List<Position> weekList = dao.selectWeekPositionList(session);
		return weekList;
	}
}
