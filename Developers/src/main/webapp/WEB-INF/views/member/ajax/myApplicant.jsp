<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


     <nav role="presentation" class="_3wSXAiIJQZ98fJ-Hi6G42Q"><button type="button" class="">프로필<i
                    class="icon-arrow_bottom_fill"></i></button>
                  <c:set value="${loginMember.memEmail }" var="memEmail"  />
            <ul class="">
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="" onclick="profilePage('${memEmail }')">프로필</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#"  onclick="myPointPage('${memEmail}')" class="">포인트</a></li>
				<li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="applicantPage('${memEmail}');" class="activeNav">제안받기 현황</a></li>	
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="likePage('${memEmail }');" class="">좋아요</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="myBookMark('${memEmail }')" class="">북마크</a></li>
              
            </ul>
        </nav>
    <div class="_3Qcftta6FkVOkjFbE2NJ2v"><button class="statusInfoButton" type="button"><i
                class="icon-step_info_icon"></i></button>
        <div class="DS_fYpEMhiYB3fNFb0lCn">
            <h3>제안받기 현황</h3>
            <dl>
                <dt>나를 원하는 회사</dt>
                <dd>
                    <ul>
                        <li class="active"><a href="/profile/status?type=matchup-offers" class="">받은 제안
                        <div class="label_">${app.size() }
                                </div></a></li>
                    </ul>
                </dd>
            </dl>
        </div>
        <section>
            <div class="_2BcuDguCHGaa1TAI2sJw20">
                <div class="header">
                    <ul>
                        <li>회사명</li>
                        <li>&nbsp; </li>
                        <li>&nbsp;&nbsp;상태</li>
                    </ul>
                </div>
                <ul class="content">
                <c:if test="${not empty  app }">
                <c:forEach items="${bus }" var="b" varStatus="bt">
                <a href="#" class="a">
                        <li>
                            <h2 role="presentation">
                                <div class="thumbnail"
                                    style="background-image: url('${path}${b.busLogo}');">
                                </div>${b.busName }
                            </h2>
                            <time ></time>
                            <div class="type resumeRequest" id="resumeRequest">
                            <c:set value="${loginMember.memNo }" var="memNo"  />
               				<button type="button" class="btn btn-primary btn-sm" onclick="fn_appl('${memNo}','1');">승인</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="fn_appl('${memNo}','2');">거절</button>
                            </div>
                        </li>
                    </a>
                 </c:forEach>  
                 </c:if>
                 <c:if test="${empty app  }">
                 <li>
                 <h2 role="presentation">
                                <div class="thumbnail"
                                    style="background-image: url();">
                                </div>제안을 요청한 회사가 없습니다.
                            </h2>
                            <time ></time><div class="type resumeRequest">
                            </div>
                            
				</li>                 
                 </c:if>
                  </ul>
                   
            </div>
        </section>
    </div>
<script>
function fn_appl(memNo,number){
		$.ajax({
		url:"${path }/member/applAns.lmc",
		type:"POST",
		data:{"memNo":memNo,"number":number},
		success:function(data){
			if(number==(1)){
				$("#resumeRequest").html("");
				$("#resumeRequest").html(
			'<button type="button" class="btn btn-primary btn-sm" >승인</button>'	
				);
			}else{
				$("#resumeRequest").html("");
				$("#resumeRequest").html(
			'<button type="button" class="btn btn-danger btn-sm" >거절</button>'	
				);	
			}
		}
		
		
	})
	
}


</script>
