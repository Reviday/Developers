package com.kh.developers.business.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.developers.business.model.service.BusinessService2;
import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.CareerInCard;
import com.kh.developers.business.model.vo.EducationInCard;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.common.authentication.MailHandler;
import com.kh.developers.common.page.PageFactory2;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
import com.kh.developers.search.model.vo.Position;


@Controller
public class BusinessController2 {

	@Autowired
	private BusinessService2 service;

	@Autowired
	private JavaMailSender jms;

	private String saveDir;

	private String path;

	public BusinessController2() {
		saveDir=this.getClass().getResource("/").getPath();
		try {
			saveDir=saveDir.substring(0, saveDir.lastIndexOf("/WEB-INF"));
		}catch(Exception e) {			
			saveDir=saveDir.substring(0, saveDir.lastIndexOf("/target"));
			saveDir+="/src/main/webapp";
		}

		if(this.getClass().getResource("/").getPath().indexOf("target")<0) {
			path="/19PM_Developers_final";
		}else {
			path="/developers";
		}

	}

	@RequestMapping("/business/logoChange")
	public ModelAndView logoChange(MultipartHttpServletRequest mReq) {
		ModelAndView mv=new ModelAndView();
		MultipartFile logo=mReq.getFile("logoFile");
		Business busInfo=(Business)mReq.getSession().getAttribute("busInfo");
		String subDir="/resources/upload/images/business/bus_"+busInfo.getBusNo()+"/logo";
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
			File oriFile=new File(saveDir+oriLogo);
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

	@RequestMapping("/business/busImgAdd")
	public ModelAndView busImgAdd(MultipartHttpServletRequest mReq) {
		ModelAndView mv=new ModelAndView();
		MultipartFile busImg=mReq.getFile("bus_img");
		Business busInfo=(Business)mReq.getSession().getAttribute("busInfo");
		String subDir="/resources/upload/images/business/bus_"+busInfo.getBusNo()+"/images";


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
			map.put("busImg",subDir+"/"+reName);
			int result=service.busImgAdd(map);
			busInfo.setBusImages(service.selectBusOne(busInfo.getBusNo()).getBusImages());
			mv.addObject("count",map.get("count"));
			mv.addObject("addImg",map.get("busImg"));
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

		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		String reName="bus_img_"+sdf.format(new Date());
		String ext=busImg.getOriginalFilename().substring(busImg.getOriginalFilename().lastIndexOf("."));
		reName+=ext;
		//기존 이미지 지우기
		String[] busImages=busInfo.getBusImages();
		String delImg=busImages[imgIndex-1];	
		File delFile=new File(saveDir+delImg);
		if(delFile.exists()) {
			delFile.delete();
		}

		//새로운 이미지 저장
		try {		
			String imgFullName=saveDir+subDir+"/"+reName;
			busImg.transferTo(new File(imgFullName));
			busImages[imgIndex-1]=subDir+"/"+reName;
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
		String cPosition="";
		try {
			cPosition=(String)req.getSession().getAttribute("applPosition");

		}catch(Exception e) {

		}
		applHtml+="<div id='appl-leftside' class='appl-leftside'>";
		applHtml+="<h5>채용중<i class='fas fa-angle-up'></i></h5>";
		applHtml+="<hr/>";
		applHtml+="<ul class='apply-ing'>";
		applHtml+="<li data='' class='";
		if(cPosition.equals("")) {			
			applHtml+="aList-click'";
		}
		applHtml+="'><span class='aList-type'>포지션 전체</span> <span class='aList-count'>"+service.selectBusApplCount(map)+"</span></li>";
		applHtml+="<li data='0' class='";
		if(cPosition.equals("0")) {			
			applHtml+="aList-click'";
		}
		map.put("applPosition", "0");
		applHtml+="'><span class='aList-type'>매치업</span> <span class='aList-count'>"+service.selectBusApplCount(map)+"</span></li>";
		map.put("status", "Y");
		List<Position> poList=service.selectPositionList(map);
		for(Position po:poList) {
			int positionNo=po.getPosition_no();
			map.put("applPosition", positionNo);
			applHtml+="<li data='"+positionNo+"' class='";
			if(cPosition.equals(""+positionNo)) {			
				applHtml+="aList-click'";
			}
			applHtml+="'><span class='aList-type'>"+po.getPosition()+"</span> <span class='aList-count'>"+service.selectBusApplCount(map)+"</span></li>";
		}
		map.remove("applPosition");
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
		applHtml+="<h4 class='h-right'>"+service.selectAnswerRate(map)+"%</h4>";
		applHtml+="</div>";
		applHtml+="<div>";
		applHtml+="<h4 class='h-left'>평균 응답일</h4>";
		applHtml+="<h4 class='h-right'>"+service.selectAnswerPeriod(map)+"일</h4>";
		applHtml+="</div>";
		applHtml+="</div>";
		applHtml+="<nav class='appl-main-nav nav'>";
		applHtml+="<ul class='nav_us'>";
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>신규&nbsp;<span>( 0 )</span></a>";
		applHtml+="</li>";
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>서류통과&nbsp;<span>( 0 )</span></a>";
		applHtml+="</li>";
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>최종합격&nbsp;<span>( 0 )</span></a>";
		applHtml+="</li>";
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>불합격&nbsp;<span>( 0 )</span></a>";
		applHtml+="</li>";
		applHtml+="<li class='ls3'>";
		applHtml+="<a class='ei_a2'>기간만료&nbsp;<span>( 0 )</span></a>";
		applHtml+="</li>";
		applHtml+="</ul>";
		applHtml+="<div class='li_input'>";
		applHtml+="<input type='text' name='search_em' placeholder='지원자, 포지션 검색'/>";
		applHtml+="<label for='btn_search_em'>";
		applHtml+="<i class='fas fa-search'></i>";
		applHtml+="</label>";
		applHtml+="<button type='button' id='btn_search_em' style='display: none;' onclick='fn_appl_nav(appl_index, appl_page, appl_position)'></button>";
		applHtml+="</div>";
		applHtml+="</nav>";
		applHtml+="<div class='appl-like-check'>";
		applHtml+="<input type='checkbox' class='' id='like_check' name='like_check'/><label for='like_check'>별표한 지원자만 보기</label>";
		applHtml+="</div>";
		applHtml+="<div class='appl-applicant-list'>";
		applHtml+="</div>";
		applHtml+="</div>";


		mv.addObject("dbIndex",1);
		mv.addObject("dbHtml", applHtml);
		mv.setViewName("business/dashboard");
		return mv;
	}

	@RequestMapping("/business/applChange.lbc")
	public ModelAndView applChange(HttpSession session, @RequestParam int applIndex, @RequestParam boolean applLike, @RequestParam String search, @RequestParam(value="applPosition", required=false, defaultValue="") String applPosition,@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		ModelAndView mv=new ModelAndView();
		Map map=new HashMap();
		map.put("busNo", ((Business)session.getAttribute("busInfo")).getBusNo());
		map.put("applPosition", applPosition);
		String navHtml="";

		map.put("applIndex", 1);
		navHtml+="<li class='ls3'>";
		navHtml+="<a class='ei_a2'>신규&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		navHtml+="</li>";
		map.put("applIndex", 2);
		navHtml+="<li class='ls3'>";
		navHtml+="<a class='ei_a2'>서류통과&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		navHtml+="</li>";
		map.put("applIndex", 3);
		navHtml+="<li class='ls3'>";
		navHtml+="<a class='ei_a2'>최종합격&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		navHtml+="</li>";
		map.put("applIndex", 4);
		navHtml+="<li class='ls3'>";
		navHtml+="<a class='ei_a2'>불합격&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		navHtml+="</li>";
		map.put("applIndex", 5);
		navHtml+="<li class='ls3'>";
		navHtml+="<a class='ei_a2'>기간만료&nbsp;<span>( "+service.selectBusApplCount(map)+" )</span></a>";
		navHtml+="</li>";

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
			html+="<div class='appl_no'>";
			html+="<h4>포지션에 적합한 후보자가 없으신가요?</h4>";
			html+="<h4><a href='"+path+"/business/matchup.lbc'>매치업</a> 탭에서 인재를 검색하고 직접 면접제안을 해보세요!</h4>";
			html+="</div>";
		}else {
			for(Applicant appl : applList) {
				Member m=service.selectApplicant(appl.getMemNo());
				html+="<div class='appl-aList'>";
				Map likeMap=new HashMap();
				likeMap.put("busNo", ((Business)session.getAttribute("busInfo")).getBusNo());
				likeMap.put("applNo", appl.getApplNo());
				if(applLike||service.selectCheckLike(likeMap)>0) {
					html+="<div class='aList-like-btn like_on'><i class='fas fa-star'></i></div>";
				}else {

					html+="<div class='aList-like-btn'><i class='fas fa-star'></i></div>";
				}
				html+="<div class='aList-left'>";
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
				html+="<button type='button' class='appl-del-btn' onclick='fn_del_modal(event);'>삭제</button>";
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
		session.setAttribute("applPosition", applPosition);
		mv.addObject("applInnerHtml", html);
		mv.addObject("navHtml",navHtml);
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

	@RequestMapping("/business/applView.lbc")
	public ModelAndView applView(@RequestParam int applNo) {
		ModelAndView mv=new ModelAndView();
		String viewHtml="";
		IntroCard ic=null;
		try {			
			ic=service.selectResumeOne(applNo);
		}catch(Exception e) {
			
		}
		if(ic!=null) {
			viewHtml+="<div id='appl-leftside' class='appl-leftside'>";
			Applicant appl=service.selectApplOne(applNo);
			Map map=new HashMap();
			map.put("busNo", appl.getBusNo());
			map.put("positionNo", appl.getPositionNo());
			viewHtml+="<h2>"+(service.selectPositionOne(map)).getPosition()+"></h2>";
			if(appl.getPositionNo()==0) {
				viewHtml+="<span>매칭일 : "+appl.getApplDate()+"</span>";	
			}else {
				viewHtml+="<span>지원일 : "+appl.getApplDate()+"</span>";
			}
			if(appl.getOfferDate()!=null) {
				viewHtml+="<span>면접 제안일 : "+appl.getOfferDate()+"</span>";
			}
			if(appl.getAnswerDate()!=null) {
				viewHtml+="<span>제안 응답일 : "+appl.getAnswerDate()+"</span>";
			}
			if(appl.getFinalDate()!=null && appl.getApplStatus()==3) {

				viewHtml+="<span>최종 합격일 : "+appl.getFinalDate()+"</span>";

			}

			viewHtml+="<span></span>";
			viewHtml+="</div>";
			viewHtml+="<div class='appl_view_container'>";
			viewHtml+="<div class='appl_view_header'>";
			int index=appl.getApplStatus();
			switch(index) {
			case 1:viewHtml+="<button type='button' class='appl_offer_btn' onclick='fn_appl_offer();'>제안하기</button>"; break;
			case 2:
				if(appl.getApplAnsYn()=='O') {
					viewHtml+="<div class='appl_offering'>제안 중...</div>";
				}else if(appl.getApplAnsYn()=='Y'){
					viewHtml+="<button type='button' class='appl_offer_btn' onclick='fn_appl_pf(3);'>합격</button><button type='button' class='appl_offer_btn' onclick='fn_appl_pf(4);'>불합격</button>"; break;
				}else {
					viewHtml+="<div class='appl_offering'>제안 거절</div>";
				}
			}
			viewHtml+="</div>";
			viewHtml+="<div class='appl_view_section'>";
			if(appl.getApplAnsYn()=='Y') {			
				viewHtml+="<div class='appl_name'>"+ic.getMemName()+"</div>";
				viewHtml+="<div class='appl_info'>"+ic.getMemEmail()+"</div>";
				viewHtml+="<div class='appl_info'>"+ic.getMemPhone()+"</div>";
			}else if(appl.getApplAnsYn()=='O') {
				viewHtml+="<div class='appl_name'>"+ic.getMemName().charAt(0)+"<i class='far fa-circle'></i><i class='far fa-circle'></i></div>";
				viewHtml+="<div class='appl_info_hide'><h5>지원자가 제안을 수락할 경우,</h5> <h5>이름과 연락처를 확인할 수 있습니다.</h5></div>";
			}else {
				viewHtml+="<div class='appl_name'>"+ic.getMemName().charAt(0)+"<i class='far fa-circle'></i><i class='far fa-circle'></i></div>";
				viewHtml+="<div class='appl_info_hide'>지원자가 제안을 거절하였습니다.</div>";
			}
			viewHtml+="<div class='appl_intro'><pre>"+ic.getIntro()+"</pre></div>";
			viewHtml+="<hr style='width:95%; border-top:groove;'>";
			if(ic.getCareers()!=null) {
				String caHtml="";
				try {	
					caHtml+="<div class='appl_careers'>";			
					for(CareerInCard cic:ic.getCareers()) {			
						caHtml+="<div class='appl_view_title' style='font-weight:bold;'>경력</div>";
						caHtml+="<div class='appl_view_name'>"+cic.getBusName()+"</div>";
						caHtml+="<div><span class='aline' style='float:left; margin-left:1%; margin-right:1%;'>"+" | "+"</span></div>";
						caHtml+="<div class='appl_view_subname' style='color:#6E6E6E';>"+cic.getDeptName()+"</div>";
						caHtml+="<div class='appl_view_date'>"+cic.getEndCareer()+"</div>";
						caHtml+="<div class='appl_view_date'>"+cic.getStartCareer()+"  ~</div>";
						caHtml+="<br>";
						caHtml+="<div class='appl_view_intro'><pre>"+cic.getCareerIntro()+"</pre></div>";
						caHtml+="<hr style='width:95%;'>";
					}
					caHtml+="</div>";
				}catch(Exception e) {
					caHtml="";
				}
				viewHtml+=caHtml;
			}
			if(ic.getEducations()!=null) {
				String edHtml="";
				try {
					edHtml+="<div class='appl_edus'>";
					for(EducationInCard eic:ic.getEducations()) {
						edHtml+="<div class='appl_view_title' style='font-weight:bold;'>학력</div>";
						edHtml+="<div class='appl_view_name'>"+eic.getSchoolName()+"</div>";
						edHtml+="<div><span class='aline' style='float:left; margin-left:1%; margin-right:1%;'>"+" | "+"</span></div>";
						edHtml+="<div class='appl_view_subname' style='color:#6E6E6E';>"+eic.getMajorName()+"</div>";
						edHtml+="<div class='appl_view_date'>"+eic.getEndEd()+"</div>";
						edHtml+="<div class='appl_view_date'>"+eic.getStartEd()+"  ~</div>";
						edHtml+="<br>";
						edHtml+="<div class='appl_view_intro'><pre>"+eic.getSubjectName()+"</pre></div>";
						edHtml+="<hr style='width:95%;'>";
					}
					edHtml+="</div>";
				}catch(Exception e) {
					edHtml="";
				}
				viewHtml+=edHtml;
			}
			if(ic.getActivities()!=null) {
				String acHtml="";
				try {	
					acHtml+="<div class='appl_acts'>";
					for(Activitie ac:ic.getActivities()) {
						acHtml+="<div class='appl_view_title' style='font-weight:bold;'>대외활동</div>";
						acHtml+="<div class='appl_view_name'>"+ac.getActName()+"</div>";
						acHtml+="<div><span class='aline' style='float:left; margin-left:1%; margin-right:1%;'>"+" | "+"</span></div>";
						acHtml+="<div class='appl_view_date'>"+ac.getStartAct()+"</div>";
						acHtml+="<br>";
						acHtml+="<div class='appl_view_intro'><pre>"+ac.getActDetail()+"</pre></div>";
						acHtml+="<hr style='width:95%;'>";
					}
					acHtml+="</div>";
				}catch(Exception e) {
					acHtml="";
				}
				viewHtml+=acHtml;
			}
			if(ic.getLanguages()!=null) {
				String langHtml="";
				try {
					langHtml+="<div class='appl_langs'>";
					for(Lang ln:ic.getLanguages()) {
						langHtml+="<div class='appl_view_title' style='font-weight:bold;'>언어</div>";
						langHtml+="<div class='appl_view_name'>"+ln.getLangName()+"</div>";
						langHtml+="<div><span class='aline' style='float:left; margin-left:1%; margin-right:1%;'>"+" | "+"</span></div>";
						langHtml+="<div class='appl_view_subname' style='color:#6E6E6E';>"+ln.getLangLevel()+"</div>";
						langHtml+="<br>";
						langHtml+="<hr style='width:95%;'>";
					}
					langHtml+="</div>";
				}catch(Exception e) {
					langHtml="";
				}
				viewHtml+=langHtml;
			}
			if(ic.getLinks()!=null) {
				String linkHtml="";
				try {					
					linkHtml+="<div class='appl_links'>";
					for(Links lk:ic.getLinks()) {
						linkHtml+="<div class='appl_view_title' style='font-weight:bold;'>링크</div>";
						linkHtml+="<div class='appl_view_name'>"+lk.getLinksAddr()+"</div>";
						linkHtml+="<hr style='width:95%;'>";
					}
					linkHtml+="</div>";
				}catch(Exception e) {
					linkHtml="";
				}
				viewHtml+=linkHtml;
			}
			viewHtml+="</div>";
			viewHtml+="<input type='hidden' class='appl_applNo' value='"+applNo+"'/>";
			viewHtml+="</div>";
		}else {			
			viewHtml+="<div>등록된 이력서가 없습니다.</div>";
		}
		
		mv.addObject("dbHtml", viewHtml);
		mv.addObject("dbIndex",11);
		mv.setViewName("business/dashboard");
		return mv;
	}

	@RequestMapping("business/applOffer.lbc")
	public ModelAndView applOffer(HttpServletRequest req, @RequestParam int applNo) throws MessagingException, UnsupportedEncodingException {
		ModelAndView mv=new ModelAndView();
		Applicant appl=service.selectApplOne(applNo);
		Member m=service.selectApplicant(appl.getMemNo());
		String email=m.getMemEmail();
		String url=req.getRequestURL().toString();
		int target=url.indexOf("developers");
		String frontUrl=url.substring(0,target);
		Map map=new HashMap();
		map.put("busNo", appl.getBusNo());
		map.put("positionNo", appl.getPositionNo());
		String poName=((Position)service.selectPositionOne(map)).getPosition();
		//메일 전송
		MailHandler sendMail = new MailHandler(jms);
		sendMail.setSubject("[Developers] "+poName+" 면접 제안 안내");
		sendMail.setText(
				new StringBuffer().append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid rgb(67,138,255); margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">")
				.append("<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">")
				.append("<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"><img src=\""+frontUrl+path+"/resources/images/Developers_logo.png"+"\" style=\"height:40px;\"/></span><br />")
				.append("<span style=\"color: rgb(67,138,255);\">면접 제안</span> 안내입니다.</h1>")
				.append("<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">")
				.append("안녕하세요.<br />")
				.append(((Business)req.getSession().getAttribute("busInfo")).getBusName()+"에서 면접 제안을 하였습니다.<br />")
				.append("아래 <b style=\"color: rgb(67,138,255);\">'제안 확인'</b> 버튼을 클릭하여 받은 제안을 확인하세요.<br />")
				.append("감사합니다.</p>")
				.append("<a style=\"color: #FFF; text-decoration: none; text-align: center;\" href=\"")
				.append(frontUrl+path+"/member/myPage.lmc?memEmail=")
				.append(email)
				.append("\" target=\"_blank\">")
				.append("<span style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background-color: rgb(67,138,255); line-height: 45px; vertical-align: middle; font-size: 16px;\">제안 확인</span></a>")
				.append("<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>")
				.toString());
		sendMail.setFrom("sjl0614@gmail.com", "디벨로퍼스 ");
		//		sendMail.setTo(email);
		sendMail.setTo("sjl0614@naver.com");
		sendMail.send();
		int result=service.updateApplOffer(applNo);

		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping("/business/applPassFail.lbc")
	public ModelAndView applPassFail(HttpServletRequest req, @RequestParam int applPf, @RequestParam int applNo) throws MessagingException, UnsupportedEncodingException {
		ModelAndView mv=new ModelAndView();
		Applicant appl=service.selectApplOne(applNo);
		Member m=service.selectApplicant(appl.getMemNo());
		String email=m.getMemEmail();
		String url=req.getRequestURL().toString();
		int target=url.indexOf("developers");
		String frontUrl=url.substring(0,target);
		Map map=new HashMap();
		map.put("busNo", appl.getBusNo());
		map.put("positionNo", appl.getPositionNo());
		String poName=((Position)service.selectPositionOne(map)).getPosition();
		//메일 전송
		MailHandler sendMail = new MailHandler(jms);
		sendMail.setSubject("[Developers] "+poName+" 합격여부 안내");
		sendMail.setText(
				new StringBuffer().append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid rgb(67,138,255); margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">")
				.append("<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">")
				.append("<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"><img src=\""+frontUrl+path+"/resources/images/Developers_logo.png"+"\" style=\"height:40px;\"/></span><br />")
				.append("<span style=\"color: rgb(67,138,255);\">합격여부</span> 안내입니다.</h1>")
				.append("<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">")
				.append("안녕하세요.<br />")
				.append(((Business)req.getSession().getAttribute("busInfo")).getBusName()+"기업의 "+poName+" 합격 여부가 전달되었습니다.<br/>")
				.append("아래 <b style=\"color: rgb(67,138,255);\">'합격여부 확인'</b> 버튼을 클릭하여 확인하세요.<br />")
				.append("감사합니다.</p>")
				.append("<a style=\"color: #FFF; text-decoration: none; text-align: center;\" href=\"")
				.append(frontUrl+path+"/member/myPage.lmc?memEmail=")
				.append(email)
				.append("\" target=\"_blank\">")
				.append("<span style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background-color: rgb(67,138,255); line-height: 45px; vertical-align: middle; font-size: 16px;\">합격여부 확인</span></a>")
				.append("<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>")
				.toString());
		sendMail.setFrom("sjl0614@gmail.com", "디벨로퍼스 ");
		sendMail.setTo(email);
		//		sendMail.setTo("sjl0614@naver.com");
		sendMail.send();
		map.put("applNo", applNo);
		map.put("applStatus",applPf);
		int result=service.updateApplPf(map);

		mv.setViewName("jsonView");
		return mv;
	}









	//비지니스 포지션
	@RequestMapping("/business/position.lbc")
	public ModelAndView dbBusPosition(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		Business bus=(Business)session.getAttribute("busInfo");
		Map map=new HashMap();
		map.put("busNo", bus.getBusNo());
		String poHtml="";
		String[] status= {"Y","T"};
		for(String s:status) {
			map.put("status", s);
			List<Position> poList=service.selectPositionList(map);
			if(poList.size()>0) {
				if(s.equals("Y")) {
					poHtml+="<h3>채용 진행중인 포지션</h3>";
					poHtml+="<div class='position_header'>";
					poHtml+="<button type='button' class='position_add_btn' onclick='fn_enroll_position();'>포지션 추가</button>";
					poHtml+="</div>";
				}else {
					poHtml+="<h3>임시 저장된 포지션</h3>";
				}
				
				poHtml+="<div class='position_section'>";
				poHtml+="<div class='position_list'>";
				for(Position po:poList) {
					poHtml+="<div class='position_info'>";
					poHtml+="<input type='hidden' class='position_no' value='"+po.getPosition_no()+"'/>";
					poHtml+="<div class='position_name'>";
					if(po.getPosition()!=null && !po.getPosition().equals("")) {
						poHtml+=po.getPosition();
					}else {
						poHtml+="포지션명 등록";
					}
					poHtml+="</div>";
					poHtml+="<div class='position_date'>";
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					String date=sdf.format(po.getDead_date());
					if(date.equals("2999-12-31")) {
						poHtml+="상시";
					}else {
						poHtml+="~ "+date+" 까지";
					}
					poHtml+="</div>";
					poHtml+="</div>";
					
				}
				poHtml+="</div>";
				poHtml+="</div>";
				if(s.equals("Y")) {
					poHtml+="<hr/>";
				}
			}
		}

		//		

		mv.addObject("dbHtml", poHtml);
		mv.addObject("dbIndex",3);
		mv.setViewName("business/dashboard");
		return mv;
	}

	@RequestMapping("/business/enrollPosition.lbc")
	public ModelAndView insertPosition(HttpSession session, @RequestParam(value="poNo", required=false, defaultValue="-1") int poNo) {
		ModelAndView mv=new ModelAndView();
		Business bus=(Business)session.getAttribute("busInfo");
		Map map=new HashMap();
		map.put("busNo", bus.getBusNo());
		if(poNo==-1&&session.getAttribute("po_no")!=null) {
			poNo=(Integer)session.getAttribute("po_no");
		}
		Position po=null;
		String view="business/dashboard";
		if(poNo!=0) {
			map.put("positionNo", poNo);
			po=service.selectPositionOne(map);
			if(po==null) {
				mv.addObject("msg","잘못된 접근입니다.");
				mv.addObject("loc","/business");
				view="common/msg";
			}else {				
				session.setAttribute("po_no",poNo);
			}
		}
		String html="";
		html="<div class='po_main'>";
		html+="<div class='po_main_header'>";
		html+="<div class='po_header_title'>포지션 추가</div>";
		html+="</div>";
		html+="<form name='po_frm' class='po_frm'>";
		html+="<input type='hidden' name='position_no' value='"+poNo+"'/>";
		html+="<div class='po_form_left'>";
		html+="<div class='po_title'>직군/직무<span class='po_three'>(최대 3개 까지 등록 가능)</span></div>";
		html+="<div class='po_con1 po_type_con'>";
		String[] skills= {"웹 개발자","서버 개발자","프론트엔드 개발자","자바 개발자","안드로이드 개발자","iOS 개발자","파이썬 개발자","데이터엔지니어","시스템/네트워크 관리자","DevOps/시스템 관리자","Node.js개발자","C/C++ 개발자","데이터 사이언티스트","개발 매니저","PHP 개발자","기술지원","머신러닝 엔지니어","보안 엔지니어","QA/테스트 엔지니어","프로덕트 매니저","빅데이터 엔지니어","루비온레일즈 개발자",".NET개발자","웹 퍼블리셔","임베디드 개발자","블록체인 플랫폼 엔지니어","하드웨어 엔지니어","CTO/Chief TechnologyOfficer","영상/음성 엔지니어","BI 엔지니어","그래픽스엔지니어","CIO/Chief InformationOfficer"};
		html+="<select class='po_type_list form-control' name='job_type_list'>";
		html+="<option class='type_init' selected disabled>직군/직무 선택</option>";
		for(String skill:skills) {
			html+="<option value='"+skill+"'>"+skill+"</option>";
		}
		html+="</select>";
		if(po!=null && po.getJob_type()!=null) {
			for(String type:po.getJob_type()){			
				html+="<div class='po_type'>";
				html+="<input type='hidden' value='"+type+"' name='job_type'/>";
				html+="<span>"+type+"</span><button type='button' onclick='fn_del_type();'><i class='fas fa-times'></i></button>";
				html+="</div>";
			}
		}
		html+="</div>";
		html+="<div class='po_title'>경력</div>";
		html+="<div class='po_con2'>";
		String[] poCa=null;
		if(po!=null&&po.getCareer()!=null) {
			poCa=(po.getCareer()).split(",");
		}
		html+="<label for='po_junior'>";
		html+="<input type='checkbox' class='po_junior' value='junior' id='po_junior'";
		html+=poCa!=null&&poCa.length==1?"checked":"";
		html+="/>신입";
		html+="</label>";
		html+="<div class='po_career'>";
		html+="<input type='number' class='po_num form-control' name='po_career' onkeypress='onlyNumber();' value=";
		html+=poCa!=null&&!poCa[0].equals("신입")?"'"+poCa[0]+"'":"'0'";
		html+=" min='0' max='100'/>";
		html+="<span> ~ </span>";
		html+="<input type='number' class='po_num form-control' name='po_career' onkeypress='onlyNumber();' value=";
		html+=poCa!=null&&poCa.length>1?"'"+poCa[1]+"'":"'0'";
		html+="min='0' max='100'/>&nbsp;<span>년</span>";
		html+="</div>";
		html+="</div>";
		html+="<div class='po_title'>채용시 예상 연봉 (최소~최대)</div>";
		html+="<div class='po_con3'>";
		html+="<input type='text' class='po_salary po_num form-control' name='po_salary' onkeypress='onlyNumber();' value=";
		html+=po!=null&&po.getPosition_salary()!=null?"'"+po.getPosition_salary()[0]+"'":"'0'";
		html+="/>만원";
		html+=" ~ ";
		html+="<input type='text' class='po_salary po_num form-control' name='po_salary' onkeypress='onlyNumber();' value=";
		html+=po!=null&&po.getPosition_salary()!=null?"'"+po.getPosition_salary()[1]+"'":"'0'";
		html+="/>만원";
		html+="</div>";
		html+="<div class='po_title'>마감일</div>";
		html+="<div class='po_con2'>";
		html+="<label for='po_period'>";
		html+="<input type='checkbox' class='po_period' id='po_period' name='po_period' value='always' ";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String date="";
		if(po!=null) {			
			date=sdf.format(po.getDead_date());
			html+=date.equals("2999-12-31")?"checked":"";
		}
		html+="/>상시";
		html+="</label>";
		html+="<input type='date' class='form-control' name='po_date' value='";
		html+=!date.equals("2999-12-31")?date:"";
		html+="' />";
		html+="</div>";
		html+="<div class='po_title'>근무지</div>";
		html+="<div class='po_con1'>";
		html+="<input type='text' class='form-control' name='' value='"+bus.getBusAddress()+"' disabled/>";
		html+="</div>";
		html+="<div class='po_title'>포지션 명</div>";
		html+="<div class='po_con1'>";
		html+="<input type='text' class='form-control' name='position' value='";
		html+=po!=null&&po.getPosition()!=null?po.getPosition():"";
		html+="'/>";
		html+="</div>";
		html+="<div class='po_title'>포지션 공고,서론</div>";
		html+="<div class='po_con4'>";
		html+="<textarea name='position_info' class='form-control'>";
		html+=po!=null&&po.getPosition_info()!=null?po.getPosition_info():"";
		html+="</textarea>";
		html+="</div>";
		html+="<div class='po_title'>주요 업무</div>";
		html+="<div class='po_con4'>";
		html+="<textarea name='mainbusiness' class='form-control'>";
		html+=po!=null&&po.getMainbusiness()!=null?po.getMainbusiness():"";
		html+="</textarea>";
		html+="</div>";
		html+="<div class='po_title'>자격요건</div>";
		html+="<div class='po_con4'>";
		html+="<textarea name='qualification' class='form-control'>";
		html+=po!=null&&po.getQualification()!=null?po.getQualification():"";
		html+="</textarea>";
		html+="</div>";
		html+="<div class='po_title'>우대사항(선택)</div>";
		html+="<div class='po_con4'>";
		html+="<textarea name='preference' class='form-control'>";
		html+=po!=null&&po.getPreference()!=null?po.getPreference():"";
		html+="</textarea>";
		html+="</div>";
		html+="<div class='po_title'>혜택 및 복지</div>";
		html+="<div class='po_con4'>";
		html+="<textarea name='benefit' class='form-control'>";
		html+=po!=null&&po.getBenefit()!=null?po.getBenefit():"";
		html+="</textarea>";
		html+="</div>";
		html+="</div>";
		html+="<div class='po_form_right'>";
		html+="<div class='po_title'>지원 알림 이메일</div>";
		html+="<div class='po_con1'>";
		html+="<input type='email' class='form-control po_email' name='apply_email' placeholder='example@developer.com' value='";
		html+=po!=null&&po.getApply_email()!=null?po.getApply_email():"";
		html+="'/>";
		html+="</div>";
		html+="</div>";
		html+="</form>";
		html+="</div>";

		String seHtml="";
		seHtml+="<div class='po_footer'>";
		seHtml+="<div class='po_footer_con'>";
		seHtml+="<button type='button' class='po_btn po_del' ";
		if(poNo==0) {
			seHtml+="style='display:none'";
		}
		seHtml+=">삭제</button>";
		if(!po.getStatus().equals("Y")) {			
			seHtml+="<button type='button' class='po_btn po_temp' data='";
			seHtml+=po.getStatus().equals("O")?"O":"T";
			seHtml+="' onclick='fn_add_position();'>임시 저장</button>";
			seHtml+="<button type='button' class='po_btn' data='O' onclick='fn_add_position();'";
			seHtml+=po.getStatus().equals("O")?" disabled>승인 요청 중":">승인요청";
			seHtml+="</button>";
		}
		seHtml+="</div>";
		seHtml+="</div>";
		seHtml+="<div class='modi_text'>";
		seHtml+="<span>정보가 수정되었습니다.</span>";
		seHtml+="</div>";

		seHtml+="<div class='del-modal' style='display:none'>";
		seHtml+="<div class='close-modal modal-background'></div>";
		seHtml+="<div class='del-modal-content'>";
		seHtml+="<div class='del-modal-header'>";
		seHtml+="<span>포지션 삭제</span>";
		seHtml+="</div>";
		seHtml+="<div class='del-modal-body'>";
		seHtml+="<div>정말 삭제하시겠습니까?</div>";
		seHtml+="<div class='warn'>*해당 포지션에 지원한 지원자 정보도 같이 삭제됩니다.</div>";
		seHtml+="</div>";
		seHtml+="<div class='del-modal-footer'>";
		seHtml+="<button class='del-modal-button' onclick='fn_del_position();'>삭제</button>";
		seHtml+="<button class='del-modal-button close-modal'>취소</button>";
		seHtml+="</div>";
		seHtml+="</div>";
		seHtml+="</div>";
		
		
		mv.addObject("dbHtml",html);
		mv.addObject("seHtml",seHtml);
		mv.addObject("dbIndex",3);
		mv.setViewName(view);
		return mv;
	}


	@RequestMapping("/business/updatePosition.lbc")
	public ModelAndView updatePosition(HttpSession session, Position po, @RequestParam(value="poStatus") String poStatus, @RequestParam(value="po_date") String po_date, @RequestParam(value="po_salary") String[] po_salary, @RequestParam(value="po_career", required=false, defaultValue="신입") String[] po_career) {
		ModelAndView mv=new ModelAndView();
		Business bus=(Business)session.getAttribute("busInfo");
		Map map=new HashMap();
		po.setBus_no(Integer.parseInt(bus.getBusNo()));
		po.setBus_name(bus.getBusName());
		int position_no=0;
		if(po.getPosition_no()==0) {
			position_no=service.insertPosition(po);
			po.setPosition_no(position_no);
		}

		map.put("po",po);
		map.put("poStatus",poStatus);
		if(po_date.length()<1) {
			po_date="2999/12/31";
		}
		map.put("poDate",po_date);
		map.put("poSalary",po_salary);
		System.out.println(po_career.length);
		if(po_career[0].equals("0")) {
			po_career[0]="신입";
		}
		map.put("poCareer",po_career);
		int result=service.updatePosition(map);
		mv.addObject("poNo",position_no);
		mv.addObject("status",poStatus);
		mv.setViewName("jsonView");
		return mv;
	}


	@RequestMapping("/business/deletePosition.lbc")
	public ModelAndView deletePosition(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		int result=service.deletePosition((Integer)session.getAttribute("po_no"));
		if(result>0) {
			session.setAttribute("positionNo", -1);
		}
		mv.addObject("msg","해당 포지션이 삭제되었습니다.");
		mv.addObject("loc","/business/position.lbc");
		mv.setViewName("common/msg");
		
		return mv;
	}


	//비지니스 정보	
	@RequestMapping("/business/busInfo.lbc")
	public ModelAndView dbBusInfo(HttpSession session) {
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
		biHtml+="<input class='form-control' type='text' name='busName' value='"+bus.getBusName()+"' disabled />";
		biHtml+="<div class='bi_info_warn'><span class='bi_warn'>*</span>회사이름은 직접 수정이 불가합니다. 수정이 필요하시면 admin@developer.com으로 문의해 주세요.</div>";
		biHtml+="</div>";
		biHtml+="<div class='bi_info'>";
		biHtml+="<div class='bi_info_title'>회사 소개<span class='bi_warn'>*</span></div>";
		biHtml+="<textarea class='form-control bi_info_ta' name='busIntroduce'>";
		biHtml+=bus.getBusIntroduce();
		biHtml+="</textarea>";
		biHtml+="</div>";
		biHtml+="<div>";
		biHtml+="<div class='bi_info_title'>웹사이트 주소</div>";
		biHtml+="<input class='form-control' type='text' name='busWebsite' value='"+bus.getBusWebsite()+"' />";
		biHtml+="</div>";
		biHtml+="<div>";
		biHtml+="<div class='bi_info_title'>본사 주소<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' name='busAddress' value='"+bus.getBusAddress()+"' />";
		biHtml+="</div>";
		biHtml+="<div class='bi_half'>"; 
		biHtml+="<div class='bi_left'>";
		biHtml+="<div class='bi_info_title'>사업자 등록번호<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' name='busRegNo' value='"+bus.getBusRegNo()+"' disabled/>";
		biHtml+="</div>";
		biHtml+="<div class='bi_right'>";
		biHtml+="<div class='bi_info_title'>매출액/투자금액(승인기준 : 매출액/투자금액 4억원 이상)<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' name='busIncome' value='"+bus.getBusIncome()+"'/><span class='won'>억원</span>";
		biHtml+="</div>";
		biHtml+="</div>";
		biHtml+="<div class='bi_half'>";
		biHtml+="<div class='bi_left'>";
		biHtml+="<div class='bi_info_title'>산업군<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' name='busIndustrial' value='"+bus.getBusIndustrial()+"'/>";
		biHtml+="</div>";
		biHtml+="<div class='bi_right'>";
		biHtml+="<div class='bi_info_title'>직원수(승인기준 : 팀원 10명이상)*</div>";
		biHtml+="<select class='form-control' name='busTotalEmp'>";
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
		biHtml+="</select>";
		biHtml+="</div>";
		biHtml+="</div>";
		biHtml+="<div class='bi_half'>";
		biHtml+="<div class='bi_left'>";
		biHtml+="<div class='bi_info_title'>설립연도<span class='bi_warn'>*</span></div>";
		biHtml+="<select class='form-control esta_sel' name='busEstablishment'>";
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
		biHtml+="<input class='form-control' type='email' name='busEmail' value='"+bus.getBusEmail()+"'/>";
		biHtml+="</div>";
		biHtml+="</div>";
		biHtml+="<div>";
		biHtml+="<div class='bi_info_title'>담당자 연락처<span class='bi_warn'>*</span></div>";
		biHtml+="<input class='form-control' type='text' name='busPhone' value='"+bus.getBusPhone()+"'/>";
		biHtml+="</div>";
		biHtml+="<div>";
		biHtml+="<div class='bi_info_title'>검색 키워드<span class='key_over'>(키워드는 최대 3개까지 등록 가능합니다.)</span></div>";
		biHtml+="<input class='form-control' type='text' name='add_keyword' placeholder='서비스명 혹은 브랜드명'/><button type='button' class='bi_keyword_add btn bi_right' onclick='fn_keyword_add();'>추가</button>";
		biHtml+="<div class='bi_info_keywords'>";
		if(bus.getSearchKeywords()!=null) {	
			for(String kw:bus.getSearchKeywords()) {
				biHtml+="<div class='bi_keyword'>";	
				biHtml+="<input type='hidden' value='"+kw+"' name='searchKeywords'/>";
				biHtml+="<span>"+kw+"</span><button type='button' onclick='fn_del_keyword();'><i class='fas fa-times'></i></button></div>";
			}
		}
		biHtml+="</div>";
		biHtml+="</div>";
		biHtml+="</form>";
		biHtml+="</div>";

		String seHtml="";

		seHtml+="<div class='bi_bottom_bar'>";
		seHtml+="<div class='bi_bottom_con'>";
		seHtml+="<button type='button' class='btn bi_info_modify' onclick='fn_update_bus();'>수정</button>";
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
				seHtml+="<img class='bi_img_busimg' src='"+path+src+"'/>";
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
		seHtml+="<img class='bi_img_busimg' src='"+path+"/resources/images/bus_img_plus.png'/>";
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
			seHtml+="<img class='bi_img_buslogo logoImg' src='"+path+bus.getBusLogo()+"'/>";
			seHtml+="<i class='fas fa-sync-alt'></i>";
			seHtml+="</label>";
			seHtml+="</div>";
		}else {
			seHtml+="<div class='bi_img_logo add_img logoImg'>";
			seHtml+="<label for='logoFile'>";
			seHtml+="<img class='bi_img_buslogo logoImg' src='"+path+"/resources/images/bus_img_plus.png'/>";
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
		seHtml+="<div class='modi_text'>";
		seHtml+="<span>정보가 수정되었습니다.</span>";
		seHtml+="</div>";


		mv.addObject("dbHtml", biHtml);
		mv.addObject("seHtml", seHtml);
		mv.addObject("dbIndex",5);
		mv.setViewName("business/dashboard");
		return mv;
	}

	//비지니스 정보 수정
	@RequestMapping("/business/updateBusInfo.lbc")
	public ModelAndView updateBusInfo(HttpSession session, Business bus) {
		ModelAndView mv=new ModelAndView();
		Business busInfo=(Business)session.getAttribute("busInfo");
		busInfo.setSearchKeywords(bus.getSearchKeywords());
		busInfo.setBusAddress(bus.getBusAddress());
		busInfo.setBusIncome(bus.getBusIncome());
		busInfo.setBusIndustrial(bus.getBusIndustrial());
		busInfo.setBusTotalEmp(bus.getBusTotalEmp());
		busInfo.setBusIntroduce(bus.getBusIntroduce());
		busInfo.setBusEstablishment(bus.getBusEstablishment());
		busInfo.setBusEmail(bus.getBusEmail());
		busInfo.setBusPhone(bus.getBusPhone());
		busInfo.setBusWebsite(bus.getBusWebsite());
		service.updateBusInfo(busInfo);
		session.setAttribute("busInfo", busInfo);
		mv.setViewName("jsonView");
		return mv;

	}
	
	
	//비지니스 계정 관리
	@RequestMapping("/business/settings.lbc")
	public ModelAndView settiongs(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String setHtml="";
		setHtml+="<div class='set_main'>";
		setHtml+="<div class='set_header'>";
		setHtml+="<div class='set_title'>계정 관리</div>";
		setHtml+="<button type='button' class='set_invite_btn' onclick='fn_invite_member();'><i class='far fa-envelope'></i>계정 초대</button>";
		setHtml+="</div>";
		setHtml+="<div class='set_main'>";
		setHtml+="<div class='set_administrators'>";
		
		setHtml+="</div>";
		setHtml+="</div>";
		
		
		
		
		
		
		setHtml+="</div>";
		
		
		
		mv.addObject("dbHtml",setHtml);
		mv.addObject("dbIndex",6);
		mv.setViewName("business/dashboard");
		return mv;
	}
}
