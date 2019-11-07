<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="companyleft">
                        <section class="companyficture">
                            <button type="button" class="fictureprev">
                                <i class="fas fa-chevron-left"></i>
                            </button>
                            <button type="button" class="ficturenext">
                            	<i class="fas fa-chevron-right"></i>
                            </button>
                            <ul class="fictureUl">
                            	<c:if test="${not empty p.bus_images }">
	                            	<c:forEach var="p" items="${p.bus_images }">
	                                	<li class="ficturelist" style="background-image:url(${p})"></li>
	                            	</c:forEach>
                            	</c:if>
                            </ul>
                        </section>
                        <section class="companytype">
                            <h2><c:out value="${p.position }"/></h2>
                            <h6>
                                <a href="${path }/search/companyAllInfo?busNo=${p.bus_no}">
                                    <c:out value="${p.bus_name }"/>
                                </a>
                                <span>
                                    <c:out value="${p.bus_area }"/>
                                    <span class="typeDot">.</span>
                                    <c:out value="${p.bus_country }"/>
                                </span>
                            </h6>
                            <div class="companytag">
                                <ul>
                                	<c:if test="${not empty tagList }">
	                                	<c:forEach var="t" items="${tagList }">
	                                        <li><a href=""><c:out value="${t.tag }"/></a></li>
	                                    </c:forEach>
                                    </c:if>
                                </ul>
                                <div class="item-gradient end"></div>
                            </div>
                            <div class="visible-xs visible-sm">
                                <div class="hiddenview">
                                    <div class="hiddenviewHeader">
                                        <div class="hvh1">
                                            <h3>채용보상금</h3>
                                            <ul>
                                                <li>
                                                    <h4>추천인</h4>
                                                    <p>500,000원</p>
                                                </li>
                                                <li>
                                                    <h4>지원자</h4>
                                                    <p>500,000원</p>
                                                </li>
                                            </ul>
                                            <button type="button" class="hvh1-btn">공유하기</button>
                                        </div>
                                        <hr class="divider">
                                        <div class="hvh1-div">
                                            <button class="likes" type="button">
                                                <i class="fab fa-gratipay"></i>
                                                <span><c:out value="${p.like_count }"/></span>
                                            </button>
                                            <button type="button" class="hvh1-btn1">
                                                <ul>
                                                	<c:if test="${p.like_count > 0 }">
	                                                    <c:forEach var="f" items="${list }" begin="0" end="2">
	                                                        <li style="background-image: ${f.mem_photo}"></li>
	                                                    </c:forEach>
                                                    </c:if>
                                                </ul>
                                            </button>
                                            <button type="button" class="hvh1-btn2">
                                                <i class="fas fa-bookmark"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <div class="visible-xs visible-sm"></div>
                        <div class="companyinfo-content">
                            <section class="companyinfo-text">
                                <p><c:out value="${p.position_info }"/></p>
                                <h6>주요업무</h6>
                                <p><c:out value="${p.mainbusiness }"/></p>
                                <h6>자격요건</h6>
                                <p><c:out value="${p.qualification }"/></p>
                                <c:if test="${not empty p.preference }">
	                                <h6>우대사항</h6>
	                                <p><c:out value="${p.preference }"/></p>
                                </c:if>
                                <h6>혜택 및 복지</h6>
                                <p><c:out value="${p.benefit }"/></p>
                            </section>
                            <hr class="company-info-text-hr">
                            <section class="company-map">
                                <div>
                                    <span class="header">마감일</span>
                                    <c:if test="${p.dead_date == 'Thu Dec 31 00:00:00 KST 2099'}">
	                                    <span class="body">상시</span>
                                    </c:if>
                                    <c:if test="${p.dead_date != 'Thu Dec 31 00:00:00 KST 2099'}">
	                                    <span class="body"><fmt:formatDate value="${p.dead_date}" pattern="yyyy년MM월dd일"/></span>
                                    </c:if>
                                </div>
                                <div>
                                    <span class="header">근무지역</span>
                                    <span class="body"><c:out value="${p.bus_address }"/></span>
                                </div>
                                <div id="map"></div>
                            </section>
                        </div>
                        <section class="companyicon">
                            <button type="button" class="left">
                                <div class="logo" style="background-image: url(${p.bus_logo})"></div>
                                <div>
                                    <h5><c:out value="${p.bus_name }"/></h5>
                                    <h6><c:out value="${p.bus_industrial }"/></h6>
                                </div>
                            </button>
                        </section>
                    </div>
                    <aside class="rightaside">
                        <div class="rightasidemain">
                            <div class="rightHeader">
                                <div class="rightTitle">
                                    <h3>채용보상금</h3>
                                    <ul>
                                        <li>
                                            <h4>추천인</h4>
                                            <p>500,000원</p>
                                        </li>
                                        <li>
                                            <h4>지원자</h4>
                                            <p>500,000원</p>
                                        </li>
                                    </ul>
                                    <c:if test="${empty loginMember }">
                                    	<button class="sharebtn suBtn">공유하기</button>
                                    </c:if>
                                    <c:if test="${not empty loginMember }">
                                    	<button class="sharebtn1">공유하기</button>
                                    </c:if>
                                </div>
                                <hr class="divider">
                                <div class="sharepeople">
                                	<c:if test="${empty loginMember }">
                                    	<button type="button" class="likes suBtn">
                                        	<i class="far fa-heart"></i>
                                        	<span><c:out value="${p.like_count }"/></span>
                                    </button>
                                    <button type="button" class="people suBtn">
                                        <ul>
                                            <c:if test="${p.like_count > 0 }">
	                                        	<c:forEach var="f" items="${list }" begin="0" end="2">
	                                            	<li style="background-image: ${f.mem_photo}"></li>
	                                            </c:forEach>
                                            </c:if>
                                        </ul>
                                    </button>
                                    <button type="button" class="share-btn suBtn">
                                        <i class="fas fa-bookmark" style="color: lightgray;"></i>
                                    </button>
                                    </c:if>
                                    <c:if test="${not empty loginMember }">
                                    	<button type="button" class="likes" onclick="onLike('${loginMember.memNo}', '${p.like_id }');">
                                        	<c:if test="${empty lm }">
                                        		<i class="far fa-heart"></i>
                                        	</c:if>
                                        	<c:if test="${not empty lm }">
                                        		<i class="fas fa-heart"></i>
                                        	</c:if>
                                        	<span><c:out value="${p.like_count }"/></span>
                                   		</button>
	                                    <button type="button" class="people">
	                                        <ul>
	                                            <c:if test="${p.like_count > 0 }">
		                                        	<c:forEach var="f" items="${list }" begin="0" end="2">
		                                            	<li style="background-image: url(${path}/resources/upload/profile/${f.mem_photo != null ? f.mem_photo : 'no-profile-image.png'})"></li>
		                                            </c:forEach>
	                                            </c:if>
	                                        </ul>
	                                    </button>
	                                    <button type="button" class="share-btn" onclick="onBookMark('${loginMember.memNo}', '${p.position_no }', '${p.like_id }')">
	                                        <c:if test="${empty bmList }">
	                                        	<i class="fas fa-bookmark" style="color: lightgray;"></i>
	                                        </c:if>
	                                        <c:if test="${not empty bmList }">
	                                        	<i class="fas fa-bookmark" style="color: darkblue;"></i>
	                                        </c:if>
	                                    </button>
                                    </c:if>
                                </div>
                            </div>
                            <div class="rightFooter">
                            	<c:if test="${empty loginMember }">
                                    <button type="button" class="footerbtn suBtn">지원하기</button>
                                </c:if>
                                <c:if test="${not empty loginMember }">
                                    <button type="button" class="footerbtn">지원하기</button>
                                </c:if>
                            </div>
                        </div>
                        <!-- 지원하기 DIV -->
                        <div class="submitDiv">
                            <div class="submitHeader">
                                <h2>지원하기</h2>
                                <button type="button" class="submitclose">뒤로</button>
                            </div>
                            <div class="submitBody" id="MODAL_BODY">
                                <h3 class="submitBody-info">지원 정보</h3>
                                <div class="submit-information">
                                    <label for="name" class="infor-name">
                                        <h4>이름</h4>
                                        <input type="text" name="name" id="" value="기영성">
                                    </label>
                                    <label for="email" class="infor-name">
                                        <h4>이메일</h4>
                                        <input type="text" name="email" value="ysung26@daum.net">
                                    </label>
                                    <label for="email" class="infor-name">
                                        <h4>연락처</h4>
                                        <input type="text" name="phone" value="01091920953">
                                    </label>
                                </div>
                                <div class="choochun123">
                                    <h4>추천인</h4>
                                    <button type="button" class="choochun-btn">
                                                                                        선택사항
                                        <i class="icon-arrow_right"></i>
                                    </button>
                                </div>
                                <h3 class="chumbu">
                                                                                첨부파일
                                    <div tabindex="0" class="upload">
                                        <input type="file" multiple autocomplete="off" tabindex="-1" style="display: none;" name="" id="">
                                        <button type="button" class="fileUpload">
                                            <i class="icon-apply_add"></i>
                                                                                                 파일 업로드
                                        </button>
                                    </div>
                                </h3>
                                <ul>
                                    <div class="resumeresume">
                                        <li>
                                            <label for="resume">
                                                <input type="checkbox" name="resume" disabled id="">
                                                <i class="icon-icon_match_list_save"></i>
                                            </label>
                                            <div>
                                                <h4>기영성 2</h4>
                                                <div>
                                                    <span>2019.10.18</span>
                                                    <span>작성 중</span>
                                                </div>
                                            </div>
                                            <a href="">
                                                <i class="icon-icon_match_btn_next"></i>    
                                            </a>
                                        </li>
                                    </div>
                                    <div class="resumeresume">
                                        <li>
                                            <label for="resume">
                                                <input type="checkbox" name="resume" id="">
                                                <i class="icon-icon_match_list_save"></i>
                                            </label>
                                            <div>
                                                <h4>기영성 1</h4>
                                                <div>
                                                    <span>2019.10.17</span>
                                                    <span>작성 완료</span>
                                                </div>
                                            </div>
                                            <a href="">
                                                <i class="icon-icon_match_btn_next"></i>    
                                            </a>
                                        </li>
                                    </div>
                                </ul>
                                <button type="button" class="newResume">새 이력서 작성</button>
                                <div class="resumeIntro">
                                    <p>developers 이력서로 지원하면 최종 합격률이 40% 높아집니다.</p>
                                </div>
                            </div>
                            <div class="submitFooter">
                                <button type="button">제출하기</button>
                            </div>
                        </div>
                    </aside>
                    <!-- 공유하기 모달창 -->
                    <div class="shareModal">
                        <div class="modalShare">
                            <div class="sharemodal-header">
                                <div class="shareHeader-title">
                                                                               공유하기
                                    <p>
                                                                                       이 포지션과 어울리는 사람을 알고 있다면, 추천해 주세요!
                                    </p>
                                </div>
                                <button type="button" class="sharemodal-close">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                            <div id="MODAL_BODY" class="sharemodal-body">
                                <div class="share-body">
                                    <a target="_blank" href="https://www.facebook.com/login/device-based/regular/login/?login_attempt=1&lwv=110" class="share-a1 share-first share-a2">
                                        <i class="fab fa-facebook-f"></i>
                                                                                         페이스북
                                    </a>
                                    <a target="_blank" href="https://ko-kr.facebook.com/messenger/" class="share-a1 share-second share-a2">
                                        <i class="fab fa-facebook-messenger"></i>
                                                                                        메신저
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div role="presentation" class="sharemodalchang"></div>
                    </div>
                    <!-- 좋아요 모달창 -->
                    <div id="modalTool">
                        <div class="modalmain">
                            <div class="modalHeader">
                                	이 포지션을 좋아한 사람들
                                <button type="button" class="modalclose">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                            <div id="MODAL_BODY" class="modalBody">
                                <ul class="likeList">
                                    <li>
                                        <strong><c:out value="${p.like_count }"/></strong>명이 좋아요
                                    </li>
                                    <c:forEach var="f" items="${list }">
	                                	<li>
	                                		<div style="background-image: url(${path}/resources/upload/profile/${f.mem_photo != null ? f.mem_photo : 'no-profile-image.png'})"></div>
	                                		<p><c:out value="${f.mem_name }"/></p>
	                                	</li>
	                                </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div role="presentation" class="modalchang"></div>
                    </div>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
