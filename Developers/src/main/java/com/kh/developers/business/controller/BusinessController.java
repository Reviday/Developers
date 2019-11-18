package com.kh.developers.business.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.developers.business.model.service.BusinessService;
import com.kh.developers.business.model.vo.Advertisement;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.business.model.vo.IntroCard;
import com.kh.developers.common.util.PaginationTemplateFunction;
import com.kh.developers.member.controller.MemberController;
import com.kh.developers.member.model.service.MemberService;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.service.ResumeService;
import com.kh.developers.resume.model.vo.Resume;

@SessionAttributes(value= {"loginMember","busInfo"})

@Controller
public class BusinessController {
	
	private static Logger logger = LoggerFactory.getLogger(BusinessController.class);
	private PaginationTemplateFunction ptf;
	
	@Autowired 
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private BusinessService bService;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private ResumeService rService;
	
	@RequestMapping("/business")
	public String empPage(HttpSession session){
		if(session.getAttribute("loginMember")!=null) {
			Member m=(Member)session.getAttribute("loginMember");
			int level = m.getMemLevel();
			//redirect 로 매핑값 서블릿으로
			if(session.getAttribute("loginMember")!=null&&level>2&&session.getAttribute("busInfo")!=null) {
				return "redirect:/business/dashboard.lbc";			
			}else if(session.getAttribute("loginMember")!=null&&level==2) {
				return "business/confirming";
				
			}else if(session.getAttribute("loginMember")!=null&&level<1&&session.getAttribute("busInfo")==null) {
				return "business/businessEnroll";
			}else {
				return "business/welcome";			
			}	
		}
		return "business/welcome";		
	}
	
