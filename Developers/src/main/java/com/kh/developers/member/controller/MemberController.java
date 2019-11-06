package com.kh.developers.member.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.developers.business.model.service.BusinessService;
import com.kh.developers.business.model.vo.Business;
import com.kh.developers.common.encrypt.MyEncrypt;
import com.kh.developers.member.model.service.MemberService;
import com.kh.developers.member.model.vo.Interests;
import com.kh.developers.member.model.vo.Member;
import com.kh.developers.resume.model.service.ResumeService;
import com.kh.developers.resume.model.vo.Activitie;
import com.kh.developers.resume.model.vo.Career;
import com.kh.developers.resume.model.vo.Education;
import com.kh.developers.resume.model.vo.Lang;
import com.kh.developers.resume.model.vo.Links;
import com.kh.developers.resume.model.vo.Resume;

@SessionAttributes(value= {"loginMember","busInfo"})
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private BusinessService bService;
	@Autowired
	private ResumeService rService;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	private MyEncrypt enc;
	
	private static Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/member/lastStepEnrollEnd.lmc") 
	public ModelAndView lastStepEnrollEnd(Member m, Model model) {
		ModelAndView mv=new ModelAndView();
		m.setMemReceiveEmail(m.getMemReceiveEmail().equals("true")?"Y":"N");
		System.out.println(m);
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
	public ModelAndView memberMainPage(Member m) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("member/mainPage");
		return mv;
	}
	
	@RequestMapping("/member/myPage.lmc")
	public ModelAndView myPage(Member m) {
		ModelAndView mv=new ModelAndView();
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
	public ModelAndView passwordCheck(Member m) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		System.out.println("passwordCheck : "+m);
		boolean flag=false;
		if(result != null) {
			if(pwEncoder.matches(m.getMemPassword(), result.getMemPassword())) {
				flag=true;
			}
		}
		mv.addObject("flag",flag);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/member/emailCheck")
	public ModelAndView emailCheck(Member m) {
		ModelAndView mv=new ModelAndView();
		Member result=service.selectMemberOne(m);
		logger.debug(result!=null?result.toString():"");
		boolean flag=result!=null?true:false;
		String msg=""; 
		if(result!=null&&result.getMemStatus().equals("N")) {
			flag=false;
			msg="현재 사용 불가능한 계정입니다. 관리자에게 문의바랍니다.";
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
		Resume r=new Resume();
		r.setResumeNo(m.getMemNo());
		r.setMemEmail(memEmail);
		int result2=rService.insertMathupCareer(r);
		int result3=rService.insertMathupEd(r);
		
		
		String startCareer=startY+startM;
		String endCareer=endY+endM;
		
		
		return mv;
	}
    
    
}
