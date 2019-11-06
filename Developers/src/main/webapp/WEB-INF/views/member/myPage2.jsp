<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" type="text/css" href="${path }/resources/css/mypage.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<div style="height: 50px;"></div>
    <div class="_1Gv5LM5zal-f72_XSo_qJ_">
    <nav role="presentation" class="_3wSXAiIJQZ98fJ-Hi6G42Q"><button type="button" class="">프로필<i
                class="icon-arrow_bottom_fill"></i></button>
        <ul class="">
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/matching" class="activeNav">프로필</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/point" class="">포인트</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><button type="button" class="">제안받기 현황<i
                        class="icon-arrow_bottom_fill"></i></button><a href="/profile/status" class="">제안받기 현황</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/likes" class="">좋아요</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/bookmarks" class="">북마크</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><button type="button" class="">설정<i
                        class="icon-arrow_bottom_fill"></i></button><a href="/profile/settings" class="">설정</a></li>
        </ul>
    </nav>
    <div class="_14NzdD9Zqjq8ocf6TORWoN">
        <aside class="Aside _1dBR38s0D_bqykmPvZBYPu">
            <header class="Aside-header">
                <div class="Aside-avatar">
                    <div class="Aside-avatar_image"
                        style="background-image: url(&quot;https://graph.facebook.com/1372739109548620/picture?height=300&amp;width=300&quot;);">
                        <div class="_1RDFX7ZROHIIPqPMgmtS2E"><input type="file" accept="image/*"><i
                                class="icon-camera_icon" role="presentation"></i></div>
                    </div>
                </div>
                <div class="Aside-me">
                    <div class="Aside-me_name">강병민</div>
                    <div class="Aside-me_email">cay9506@naver.com</div>
                    <div class="Aside-me_tel">010-5632-1245</div>
                </div><a href="/profile/matching?level=1" class="Aside-edit">기본정보 수정</a>
            </header>
            <div class="MatchUpStatus _s0V-DmOyFivCW3HY7Nh3"><a href="/profile/status?type=matchup-likes"
                    class="MatchUpStatus-item"><span class="MatchUpStatus-label">원해요</span><strong
                        class="MatchUpStatus-value">0</strong></a><a href="/profile/status?type=matchup-opens"
                    class="MatchUpStatus-item"><span class="MatchUpStatus-label">열람/요청</span><strong
                        class="MatchUpStatus-value">0</strong></a><a href="/profile/status?type=matchup-offers"
                    class="MatchUpStatus-item"><span class="MatchUpStatus-label">받은 제안</span><strong
                        class="MatchUpStatus-value">0</strong></a></div>
        </aside>
        <section>
            <div class="_6zGbQ6Gwdi0O826QWL_gN">
                <div class="MatchUpForm _1DBZ1F8aWXUpL5ry5a_nRi _3KMaM1vv70381zri4eolK1">
                    <div class="ResumeWordCountWarning-body">
                        <p class="ResumeWordCountWarning-count is-invalid">이력서 글자 수 : <span
                                class="current_char">125자</span> / 최소 400자</p>
                        <p class="ResumeWordCountWarning-guide">글자 수가 400자 이상이면, 직접 제안받을 확률이 높아집니다.</p>
                    </div><a href="/cv/361116?from=profile" class="ResumeWordCountWarning-button">이력서 강화하기</a>
                </div>
                <div class="MatchUpForm _1DBZ1F8aWXUpL5ry5a_nRi _3IED0gKfPim4KkuZ7BNhTA">
                    <header class="Form-header">
                        <dl class="Form-title">
                            <dt>기본 이력서</dt>
                        </dl>
                    </header>
                    <div class="FormBlock _3jRGSvRhv5E53D3OVwfvlL">
                        <div class="FormBlock-content content">
                            <div class="_1hQHY2MOttuKGMBqDe_htT">
                                <div class="Static-label">기본 이력서 선택</div>
                                <div class="Static-body">
                                    <div class="j5MfBkBHKnuB74EAGzFL"><button type="button"
                                            class="DefaultResumeSelector-button">강병민 9</button></div>
                                </div>
                            </div>
                            <div class="MainResume-fieldset">
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">학교</div>
                                    <div class="Static-body">
                                        <div class="_19vX-16wSMhdZ9PHWSu9fr"><span
                                                class="ResumeEntry-major">연세대학교</span><span
                                                class="ResumeEntry-minor is-empty">전공 미입력</span></div>
                                    </div>
                                </div>
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">직장</div>
                                    <div class="Static-body">
                                        <div class="_19vX-16wSMhdZ9PHWSu9fr"><span
                                                class="ResumeEntry-major">넵튠</span><span
                                                class="ResumeEntry-minor is-empty">직책 미입력</span></div>
                                    </div>
                                </div><a href="/cv/361116?from=profile" class="MainResume-edit"><i class="icon-edit"
                                        style="font-size: 28px;"></i></a>
                            </div>
                            <div class="MainResume-about">안녕하세요. 10년차 웹 개발자 입니다.</div>
                        </div>
                    </div>
                </div>
                <div class="MatchUpForm _1DBZ1F8aWXUpL5ry5a_nRi _3ZoHfZyrHiWR9JdVIgtNxq">
                    <header class="Form-header">
                        <dl class="Form-title">
                            <dt>관심분야 설정</dt>
                        </dl>
                    </header>
                    <div class="FormBlock _3jRGSvRhv5E53D3OVwfvlL">
                        <div class="FormBlock-content content">
                            <div class="EnterInterestArea-fieldset">
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">직군</div>
                                    <div class="Static-body">개발</div>
                                </div>
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">직무</div>
                                    <div class="Static-body">데이터 엔지니어, 자바 개발자, .NET 개발자, 시스템,네트워크 관리자, 프론트엔드 개발자, 보안
                                        엔지니어, DevOps / 시스템 관리자, QA,테스트 엔지니어, 안드로이드 개발자, iOS 개발자, CIO,Chief Information
                                        Officer, CTO,Chief Technology Officer, 서버 개발자, 웹 개발자, 프로덕트 매니저, 개발 매니저, PHP 개발자,
                                        루비온레일즈 개발자, Node.js 개발자, 그래픽스 엔지니어, 파이썬 개발자, C,C++ 개발자, 웹 퍼블리셔, BI 엔지니어, 데이터
                                        사이언티스트, 빅데이터 엔지니어, 기술지원, 머신러닝 엔지니어</div>
                                </div>
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">경력</div>
                                    <div class="Static-body">10 년 이상</div>
                                </div>
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">스킬</div>
                                    <div class="Static-body">A3</div>
                                </div><a href="/profile/matching?level=2&amp;step=1&amp;modi=true"
                                    class="EnterInterestArea-edit"><i class="icon-edit"
                                        style="font-size: 28px;"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="FormBlock _3jRGSvRhv5E53D3OVwfvlL">
                        <div class="FormBlock-content content">
                            <div class="_1EAHl8ELPU2wXBt1lTk3dJ">
                                <div class="FormButton _3I5bkI50gryaER31Iu7b4E">
                                    <h6 class="FormButton-label">추천인 선택</h6><button type="button"
                                        class="FormButton-button">선택하기<i class="icon-arrow_right"></i></button>
                                </div>
                                <div class="FormButton _3I5bkI50gryaER31Iu7b4E">
                                    <h6 class="FormButton-label">제외기업설정</h6><button type="button"
                                        class="FormButton-button">선택하기<i class="icon-arrow_right"></i></button>
                                </div>
                                <div class="InputGroup S_Q_6_Q0Z4g7wQdTbQh7e _3VqhswPaKoJ1nTQbYROm0N">
                                    <h6 class="InputGroup-label">구직 여부 설정</h6>
                                    <div class="InputGroup-body">
                                        <div class="JobSearchIntentionSelector-wrapper"><select
                                                class="JobSearchIntentionSelector-select">
                                                <option value="NOW">현재 구직 중</option>
                                                <option value="INTEREST">관심 있음</option>
                                                <option value="NO">전혀 관심 없음</option>
                                            </select></div><span class="JobSearchIntentionSelector-status">이력서
                                            공개중</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" type="text/javascript"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" type="text/javascript"></script>
