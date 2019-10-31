package com.kh.developers.business.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.business.model.vo.Business;
import com.kh.developers.member.model.vo.Member;

@Controller
public class BusinessController2 {

	@RequestMapping("/business/logoChange")
	public ModelAndView logoChange(MultipartHttpServletRequest mReq) {
		ModelAndView mv=new ModelAndView();
		MultipartFile logo=mReq.getFile("logoFile");
		String subDir="/resources/upload/images/business/bus_1/logo";
		String saveDir=mReq.getSession().getServletContext().getRealPath(subDir);
		File dir=new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		String reName="logo_"+sdf.format(new Date());
		String ext=logo.getOriginalFilename().substring(logo.getOriginalFilename().lastIndexOf("."));
		reName+=ext;
		try {			
			logo.transferTo(new File(saveDir+"/"+reName));
		}catch(IOException e) {
			e.printStackTrace();
		}
		mv.addObject("logo",subDir+"/"+reName);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping("/business/dashboard.lbc")
	public ModelAndView dashboard(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String view="";
		Member loginMember=(Member)session.getAttribute("loginMember");
		Business bus=(Business)session.getAttribute("bus");
		if(loginMember!=null && loginMember.getMemLevel()>=3 && bus!=null) {
			if(bus.getBusStatus().charAt(0)=='Y') {
				view="business/dashboard";
			}else {
				view="business/confirming";
			}
		}
		view="business/dashboard";
		mv.setViewName(view);
		return mv;
	}
}