<!-- 사이드바 고정 스크립트 -->
<script>
	var icon = $(".companyicon").offset().top;		
    $(window).scroll(function () { 
         if ($(this).scrollTop() > icon - 300 || $(this).scrollTop() == null) { 
             $(".rightaside").css("position", "absolute");
             $(".rightaside").css("top", "");
             $(".rightaside").css("bottom", "0px");	                
         } else {
             $(".rightaside").css("position", "fixed");
             $(".rightaside").css("top", "70px");
           
         }
    	
     });
</script> 
	<!-- 사진 슬라이드 script -->
<script>
    
    var sliderWrapper = document.getElementsByClassName("companyficture"),
        sliderContainer = document.getElementsByClassName("fictureUl"),
        slides = document.getElementsByClassName("ficturelist"),
        slideCount = slides.length,
        currentIndex = 0,
        topHeight = 0,
        navPrev = document.getElementsByClassName("fictureprev"),
        navNext = document.getElementsByClassName("ficturenext");

    function calculateTallestSlide(){
        for(var i = 0; i < slideCount; i++){
            if(slides[i].offsetHeight > topHeight){
                topHeight = slides[i].offsetHeight;
            }
        }
        sliderWrapper[0].style.height = topHeight + 'px';
        sliderContainer[0].style.height = topHeight + 'px';
    }
    calculateTallestSlide();

    for(var i = 0; i < slideCount; i++){
        slides[i].style.left = i * 100 + '%';
    }

    function goToSlide(idx) {
        sliderContainer[0].style.left = idx * -100 + '%';
        currentIndex = idx;
        // updateNav();
    }

    $(navPrev).click(function(e){
        e.preventDefault();
        if(currentIndex > 0){
            goToSlide(currentIndex - 1);
        }else{
            goToSlide(slideCount - 1);
        }
    });

    $(navNext).click(function(e){
        e.preventDefault();
        if(currentIndex < slideCount - 1) {
            goToSlide(currentIndex + 1);
        }else{
            goToSlide(0);
        }
    });

    function updateNav(){
        if(currentIndex == 0){
            $(navPrev).addClass('disabled');
        }else{
            $(navPrev).removeClass('disabled');
        }
        if(currentIndex == slideCount - 1){
            $(navNext).addClass('disabled');
        }else{
            $(navNext).removeClass('disabled');
        }
    }
    goToSlide(0);
