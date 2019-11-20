package com.kh.developers.admin.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.developers.admin.model.service.AdminService;
import com.kh.developers.admin.model.vo.BusinessRequest;
import com.kh.developers.admin.model.vo.EnrollPosition;
import com.kh.developers.admin.model.vo.MappingCount;
import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.common.authentication.MailHandler;
import com.kh.developers.common.util.PaginationTemplate;
import com.kh.developers.common.util.PaginationTemplateFunction2nd;
import com.kh.developers.member.model.vo.Member;

@SessionAttributes(value= {"loginMember"})
@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	@Inject
    private JavaMailSender mailSender;
	private PaginationTemplate pt;
	private PaginationTemplateFunction2nd ptf;
	
	@RequestMapping("/admin/mapperCountSort.lac")
	public String mapperCountSort(Model model,
			@RequestParam (value="id", required=true) String id) {
		List<MappingCount> mcList=new ArrayList<MappingCount>();
		// id값 판별
		String mapperId="";
		String countId="";
		if(id.equals("mapperASC")) {
			mcList=service.mappingLogCounterSort(2,"ASC");
			mapperId="mapperDESC";
			countId="countASD";
		} else if(id.equals("mapperDESC")) {
			mcList=service.mappingLogCounterSort(2,"DESC");
			mapperId="mapperASC";
			countId="countASD";
		} else if(id.equals("countASD")) {
			mcList=service.mappingLogCounterSort(1,"ASC");
			mapperId="mapperASC";
			countId="countDESC";
		} else if(id.equals("countDESC")) {
			mcList=service.mappingLogCounterSort(1,"DESC");
			mapperId="mapperASC";
			countId="countASD";
		}
		
		model.addAttribute("mapperId",mapperId);
		model.addAttribute("countId",countId);
		model.addAttribute("mcList", mcList);
		return "admin/mappingCountTableAjax";
	}
	
	@RequestMapping("/admin/mappingLog.lac")
	public ModelAndView mappingLog() {
		ModelAndView mv=new ModelAndView();
		
		// 매핑 카운트 가져오기
		List<MappingCount> mcList=service.mappingLogCounter();
		
		// 홈페이지 기능 통계 - 페이지 전환/기능 (0번이 기능, 1번이 페이지 전환)
		List<Integer> divCount=service.mappingDivCounter();
		// 홈페이지 기능 통계 - 권한 별 사용 횟수(0:관리자, 1:기업, 2:비회원, 3:회원)
		List<Integer> authCount=service.mappingAuthCounter();
		// 홈페이지 기능 통계 - 등급별 전환/기능 카운트
		List<Integer> adminCount=service.mappingAuthCounter("관리자");
		List<Integer> busCount=service.mappingAuthCounter("기업");
		List<Integer> memCount=service.mappingAuthCounter("회원");
		List<Integer> nonCount=service.mappingAuthCounter("비회원");
		
		mv.addObject("divCount", divCount);
		mv.addObject("authCount", authCount);
		mv.addObject("adminCount", adminCount);
		mv.addObject("busCount", busCount);
		mv.addObject("memCount", memCount);
		mv.addObject("nonCount", nonCount);
		mv.addObject("mcList", mcList);
		mv.setViewName("admin/mappingLog");
		return mv;
	}
	
	@RequestMapping("/admin/visitorChangeChart.lac")
	public String visitorChangeChart(Model model,
			@RequestParam (value="period", required=true) String period,
			@RequestParam (value="term", required=true) int term,
			@RequestParam (value="chart", required=true) String chart) {
		// period, term, term 에 따른 자료 select!
		List<Map<String, Integer>> resultList=service.selectVisitorChartData(period, term);
		
		model.addAttribute("period",period);
		model.addAttribute("term", term);
		model.addAttribute("chart", chart);
		model.addAttribute("timeList", resultList);
		return "admin/visitorLogChartAjax";
	}
	
	@RequestMapping("/admin/visitorLog.lac")
	public ModelAndView visitorLog() {
		ModelAndView mv=new ModelAndView();
		
		//전체,한 달,일주일,하루 통계를 가져온다.
		List<Integer> visitorStats=service.selectVisitorStats();
		
		//최고 방문자 수, 날짜
		Map<String, Object> highestVisitor=service.selectHighestVisitor();
		
		//시간별 차트 
		// period, term, term 에 따른 자료 select!
		List<Map<String, Integer>> resultList=service.selectVisitorChartData("A", 3);
		mv.addObject("period","A");
		mv.addObject("term", "3");
		mv.addObject("chart", "line");
		mv.addObject("timeList", resultList);
		mv.addObject("visitorStats",visitorStats);
		mv.addObject("highestVisitor",highestVisitor);
		mv.setViewName("admin/visitorLog");
		return mv;
	}
		
	@RequestMapping("/admin/positionRejection.lac")
	public String positionRejection(HttpServletRequest req, Model model,
			@RequestParam (value="positionNo", required=true) int positionNo,
			@RequestParam (value="busName", required=true) String busName,
			@RequestParam (value="applyEmail", required=true) String applyEmail) throws MessagingException, UnsupportedEncodingException {
		// 승인 처리 서비스
		int result=service.positionRejection(positionNo);
		
		// 승인 메일 송신 로직
		if(result>0) {
			String url=req.getRequestURL().toString();
			int target=url.indexOf("developers");
			String frontUrl="";url.substring(0,target);
			if(req.getRequestURI().indexOf("/developers")>=0) {
				//일반 로컬 서버
				frontUrl=url.substring(0,target)+"developers";
			} else if(req.getRequestURI().indexOf("/19PM_Developers_final")>=0) {
				//학원 서버용
				frontUrl=url.substring(0,target)+"19PM_Developers_final";
			} else {
				//보통 있을 수 없지만 만약 위 두가지 중 예외가 존재한다면 
				//server에서 설정을 기본값인 spring으로 했을 경우.
				frontUrl=url.substring(0,target)+"spring";
				//위가 아닌 다른 예외 상황이 온다고 한다면, 기록은 하되 조인할때 기타 값이 null로 출력될 것임.
			}
			//메일 전송
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[Developers] 포지션 등록 거절 안내");
			sendMail.setText(
					new StringBuffer().append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid rgb(67,138,255); margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">")
					.append("<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">")
					.append("<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"><img src=\""+frontUrl+"/resources/images/Developers_logo.png"+"\" style=\"height:40px;\"/></span><br />")
					.append("<span style=\"color: rgb(67,138,255);\">"+busName+"</span> 포지션 등록이 승인되지 않았습니다.</h1>")
					.append("<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">")
					.append("안녕하세요.<br/>")
					.append("모두가 함께하는 지인추천 채용서비스 디벨로퍼스입니다.<br/><br/>")
					.append("신청하신 포지션에 대한 승인 거절 안내 드립니다.<br/>")
					.append("작성하여주신 포지션 내역에서 적절하지 않은 내역이 발견되어 <br/>")
					.append("부득이하게 승인 거절을 했습니다.<br/><br/>")
					.append("재검토 후에 다시 요청하여주시기 바랍니다.<br/>")
					.append("거절 사유에 대해 자세한 내역을 확인하고자 하신다면<br/>")
					.append("저희 이메일로 요청을 주시면 친절히 답변해드리겠습니다.<br/>")
					.append("<a style=\"color: #fff; text-decoration: none; text-align: center;\"")
					.append("href=\""+frontUrl+"/business\"")
					.append("target=\"_blank\" rel=\"noreferrer noopener\">")
					.append("<span style=\"display: inline-block; border-radius: 5px; width: 210px; height: 45px; margin: 30px 5px 40px; background-color: rgb(67,138,255); line-height: 45px; vertical-align: middle; font-size: 16px; font-weight: 600;\">")
					.append("디벨로퍼스 대시보드로 이동</span></a>")
					.append("<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>")
					.toString());
			sendMail.setFrom("ysk.testacc@gmail.com", "디벨로퍼스 ");
			sendMail.setTo("ysk4517@naver.com");
			sendMail.send();
		}
		
		// 페이지네이션
		int totalData=service.selectEnrollPositionCount() ;
		pt=new PaginationTemplate(req, totalData, "/admin/enrollPosition.lac");
		//포지션등록 요청 내용 이력을 가져온다.
		List<EnrollPosition> list=service.selectEnrollPositionList(pt.getcPage(), pt.getNumPerPage());
		
		//직업 필드 매핑용
		List<Map<String,String>> jobFieldList=service.selectJabField();
		Map<String,String> jobField=new HashMap<String, String>();
		for(Map<String,String> map:jobFieldList) {
			jobField.put(map.get("JOB_CODE"), map.get("JOB_NAME"));
		}
		
		model.addAttribute("resultList",list);
		model.addAttribute("jobFiled", jobField);
		model.addAttribute("cPage", pt.getcPage());
		model.addAttribute("numPerPage", pt.getNumPerPage());
		model.addAttribute("pageBar", pt.getPageBar());
		return "admin/enrollPositionAjax";
	}
	
	@RequestMapping("/admin/positionApproval.lac")
	public String positionApproval(HttpServletRequest req, Model model,
			@RequestParam (value="positionNo", required=true) int positionNo,
			@RequestParam (value="busName", required=true) String busName,
			@RequestParam (value="applyEmail", required=true) String applyEmail) throws MessagingException, UnsupportedEncodingException {
		// 승인 처리 서비스
		int result=service.positionApproval(positionNo);
		
		// 승인 메일 송신 로직
		if(result>0) {
			String url=req.getRequestURL().toString();
			int target=url.indexOf("developers");
			String frontUrl="";url.substring(0,target);
			if(req.getRequestURI().indexOf("/developers")>=0) {
				//일반 로컬 서버
				frontUrl=url.substring(0,target)+"developers";
			} else if(req.getRequestURI().indexOf("/19PM_Developers_final")>=0) {
				//학원 서버용
				frontUrl=url.substring(0,target)+"19PM_Developers_final";
			} else {
				//보통 있을 수 없지만 만약 위 두가지 중 예외가 존재한다면 
				//server에서 설정을 기본값인 spring으로 했을 경우.
				frontUrl=url.substring(0,target)+"spring";
				//위가 아닌 다른 예외 상황이 온다고 한다면, 기록은 하되 조인할때 기타 값이 null로 출력될 것임.
			}
			//메일 전송
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[Developers] 포지션 등록 승인 안내");
			sendMail.setText(
					new StringBuffer().append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid rgb(67,138,255); margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">")
					.append("<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">")
					.append("<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"><img src=\""+frontUrl+"/resources/images/Developers_logo.png"+"\" style=\"height:40px;\"/></span><br />")
					.append("<span style=\"color: rgb(67,138,255);\">"+busName+"</span> 포지션 등록이 완료되었습니다.</h1>")
					.append("<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">")
					.append("<b style=\"color: rgb(67,138,255);\">'디벨로퍼스 대시보드로 이동'</b>")
					.append("을 클릭하여 <br/>정보를 확인하시기 바랍니다.<br/><br/>")
					.append("포지션에서 수정사항이 생길 경우<br/>")
					.append("기업 페이지에서 수정요청이 가능합니다.<br/>")
					.append("<a style=\"color: #fff; text-decoration: none; text-align: center;\"")
					.append("href=\""+frontUrl+"/business\"")
					.append("target=\"_blank\" rel=\"noreferrer noopener\">")
					.append("<span style=\"display: inline-block; border-radius: 5px; width: 210px; height: 45px; margin: 30px 5px 40px; background-color: rgb(67,138,255); line-height: 45px; vertical-align: middle; font-size: 16px; font-weight: 600;\">")
					.append("디벨로퍼스 대시보드로 이동</span></a>")
					.append("<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>")
					.toString());
			sendMail.setFrom("ysk.testacc@gmail.com", "디벨로퍼스 ");
			sendMail.setTo(applyEmail);
			sendMail.send();
		}
		
		// 페이지네이션
		int totalData=service.selectEnrollPositionCount() ;
		pt=new PaginationTemplate(req, totalData, "/admin/enrollPosition.lac");
		//포지션등록 요청 내용 이력을 가져온다.
		List<EnrollPosition> list=service.selectEnrollPositionList(pt.getcPage(), pt.getNumPerPage());
		
		//직업 필드 매핑용
		List<Map<String,String>> jobFieldList=service.selectJabField();
		Map<String,String> jobField=new HashMap<String, String>();
		for(Map<String,String> map:jobFieldList) {
			jobField.put(map.get("JOB_CODE"), map.get("JOB_NAME"));
		}
		
		model.addAttribute("resultList",list);
		model.addAttribute("jobFiled", jobField);
		model.addAttribute("cPage", pt.getcPage());
		model.addAttribute("numPerPage", pt.getNumPerPage());
		model.addAttribute("pageBar", pt.getPageBar());
		return "admin/enrollPositionAjax";
	}
	
	@RequestMapping("/admin/positionInfo.lac")
	public ModelAndView positionInfo(HttpServletRequest req, Model model,
			@RequestParam (value="positionNo", required=true) int positionNo) {
		ModelAndView mv=new ModelAndView();
		
		//포지션 정보를 가져온다.
		EnrollPosition p=service.selectPositionOne(positionNo);
		
		//직업 필드 매핑용
		List<Map<String,String>> jobFieldList=service.selectJabField();
		Map<String,String> jobField=new HashMap<String, String>();
		for(Map<String,String> map:jobFieldList) {
			jobField.put(map.get("JOB_CODE"), map.get("JOB_NAME"));
		}
		System.out.println(jobField);		
		mv.addObject("position", p);
		mv.addObject("jobFiled", jobField);
		mv.setViewName("/admin/positionInfo");
		return mv;
	}
	
	@RequestMapping("/admin/enrollPosition.lac")
	public ModelAndView enrollPosition(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		
		// 페이지네이션
		int totalData=service.selectEnrollPositionCount() ;
		pt=new PaginationTemplate(req, totalData, "/admin/enrollPosition.lac");
		//포지션등록 요청 내용 이력을 가져온다.
		List<EnrollPosition> list=service.selectEnrollPositionList(pt.getcPage(), pt.getNumPerPage());
		
		//직업 필드 매핑용
		List<Map<String,String>> jobFieldList=service.selectJabField();
		Map<String,String> jobField=new HashMap<String, String>();
		for(Map<String,String> map:jobFieldList) {
			jobField.put(map.get("JOB_CODE"), map.get("JOB_NAME"));
		}
		
		mv.addObject("resultList",list);
		mv.addObject("jobFiled", jobField);
		mv.addObject("cPage", pt.getcPage());
		mv.addObject("numPerPage", pt.getNumPerPage());
		mv.addObject("pageBar", pt.getPageBar());
		mv.setViewName("admin/enrollPosition");
		return mv;
	}
	
	@RequestMapping("/admin/businessRequestRejection.lac")
	public String businessRequestRejection(HttpServletRequest req, Model model,
			@RequestParam (value="requestNo", required=true) int requestNo,
			@RequestParam (value="busNo", required=true) int busNo,
			@RequestParam (value="busName", required=true) String busName,
			@RequestParam (value="memNo", required=true) int memNo,
			@RequestParam (value="memEmail", required=true) String memEmail) throws MessagingException, UnsupportedEncodingException {
		// 거절 처리 서비스
		int result=0;
		try {
			result=service.businessRequestRejection(requestNo, busNo, memNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 승인 메일 송신 로직
		if(result>0) {
			String url=req.getRequestURL().toString();
			int target=url.indexOf("developers");
			String frontUrl="";url.substring(0,target);
			if(req.getRequestURI().indexOf("/developers")>=0) {
				//일반 로컬 서버
				frontUrl=url.substring(0,target)+"developers";
			} else if(req.getRequestURI().indexOf("/19PM_Developers_final")>=0) {
				//학원 서버용
				frontUrl=url.substring(0,target)+"19PM_Developers_final";
			} else {
				//보통 있을 수 없지만 만약 위 두가지 중 예외가 존재한다면 
				//server에서 설정을 기본값인 spring으로 했을 경우.
				frontUrl=url.substring(0,target)+"spring";
				//위가 아닌 다른 예외 상황이 온다고 한다면, 기록은 하되 조인할때 기타 값이 null로 출력될 것임.
			}
			//메일 전송
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[Developers] 기업등록 거절 관련 안내");
			sendMail.setText(
					new StringBuffer().append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid rgb(67,138,255); margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">")
					.append("<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">")
					.append("<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"><img src=\""+frontUrl+"/resources/images/Developers_logo.png"+"\" style=\"height:40px;\"/></span><br />")
					.append("<span style=\"color: rgb(67,138,255);\">"+busName+"</span> 회사 등록이 승인되지 않았습니다.</h1>")
					.append("<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">")
					.append("안녕하세요.<br/>")
					.append("모두가 함께하는 지인추천 채용서비스 디벨로퍼스입니다.<br/><br/>")
					.append("신청하신 기업에 대한 승인 거절 안내 드립니다.<br/>")
					.append("가입해주신 개인 포털 계정으로는 회사 재직 여부를 확인 할 수 없어,<br/>")
					.append("부득이하게 승인 거절을 했습니다.<br/><br/>")
					.append("해당 기업 내부 인사담당자께 관리자 또는 리뷰어 권한 요청을<br/> 진행하시길 권장 드립니다.<br/>")
					.append("추가 문의 있으시면 답신으로 남겨주시면 됩니다.<br/>")
					.append("<a style=\"color: #fff; text-decoration: none; text-align: center;\"")
					.append("href=\""+frontUrl+"/business\"")
					.append("target=\"_blank\" rel=\"noreferrer noopener\">")
					.append("<span style=\"display: inline-block; border-radius: 5px; width: 210px; height: 45px; margin: 30px 5px 40px; background-color: rgb(67,138,255); line-height: 45px; vertical-align: middle; font-size: 16px; font-weight: 600;\">")
					.append("디벨로퍼스 대시보드로 이동</span></a>")
					.append("<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>")
					.toString());
			sendMail.setFrom("ysk.testacc@gmail.com", "디벨로퍼스 ");
			sendMail.setTo(memEmail);
			sendMail.send();
		}
		
		// 페이지네이션
		int totalData=service.selectbusinessRequestCount() ;
		pt=new PaginationTemplate(req, totalData, "/admin/businessRequest.lac");
		//기업등록 요청 내용 이력을 가져온다.
		List<BusinessRequest> list=service.selectbusinessRequestList(pt.getcPage(), pt.getNumPerPage());
		
		model.addAttribute("resultList",list);
		model.addAttribute("cPage", pt.getcPage());
		model.addAttribute("numPerPage", pt.getNumPerPage());
		model.addAttribute("pageBar", pt.getPageBar());
		return "admin/businessRequestAjax";
	}
	
	@RequestMapping("/admin/businessRequestApproval.lac")
	public String businessRequestApproval(HttpServletRequest req, Model model,
			@RequestParam (value="requestNo", required=true) int requestNo,
			@RequestParam (value="busNo", required=true) int busNo,
			@RequestParam (value="busName", required=true) String busName,
			@RequestParam (value="memNo", required=true) int memNo,
			@RequestParam (value="memEmail", required=true) String memEmail) throws MessagingException, UnsupportedEncodingException {
		// 승인 처리 서비스
		int result=0;
		try {
			result=service.businessRequestApproval(requestNo, busNo, memNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 승인 메일 송신 로직
		if(result>0) {
			String url=req.getRequestURL().toString();
			int target=url.indexOf("developers");
			String frontUrl="";url.substring(0,target);
			if(req.getRequestURI().indexOf("/developers")>=0) {
				//일반 로컬 서버
				frontUrl=url.substring(0,target)+"developers";
			} else if(req.getRequestURI().indexOf("/19PM_Developers_final")>=0) {
				//학원 서버용
				frontUrl=url.substring(0,target)+"19PM_Developers_final";
			} else {
				//보통 있을 수 없지만 만약 위 두가지 중 예외가 존재한다면 
				//server에서 설정을 기본값인 spring으로 했을 경우.
				frontUrl=url.substring(0,target)+"spring";
				//위가 아닌 다른 예외 상황이 온다고 한다면, 기록은 하되 조인할때 기타 값이 null로 출력될 것임.
			}
			//메일 전송
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[Developers] 기업등록 승인 관련 안내");
			sendMail.setText(
					new StringBuffer().append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid rgb(67,138,255); margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">")
					.append("<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">")
					.append("<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"><img src=\""+frontUrl+"/resources/images/Developers_logo.png"+"\" style=\"height:40px;\"/></span><br />")
					.append("<span style=\"color: rgb(67,138,255);\">"+busName+"</span> 회사 등록이 완료되었습니다.</h1>")
					.append("<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">")
					.append("<b style=\"color: rgb(67,138,255);\">'디벨로퍼스 대시보드로 이동'</b>")
					.append("을 클릭하여 <br/>회사 정보를 자세하게 업데이트 해주세요.<br/><br/>")
					.append("회사 정보는 언제든지 수정하실 수 있으며<br/>")
					.append("기업 페이지에서 확인이 가능합니다.<br/>")
					.append("<a style=\"color: #fff; text-decoration: none; text-align: center;\"")
					.append("href=\""+frontUrl+"/business\"")
					.append("target=\"_blank\" rel=\"noreferrer noopener\">")
					.append("<span style=\"display: inline-block; border-radius: 5px; width: 210px; height: 45px; margin: 30px 5px 40px; background-color: rgb(67,138,255); line-height: 45px; vertical-align: middle; font-size: 16px; font-weight: 600;\">")
					.append("디벨로퍼스 대시보드로 이동</span></a>")
					.append("<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>")
					.toString());
			sendMail.setFrom("ysk.testacc@gmail.com", "디벨로퍼스 ");
			sendMail.setTo(memEmail);
			sendMail.send();
		}
		
		// 페이지네이션
		int totalData=service.selectbusinessRequestCount() ;
		pt=new PaginationTemplate(req, totalData, "/admin/businessRequest.lac");
		//기업등록 요청 내용 이력을 가져온다.
		List<BusinessRequest> list=service.selectbusinessRequestList(pt.getcPage(), pt.getNumPerPage());
		
		model.addAttribute("resultList",list);
		model.addAttribute("cPage", pt.getcPage());
		model.addAttribute("numPerPage", pt.getNumPerPage());
		model.addAttribute("pageBar", pt.getPageBar());
		return "admin/businessRequestAjax";
	}
	
	@RequestMapping("/admin/memberInfo.lac")
	public ModelAndView memberInfo(HttpServletRequest req, Model model,
			@RequestParam (value="memNo", required=true) int memNo) {
		ModelAndView mv=new ModelAndView();
		
		//회원정보를 가져온다.
		Member m=service.selectMemberOne(memNo);
		mv.addObject("Member", m);
		mv.setViewName("/admin/memberInfo");
		return mv;
	}
	
	@RequestMapping("/admin/businessInfo.lac")
	public ModelAndView businessInfo(HttpServletRequest req, Model model,
			@RequestParam (value="busNo", required=true) int busNo) {
		ModelAndView mv=new ModelAndView();
		
		//기업정보를 가져온다.
		Business b=service.selectBusinessOne(busNo);
		mv.addObject("business", b);
		mv.setViewName("/admin/businessInfo");
		return mv;
	}
	
	
	@RequestMapping("/admin/businessRequest.lac")
	public ModelAndView businessRequest(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		
		// 페이지네이션
		int totalData=service.selectbusinessRequestCount() ;
		pt=new PaginationTemplate(req, totalData, "/admin/businessRequest.lac");
		//기업등록 요청 내용 이력을 가져온다.
		List<BusinessRequest> list=service.selectbusinessRequestList(pt.getcPage(), pt.getNumPerPage());
		
		mv.addObject("resultList",list);
		mv.addObject("cPage", pt.getcPage());
		mv.addObject("numPerPage", pt.getNumPerPage());
		mv.addObject("pageBar", pt.getPageBar());
		mv.setViewName("admin/businessRequest");
		return mv;
	}
	
	@RequestMapping("/admin/mllChangeChart.lac")
	public String mllChangeChart(HttpServletRequest req, Model model,
			@RequestParam (value="data", required=false, defaultValue="all") String data,
			@RequestParam (value="chart", required=false, defaultValue="bar") String chart) {
		//로그인 차트용
		if(!(data.equals("Y")||data.equals("N"))) {
			//전체 통계값
			List<Map<String, Integer>> chartListS=service.selectLoginLogChartData("Y");
			List<Map<String, Integer>> chartListF=service.selectLoginLogChartData("N");
			model.addAttribute("chartListS", chartListS);
			model.addAttribute("chartListF", chartListF);
		} else {
			//단일 값
			List<Map<String, Integer>> chartList=service.selectLoginLogChartData(data);
			model.addAttribute("chartList", chartList);
		}
		
		model.addAttribute("data",data);
		model.addAttribute("chart",chart);
		return "admin/loginLogCharAjax";
	}
	
	@RequestMapping("/admin/tagRejection.lac")
	public String tagRejection(HttpServletRequest req, Model model,
			@RequestParam (value="tagNo", required=true) int tagNo) {
		//태그 거절 로직 수행
		int result=service.tagRejection(tagNo);
		
		if(result>0) {
			int totalData=service.selectTagOpinionCount() ;
			pt=new PaginationTemplate(req, totalData, "/admin/selectTagOpinionList.lac");
			List<Map<String, Object>> list=service.selectTagOpinionList(pt.getcPage(), pt.getNumPerPage());
			model.addAttribute("resultList",list);
			model.addAttribute("cPage", pt.getcPage());
			model.addAttribute("numPerPage", pt.getNumPerPage());
			model.addAttribute("pageBar", pt.getPageBar());
			return "admin/tagOpinionAjax";
		} else {
			String msg="에러가 발생하였습니다. \n다시 시도해 주기시 바랍니다.";
			String loc="/admin/mainPage.jsp";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}
	}
	
	@RequestMapping("/admin/tagApproval.lac")
	public String tagApproval(HttpServletRequest req, Model model,
			@RequestParam (value="tagNo", required=true) int tagNo,
			@RequestParam (value="busNo", required=true) int busNo,
			@RequestParam (value="tagOpinion", required=true) String tagOpinion) {
		//태그 승인 로직 수행
		int result=service.tagApproval(tagNo, busNo, tagOpinion);
		
		if(result>0) {
			int totalData=service.selectTagOpinionCount() ;
			pt=new PaginationTemplate(req, totalData, "/admin/selectTagOpinionList.lac");
			List<Map<String, Object>> list=service.selectTagOpinionList(pt.getcPage(), pt.getNumPerPage());
			model.addAttribute("resultList",list);
			model.addAttribute("cPage", pt.getcPage());
			model.addAttribute("numPerPage", pt.getNumPerPage());
			model.addAttribute("pageBar", pt.getPageBar());
			return "admin/tagOpinionAjax";
		} else {
			String msg="에러가 발생하였습니다. \n다시 시도해 주기시 바랍니다.";
			String loc="/admin/mainPage.jsp";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}
	}
	
	@RequestMapping("/admin/selectTagOpinionList.lac")
	public ModelAndView tagOpinionList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		
		int totalData=service.selectTagOpinionCount() ;
		pt=new PaginationTemplate(req, totalData, "/admin/selectTagOpinionList.lac");
		List<Map<String, Object>> list=service.selectTagOpinionList(pt.getcPage(), pt.getNumPerPage());
		
		mv.addObject("resultList",list);
		mv.addObject("cPage", pt.getcPage());
		mv.addObject("numPerPage", pt.getNumPerPage());
		mv.addObject("pageBar", pt.getPageBar());
		mv.setViewName("admin/tagOpinionList");
		return mv;
	}
	
	@RequestMapping("/admin/loginLogSearchList.lac")
	public String loginLogSearchList(HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value,
			@RequestParam (value="mllSuccess", required=false, defaultValue="R") String mllSuccess) {
		// value 조건을 가진 검색 리스트 갯수
		int totalData=service.selectLoginLogCountBySearch(value, mllSuccess);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "mll_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<MemberLoginLog> list=service.selectLoginLogListBySearch(value, mllSuccess, ptf.getcPage(), ptf.getNumPerPage());
		model.addAttribute("logList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("mllSuccess", mllSuccess);
		model.addAttribute("cPage", ptf.getcPage());
		model.addAttribute("numPerPage", ptf.getNumPerPage());
		model.addAttribute("pageBar", ptf.getPageBar(true));
		return "admin/loginLogAjax";
	}
	
	@RequestMapping("/admin/loginLog.lac")
	public ModelAndView loginLog(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		//로그인 통계용 
		List<Integer> statsList=service.selectLoginLogStats();
		
		//로그인 차트용
		List<Map<String, Integer>> chartListS=service.selectLoginLogChartData("Y");
		List<Map<String, Integer>> chartListF=service.selectLoginLogChartData("N");
		
		//로그인 테이블 자료
		int totalData=service.selectLoginLogCountBySearch("", "R") ;
		ptf=new PaginationTemplateFunction2nd(req, totalData, "mll_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<MemberLoginLog> list=service.selectLoginLogListBySearch("", "R", ptf.getcPage(), ptf.getNumPerPage());
		
		mv.addObject("statsList", statsList);
		mv.addObject("chartListS", chartListS);
		mv.addObject("chartListF", chartListF);
		mv.addObject("logList",list);
		mv.addObject("data","all");
		mv.addObject("chart","bar");
		mv.addObject("searchValue", "");
		mv.addObject("mllSuccess", "R");
		mv.addObject("cPage", ptf.getcPage());
		mv.addObject("numPerPage", ptf.getNumPerPage());
		mv.addObject("pageBar", ptf.getPageBar(true));
		return mv;
	}
	
	@RequestMapping("/admin/restoreMember.lac")
	public String restoreMember(Member m, HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value) {
		//계정 복구 로직 
		int result=service.restoreMember(m);
		
		int totalData=service.selectWithdrawMemberCountBySearch(value);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "wd_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectWithdrawMemberListBySearch(value, ptf.getcPage(), ptf.getNumPerPage());
		
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("cPage", ptf.getcPage());
		model.addAttribute("numPerPage", ptf.getNumPerPage());
		model.addAttribute("pageBar", ptf.getPageBar(true));
		return "admin/withdrawMemberListAjax";
	}
	
	
	@RequestMapping("/admin/withdrawMemberSearchList.lac")
	public String withdrawMemberSearchList(HttpServletRequest req, Model model,
		@RequestParam (value="value", required=true) String value) {
		// value 조건을 가진 검색 리스트 갯수
		int totalData=service.selectWithdrawMemberCountBySearch(value);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "wd_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectWithdrawMemberListBySearch(value, ptf.getcPage(), ptf.getNumPerPage());
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("cPage", ptf.getcPage());
		model.addAttribute("numPerPage", ptf.getNumPerPage());
		model.addAttribute("pageBar", ptf.getPageBar(true));
		return "admin/withdrawMemberListAjax";
	}
	
	@RequestMapping("/admin/withdrawMemberList.lac")
	public ModelAndView withdrawMemberList(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		int totalData=service.selectWithdrawMemberCountBySearch("");
		ptf=new PaginationTemplateFunction2nd(req, totalData, "wd_search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectWithdrawMemberListBySearch("", ptf.getcPage(), ptf.getNumPerPage());
		
		mv.addObject("memList",list);
		mv.addObject("searchValue", "");
		mv.addObject("cPage", ptf.getcPage());
		mv.addObject("numPerPage", ptf.getNumPerPage());
		mv.addObject("pageBar", ptf.getPageBar(true));
		return mv;
	}
	
	@RequestMapping("/admin/memberSearchList.lac")
	public String memberSearchList(HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value,
			@RequestParam (value="searchLevel", required=false, defaultValue="-2") int searchLevel) {
		// value 조건을 가진 검색 리스트 갯수
		int totalData=service.selectMemberCountBySearch(value, searchLevel);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectMemberListBySearch(value, searchLevel, ptf.getcPage(), ptf.getNumPerPage());
		model.addAttribute("memList",list);
		model.addAttribute("searchValue", value);
		model.addAttribute("searchLevel", searchLevel);
		model.addAttribute("cPage", ptf.getcPage());
		model.addAttribute("numPerPage", ptf.getNumPerPage());
		model.addAttribute("pageBar", ptf.getPageBar(true));
		return "admin/memberListAjax";
	}
	
	
	@RequestMapping("/admin/deleteMember.lac")
	public String deleteMember(Member m, HttpServletRequest req, Model model,
			@RequestParam (value="value", required=false, defaultValue="") String value,
			@RequestParam (value="searchLevel", required=false, defaultValue="-2") int searchLevel) {
		//검색조건을 유지시킨 상태에서 리스트 업데이트가 필요하다.
		int totalData;
		List<Member> list;
		int result=service.deleteMember(m);
		if(result>0) {
			totalData=service.selectMemberCountBySearch(value, searchLevel);
			ptf=new PaginationTemplateFunction2nd(req, totalData, "search");
			ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
			list=service.selectMemberListBySearch(value, searchLevel, ptf.getcPage(), ptf.getNumPerPage());
			model.addAttribute("memList",list);
			model.addAttribute("searchValue", value);
			model.addAttribute("searchLevel", searchLevel);
			model.addAttribute("cPage", ptf.getcPage());
			model.addAttribute("numPerPage", ptf.getNumPerPage());
			model.addAttribute("pageBar", ptf.getPageBar(true));
			return "admin/memberListAjax";
		} else {
			String msg="에러가 발생하였습니다. \n다시 시도해 주기시 바랍니다.";
			String loc="/admin/mainPage.jsp";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}
	}
	
	@RequestMapping("/admin/updateMember.lac")
	@ResponseBody
	public String updateMember(Member m, HttpServletResponse res) {
		/*@ReponseBody이용*/
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		
		int result=service.updateMember(m);
		String jsonStr="";
		try {
			jsonStr=mapper.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}
	
	@RequestMapping("/admin/memberList.lac")
	public ModelAndView memberList(HttpServletRequest req) {
		/* 작업하면서 알게된 사실!
		 * viewName을 설정하지 않으면 실행중인 메소드 명(memberList)과 일치하는 view를 찾아간다.
		 */
		ModelAndView mv=new ModelAndView();
		
		//회원 통계
		List<Map<String, Integer>> statsList=service.selectMemberStats();
		Map<String, Integer> statsMap=new HashMap<String, Integer>(); 
		int total=0, unfinished=0, common=0, business=0;
		System.out.println(statsList);
		for(int i=0; i<statsList.size(); i++) {
			int level=Integer.parseInt(String.valueOf(statsList.get(i).get("LEVEL")+""));
			int count=Integer.parseInt(String.valueOf(statsList.get(i).get("COUNT")+""));
			total+=count;
			switch(level) {
			case 0: unfinished+=count; break;
			case 1: common+=count; break;
			case 2: common+=count; break;
			case 3: business+=count; break;
			case 4: business+=count; break;
			case 5: /*관리자 Pass*/ break;
			}
		}
		
		statsMap.put("total", total);
		statsMap.put("business", business);
		statsMap.put("common", common);
		statsMap.put("unfinished", unfinished);
		
		int totalData=service.selectMemberCountBySearch("", -2);
		ptf=new PaginationTemplateFunction2nd(req, totalData, "search");
		ptf.setUseParamCPage(); // cPage를 파라미터로 넘긴다.
		List<Member> list=service.selectMemberListBySearch("", -2, ptf.getcPage(), ptf.getNumPerPage());
		
		mv.addObject("memList",list);
		mv.addObject("statsMap",statsMap);
		mv.addObject("searchValue", "");
		mv.addObject("searchLevel", -2);
		mv.addObject("cPage", ptf.getcPage());
		mv.addObject("numPerPage", ptf.getNumPerPage());
		mv.addObject("pageBar", ptf.getPageBar(true));
		return mv;
	}
	
	@RequestMapping("admin/adminPage.lac")
	public String adminPage() {
		return "admin/mainPage";
	}
}
