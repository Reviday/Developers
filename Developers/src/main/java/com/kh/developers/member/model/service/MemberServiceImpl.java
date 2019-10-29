package com.kh.developers.member.model.service;

import java.util.HashMap;
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
import com.kh.developers.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
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
                new StringBuffer().append("<h1>메일인증</h1>")
                .append("<a href='"+url+"developers/member/emailConfirm?memNo=")
                .append(m.getMemNo())
                .append("&memberAuthKey=")
                .append(key)
                .append("' target='_blank'>이메일 인증 확인</a>").toString());
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
}
