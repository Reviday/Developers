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
	                                	<li class="ficturelist" style="background-image:url(${path }${p})"></li>
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
	                                                        <li style="background-image: url(${path}${f.mem_icon})"></li>
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
                                <div class="logo" style="background-image: url(${path }${p.bus_logo})"></div>
                                <div>
                                    <h5><c:out value="${p.bus_name }"/></h5>
                                    <h6><c:out value="${p.bus_industrial }"/></h6>
                                </div>
                            </button>
                        </section>
                    </div>
                    <aside class="rightaside" style="top: 70px;">
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
	                                            	<li style="background-image: url(${path }${f.mem_icon})"></li>
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
		                                            	<li style="background-image: url(${path}${f.mem_icon != null ? f.mem_icon : '/resources/upload/profile/no-profile-image.png'})"></li>
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
                                    <button type="button" class="footerbtn1">지원하기</button>
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
                                        <input type="text" name="name" id="" value="<c:out value="${m.memName }"/>">
                                    </label>
                                    <label for="email" class="infor-name">
                                        <h4>이메일</h4>
                                        <input type="text" name="email" value="<c:out value="${m.memEmail }"/>">
                                    </label>
                                    <label for="email" class="infor-name">
                                        <h4>연락처</h4>
                                        <input type="text" name="phone" value="<c:out value="${m.memPhone }"/>">
                                    </label>
                                </div>
                                <div class="choochun123">
                                    <h4>추천인</h4>
                                    <button type="button" class="choochun-btn">
                                                                                        선택사항
                                        <i class="icon-arrow_right"></i>
                                    </button>
                                </div>
                                <h3 class="chumbu"> 첨부파일</h3>
                                <ul>
                                    <c:if test="${not empty rList }">
                                		<c:forEach var="r" items="${rList }">
                                			<c:if test="${r.status == 'N' }">
			                                    <div class="resumeresume">
			                                        <li>
			                                            <label for="resume">
			                                                <input type="checkbox" name="resume" disabled id="resume">
			                                            </label>
			                                            <div>
			                                                <h4><c:out value="${r.mem_name}"/></h4>
			                                                <div>
			                                                    <span><fmt:formatDate value="${r.resume_date }" pattern="yyyy.MM.dd"/></span>
			                                                    <span>작성 중</span>
			                                                </div>
			                                            </div>
			                                            <a href="">
			                                                <i class="icon-icon_match_btn_next"></i>    
			                                            </a>
			                                        </li>
			                                    </div>
		                                    </c:if>
		                                    <c:if test="${r.status == 'Y' }">
			                                    <div class="resumeresume">
			                                        <li>
			                                            <label for="resume">
			                                                <input type="checkbox" name="resume" value="${r.resume_no }" id="resume">
			                                            </label>
			                                            <div>
			                                                <h4><c:out value="${r.mem_name}"/></h4>
			                                                <div>
			                                                    <span><fmt:formatDate value="${r.resume_date }" pattern="yyyy.MM.dd"/></span>
			                                                    <span>작성 완료</span>
			                                                </div>
			                                            </div>
			                                            <a href="">
			                                                <i class="icon-icon_match_btn_next"></i>    
			                                            </a>
			                                        </li>
			                                    </div>
		                                    </c:if>
	                                    </c:forEach>
                                    </c:if>
                                </ul>
                                <button type="button" class="newResume" onclick="location.href='${path }/resume/insertResumepage.lmc?memEmail=${loginMember.memEmail }';">새 이력서 작성</button>
                                <div class="resumeIntro">
                                    <p>developers 이력서로 지원하면 최종 합격률이 40% 높아집니다.</p>
                                </div>
                            </div>
                            <div class="submitFooter">
                                <button type="button" class="disabled1" onclick="submitPosition('${p.bus_no}', '${loginMember.memNo }', '${p.position_no }');">제출하기</button>
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
	                                		<div style="background-image: url(${path}${f.mem_icon != null ? f.mem_icon : '/resources/upload/profile/no-profile-image.png'})"></div>
	                                		<p><c:out value="${f.mem_name }"/></p>
	                                	</li>
	                                </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div role="presentation" class="modalchang"></div>
                    </div>
           
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
<!-- 카카오맵 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2fac4a1ad7e4da1c940cda1807c7495&libraries=services"></script>
<script>
	var address = '${p.bus_address}';
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	 var geocoder = new kakao.maps.services.Geocoder();
	
	geocoder.addressSearch('${p.bus_address}', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + '${p.bus_name}' + '</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});     
</script>
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
	$(document).on("click", ".footerbtn1", function(event){
		$(".rightasidemain").css("display", "none");
		$(".submitDiv").css("display", "block");
	})
	$(document).on("click", ".submitclose", function(event){
		$(".rightasidemain").css("display", "block");
		$(".submitDiv").css("display", "none");
	})
</script>
<!-- 추천인 선택사항 모달 -->
<script>
	$(document).on("click", ".choochun-btn", function(event){
		$("#modal").css("display", "block");
	})
	$(document).on("click", ".modalmodalmodalmodal", function(event){
		$("#modal").css("display", "none");
	})
	$(document).on("click", ".modalmodalclose", function(event){
		$("#modal").css("display", "none");
	})
	$(document).on("click", ".choochunList", function(event){
		$(this).prev().removeClass("selectedC");
		$(this).next().removeClass("selectedC");
		$(this).addClass("selectedC");
		$(".modalbodyfooter>a").css("background-color", "#258bf7");
		$(".modalbodyfooter>a").css("cursor", "pointer");
	})
	function recommendInsert(){
		var name = $(".selectedC").attr("id");
		var str = "<h4>추천인</h4><button type='button' class='choochun-btn'>" + name + "<i class='fas fa-angle-right'></i></button>";
		$(".choochun123").html("");
		$(".choochun123").html(str);
		$("#modal").css("display", "none");
	}
	$(document).on("click", ".icon-icon_match_list_save", function(event){
		$("#" + $(this).parents("label").attr("for")).click();
	})
	$(document).on("click", "input[type='checkbox'][name='resume']", function(event){
		if($(this).prop("checked")){
			$("input[type='checkbox'][name='resume']").prop("checked", false);
			$(this).prop("checked", true);
		}
	})
</script>
<!-- 포지션 지원하기  -->
<script>
	var nameflag = false;
	var emailflag = false;
	var phoneflag = false;
	$(document).on("keyup", "input[name=name]", function(event){
		if($("input[name=name]").val().trim().length > 0) nameflag = true;
		else nameflag = false;
		if($("input[name=email]").val().trim().length > 0) emailflag = true;
		else emailflag = false;
		if($("input[name=phone]").val().trim().length > 0) phoneflag = true;
		else phoneflag = false;
		if(nameflag == true && emailflag == true && phoneflag == true && $("input:checkbox[name=resume]:checked").val().length > 0) {
			$(".submitFooter>button[type=button]").removeClass("disabled1");
		}else{
			$(".submitFooter>button[type=button]").addClass("disabled1");
		}
	})
	$(document).on("keyup", "input[name=email]", function(event){
		if($("input[name=name]").val().trim().length > 0) nameflag = true;
		else nameflag = false;
		if($("input[name=email]").val().trim().length > 0) emailflag = true;
		else emailflag = false;
		if($("input[name=phone]").val().trim().length > 0) phoneflag = true;
		else phoneflag = false;
		if(nameflag == true && emailflag == true && phoneflag == true && $("input:checkbox[name=resume]:checked").val().length > 0) {
			$(".submitFooter>button[type=button]").removeClass("disabled1");
		}else{
			$(".submitFooter>button[type=button]").addClass("disabled1");
		}
	})
	$(document).on("keyup", "input[name=phone]", function(event){
		if($("input[name=name]").val().trim().length > 0) nameflag = true;
		else nameflag = false;
		if($("input[name=email]").val().trim().length > 0) emailflag = true;
		else emailflag = false;
		if($("input[name=phone]").val().trim().length > 0) phoneflag = true;
		else phoneflag = false;
		if(nameflag == true && emailflag == true && phoneflag == true && $("input:checkbox[name=resume]:checked").val().length > 0) {
			$(".submitFooter>button[type=button]").removeClass("disabled1");
		}else{
			$(".submitFooter>button[type=button]").addClass("disabled1");
		}
	})
	$(document).on("change", "input:checkbox[name=resume]", function(event){
		if($("input[name=name]").val().trim().length > 0) nameflag = true;
		else nameflag = false;
		if($("input[name=email]").val().trim().length > 0) emailflag = true;
		else emailflag = false;
		if($("input[name=phone]").val().trim().length > 0) phoneflag = true;
		else phoneflag = false;
		if(nameflag == true && emailflag == true && phoneflag == true && $("input:checkbox[name=resume]").is(":checked")) {
			$(".submitFooter>button[type=button]").removeClass("disabled1");
		}else{
			$(".submitFooter>button[type=button]").addClass("disabled1");
		}
	})
	function submitPosition(busNo, memNo, positionNo){
		var resumeNo = $("input:checkbox[name=resume]:checked").val();
		var recommendId = $(".selectedC").attr("value");
		if(recommendId != null){
			$.ajax({
				url: path + "/search/positionRecommendSubmit",
				type: "POST",
				data: {
						busNo : busNo,
						memNo : memNo, 
						positionNo : positionNo,
						resumeNo : resumeNo,
						recommendId : recommendId
				},	
				success: function(data){
					alert(data);
				}
			}) 	
		}else{
			$.ajax({
				url: path + "/search/positionSubmit",
				type: "POST",
				data: {
						busNo : busNo,
						memNo : memNo, 
						positionNo : positionNo,
						resumeNo : resumeNo
				},	
				success: function(data){
					alert(data);
				}
			}) 	
		}
	}
</script>