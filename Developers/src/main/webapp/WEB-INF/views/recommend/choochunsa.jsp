<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/choochunsa.css">
	
<section id="choochunsa">
    <div class="topSection1 topSection2 topSection3">
        <div class="profilePicWrapper">
            <div class="profilePicture1 profilePicture2" style="background-image: url(${path}${recommend.recommend_photo != null ? recommend.recommend_photo : '/resources/upload/profile/no-profile-image.png'});"></div>
            <p class="userName"><c:out value="${recommend.recommend_name }"/></p>
        </div>
    </div>
    <div class="choochunsa1 choochunsa2">
        <div class="contentWrapper1 contentWrapper2 contentWrapper3">
            <div class="rowcontent1 rowcontent2">
                <div class="leftrowcontent1 leftrowcontent2 leftrowcontent3 leftrowcontent4">
                    <p class="columnLabel">추천사 예시</p>
                    <div class="sample1 sample2">
                        <!-- 클릭하면 selected클래스 추가 -->
                        <div class="labelSection">
                            <p>직장 동료</p>
                            <i class="fas fa-angle-down"></i>
                        </div>
                        <p class="descriptionSection">
                            이윤지님과 저는 약 2년간 원티드 마케팅팀에서 함께 일했습니다.
                            윤지님은 창의적 기획력과 데이터 분석력까지 갖춘 온라인 마케터 입니다. 
                            채널에 대한 이해도가 높은 것은 물론 유저 성향 파악 능력이 뛰어나 입사 초기 대비 유저 재방문률 30% 증가라는 성과를 이끌어 냈습니다.
                            더불어 유연한 커뮤니케이션 능력의 보유자로 함께 일하는 동료들이 즐겁게 일할 수 있었고, 자기주도적 성향으로 업무가 효율적으로 진행될 수 있었습니다.
                            기회가 있다면 다시 함께 일하고 싶은 분으로 적극 추천 드립니다.
                        </p>
                    </div>
                    <div class="sample1 sample2">
                        <div class="labelSection">
                            <p>비즈니스 파트너</p>
                            <i class="fas fa-angle-down"></i>
                        </div>
                        <p class="descriptionSection">
                            공지철님은 1년 간 장기 프로젝트를 함께 진행했던 클라이언트입니다. 
                            업무에 대한 이해력이 굉장히 빠른 분으로, 기획 단계부터 런칭까지 늘 기한보다 앞선 제안과 실행을 보여 주었습니다. 
                            예상치 못한 이슈가 발생해도 논리적이고 합당한 근거를 제시하여 불필요한 커뮤니케이션을 최소화한 후, 빠르게 판단하고 문제를 해결하는 분입니다.  
                            팀장으로서 팀원들에게 끊임없이 동기부여를 하면서 각자 업무에 최선을 다할 수 있는 환경을 만들어 주는 모습 또한 인상적이었습니다. 
                            함께 업무를 진행했던 30명 이상의 파트너 중 가장 믿음직한 분으로 자신있게 추천합니다.        
                        </p>
                    </div>
                    <div class="sample1 sample2">
                        <div class="labelSection">
                            <p>학교 동문/친구</p>
                            <i class="fas fa-angle-down"></i>
                        </div>
                        <p class="descriptionSection">
                            <span>
                                책임감과 오너십을 가진 개발자 김철수님을 추천합니다.
                                <br>
                                - 새로운 프로젝트의 목표를 잘 이해하고, 다른 플랫폼에도 관심이 많아 협업하기 좋음.
                                <br>
                                - 유닛테스트가 생활화되어있고, 자신만의 높은 품질 기준을 바탕으로 꾸준하게 버그없는 제품 개발.
                                <br>
                                - 3개월간 진행 되었던 모바일 기반 인디 게임의 전체 설계 리드/PM/QA를 담당
                                <br>
                                - 런칭 후 다운로드 2만 돌파 경험. 고객 의견을 반영한 2번의 업데이트 실행.
                                <br>
                                - 다양한 커뮤니티 활동을 통한 기술 트렌드 공부 및 네트워크 관계 형성
                            </span>
                        </p>
                    </div>
                </div>
                <div class="rightrowcontent1 rightrowcontent2 rightrowcontent3 rightrowcontent4">
                    <p class="columnLabel">추천사 작성</p>            
                    <textarea class="choochunText" placeholder="추천사를 이곳에 작성해주세요. 이 분을 좋은 인재로 추천하는 이유를 적어주세요."><c:out value="${recommend.recommend_text }"/></textarea>
                </div>
            </div>
        </div>
        <div class="buttonWrapper">
            <div class="buttonSaveReferral disabled" style="position: absolute;bottom:70px;left:45%;">
                <p>작성 완료</p>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- 예시 -->
<script>
    $(function() {
         $('.labelSection').click(function(e) {
            var classVal=e.target.className;
            $('.labelSection').next().removeClass('show');
            $('.labelSection').removeClass('selected');
            $(this).addClass("selected");
            $(this).next().addClass('show');
            if(classVal.includes("selected")){
                $(this).next().removeClass('show');
                $(this).removeClass("selected");
            }
         });
     })
    $(document).on("keyup", ".choochunText", function(event){
	    if($(".choochunText").val().trim().length > 0) {
	            $(".buttonSaveReferral").removeClass("disabled");
	        }else{
	            $(".buttonSaveReferral").addClass("disabled");
	        }
	})
	$(document).on("click", ".buttonSaveReferral", function(event){
		var text = $(".choochunText").val();
		location.href = '${path}' + "/recommend/insertchoochunsa?memNo=" + '${recommend.mem_no}' + "&recommendNo=" + '${recommend.recommend_no}' + "&text=" + text;
	})
</script>