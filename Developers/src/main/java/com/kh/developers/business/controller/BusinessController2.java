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

import com.kh.developers.business.model.service.BusinessService;
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
		saveDir+="/src/main/webapp";
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
			File oriFile=new File(saveDir+oriLogo.substring(oriLogo.lastIndexOf("/resources")));
			if(oriFile.exists()) {
				oriFile.delete();
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
	
	@RequestMapping("/business/busImgAdd")
	public ModelAndView busImgAdd(MultipartHttpServletRequest mReq) {
		ModelAndView mv=new ModelAndView();
		MultipartFile busImg=mReq.getFile("bus_img");
		Business busInfo=(Business)mReq.getSession().getAttribute("busInfo");
		String subDir="/resources/upload/images/business/bus_"+busInfo.getBusNo()+"/images";
		String saveDir=mReq.getSession().getServletContext().getRealPath("");
		saveDir=saveDir.substring(0, saveDir.lastIndexOf("\\target"));
		saveDir+="/src/main/webapp";
		File dir=new File(saveDir+subDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		String reName="bus_img_"+sdf.format(new Date());
		String ext=busImg.getOriginalFilename().substring(busImg.getOriginalFilename().lastIndexOf("."));
		reName+=ext;
		int count=busInfo.getBusImages()!=null?busInfo.getBusImages().length+1:1;
		//새로운 이미지 저장
		try {		
			String logoFullName=saveDir+subDir+"/"+reName;
			busImg.transferTo(new File(logoFullName));
			Map map=new HashMap();
			map.put("busNo", busInfo.getBusNo());
			map.put("count",count);
			map.put("busImg","/developers"+subDir+"/"+reName);
			int result=service.busImgAdd(map);
			String imgHtml="";
			imgHtml+="";
			imgHtml+="<div class='bi_img_bus modi_img del_img'>";
			imgHtml+="<label for='bus_img"+count+"'>";
			imgHtml+="<img class='bi_img_busimg' src='/developers"+subDir+"/"+reName+"'/>";
			imgHtml+="<i class='fas fa-sync-alt'></i>";
			imgHtml+="<form enctype='multipart/form-data' method='POST'>";
			imgHtml+="<input id='bus_img"+count+"' name='bus_img' type='file' style='display:none;'>";
			imgHtml+="</form>";
			imgHtml+="</label>";
			imgHtml+="<button type='button' class='img_del_btn' onclick='fn_del_img(event);'><i class='far fa-times-circle'></i></botton>";
			imgHtml+="</div>";
			mv.addObject("imgHtml",imgHtml);
			busInfo.setBusImages(service.selectBusOne(busInfo.getBusNo()).getBusImages());
		}catch(IOException e) {
			e.printStackTrace();
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/business/busImgModify")
	public ModelAndView busImgModify(MultipartHttpServletRequest mReq) {
		ModelAndView mv=new ModelAndView();
		int imgIndex=Integer.parseInt(mReq.getParameter("imgIndex"));
		MultipartFile busImg=mReq.getFile("bus_img");
		Business busInfo=(Business)mReq.getSession().getAttribute("busInfo");
		String subDir="/resources/upload/images/business/bus_"+busInfo.getBusNo()+"/images";
		String saveDir=mReq.getSession().getServletContext().getRealPath("");
		saveDir=saveDir.substring(0, saveDir.lastIndexOf("\\target"));
		saveDir+="/src/main/webapp";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		String reName="bus_img_"+sdf.format(new Date());
		String ext=busImg.getOriginalFilename().substring(busImg.getOriginalFilename().lastIndexOf("."));
		reName+=ext;
		//기존 이미지 지우기
		String[] busImages=busInfo.getBusImages();
		String delImg=busImages[imgIndex-1];	
		File delFile=new File(saveDir+delImg.substring(delImg.lastIndexOf("/resources")));
		if(delFile.exists()) {
			delFile.delete();
		}
		
		//새로운 이미지 저장
		try {		
			String imgFullName=saveDir+subDir+"/"+reName;
			busImg.transferTo(new File(imgFullName));
			busImages[imgIndex-1]="/developers"+subDir+"/"+reName;
			busInfo.setBusImages(busImages);
			int result=service.updateBusInfo(busInfo);
		}catch(IOException e) {
			e.printStackTrace();
		}
		mv.addObject("busImg",busImages[imgIndex-1]);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("business/busImgDelete")
	public ModelAndView busImgDelete(HttpSession session, @RequestParam int imgIndex) {
		ModelAndView mv= new ModelAndView();
		Business bus=(Business)session.getAttribute("busInfo");			
		String delImg=bus.getBusImages()[imgIndex-1];	
		String subDir="/resources/upload/images/business/bus_"+bus.getBusNo()+"/images";
		String saveDir=session.getServletContext().getRealPath("");
		saveDir=saveDir.substring(0, saveDir.lastIndexOf("\\target"));
		saveDir+="/src/main/webapp";
		File delFile=new File(saveDir+delImg.substring(delImg.lastIndexOf("/resources")));
		if(delFile.exists()) {
			delFile.delete();
		}
		String[] images=new String[bus.getBusImages().length-1];
		int count=0;
		for(int i=0; i<bus.getBusImages().length; i++) {
			if(i!=imgIndex-1) {
				images[count++]=bus.getBusImages()[i];
			}
		}
		bus.setBusImages(images);
		service.updateBusInfo(bus);
		session.setAttribute("busInfo", service.selectBusOne(bus.getBusNo()));
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
		map.put("busNo", ((Business)req.getSession().getAttribute("busInfo")).getBusNo());
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
		map.put("applIndex", 5);
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
		map.put("busNo", ((Business)session.getAttribute("busInfo")).getBusNo());
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
			for(Applicant appl : applList) {
				Member m=service.selectApplicant(appl.getMemNo());
				html+="<div class='appl-aList'>";
				html+="<div class='aList-left'>";
				Map likeMap=new HashMap();
				likeMap.put("busNo", ((Business)session.getAttribute("busInfo")).getBusNo());
				likeMap.put("applNo", appl.getApplNo());
				if(applLike||service.selectCheckLike(likeMap)>0) {
					html+="<div class='aList-like-btn like_on'><i class='fas fa-star'></i></div>";
				}else {
					
					html+="<div class='aList-like-btn'><i class='fas fa-star'></i></div>";
				}
				html+="<div class='aList-info'>";
				html+="<div class='aList-info-no'>No_"+appl.getAlNo()+"</div>";
				html+="<div class='aList-info-name'>"+m.getMemName().charAt(0)+"<i class='far fa-circle'></i><i class='far fa-circle'></i></div>";
				html+="</div>";
				html+="<div class='aList-type'>";
				html+="<span>매치업</span>";
				html+="</div>";
				html+="</div>";
				html+="<div class='aList-right'>";
				html+="<div class='aList-del-btn'>";
				html+="<button type='button' class='del-btn' onclick='fn_del_modal(event);'>삭제</button>";
				html+="</div>";
				html+="</div>";
				html+="<input type='hidden' class='aList-appl-no' value='"+appl.getApplNo()+"'/>";
				html+="</div><br/>";
			}
			mv.addObject("pageBar", PageFactory2.getApplPageBar(totalData, cPage, numPerPage));
			
			String delModal="";
			delModal+="<div class='del-modal'>";
			delModal+="<div class='close-modal modal-background'></div>";
			delModal+="<div class='del-modal-content'>";
			delModal+="<div class='del-modal-header'>";
			delModal+="<span>지원자 삭제</span>";
			delModal+="</div>";
			delModal+="<div class='del-modal-body'>";
			delModal+="<div class='del-mem'></div>";
			delModal+="<div>정말 삭제하시겠습니까?</div>";
			delModal+="<div class='warn'>*한번 삭제된 지원자는 다시 열람할 수 없습니다.</div>";
			delModal+="</div>";
			delModal+="<div class='del-modal-footer'>";
			delModal+="<button class='del-modal-button' onclick='fn_appl_del();'>삭제</button>";
			delModal+="<button class='del-modal-button close-modal'>취소</button>";
			delModal+="</div>";
			delModal+="</div>";
			
			delModal+="</div>";
			mv.addObject("delModal", delModal);
					
		}
		session.setAttribute("applIndex", applIndex);
		session.setAttribute("applcPage", cPage);
		session.setAttribute("applLike", applLike);
		mv.addObject("applInnerHtml", html);
		
		mv.setViewName("jsonView");
		return mv; 
	}
	
	@RequestMapping("/business/applLike.lbc")
	public ModelAndView applLike(HttpSession session, @RequestParam int applNo, @RequestParam boolean flag) {
		ModelAndView mv=new ModelAndView();
		Map map=new HashMap();
		map.put("busNo", ((Business)session.getAttribute("busInfo")).getBusNo());
		map.put("applNo", applNo);
		
		int result=0;
		if(flag) {			
			result=service.deleteApplLike(map);
		}else {
			result=service.insertApplLike(map);
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/business/applDel.lbc")
	public ModelAndView applDel(HttpSession session, @RequestParam int applNo) {
		ModelAndView mv=new ModelAndView();
		Map map=new HashMap();
		map.put("busNo", ((Business)session.getAttribute("busInfo")).getBusNo());
		map.put("applNo", applNo);
		service.deleteApplicant(map);
		mv.addObject("msg", "해당 지원자가 삭제되었습니다.");
		mv.addObject("loc", "/business/dashboard.lbc");
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	@RequestMapping("/business/busInfo.lbc")
	public ModelAndView dbMatchup(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		Business bus=(Business)session.getAttribute("busInfo");
		String biHtml="";
		biHtml+="<div class='bi_main'>";
		biHtml+="<div class='bi_main_top'>";
		biHtml+="<div class='bi_main_title'>회사 정보</div> <div class='bi_info_img'>이미지 변경</div>";
		biHtml+="</div>";
		biHtml+="<form class='bi_frm' name='bi_frm'>";
		biHtml+="<div>";
		biHtml+="<div class='bi_info_title'>회사 이름<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' value='"+bus.getBusName()+"' disabled />";
		biHtml+="<div class='bi_info_warn'><span class='bi_warn'>*</span>회사이름은 직접 수정이 불가합니다. 수정이 필요하시면 admin@developer.com으로 문의해 주세요.</div>";
		biHtml+="</div>";
		biHtml+="<div class='bi_info'>";
		biHtml+="<div class='bi_info_title'>회사 소개<span class='bi_warn'>*</span></div>";
		biHtml+="<textarea class='form-control bi_info_ta'>";
		biHtml+=bus.getBusIntroduce();
		biHtml+="</textarea>";
		biHtml+="</div>";
		biHtml+="<div>";
		biHtml+="<div class='bi_info_title'>웹사이트 주소</div>";
		biHtml+="<input class='form-control' type='text' value='"+bus.getBusWebsite()+"' />";
		biHtml+="</div>";
		biHtml+="<div>";
		biHtml+="<div class='bi_info_title'>본사 주소<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' value='"+bus.getBusAddress()+"' />";
		biHtml+="</div>";
		biHtml+="<div class='bi_half'>"; 
		biHtml+="<div class='bi_left'>";
		biHtml+="<div class='bi_info_title'>사업자 등록번호<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' value='"+bus.getBusRegNo()+"'/>";
		biHtml+="</div>";
		biHtml+="<div class='bi_right'>";
		biHtml+="<div class='bi_info_title'>매출액/투자금액(승인기준 : 매출액/투자금액 4억원 이상)<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' value='"+bus.getBusIncome()+"'/><span class='won'>억원</span>";
		biHtml+="</div>";
		biHtml+="</div>";
		biHtml+="<div class='bi_half'>";
		biHtml+="<div class='bi_left'>";
		biHtml+="<div class='bi_info_title'>산업군<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' value='"+bus.getBusIndustrial()+"'/>";
		biHtml+="</div>";
		biHtml+="<div class='bi_right'>";
		biHtml+="<div class='bi_info_title'>직원수(승인기준 : 팀원 10명이상)*</div>";
		biHtml+="<select class='form-control'>";
		biHtml+="<option value=''>회사규모</option>";
		String[] totalEmp= {"1~4","5~10","11~50","51~200","201~500","501~1000","1001~5000","5001~10000","10001~"};
		for(String te:totalEmp) {
			biHtml+="<option value='";
			biHtml+=te+"'";
			if(te.equals(bus.getBusTotalEmp())) {
				biHtml+="selected";
			}
			biHtml+=">";
			if(te.equals(totalEmp[totalEmp.length-1])) {
				biHtml+=te+"명 이상";
			}else {				
				biHtml+=te+"명";
			}
			biHtml+="</option>";
		}
		biHtml+="<option value='1~4'>1~4명</option>";
		biHtml+="<option value='5~10'>5~10명</option>";
		biHtml+="<option value='11~50'>11~50명</option>";
		biHtml+="<option value='51~200'>51~200명</option>";
		biHtml+="<option value='201~500'>201~500명</option>";
		biHtml+="<option value='501~1000'>501~1000명</option>";
		biHtml+="<option value='1001~5000'>1001~5000명</option>";
		biHtml+="<option value='5001~10000'>5001~10000명</option>";
		biHtml+="<option value='10001~'>10000명 이상</option>";
		biHtml+="</select>";
		biHtml+="</div>";
		biHtml+="</div>";
		biHtml+="<div class='bi_half'>";
		biHtml+="<div class='bi_left'>";
		biHtml+="<div class='bi_info_title'>설립연도<span class='bi_warn'>*</span></div>";
		biHtml+="<select class='form-control esta_sel'>";
		biHtml+="<option value='' disabled>ex) 2010년</option>";
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
		int year=Integer.parseInt(sdf.format(date));
		for(int i=year; i>1949; i--) {
			biHtml+="<option value='"+i+"'";
			if(String.valueOf(i).equals(bus.getBusEstablishment())) {				
				biHtml+="selected";
			}
			biHtml+=">"+i+"년</option>";;
		}
		
		biHtml+="</select>";
		biHtml+="</div>";
		biHtml+="<div class='bi_right'>";
		biHtml+="<div class='bi_info_title'>정보 수신 메일<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='email' value='"+bus.getBusEmail()+"'/>";
		biHtml+="</div>";
		biHtml+="</div>";
		biHtml+="<div>";
		biHtml+="<div class='bi_info_title'>담당자 연락처<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' value='"+bus.getBusPhone()+"'/>";
		biHtml+="</div>";
		biHtml+="<div>";
		biHtml+="<div class='bi_info_title'>검색 키워드(키워드는 최대 3개까지 등록 가능합니다.)</div>";
		biHtml+="<input class='form-control' type='text' placeholder='서비스명 혹은 브랜드명'/><button type='button' class='bi_keyword_add btn bi_right'>추가</button>";
		biHtml+="</div>";
		biHtml+="</form>";
		biHtml+="</div>";
		
		String seHtml="";
		
		seHtml+="<div class='bi_bottom_bar'>";
		seHtml+="<div class='bi_bottom_con'>";
		seHtml+="<button type='button' class='btn bi_info_modify'>수정</button>";
		seHtml+="</div>";
		seHtml+="</div>";

		seHtml+="<div class='bi_img_container'>";
		seHtml+="<div class='bi_img_content'>";
		seHtml+="<div class='bi_img_header'>";
		seHtml+="이미지 변경";
		seHtml+="</div>";
		seHtml+="<div class='bi_img_main'>";
		seHtml+="<div>";
		seHtml+="<span>대표 이미지</span><br/>";
		int count=1;
		if(bus.getBusImages()!=null) {			
			for(String src:bus.getBusImages()) {
				seHtml+="<div class='bi_img_bus modi_img del_img'>";
				seHtml+="<label for='bus_img"+count+"'>";
				seHtml+="<img class='bi_img_busimg' src='"+src+"'/>";
				seHtml+="<i class='fas fa-sync-alt'></i>";
				seHtml+="<form enctype='multipart/form-data' method='POST'>";
				seHtml+="<input id='bus_img"+count+"' name='bus_img' type='file' style='display:none;'>";
				seHtml+="</form>";
				seHtml+="</label>";
				seHtml+="<button type='button' class='img_del_btn' onclick='fn_del_img(event);'><i class='far fa-times-circle'></i></botton>";
				seHtml+="</div>";
				count++;
			}
		}
		seHtml+="<div class='bi_img_bus add_img'>";
		seHtml+="<label for='bus_img'>";
		seHtml+="<img class='bi_img_busimg' src='/developers/resources/images/bus_img_plus.png'/>";
		seHtml+="<form enctype='multipart/form-data' method='POST'>";
		seHtml+="<input id='bus_img' name='bus_img' type='file' style='display:none;'>";
		seHtml+="</form>";
		seHtml+="</label>";
		seHtml+="</div>";
		seHtml+="</div>";
		seHtml+="<div>";
		seHtml+="<span>로고 이미지</span><br/>";
		if(bus.getBusLogo()!=null) {
			seHtml+="<div class='bi_img_logo modi_img'>";
			seHtml+="<label for='logoFile'>";
			seHtml+="<img class='bi_img_buslogo' src='"+bus.getBusLogo()+"'/>";
			seHtml+="<i class='fas fa-sync-alt'></i>";
			seHtml+="</label>";
			seHtml+="</div>";
		}else {
			seHtml+="<div class='bi_img_logo add_img'>";
			seHtml+="<label for='logoFile'>";
			seHtml+="<img class='bi_img_buslogo' src='/developers/resources/images/bus_img_plus.png'/>";
			seHtml+="</label>";
			seHtml+="</div>";
		}
		seHtml+="</div>";
		seHtml+="</div>";
		seHtml+="<div class='bi_img_bottom'>";
		seHtml+="<button class='bi_img_close'>닫기</div>";
		seHtml+="</div>";
		seHtml+="</div>";
		seHtml+="</div>";
		mv.addObject("dbHtml", biHtml);
		mv.addObject("seHtml", seHtml);
		mv.addObject("dbIndex",5);
		mv.setViewName("business/dashboard");
		return mv;
	}
	
	//비지니스 정보 수정
	@RequestMapping("/business/updateBusInfo")
	public ModelAndView updateBusInfo(HttpSession session ) {
		ModelAndView mv=new ModelAndView();
		return mv;
		
	}
}
