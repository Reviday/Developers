package com.kh.developers.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.developers.admin.model.vo.MemberLoginLog;
import com.kh.developers.business.model.service.BusinessService;
import com.kh.developers.business.model.vo.Applicant;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.common.authentication.MailHandler;
import com.kh.developers.common.encrypt.MyEncrypt;
import com.kh.developers.common.page.PageFactory3;
import com.kh.developers.member.model.service.MemberService;
import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.member.model.vo.MyApp;
import com.kh.developers.member.model.vo.Point;
import com.kh.developers.resume.model.service.ResumeService;
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Education;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
import com.kh.developers.resume.model.vo.Resume;
import com.kh.developers.search.model.service.SearchService;
import com.kh.developers.search.model.vo.MainAdCompany;
import com.kh.developers.search.model.vo.Position;

@SessionAttributes(value= {"loginMember","busInfo","REMOTE_ADDR"})
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private SearchService service1;
	@Autowired
	private BusinessService bService;
	@Autowired
	private ResumeService rService;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Inject
    private JavaMailSender mailSender;
	@Autowired
	private MyEncrypt enc;
	
	private static Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/member/lastStepEnrollEnd.lmc") 
	public ModelAndView lastStepEnrollEnd(Member m, Model model) {
		ModelAndView mv=new ModelAndView();
		m.setMemReceiveEmail(m.getMemReceiveEmail().equals("true")?"Y":"N");
		Member result=service.lastStepEnrollEnd(m);
		System.out.println("result :" +result);
		if(result==null) {
			String msg="에러가 발생하였습니다. \n다시 시도해 주기시 바랍니다.";
			String loc="/";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
		} else {
			model.addAttribute("loginMember", result);
			mv.setViewName("member/mainPage");
		}
		return mv;
	}
	
	@RequestMapping("/member/main.lmc")
	public ModelAndView memberMainPage(Member m, HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		//메인상단광고
		List<MainAdCompany> mList = service.mainAdList();
		mv.addObject("mList", mList);
		//회원 관심분야 객체
		Interests inter = service.selectInterests(((Member)req.getSession().getAttribute("loginMember")).getMemEmail());
		if(inter == null) {
			//추천 채용 리스트
			List<Position> psList = service.selectPositionList();	
			mv.addObject("psList", psList);
			//신규 채용 회사
			List<Position> firstList = service1.firstPsList11();
			mv.addObject("firstList", firstList);
			//금주의 추천
			List<Position> weekList = service.selectWeekPositionList();
			mv.addObject("weekList", weekList);
		}else {
			//추천 채용 리스트
			List<Position> psList = service.selectInterPositionList(inter);
			mv.addObject("psList", psList);
			List<Position> psList1 = service.selectPositionList();	
			mv.addObject("psList1", psList1);
			//신규 채용 회사
			List<Position> firstList = service1.firstPsList11();
			mv.addObject("firstList", firstList);
			//금주의 추천
			List<Position> weekList = service.selectWeekPositionList();
			mv.addObject("weekList", weekList);
		}
		
		mv.setViewName("member/mainPage");
		return mv;
	}
	
	@RequestMapping("/member/myPage.lmc")
	public ModelAndView myPage(Member m,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		String email=((Member)req.getSession().getAttribute("loginMember")).getMemEmail();
		m.setMemEmail(email);
		m=service.selectMemberOne(m);
		Resume resume=rService.selectMathUpResume(m);
		if(resume==null) {
			mv.setViewName("member/myPage");
			return mv;
		}else {
			List<Career> career=rService.selectCareer(resume);
			List<Education> ed=rService.selectEd(resume);
			List<Activitie> ac=rService.selectAc(resume);
			List<Lang> Lang=rService.selectLang(resume);
			List<Links> links=rService.selectLinks(resume);
			Interests inter =rService.selectInter(m);
			mv.addObject("ed",ed);
			mv.addObject("ac",ac);
			mv.addObject("Lang",Lang);
			mv.addObject("links",links);
			mv.addObject("resume", resume);
			mv.addObject("career", career);
			mv.addObject("inter",inter);
			mv.setViewName("member/myPage2");
			return mv;
		}
	}
	
	@RequestMapping("/member/reSendMail.lmc")
	public void reSendMail(Member m, HttpServletRequest req, HttpServletResponse res) throws IOException {
		String url=req.getRequestURL().toString();
		int target=url.indexOf("developers");
		String frontUrl=url.substring(0,target);
		
		int result=1;
		String msg="";
		try {
			service.sendMail(m,frontUrl);
		} catch (Exception e) {
			result=-1;
		}
		if(result>0) {
			msg="기입된 이메일로 인증 메일이 전송되었습니다.";
		} else {
			msg="이메일 전송에 실패하였습니다.\n다시 확인하여 주시기 바랍니다.";
		}
		res.setContentType("text/html;charset=UTF-8");
		res.getWriter().print(msg);
	}
	
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session, SessionStatus s) {
		if(!s.isComplete()) {
			s.setComplete();//로그아웃
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/member/login.do") 
	public ModelAndView login(Member m, Model model, HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		boolean flag=false;
		if(result != null) {
			if(pwEncoder.matches(m.getMemPassword(), result.getMemPassword())) {
				flag=true;
			}
		} 
		
		if(flag) {
			if(result!=null&&result.getMemLevel()>=5) {
				model.addAttribute("loginMember",result); 
				mv.setViewName("admin/mainPage");
				return mv;
			} else if(result!=null&&result.getMemEmailCert().equals("N")) {
				model.addAttribute("ldc", "noemailcert"); // ldc : login Deny Code
			} else if(result!=null&&result.getMemName()==null) {
				model.addAttribute("ldc", "noname"); // ldc : login Deny Code
			} else if(result!=null&&result.getMemLevel()>=3 && result.getMemLevel()<5){
				// businessEnroll 마친 회원
				int memberNo=result.getMemNo();
				Business bus=bService.selectBusInfo(memberNo); //사업장 정보 불러오는 로직 
				model.addAttribute("busInfo",bus);
			}
			//메인상단광고
			List<MainAdCompany> mList = service.mainAdList();
			mv.addObject("mList", mList);
			//회원 관심분야 객체
			Interests inter = service.selectInterests(result.getMemEmail());
			if(inter == null) {
				//추천 채용 리스트
				List<Position> psList = service.selectPositionList();	
				mv.addObject("psList", psList);
				//신규 채용 회사
				List<Position> firstList = service1.firstPsList11();
				mv.addObject("firstList", firstList);
				//금주의 추천
				List<Position> weekList = service.selectWeekPositionList();
				mv.addObject("weekList", weekList);
			}else {
				//추천 채용 리스트
				List<Position> psList = service.selectInterPositionList(inter);
				mv.addObject("psList", psList);
				List<Position> psList1 = service.selectPositionList();	
				mv.addObject("psList1", psList1);
				//신규 채용 회사
				List<Position> firstList = service1.firstPsList11();
				mv.addObject("firstList", firstList);
				//금주의 추천
				List<Position> weekList = service.selectWeekPositionList();
				mv.addObject("weekList", weekList);
			}
			model.addAttribute("loginMember",result); 
			mv.setViewName("member/mainPage");
		} else {
			/*로그인 로직 상, login.do를 실행할떄 비밀번호가 틀릴 수가 없기 때문*/
			mv.addObject("msg","잘못된 경로입니다.");
			mv.addObject("loc","/");
			mv.setViewName("common/msg");
		}
		return mv;
	}
		
	@RequestMapping("/member/passwordCheck") 
	public ModelAndView passwordCheck(Member m, HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		boolean flag=false;
		if(result != null) {
			if(pwEncoder.matches(m.getMemPassword(), result.getMemPassword())) {
				flag=true;
			}
		}
		insertLoginLog(result, flag, request, "패스워드 불일치");
		mv.addObject("flag",flag);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/member/emailCheck")
	public ModelAndView emailCheck(Member m, HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		boolean flag=result!=null?true:false;
		String msg=""; 
		if(result!=null&&result.getMemStatus().equals("N")) {
			flag=false;
			msg="현재 사용 불가능한 계정입니다. 관리자에게 문의바랍니다.";
			insertLoginLog(result, flag, request, "사용 불가능한 계정");
		} 
		mv.addObject("flag",flag);
		mv.addObject("msg",msg);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/member/enrollMember") 
	public ModelAndView enrollMember(Member m, HttpServletRequest req, RedirectAttributes rttr) {
		ModelAndView mv=new ModelAndView();
		System.out.println(m);
		//비밀번호 암호화
		m.setMemPassword(pwEncoder.encode(m.getMemPassword()));
		
		String url=req.getRequestURL().toString();
		int target=url.indexOf("developers");
		String frontUrl=url.substring(0,target);
		int result=0;
		int result1=0;
		Point p=new Point();
		p.setMemPointPlus(1000);
		p.setPointIntro("회원 축하해염!");
		
		String msg="";
		try {
			result=service.insertMember(m, frontUrl);
			result1 = service.insertFilter();
			
		} catch (Exception e) {
			msg="회원가입에 실패하였습니다. 다시 확인해주시기 바랍니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/");
		}
		if(result>0) {
			msg="기입된 이메일로 인증 메일이 전송되었습니다.";
			p.setMemNo(m.getMemNo());
			int result2=service.addPoint(p);
			Point p2=service.selectaddPoint(p.getPointNo());
			int result3=service.updateMemberPoint(p2);
			mv.addObject("msg",msg);
			mv.setViewName("jsonView");
			
		} else if(result<0) {
			msg="인증메일 전송에 실패하였습니다. 다시 시도해 주시기 바랍니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/");
		} else {
			msg="회원가입 도중 에러가 발생하였습니다.";
			rttr.addFlashAttribute("msg",msg);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	//이메일 인증 코드 검증
    @RequestMapping(value = "/member/emailConfirm", method = RequestMethod.GET)
    public String emailConfirm(Member m,Model model,RedirectAttributes rttr) throws Exception { 
        int result=service.checkAuth(m);
        if(result <= 0) {
            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
            return "redirect:/";
        }
        Member loginMember=service.selectMemberOne(m);
        model.addAttribute("loginMember",loginMember);
        return "member/mainPage";
    }
    @RequestMapping(value="/member/insertInterests.lmc",produces = "application/text; charset=utf8" )
    public ModelAndView insertInterests(
    		@RequestParam(value="jobName") String jobName, 
    		@RequestParam(value="memEmail") String memEmail,
    		@RequestParam(value="experience") String experience,
    		@RequestParam(value="duty[]") List<String> dutyList,
    		@RequestParam(value="salary") int salary ,
    		@RequestParam(value="skill[]") List<String> skillList ) {
    	ModelAndView mv=new ModelAndView();
    	Interests i = new Interests();
    	i.setJobName(jobName);
    	i.setExperience(experience);
    	i.setSalary(salary);
    	i.setMemEmail(memEmail);
    	int dutysize=0;
    	String[] arrayDuty = new String[dutyList.size()];
         for(String duty : dutyList) {
        	 arrayDuty[dutysize++] = duty;
         }
         int skillsize=0;
         Arrays.sort(arrayDuty);
    	i.setDuty(arrayDuty);
    	String[] arraySkill = new String[skillList.size()];
    	for(String skill : skillList) {
    		arraySkill[skillsize++] = skill;
        }
    	Arrays.sort(arraySkill);
    	i.setSkill(arraySkill);
    	int result =service.insertInterests(i);
    	mv.addObject("i",i);
    	mv.setViewName("member/ajax/insertMathup");
    	return mv;
    }
    
	@RequestMapping("/member/insertMathupResume.lmc")
	public ModelAndView insertMathupResume(String schoolName,String empName,String startY,String startM,String endY,String endM,String memEmail,String memName) {
		ModelAndView mv=new ModelAndView();
		Member m =new Member();
		m.setMemEmail(memEmail);
		m.setMemName(memName);
		int result=rService.insertMathupResume(m);
		String startCareer=startY+startM;
		String endCareer=endY+endM;
		Resume r=new Resume();
		r.setResumeNo(m.getMemNo());
		r.setMemEmail(memEmail);
		r.setBusName(empName);
		r.setSchoolName(schoolName);
		r.setStartCareer(startCareer);
		r.setEndCareer(endCareer);
		int result4=rService.updateInterestsRno(r);
		int result2=rService.insertMathupCareer(r);
		int result3=rService.insertMathupEd(r);
		mv.setViewName("redirect:/member/myPage.lmc");
		return mv;
	}

	@RequestMapping("/member/updatePage.lmc")
	public ModelAndView updatePage() {
		ModelAndView mv= new ModelAndView();
		mv.setViewName("member/ajax/updatePage");
		return mv;
	}
	@RequestMapping(value="/member/likePage.lmc",produces = "application/text; charset=utf8" )
	public ModelAndView likePage(Member m) {
		ModelAndView mv= new ModelAndView();
		m=service.selectMemberOne(m);
		List<Position>likeList=service.selectLike(m);
		mv.addObject("likeList",likeList);
		mv.setViewName("member/ajax/myLike");
		return mv;
	}
	@RequestMapping(value="/member/myBookMark.lmc",produces = "application/text; charset=utf8" )
	public ModelAndView myBookMark(Member m) {
		ModelAndView mv= new ModelAndView();
		m=service.selectMemberOne(m);
		List<Position>likeList=service.selectBookMark(m);
		mv.addObject("likeList",likeList);
		mv.setViewName("member/ajax/myBookMark");
		return mv;
	}
    @RequestMapping("/member/memberUpdate.lmc")
    public ModelAndView memberUpdate(Member m,HttpSession session) {
    	ModelAndView mv = new ModelAndView();
    	int result=service.memberUpdate(m);
    	Member m2=service.selectMemberOne(m);
    	Interests inter=service.selectInterests(m2.getMemEmail());
    	if(inter==null) {
    		mv.addObject("loginMember",m2);
        	mv.setViewName("member/myPage");
    	}else {
    		Resume resume=rService.selectMathUpResume(m2);
    		List<Career> career=rService.selectCareer(resume);
			List<Education> ed=rService.selectEd(resume);
			List<Activitie> ac=rService.selectAc(resume);
			List<Lang> Lang=rService.selectLang(resume);
			List<Links> links=rService.selectLinks(resume);
			mv.addObject("ed",ed);
			mv.addObject("ac",ac);
			mv.addObject("Lang",Lang);
			mv.addObject("links",links);
			mv.addObject("resume", resume);
			mv.addObject("career", career);
			mv.addObject("inter",inter);
    		mv.addObject("loginMember",m2);
        	mv.setViewName("member/myPage2");
    	}
    	
    	return mv;
    }
    @RequestMapping("/member/logoChange")
    @ResponseBody
	public String logoChange(MultipartHttpServletRequest mReq,HttpServletResponse res) {
    	/*@ReponseBody이용*/

    	
		ObjectMapper mapper=new ObjectMapper();
		//잭슨이 제공하는 객체 자바클래스하고 json자바스크립트 객체 매핑 시켜줌 
		MultipartFile logo=mReq.getFile("logoFile");
		Member memInfo=((Member)mReq.getSession().getAttribute("loginMember"));
		String subDir="/resources/upload/profile";
		String saveDir=new MemberController().getClass().getResource("/").getPath();
		
		try {
			saveDir=saveDir.substring(0, saveDir.lastIndexOf("/WEB-INF"));
		}catch(Exception e) {			
			saveDir=saveDir.substring(0, saveDir.lastIndexOf("/target"));
			saveDir+="/src/main/webapp";
		}
		
		File dir=new File(saveDir+subDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		String reName="logo_"+sdf.format(new Date());
		String ext=logo.getOriginalFilename().substring(logo.getOriginalFilename().lastIndexOf("."));
		reName+=ext;
		//기존 로고 지우기
		if(memInfo.getMemIcon()!=null) {			
			String oriLogo=memInfo.getMemIcon();	
			File oriFile=new File(saveDir+oriLogo);
			if(oriFile.exists()) {
				oriFile.delete();
			}
		}
		//새로운 로고로 저장
		try {		
			String logoFullName=saveDir+subDir+"/"+reName;
			logo.transferTo(new File(logoFullName));
			memInfo.setMemIcon(subDir+"/"+reName);
			int result=service.busLogoChange(memInfo);
		}catch(IOException e) {
			e.printStackTrace();
		}
		String jsonStr="";
		try {
			jsonStr=mapper.writeValueAsString(memInfo.getMemIcon());
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 res.setContentType("application/json;charset=utf-8");
		return jsonStr;

	}

    public void insertLoginLog(Member m, boolean result, HttpServletRequest request, String reason) {
    	try {
    		MemberLoginLog mll=new MemberLoginLog();
    		mll.setMllSuccess(result==true?"Y":"N"); // m이 null이 아니면 로그인 성공
    		mll.setMllMemNo(m.getMemNo()); // m의 uid를 가져온다.
    		mll.setMllUserEmail(m.getMemEmail()); // 사용자가 입력한 이메일
    		mll.setMllIp(request.getRemoteAddr()); // 로그인 시도한 ip
    		mll.setMllReason(result==true?"로그인 성공":reason); // 로그인 성공/실패시 이유(더 다양한 사유도 가능할 듯하다)
    		mll.setMllUseragent(request.getHeader("User-Agent")); // 로그인한 브라우저의 user agent
    		mll.setMllUrl(String.valueOf(request.getRequestURL())); // 로그인한 페이지 주소
    		mll.setMllReferer(request.getHeader("referer"));// 이전 페이지 주소
    		
    		//로그인 로그를 남긴다. (리턴값은 필요없음.)
    		service.insertLoginLog(mll);
    	} catch(Exception e) {
    		/*에러 처리 없음*/
    	}
    }
    @RequestMapping("/member/updateInterestsPage.lmc")
    public ModelAndView updateInterests(Member m) {
    	ModelAndView mv=new ModelAndView();    	
    	Interests i=service.selectInterests(m.getMemEmail());
    	mv.addObject("inter", i);
    	mv.setViewName("member/ajax/updateInterests");
    	return mv;
    }
    @RequestMapping(value="/member/updateInterests.lmc",produces = "application/text; charset=utf8")
    public ModelAndView updateInterests(
    		@RequestParam(value="memEmail") String memEmail,
    		@RequestParam(value="experience") String experience,
    		@RequestParam(value="duty[]") List<String> dutyList,
    		@RequestParam(value="salary") int salary ,
    		@RequestParam(value="skill[]") List<String> skillList
    		) {
    	ModelAndView mv= new ModelAndView();
    	Interests i = new Interests();
    	i.setExperience(experience);
    	i.setSalary(salary);
    	i.setMemEmail(memEmail);
    	int dutysize=0;
    	String[] arrayDuty = new String[dutyList.size()];
         for(String duty : dutyList) {
        	 arrayDuty[dutysize++] = duty;
         }
         int skillsize=0;
         Arrays.sort(arrayDuty);
    	i.setDuty(arrayDuty);
    	String[] arraySkill = new String[skillList.size()];
    	for(String skill : skillList) {
    		arraySkill[skillsize++] = skill;
        }
    	Arrays.sort(arraySkill);
    	i.setSkill(arraySkill);
    	int result =service.updateInterests(i);
    	Member m2= new Member();
    	m2.setMemEmail(memEmail);
    	Resume resume=rService.selectMathUpResume(m2);
		List<Career> career=rService.selectCareer(resume);
		List<Education> ed=rService.selectEd(resume);
		mv.addObject("ed",ed);
		mv.addObject("resume", resume);
		mv.addObject("career", career);
    	mv.addObject("inter",i);
    	mv.addObject("memEmail",memEmail);
    	mv.setViewName("member/ajax/myPageAjax");
    	
    	return mv;
    }
    @RequestMapping("/member/applicantPage.lmc")
    public ModelAndView applicantPage(Member m) {
    	ModelAndView mv=new ModelAndView();
    	m=service.selectMemberOne(m);
    	List<Applicant> applicant=service.selectApplicant(m);
    	mv.addObject("app", applicant);
    	mv.setViewName("member/ajax/myApplicant");
    	return mv;
    }
    @RequestMapping("/member/applAns.lmc")
    public ModelAndView applAns(int applNo,int memNo,int number,HttpServletRequest req) throws MessagingException, UnsupportedEncodingException {
    	ModelAndView mv = new ModelAndView();
    	Member m = service.selectMemNo(memNo);
    	int result=service.applAns(applNo,number);
    	Business b =service.selectBusOne(""+result);
    	String url=req.getRequestURL().toString();
		int target=url.indexOf("developers");
		String frontUrl=url.substring(0,target);
    	Map<String, Object> map = new HashMap<String, Object>();
		map.put("memNo", m.getMemNo());
		//메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Developers] 지원자 응답완료");
        sendMail.setText(
                new StringBuffer().append("<div style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid rgb(67,138,255); margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">")
                .append("<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">")
                .append("<span style=\"font-size: 15px; margin: 0 0 10px 3px;\"><img src=\""+frontUrl+"developers/resources/images/Developers_logo.png"+"\" style=\"height:40px;\"/></span><br />")
                .append("<span style=\"color: rgb(67,138,255);\">응답 </span> 안내입니다.</h1>")
                .append("<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">")
                .append("안녕하세요.<br />")
                .append("지원자가 응답을 완료하였습니다.<br />")
                .append("어떤 응답을 하였는지 로그인하여 확인해주세요.<br />")
                .append("감사합니다.</p>")
                .append("<a style=\"color: #FFF; text-decoration: none; text-align: center;\" href=\"")
                .append(frontUrl+"developers/member/emailConfirm?memNo=")
                .append(m.getMemNo())
                .append("&memEmail=")
                .append(m.getMemEmail())
                .append("\" target=\"_blank\">")
                .append("<span style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background-color: rgb(67,138,255); line-height: 45px; vertical-align: middle; font-size: 16px;\">확인하러 가기</span></a>")
                .append("<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>")
                .toString());
        sendMail.setFrom("ysk.testacc@gmail.com", "디벨로퍼스 ");
        sendMail.setTo(b.getBusEmail());
        sendMail.send();
    	mv.addObject("number", number);
    	mv.setViewName("member/ajax/myApplicant");
    	return mv;
    }
    @RequestMapping("/member/profilePage.lmc")
	public ModelAndView profilePage(Member m,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		String email=((Member)req.getSession().getAttribute("loginMember")).getMemEmail();
		m.setMemEmail(email);
		m=service.selectMemberOne(m);
		Resume resume=rService.selectMathUpResume(m);
		if(resume==null) {
			mv.setViewName("member/ajax/profilePage");
			return mv;
		}else {
			List<Career> career=rService.selectCareer(resume);
			List<Education> ed=rService.selectEd(resume);
			List<Activitie> ac=rService.selectAc(resume);
			List<Lang> Lang=rService.selectLang(resume);
			List<Links> links=rService.selectLinks(resume);
			Interests inter =rService.selectInter(m);
			mv.addObject("ed",ed);
			mv.addObject("ac",ac);
			mv.addObject("Lang",Lang);
			mv.addObject("links",links);
			mv.addObject("resume", resume);
			mv.addObject("career", career);
			mv.addObject("inter",inter);
			mv.setViewName("member/ajax/profilePage2");
			return mv;
		}
	}
    @RequestMapping("/member/myPointPage.lmc")
    public ModelAndView myPoint(Member m) {
    	ModelAndView mv = new ModelAndView();
    	m=service.selectMemberOne(m);
    	List<Point>pointList=service.selectMyPoint(m);
    	mv.addObject("pointList", pointList);
    	mv.setViewName("member/ajax/myPoint");
    	return mv;
    }
    @RequestMapping("/member/dashBoard.lmc")
    public ModelAndView dashBoard(Member m,
    		@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
    	ModelAndView mv= new ModelAndView();
    	m=service.selectMemberOne(m);
    	int numPerPage=10;
		int totalData=0;
		//list 가져오기
		String url="/developers/member/dashBoard.lmc?memEmail="+m.getMemEmail();
		List<MyApp>applList=service.selectMemAppl(m,cPage,numPerPage); 
		totalData=service.selectMemApplCount(m);
		mv.addObject("pageBar", PageFactory3.getPageBar(totalData, cPage, numPerPage,url));
    	mv.addObject("applList", applList);
    	mv.addObject("totalData", totalData);
    	mv.setViewName("member/dashBoard");
    	return mv;
    }
    @RequestMapping("/member/dashBoardSearch.lmc")
    public ModelAndView dashBoardSearch(MyApp ma,
    		@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
    	ModelAndView mv= new ModelAndView();
    	int numPerPage=10;
    	int SearchTotalData=0;
    	String url="/developers/member/dashBoard.lmc?memEmail="+ma.getMemEmail()+"&busName="+ma.getBusName();
    	List<MyApp> applList =service.selectMa(ma,cPage,numPerPage);
    	Member m=new Member();
    	m.setMemNo((ma.getMemNo()));
    	int totalData=service.selectMemApplCount(m);
    	SearchTotalData=service.selectMaCount(ma);
    	mv.addObject("pageBar", PageFactory3.getPageBar(SearchTotalData, cPage, numPerPage,url));
    	mv.addObject("busName", ma.getBusName());
    	mv.addObject("applList", applList);
    	mv.addObject("totalData", totalData);
    	mv.addObject("SearchTotalData", SearchTotalData);
    	mv.setViewName("member/ajax/dashBoardList");
    	return mv;
    }
    @RequestMapping("/member/addPoint")
    public ModelAndView addPoint(Point p) {
    	ModelAndView mv= new ModelAndView();
    	p.setMemPoint(1000);
    	p.setPointIntro("생일축하");
    	
    	int result=service.addPoint(p);
    	
    	mv.setViewName("/");
    	return mv;
    }
    
    @RequestMapping("/member/deleteMember.lmc")
    public ModelAndView deleteMemberPage() {
    	ModelAndView mv= new ModelAndView();
    	mv.setViewName("member/ajax/deleteMemeber");
    	return mv;
    }
    @RequestMapping("/member/RealdeleteMember.lmc")
    public ModelAndView RealdeleteMember(int memNo,HttpSession session,SessionStatus s) {
    	ModelAndView mv= new ModelAndView();
    	int result = service.RealdeleteMember(memNo);
    	if(!s.isComplete()) {
			s.setComplete();//로그아웃
			session.invalidate();
		}

    	mv.setViewName("redirect:/");
    	return mv;
    }
    
}