<script>	
	var duty=[];
    function dutyview(){
        var dutybutton =document.getElementsByClassName('_26Ms0F-WSvfKh16ALOIC20');
        if($(dutybutton).attr('disabled')){
            $(dutybutton).attr('disabled',false);
        }else{
            $(dutybutton).attr('disabled',true);
        }
     
	
    }
    
    $(function(){
    	 $('._26Ms0F-WSvfKh16ALOIC20').click(function() {
         	if($(this).hasClass("active") === false){
             $(this).addClass('active');
         	}else{
         	$(this).removeClass('active');	
         	}
         });
    });
    
   function saveInter(memEmail){
	
	   var skill = [];
	   $("input[name='skill']:checked").each(function(i){   
		   skill.push($(this).val());
	   });
	   var jobName =$("select[name=jobName]").val();
	   var experience =$("select[name=career]").val();
	   var salary =$("input[name=salary]").val();
	   for(var i=0; i<$('.active').length; i++){
	   duty.push($(document.getElementsByClassName('active')[i]).val());
  		 }
	   var objParams = {
			   "jobName":jobName,
			   "memEmail":memEmail,
			   "experience":experience,
	   			"duty":duty,
	   			"salary":salary,
	   			"skill":skill
           };
	   console.log(jobName,memEmail,experience,duty,salary,skill);
	   $.ajax({
   		url:"${path }/member/insertInterests.lmc",
   		type:"POST",
   		data: objParams,
   		contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
   		success: function(data) { 
   			$("#sectionA").html("");
			$("#sectionA").html(data);
   		},
   		error: function(data) {
   			console.log(data);
   		}
   	}); 
   }


</script>






