package com.kh.developers.business.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.business.model.service.BusinessService2;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

@Controller
public class BusinessController2 {
	
	@Autowired
	private BusinessService2 service;

	@RequestMapping("/business/logoChange")
	public ModelAndView logoChange(MultipartHttpServletRequest mReq) {
		ModelAndView mv=new ModelAndView();
		MultipartFile logo=mReq.getFile("logoFile");
		Business busInfo=(Business)mReq.getSession().getAttribute("busInfo");
		String subDir="/resources/upload/images/business/bus_"+busInfo.getBusNo()+"/logo";
		String saveDir=mReq.getSession().getServletContext().getRealPath("");
		saveDir=saveDir.substring(0, saveDir.lastIndexOf("\\target"));
		saveDir+="\\src\\main\\webapp";
		File dir=new File(saveDir+subDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		String reName="logo_"+sdf.format(new Date());
		String ext=logo.getOriginalFilename().substring(logo.getOriginalFilename().lastIndexOf("."));
		reName+=ext;
		//기존 로고 지우기
		if(busInfo.getBusLogo()!=null) {			
			File oriFile=new File(saveDir+busInfo.getBusLogo());
			if(oriFile.exists()) {
				oriFile.delete();
			}
		}
		//새로운 로고로 저장
		try {		
			String logoFullName=saveDir+subDir+"/"+reName;
			logo.transferTo(new File(logoFullName));
			busInfo.setBusLogo(subDir+"/"+reName);
			int result=service.busLogoChange(busInfo);
		}catch(IOException e) {
			e.printStackTrace();
		}
		mv.addObject("logo",busInfo.getBusLogo());
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping("/business/dashboard.lbc")
	public ModelAndView dashboard(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String view="";
		Member loginMember=(Member)session.getAttribute("loginMember");
		Business busInfo=(Business)session.getAttribute("busInfo");
		if(loginMember!=null && loginMember.getMemLevel()>=3 && busInfo!=null) {
			if(busInfo.getBusStatus().charAt(0)=='Y') {
				view="business/dashboard";
			}else {
				view="business/confirming";
			}
		}
		mv.setViewName(view);
		return mv;
	}
}
