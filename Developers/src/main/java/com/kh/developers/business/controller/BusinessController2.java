package com.kh.developers.business.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.business.model.service.BusinessService2;
import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.common.page.PageFactory2;
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
			String oriLogo=busInfo.getBusLogo();
			if(oriLogo.lastIndexOf("/developers/")>0) {		
				File oriFile=new File(saveDir+oriLogo.substring(oriLogo.lastIndexOf("/developers/")));
				if(oriFile.exists()) {
					oriFile.delete();
				}
			}
		}
		//새로운 로고로 저장
		try {		
			String logoFullName=saveDir+subDir+"/"+reName;
			logo.transferTo(new File(logoFullName));
			busInfo.setBusLogo("/developers"+subDir+"/"+reName);
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
	
	@RequestMapping("/business/applicants.lbc")
	public ModelAndView dbApplications(Model model,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		Map map=new HashMap();
		String applHtml="";
		applHtml+="<div id='appl-leftside' class='appl-leftside'>";
		applHtml+="<h5>채용중<i class='fas fa-angle-up'></i></h5>";
		applHtml+="<hr/>";
		applHtml+="<ul class='apply-ing'>";
		applHtml+="<li class='aList-click'><span class='aList-type'>포지션 전체</span> <span class='aList-count'>11</span></li>";
		applHtml+="<li><span class='aList-type'>매치업</span> <span class='aList-count'>11</span></li>";
		applHtml+="</ul>";
		applHtml+="<br/>";
		applHtml+="<h5>마감된 포지션<i class='fas fa-angle-up'></i></h5>";
		applHtml+="<hr/>";
		applHtml+="<ul>";
		applHtml+="</ul>";
		applHtml+="</div>";
		applHtml+="<div id='appl-main' class='appl-main'>";
		applHtml+="<div id='appl-main-top' class='appl-main-top'>";
		applHtml+="<div id='appl-main-top-left' class='appl-main-top-left'>";
		applHtml+="<h4 class='h-left'>지원자 응답률</h4>";
		applHtml+="<h4 class='h-right'>0.0%</h4>";
		applHtml+="</div>";
		applHtml+="<div>";
		applHtml+="<h4 class='h-left'>평균 응답일</h4>";
		applHtml+="<h4 class='h-right'>0일</h4>";
		applHtml+="</div>";
		applHtml+="</div>";
		applHtml+="<nav class='appl-main-nav nav'>";
		applHtml+="<ul class='nav_us'>";
		map.put("applIndex", 1);
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>신규&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		applHtml+="</li>";
		map.put("applIndex", 2);
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>서류통과&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		applHtml+="</li>";
		map.put("applIndex", 3);
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>최종합격&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		applHtml+="</li>";
		map.put("applIndex", 4);
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>불합격&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		applHtml+="</li>";
		map.put("applIndex", 0);
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>기간만료&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		applHtml+="</li>";
		applHtml+="<li class='ls3 li_input'>";
		applHtml+="<input type='text' name='search_em' placeholder='지원자, 포지션 검색'/>";
		applHtml+="<label for='btn_search_em'>";
		applHtml+="<i class='fas fa-search'></i>";
		applHtml+="</label>";
		applHtml+="<button type='button' id='btn_search_em' style='display: none;' onclick='fn_appl_nav(appl_index)'></button>";
		applHtml+="</li>";
		applHtml+="</ul>";
		applHtml+="</nav>";
		applHtml+="<div class='appl-like-check'>";
		applHtml+="<input type='checkbox' class='' id='like_check' name='like_check'/><label for='like_check'>별표한 지원자만 보기</label>";
		applHtml+="</div>";
		applHtml+="<div class='appl-applicant-list'>";
		
		applHtml+="</div>";
/*<div class='appl-applicant-list'>
				<c:if test='${empty aList}'>
					<!-- <c:forEach items='${aList}' var='l' varStatus='v'>
						
					</c:forEach> -->
					<div class='appl-aList'>
						<div class='aList-left'>
							<div class='aList-like-btn'><i class='fas fa-star'></i></div>
							<div class='aList-info'>
								<div class='aList-info-no'>No_1</div>
								<div class='aList-info-name'>송<i class='far fa-circle'></i><i class='far fa-circle'></i></div>
							</div>
							<div class='aList-type'>
								<span>매치업</span>
							</div>
						</div>
						<div class='aList-right'>
							<div class='aList-del-btn'>
								<button type='button' class='del-btn' onclick='fn_aList_del()'>삭제</button>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test='${not empty aList}'>
					<br/>
					<h4>포지션에 적합한 후보자가 없으신가요?</h4>
					<h4><a href='#'>매치업</a> 탭에서 인재를 검색하고 직접 면접제안을 해보세요!</h4>
				</c:if>
			</div> */
		
		
		applHtml+="</div>";
		
		
		mv.addObject("dbIndex",1);
		mv.addObject("dbHtml", applHtml);
		mv.setViewName("business/dashboard");
		return mv;
	}
	
	@RequestMapping("/business/applChange.lbc")
	public ModelAndView applChange(HttpSession session, @RequestParam int applIndex, @RequestParam boolean applLike, @RequestParam String search, @RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		ModelAndView mv=new ModelAndView();
		Map map=new HashMap();
		map.put("applIndex", applIndex);
		map.put("applLike", applLike);
		String html="";
		List<Applicant> applList=new ArrayList<Applicant>();
		int numPerPage=5;
		int totalData=0;
		//list 가져오기
		applList=service.selectBusAppl(map, cPage,numPerPage); totalData=service.selectBusApplCount(map);
		

		
		if(applList.isEmpty()) {
			html+="<br/>";
			html+="<h4>포지션에 적합한 후보자가 없으신가요?</h4>";
			html+="<h4><a href='#'>매치업</a> 탭에서 인재를 검색하고 직접 면접제안을 해보세요!</h4>";
		}else {
			for(int i=0; i<applList.size(); i++) {
				Member m=service.selectApplicant(applList.get(i).getMemNo());
				html+="<div class='appl-aList'>";
				html+="<div class='aList-left'>";
				Map likeMap=new HashMap();
				map.put("busNo", ((Business)session.getAttribute("busInfo")).getBusNo());
				map.put("memNo", m.getMemNo());
				if(applLike||service.selectCheckLike(likeMap)>0) {					
					html+="<div class='aList-like-btn like_on'><i class='fas fa-star'></i></div>";
				}else {
					
					html+="<div class='aList-like-btn'><i class='fas fa-star'></i></div>";
				}
				html+="<div class='aList-info'>";
				html+="<div class='aList-info-no'>No_"+m.getMemNo()+"</div>";
				html+="<div class='aList-info-name'>"+m.getMemName().charAt(0)+"<i class='far fa-circle'></i><i class='far fa-circle'></i></div>";
				html+="</div>";
				html+="<div class='aList-type'>";
				html+="<span>매치업</span>";
				html+="</div>";
				html+="</div>";
				html+="<div class='aList-right'>";
				html+="<div class='aList-del-btn'>";
				html+="<button type='button' class='del-btn' onclick='fn_aList_del()'>삭제</button>";
				html+="</div>";
				html+="</div>";
				html+="</div><br/>";
			}
		}
		session.setAttribute("applIndex", applIndex);
		session.setAttribute("applcPage", cPage);
		session.setAttribute("applLike", applLike);
		mv.addObject("applInnerHtml", html);
		mv.addObject("pageBar", PageFactory2.getApplPageBar(totalData, cPage, numPerPage));
		mv.setViewName("jsonView");
		return mv; 
	}
	
	
	@RequestMapping("/business/busInfo.lbc")
	public ModelAndView dbMatchup() {
		ModelAndView mv=new ModelAndView();
		String biHtml="";
		biHtml+="<div id='bi-top'>";
		biHtml+="<nav></nav>";
		biHtml+="</div>";
		
		mv.addObject("dbHtml", biHtml);
		mv.addObject("dbIndex",5);
		mv.setViewName("business/dashboard");
		return mv;
	}
	
	@RequestMapping("/business/applLike.lbc")
	public ModelAndView applLike(HttpSession session, @RequestParam int memNo, @RequestParam boolean flag) {
		ModelAndView mv=new ModelAndView();
		Map map=new HashMap();
		map.put("busNo", ((Business)session.getAttribute("busInfo")).getBusNo());
		map.put("memNo", memNo);
		
		int result=0;
		if(flag) {			
			result=service.deleteApplLike(map);
		}else {
			result=service.insertApplLike(map);
		}
		if(result>0) {
			
		}else {
			System.out.println("에러");
		}
		mv.setViewName("jsonView");
		return mv;
	}
}