	@RequestMapping("/business/register")
	public ModelAndView register(
			Member m, Model model, HttpServletRequest req, RedirectAttributes rttr
			) {
		ModelAndView mv=new ModelAndView();
		logger.debug(""+m);
		m.setMemPassword(pwEncoder.encode(m.getMemPassword()));

		String url=req.getRequestURL().toString();
		int target=url.indexOf("developers");
		String frontUrl=url.substring(0,target);
		int result=0;
		int result1=0;
		String msg="";
		try {
			result=bService.insertMember(m, frontUrl);
			result1 = service.insertFilter();
		} catch (Exception e) {
			msg="회원가입에 실패하였습니다. 다시 확인해주시기 바랍니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/business");
		}
		if(result>0) {
//			Member mem=service.selectMemberOne(m);
//			mv.addObject("mem",mem);
//			model.addAttribute("loginMember",mem);
			msg="기입된 이메일로 인증 메일이 전송되었습니다.";
			mv.addObject("msg",msg);
			mv.setViewName("jsonView");
		} else if(result<0) {
			msg="인증메일 전송에 실패하였습니다. 다시 시도해 주시기 바랍니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/business");
		} else {
			msg="회원가입 도중 에러가 발생하였습니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/business");
		}
		logger.debug("과연??"+result);
		return mv;
	}
	
	@RequestMapping("/business/businessEnroll")
	public ModelAndView businessEnroll(Business bus,HttpServletRequest req, RedirectAttributes rttr){
		ModelAndView mv=new ModelAndView();
		Member m=(Member)req.getSession().getAttribute("loginMember");
		String msg="";
		int result=0;
		try {
			result=bService.insertBusiness(bus,m.getMemNo());			
		}catch(Exception e) {
			msg= "기업등록에 실패하셨습니다. 다시한번 시도하여 주시기 바랍니다";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/business");
		}
		if(result>0) {
			mv.setViewName("/business/confirming");			
		}else {
			msg= "기업등록 도중 에러가 발생하였습니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/business");
		}
		//관리자 한테도 보내줘야함
		return mv;		
	}
	
	@RequestMapping("/business/login")
	@ResponseBody
	public ModelAndView empLogin(Member m, Model model, HttpServletRequest request,RedirectAttributes rttr) {
			ModelAndView mv=new ModelAndView();
			logger.debug(""+m);
			Member result=service.selectMemberOne(m);
			boolean confirmed=true;
			boolean flag=false;
			if(result != null) {
				if(pwEncoder.matches(m.getMemPassword(), result.getMemPassword())) {
					flag=true;
				}
			}
			if(flag) {
				if(result!=null&&result.getMemEmailCert().equals("N")) {
//					model.addAttribute("ldc", "noemailcert"); // ldc : login Deny Code
					confirmed=false;
					rttr.addFlashAttribute("confirmed",confirmed);
					 mv.addObject("confirmed", confirmed);
//				     mv.setViewName("business");
//					return "redirect:/business/{confirmed}";
					mv.setViewName("redirect:/business");
				}else if(result!=null&&result.getMemLevel()<2) {
					 // 아직 bussinessEnroll 안한 회원 
					model.addAttribute("loginMember",result); 
					mv.setViewName("business/businessEnroll");
				}else if(result!=null&&result.getMemLevel()==2){
					//기업 등록은 했지만 confirm 이 안난 회원 
					model.addAttribute("loginMember",result); 
					mv.setViewName("business/confirming");
				}else if(result!=null&&result.getMemLevel()>=3 && result.getMemLevel()<5){
				// businessEnroll 마친 회원
				int memberNo=result.getMemNo();
				Business bus=bService.selectBusInfo(memberNo); //사업장 정보 불러오는 로직 
				logger.debug(""+bus);
				model.addAttribute("loginMember",result); 
				model.addAttribute("busInfo",bus);
				mv.setViewName("redirect:/business/dashboard.lbc");											
				}else if(result!=null&&result.getMemLevel()>=5) {
				model.addAttribute("loginMember",result); 
	            mv.setViewName("admin/mainPage");
				}
				else {
				/*로그인 로직 상, login.do를 실행할떄 비밀번호가 틀릴 수가 없기 때문*/
				mv.addObject("msg","잘못된 경로입니다.");
				mv.addObject("loc","/");
				mv.setViewName("common/msg");
				}
			}
			new MemberController().insertLoginLog(result, flag, request, "패스워드 불일치");
			return mv;
	}
	
	@RequestMapping("/business/logout")
	public String logout(HttpSession session, SessionStatus s) {
		if(!s.isComplete()) {
			s.setComplete();//로그아웃
			session.invalidate();
		}
		return "redirect:/business";
	}
	
	@RequestMapping("/business/matchup.lbc")
	public ModelAndView matchup(Business bus,Resume r) {
		ModelAndView mv= new ModelAndView();
//		Resume resume=rService.selectResumeOne(r);
//		List<Career> career=rService.selectCareer(resume);
//		List<Education> ed=rService.selectEd(resume);
//		List<Activitie> ac=rService.selectAc(resume);
//		List<Lang> Lang=rService.selectLang(resume);
//		List<Links> links=rService.selectLinks(resume);
//		mv.addObject("ed",ed);
//		mv.addObject("ac",ac);
//		mv.addObject("Lang",Lang);
//		mv.addObject("links",links);
//		mv.addObject("resume", resume);
//		mv.addObject("career", career);
		mv.addObject("dbIndex",2);
//		mv.addObject("dbHtml",matchHTML);
		mv.setViewName("business/temporaryPage");
		return mv;
	}
	
	@RequestMapping("/business/favorites")
	public ModelAndView favorites(String busNo, String resumeNo, String selectVal) {
		ModelAndView mv=new ModelAndView();
//		찜하기: 사업장 번호와 이력서 번호 불러와서 fav로 연결시켜줌 -> 찜한 목록에 추가 
//		찜하기: 취소시 테이블에서 delete
//		이력서 미리보기: 백단에서 처리 할 것 없음 
//		이력서를 열람하려면 열람권 결제를 해야함
//		이력서 열람하기: 사업장 번호와 이력서 번호 불러와서 seen으로 연결시켜줌 -> 열람한 목록에 추가
//		면접 제인하기: 사업장 번호와 이력서 번호 불러와서 offer로 연결시켜줌 -> 면접 제안한 목록에 추가
//		int insertResult=bService.insertFavorite(busNo,resumeNo,selectVal);
//		int removeResult=bService.removeFavorite(busNo,resumeNo,selectVal);
		return mv;
	}
	
	@RequestMapping(value = "/business/selectResume", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String selectResume(@RequestParam (value="searchPackage[]") List<String>searchPackage, HttpServletRequest req, HttpServletResponse res) {
		ObjectMapper mapper=new ObjectMapper(); //잭슨 객체 - json자바스크립트 객체 매핑시킴 
		List<IntroCard>icList=new ArrayList<IntroCard>();
		Map<String,Object>resultMap=new HashMap<String,Object>();
		Business bus=(Business)req.getSession().getAttribute("busInfo");
		int busNo=Integer.parseInt(bus.getBusNo());
		String jsonStr="";
		String duties="";
		String searchBox="";
		int cPage;
		try {
			cPage=Integer.parseInt(searchPackage.get(2));			
		}catch(Exception e) {
			cPage=1;
		}
		
		
		if(!searchPackage.get(0).isEmpty()) {
			String[] selected=(searchPackage.get(0)).split(",");
			Arrays.sort(selected);
			for(int i=0;i<selected.length;i++) {
				duties+='%'+selected[i];
			}
			duties+='%';			
		}
		if(!searchPackage.get(1).isEmpty()) {
			String[] search=(searchPackage.get(1)).split(" ");
			for(int i=0;i<search.length;i++) {
				if(i<search.length-1) searchBox+=search[i]+"|";
				else searchBox+=search[i];
			}
		}

//		이력서 검색으로 가져오기 로직
		if(searchPackage.get(0).isEmpty()&&searchPackage.get(1).isEmpty()) {
			System.out.println("검색1,2 둘다 없음 (모든검색)");
//			검색1,2 둘다없는 모든검색
			int icCount=bService.selectCountBasic();
			ptf=new PaginationTemplateFunction(cPage, icCount,"cPageSearch");
			icList=bService.selectIntroCards(ptf.getcPage(), ptf.getNumPerPage());
			for(IntroCard ic:icList) {
				ic.setCareers(bService.selectCareers(ic.getResumeNo()));
				ic.setEducations(bService.selectEducations(ic.getResumeNo()));
				System.out.println(busNo);
				System.out.println(ic.getResumeNo());
				if(bService.selectFavorite(busNo,ic.getResumeNo())!=null){
					ic.setFavorite(bService.selectFavorite(busNo,ic.getResumeNo()));					
				}else {
					ic.setFavorite("F");
				}
			}
		}
		else if(!searchPackage.get(0).isEmpty()&&searchPackage.get(1).isEmpty()) {
			System.out.println("검색1만 있음");
//			검색1만 있을때
			int icCount=bService.selectCountDuties(duties);
			ptf=new PaginationTemplateFunction(cPage, icCount,"cPageSearch");
			
			icList=bService.selectIntroCards(duties,ptf.getcPage(), ptf.getNumPerPage());
			for(IntroCard ic:icList) {
				ic.setCareers(bService.selectCareers(ic.getResumeNo()));
				ic.setEducations(bService.selectEducations(ic.getResumeNo()));
				if(bService.selectFavorite(busNo,ic.getResumeNo())!=null){
					ic.setFavorite(bService.selectFavorite(busNo,ic.getResumeNo()));					
				}else {
					ic.setFavorite("F");
				}
			}
		}
		else if(!searchPackage.get(0).isEmpty()&&!searchPackage.get(1).isEmpty()) {
			System.out.println("검색1,검색2 둘다 있음");
//			검색1 과 검색2가 있을때
			int icCount=bService.selectCountBoth(duties,searchBox); // 개수 반환
			ptf=new PaginationTemplateFunction(cPage, icCount,"cPageSearch");
			icList=bService.selectIntroCards(duties,searchBox, ptf.getcPage(), ptf.getNumPerPage());
			for(IntroCard ic:icList) {
				ic.setCareers(bService.selectCareers(ic.getResumeNo()));
				ic.setEducations(bService.selectEducations(ic.getResumeNo()));
				if(bService.selectFavorite(busNo,ic.getResumeNo())!=null){
					ic.setFavorite(bService.selectFavorite(busNo,ic.getResumeNo()));					
				}else {
					ic.setFavorite("F");
				}
			}
		}
		else if(searchPackage.get(0).isEmpty()&&!searchPackage.get(1).isEmpty()) {
			System.out.println("모든검색/검색2만 있음");
//			검색2만 있을때 
			int icCount=bService.selectCountSearch(searchBox);
			ptf=new PaginationTemplateFunction(cPage, icCount,"cPageSearch");
			icList=bService.selectIntroCardsSearch(searchBox,ptf.getcPage(), ptf.getNumPerPage());
			for(IntroCard ic:icList) {
				ic.setCareers(bService.selectCareers(ic.getResumeNo()));
				ic.setEducations(bService.selectEducations(ic.getResumeNo()));
				if(bService.selectFavorite(busNo,ic.getResumeNo())!=null){
					ic.setFavorite(bService.selectFavorite(busNo,ic.getResumeNo()));					
				}else {
					ic.setFavorite("F");
				}
			}
		}
		String pageBar="";
		pageBar=ptf.getPageBar();			
		
		resultMap.put("icList", icList);
		resultMap.put("pageBar",pageBar);
		try {
			jsonStr=mapper.writeValueAsString(resultMap);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		res.setContentType("application/json;charset=utf-8");

		return jsonStr;
	}
	
	
	@RequestMapping(value = "/business/openResume", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String openResume(@RequestParam (value="resumeNo", required=true) int resumeNo, HttpServletResponse res) {
		ObjectMapper mapper=new ObjectMapper(); //잭슨 객체 - json자바스크립트 객체 매핑시킴
		String jsonStr="";
		IntroCard ic=bService.selectOneIntroCard(resumeNo);
		if(ic!=null) {
			ic.setCareers(bService.selectCareers(resumeNo));
			ic.setEducations(bService.selectEducations(resumeNo));			
		}
		try {
			jsonStr=mapper.writeValueAsString(ic);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}
	
	//찜하기 로직 
	@RequestMapping(value = "/business/clickFav", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String clickFav(@RequestParam(value="resumeNo") int resumeNo, @RequestParam(value="flag") int flag,HttpSession session,HttpServletResponse res) {
		Business bus=(Business) session.getAttribute("busInfo");
		ObjectMapper mapper=new ObjectMapper(); //잭슨 객체 - json자바스크립트 객체 매핑시킴
		String jsonStr="";
		int result;
		int busNo=Integer.parseInt(bus.getBusNo());
		
		if(flag>0) {
			result=bService.insertFavorite(resumeNo, busNo);			
		}else {
			result=bService.removeFavorite(resumeNo, busNo);
			if(result>0) {
				result=-1;
			}
		}
		try {
			jsonStr=mapper.writeValueAsString(result);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}
	
	
	// 왼쪽 메뉴바 로직
	
	// 찜하기 불러오기 
	@RequestMapping(value = "/business/favoriteList", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String favoriteList(@RequestParam (value="cPage", required=false, defaultValue="0") int cPage,HttpSession session, HttpServletResponse res) {
		Business bus=(Business) session.getAttribute("busInfo");
		Map<String,Object>resultMap=new HashMap<String,Object>();
		List<IntroCard>icList=new ArrayList<IntroCard>();
		ObjectMapper mapper=new ObjectMapper(); //잭슨 객체 - json자바스크립트 객체 매핑시킴
		String jsonStr="";
		int busNo=Integer.parseInt(bus.getBusNo());
		if(cPage<1) {
			cPage=1;
		}
		
		int icCount=bService.selectCountFav(busNo);
		ptf=new PaginationTemplateFunction(cPage, icCount,"favoriteList");
		icList=bService.selectFavorites(busNo,ptf.getcPage(), ptf.getNumPerPage());
		if(icList.size()>0) {
			for(IntroCard ic:icList) {
				ic.setCareers(bService.selectCareers(ic.getResumeNo()));
				ic.setEducations(bService.selectEducations(ic.getResumeNo()));
			}
			String pageBar="";
			pageBar=ptf.getPageBar();			
			resultMap.put("icList", icList);
			resultMap.put("pageBar",pageBar);
			try {
				jsonStr=mapper.writeValueAsString(resultMap);
			}catch(JsonProcessingException e) {
				e.printStackTrace();
			}
		}else{
			String val="F";
			try {
				jsonStr=mapper.writeValueAsString(val);
			}catch(JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}
	
	
	// 광고 페이지 들어가기 
	@RequestMapping("/business/ad.lbc")
	public ModelAndView advertisement(HttpServletRequest req) {
		ModelAndView mv= new ModelAndView();
		List<Advertisement>adList=new ArrayList<Advertisement>();
		List<Advertisement>categoryList=new ArrayList<Advertisement>();
		List<Advertisement>mainList=new ArrayList<Advertisement>();
		Business bus=(Business)req.getSession().getAttribute("busInfo");
		int busNo=Integer.parseInt(bus.getBusNo());
		//직무, 메인 광고 결과 가지고 오기 
		adList=bService.selectAdvertisement(busNo);
		if(adList.size()>0) {
			for(Advertisement ad: adList) {
				ad.setPosition(bService.selectPositionName(ad.getPositionNo()));
				if(ad.getAdType().equals("CATEGORY")){
					categoryList.add(ad);
				}else {
					mainList.add(ad);
				}
			}
		}
		mv.addObject("categoryList",categoryList);
		mv.addObject("mainList",mainList);
		mv.setViewName("business/advertisement");
		return mv;
	}
	
	//광고 페이지 직무 상단/메인 상단 페이지 
	@RequestMapping(value = "/business/selectPositionInfo", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String positionInfo(@RequestParam (value="flag", required=true) String flag, HttpServletRequest req,HttpServletResponse res) {
		Map<String,Object>resultMap=new HashMap<String,Object>();
		Business bus=(Business)req.getSession().getAttribute("busInfo");
		int busNo=Integer.parseInt(bus.getBusNo());
		ObjectMapper mapper=new ObjectMapper(); //잭슨 객체 - json자바스크립트 객체 매핑시킴
		String jsonStr="";
		List<Advertisement>polist=new ArrayList<Advertisement>();
		polist=bService.selectPositionInfo(busNo);
		resultMap.put("polist", polist);
		resultMap.put("flag", flag);
		try {
			jsonStr=mapper.writeValueAsString(resultMap);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}
	
	
//	광고 클릭 수 저장 함수 
	@RequestMapping("/business/AdClick")
	public String adClick(@RequestParam(value="adNo", required=true) int adNo,HttpServletRequest req) {
		
		
		return "";
	}
	
	
	
	
	
}