</script>
    <!-- 구글맵 api 스크립트 -->
<script>
	 function initMap(){
	       
	    var latitude = 37.566536;
	    var longitude = 126.97797;
	
	    var seoul = {lat: latitude, lng: longitude};
	    var map = new google.maps.Map(document.getElementById('map'),{
	                zoom : 15,
	                center : seoul});
 	    var marker = new google.maps.Marker({
	        position : seoul,
	        title : "Hello Marker"
	    });
	    marker.setMap(map); 
	    	
	} 
</script>
<script async defer  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXNeoRZYBee7rZgjb0jWpmVUMsx-DPZUg&callback=initMap"></script>
<!-- 좋아요 모달창 -->
<script>
	$(function(){                                     
	    $(".people").click(function() {
	        $("#modalTool").css("display","block");
	    }); 
	
	    $(".modalchang").on("click",function() {
	        $("#modalTool").css("display","none");
	    });
	    $(".modalclose").on("click",function() {
	        $("#modalTool").css("display","none");
	    });
	})
</script>
<!-- 공유하기 모달창 -->
<script>
	$(function(){                                        
	    $(".sharebtn1").click(function() {
	        $(".shareModal").css("display","block");
	    }); 
	
	    $(".sharemodal-close").on("click",function() {
	        $(".shareModal").css("display","none");
	    });
	    $(".sharemodalchang").on("click",function() {
	        $(".shareModal").css("display","none");
	    });
	})
</script>
<!-- 좋아요클릭 Ajax -->
<script>
	function onLike(memNo, likeId){
		$.ajax({
			url: path + "/search/changeLikeAjax",
			type: "POST",
			data: {positionNo : ${p.position_no}, 
				   memNo : memNo,
				   likeId : likeId},	
			success: function(data){
				$(".infomid-company").html("");
				$(".infomid-company").html(data);
			}
		}) 
	}
</script>
<!-- 북마크 클릭 Ajax -->
<script>
	function onBookMark(memNo, positionNo, likeId){
		$.ajax({
			url: path + "/search/changeBookMarkAjax",
			type: "POST",
			data: {memNo : memNo,
				   positionNo : positionNo,
				   likeId : likeId},	
			success: function(data){
				$(".infomid-company").html("");
				$(".infomid-company").html(data);
			}
		}) 
	}
</script>
<!-- 지원하기 DIV -->
<script>
	$(".footerbtn1").click(function(){
		$(".rightasidemain").css("display", "none");
		$(".submitDiv").css("display", "block");
	})
	$(".submitclose").click(function(){
		$(".rightasidemain").css("display", "block");
		$(".submitDiv").css("display", "none");
	})
</script>