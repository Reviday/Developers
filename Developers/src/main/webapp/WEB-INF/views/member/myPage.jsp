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
     <div class="_1Gv5LM5zal-f72_XSo_qJ_"  id="mainContent">
        <nav role="presentation" class="_3wSXAiIJQZ98fJ-Hi6G42Q"><button type="button" class="">프로필<i
                    class="icon-arrow_bottom_fill"></i></button>
                    <c:set value="${loginMember.memEmail }" var="memEmail"  />
            <ul class="">
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="activeNav">프로필</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="">포인트</a></li>
				<li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="applicantPage('${memEmail}');" class="">제안받기 현황</a></li>	
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="likePage('${memEmail }');" class="">좋아요</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="myBookMark('${memEmail }')" class="">북마크</a></li>
              
            </ul>
        </nav>
        <div class="_14NzdD9Zqjq8ocf6TORWoN">
            <aside class="Aside _1dBR38s0D_bqykmPvZBYPu">
                <div class="Aside-header">
                                    <div class="Aside-avatar">
                    <c:if test="${loginMember.memIcon==null }">
                    <div class="Aside-avatar_image" id="logoImg" 
                    style="background-image: url('${path}/resources/upload/profile/no-profile-image.png ');">
                          <div class="_1RDFX7ZROHIIPqPMgmtS2E">
                        <form id="logoFrm" name="logoFrm" enctype="multipart/form-data" method="POST">
                        <i class="icon-camera_icon" role="presentation">+</i>
							<input type="file" accept="image/*" id="logoFile" name="logoFile"/>
						</form>
                       </div>
                    </div>
                    </c:if>
                    
                    <c:if test="${loginMember.memIcon!=null }">
                    <div class="Aside-avatar_image" id="logoImg" 
                    style="background-image: url('${path}/${loginMember.memIcon } ');">
                          <div class="_1RDFX7ZROHIIPqPMgmtS2E">
                        <form id="logoFrm" name="logoFrm" enctype="multipart/form-data" method="POST">
                        <i class="icon-camera_icon" role="presentation">+</i>
					<input type="file" accept="image/*" id="logoFile" name="logoFile"/>
						</form>
                       </div>
                    </div>
                    </c:if>
                  
                </div>
                     <div class="Aside-me">
                    <div class="Aside-me_name">${loginMember.memName }</div>
                    <div class="Aside-me_email">${memEmail }</div>
                    <div class="Aside-me_tel">
                    <c:if test="${loginMember.memPhone==null }">
                    	저장된 번호가 없습니다
                    </c:if>
                    <c:if test="${loginMember.memPhone!=null }">
                    ${loginMember.memPhone }
                    </c:if>
                    </div>
                </div><a href="#"  onclick="updatePage();"class="Aside-edit">기본정보 수정</a>
                
                </div>
              
            </aside>
            <section>
                <section id="sectionA">
                    <div class="MatchUpForm _1DBZ1F8aWXUpL5ry5a_nRi fixedFooter">
                        <div class="Form-header">
                            <dl class="Form-title">
                                <dt>관심분야 설정</dt>
                            </dl>
                        </div>
                        <div class="FormBlock _3jRGSvRhv5E53D3OVwfvlL">
                            <div class="FormBlock-content content">
                                <div class="_1L31UYqre402LhtszG3_cE selected">
                                    <h6>직군</h6>
                                    <div class="_3Q44kHqvs_YnYQ-Edlc7V">
                                    <select name="jobName" id="jobName">
                                            <option value="----default----" hidden="" >선택하기</option>
                                            <option value="개발">개발</option>
                                        
                                        </select>
                                        </div>
                                </div>
                                <div class="kPWd3WMdUzCJKWNaAekr0">
                                    <h6>직무</h6>
                                    <div role="presentation" class="options">
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="웹 개발자" disabled="">웹 개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="서버 개발자" disabled="">서버 개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="프론트엔드 개발자" disabled="">프론트엔드 개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="자바 개발자" disabled="">자바 개발자</button>
										    <button type="button"class="_26Ms0F-WSvfKh16ALOIC20"  value="안드로이드 개발자" disabled="">안드로이드 개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="iOS 개발자" disabled="">iOS 개발자</button>
										    <button type="button"class="_26Ms0F-WSvfKh16ALOIC20"  value="파이썬 개발자" disabled="">파이썬 개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="데이터 엔지니어" disabled="">데이터엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="시스템,네트워크 관리자" disabled="">시스템,네트워크 관리자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="DevOps / 시스템 관리자" disabled="">DevOps / 시스템 관리자</button>
										    <button type="button"class="_26Ms0F-WSvfKh16ALOIC20"  value="Node.js개발자" disabled="">Node.js개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="C/C++ 개발자" disabled="">C/C++ 개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="데이터 사이언티스트" disabled="">데이터 사이언티스트</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="개발 매니저" disabled="">개발 매니저</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="PHP 개발자" disabled="">PHP 개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="기술지원" disabled="">기술지원</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="머신러닝 엔지니어" disabled="">머신러닝 엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="보안 엔지니어" disabled="">보안 엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="QA/테스트 엔지니어" disabled="">QA/테스트 엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="프로덕트 매니저" disabled="">프로덕트 매니저</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="빅데이터 엔지니어" disabled="">빅데이터 엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="루비온레일즈 개발자" disabled="">루비온레일즈 개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value=".NET개발자" disabled="">.NET개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="웹 퍼블리셔" disabled="">웹 퍼블리셔</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="임베디드 개발자" disabled="">임베디드 개발자</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="블록체인 플랫폼 엔지니어" disabled="">블록체인 플랫폼 엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="하드웨어 엔지니어" disabled="">하드웨어 엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="CTO/Chief TechnologyOfficer" disabled="">CTO/Chief TechnologyOfficer</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="영상,음성 엔지니어" disabled="">영상,음성 엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="BI 엔지니어" disabled="">BI 엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="그래픽스엔지니어" disabled="">그래픽스엔지니어</button>
										    <button type="button" class="_26Ms0F-WSvfKh16ALOIC20" value="CIO,Chief InformationOfficer" disabled="">CIO,Chief InformationOfficer</button>
                                            <button type="button" class="toggleEditable" id="dutyview" onclick="dutyview();">+</button></div>
                                </div>
                                <div class="_1L31UYqre402LhtszG3_cE selected">
                                    <h6>경력</h6>
                                    <div class="_3Q44kHqvs_YnYQ-Edlc7V"><select name="career">
                                            <option value="----default----" hidden="" disabled="">선택하기</option>
                                            <option value="0">신입</option>
                                            <option value="1">1 년</option>
                                            <option value="2">2 년</option>
                                            <option value="3">3 년</option>
                                            <option value="4">4 년</option>
                                            <option value="5">5 년</option>
                                            <option value="6">6 년</option>
                                            <option value="7">7 년</option>
                                            <option value="8">8 년</option>
                                            <option value="9">9 년</option>
                                            <option value="10">10 년 이상</option>
                                        </select></div>
                                </div><div class="_1L31UYqre402LhtszG3_cE selected orm-group row">
                                	<div class="col-4">
                                    <h6 class="FormButton-label">현재 연봉</h6> 
                                    </div>
                                    <div class="col-8">
                                    <input type="number" name="salary" class="form-control">
                                    </div>
                                </div>
                                <div class="FormButton _3I5bkI50gryaER31Iu7b4E selected " >
                                <div class="FormButton _3I5bkI50gryaER31Iu7b4E selected orm-group row">
                                	<div class="col-12">
                                    <h6 class="FormButton-label">스킬
                                    </div>
                                </div>    
                                <div class=" FormButton _3I5bkI50gryaER31Iu7b4E selected orm-group row">
                                    <div class="checkbox checkbox-info col-12">
			                       <label><input  name="skill"  class="styled" value="JAVA"  type="checkbox">JAVA</label>
			                   		<label><input name="skill" class="styled" value="SPRING"  type="checkbox">SPRING</label>
			                   		<label><input name="skill" class="styled" value="JSP"  type="checkbox">JSP</label>
			                   		<label><input name="skill" class="styled" value="HTML"  type="checkbox">HTML</label>
			                   		<label><input name="skill" class="styled" value="Javascript"  type="checkbox">Javascript</label>
			                   		<label><input name="skill" class="styled" value="Oracle"  type="checkbox">Oracle</label>
			                   		<label><input name="skill" class="styled" value="Ajax"  type="checkbox">Ajax</label>
			                   		<label><input name="skill" class="styled" value="MVC"  type="checkbox">MVC</label>
			                   		<label><input name="skill" class="styled" value="스프링 MVC"  type="checkbox">스프링 MVC</label>
			                   		<label><input name="skill" class="styled" value="Apache"  type="checkbox">Apache</label>
			                   		<label><input name="skill" class="styled" value="PPAP"   type="checkbox">PPAP</label>
			                   		<label><input name="skill" class="styled" value="럭키세븐"  type="checkbox">럭키세븐</label>
			                   		<label><input name="skill" class="styled" value="텔레포트"  type="checkbox">텔레포트</label>
					                </div>					
					                </div> 		
                            </div>
                                  
                            </div>
                        </div>

                        <footer class="FormFooter _3MqXvmRsKlYS61B7NaqHUC fixedFooter isChild">
                         <c:set value="${loginMember.memEmail }" var="memEmail"  />
                        	<input type="hidden" value="${memEmail }" name="memEmail" id="memEmail"/>
                            <div class="childrenWrapper"><button type="button" onclick="saveInter('${memEmail }' );">다음 단계</button></div>
                        </footer>
                    </div>
                </section>
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
	   
	   $.ajax({
   		url:"${path }/member/insertInterests.lmc",
   		type:"POST",
   		data: objParams,
   		contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
   		success: function(data) { 
   			$("#sectionA").html("");
			$("#sectionA").html(data);
   		}
   	}); 
   }
   function updatePage(){
	   $.ajax({
		   url:"${path }/member/updatePage.lmc",
		   type:"POST",
		   success:function(data){
			   $("#sectionA").html("");
			   $("#sectionA").html(data); 
		   }
		   
	   })
   }
   function likePage(memEmail) {
	   $.ajax({
		   url:"${path }/member/likePage.lmc",
		   type:"POST",
		   data:{"memEmail":memEmail},
		   success:function(data){
			   $("#mainContent").html("");
			   $("#mainContent").html(data);
		   }
	   })	
}
   function myBookMark(memEmail) {
	   $.ajax({
		   url:"${path }/member/myBookMark.lmc",
		   type:"POST",
		   data:{"memEmail":memEmail},
		   success:function(data){
			   $("#mainContent").html("");
			   $("#mainContent").html(data);
		   }
	   })	
}   
 //로고 클릭 이벤트
	$("#logoFile").on("change",function(){
		var frm=new FormData($("#logoFrm")[0]);
		$.ajax({
			url:"${path }/member/logoChange",
			data:frm,
			type:"post",
			processData:false,
			dataType:"json",
     	    contentType:false,
			success:function(data){
				$("#logoImg").css('background-image', 'url('+data+')');
				$("#profile_img").attr("src",data);
			},error:function(data){
				console.log("실패");
			}

		})
	});
 
 function applicantPage(memEmail){
	 $.ajax({
		url:"${path }/member/applicantPage.lmc",
		data:{"memEmail":memEmail},
		type:"POST",
		success:function(data){
			  $("#mainContent").html("");
			   $("#mainContent").html(data);
		}
		 
	 });
	 
 }


</script>






