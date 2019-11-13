package com.kh.developers.common.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kh.developers.admin.model.vo.VisitCount;

public class VisitCounter implements HttpSessionListener{

	
    @Override
    public void sessionCreated(HttpSessionEvent sessionEvent){
    	HttpSession session = sessionEvent.getSession();
        WebApplicationContext context=WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        
        SqlSessionTemplate dbSession=context.getBean("sqlSessionTemplate",SqlSessionTemplate.class);
        
        VisitCount vc = new VisitCount();
        vc.setVisitIp(req.getRemoteAddr());
        
        try {
			int result=dbSession.insert("log.insertVisitor",vc);
		} catch (Exception e) {
			/*에러무시*/
		}
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0){
        //TODO Auto-generated method stub
    }
}
