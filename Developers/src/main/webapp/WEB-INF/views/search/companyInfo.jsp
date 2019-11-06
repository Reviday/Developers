<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/companyInfo.css">
	
	
    <section id="companyInfo">
        <div class="InfoMain">
            <div class="infoMid">
                <div class="infomid-company">
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
                                	<c:if test="${not empty p.tag }">
	                                	<c:forEach var="t" items="${p.tag }">
	                                        <li><a href=""><c:out value="${t }"/></a></li>
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
	                                    <span class="body"><c:out value="${p.dead_date }"/></span>
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
                                <div class="logo" style="background-image: ${p.bus_logo}"></div>
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
                                    	<button class="sharebtn">공유하기</button>
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
                                        <i class="fas fa-bookmark"></i>
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
                                    <button type="button" class="share-btn">
                                        <i class="fas fa-bookmark"></i>
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
                    </aside>
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
                </div>
                <div class="choochun">
                    <h5 class="choochun-title">추천 채용</h5>
                    <div class="choochun-content">
                        <ul class="clearfix">
                        	<c:forEach var="c" items="${rcList }">
	                            <li>
	                                <div class="choochun-content-context">
	                                    <a href="${path }/search/companyInfo1.do?positionNo=${c.position_no }">
	                                        <div class="contextHeader" style="background-image:url(${c.bus_images[0]});">
	                                            <button class="likeButton">
	                                                <i class="fas fa-heart" style="margin-right: 10px"></i>
	                                                <c:out value="${c.like_count }"></c:out>
	                                            </button>
	                                        </div>
	                                        <div class="body">
	                                            <dl>
	                                                <dt><c:out value="${c.position }"></c:out></dt>
	                                                <dd>
	                                                    <c:out value="${c.bus_name }"></c:out>
	                                                    <br>
	                                                    <span><c:out value="${c.bus_area }"></c:out></span>
	                                                    <span class="addressDot">.</span>
	                                                    <span><c:out value="${c.bus_country }"></c:out></span>
	                                                </dd>
	                                            </dl>
	                                            <div class="reward">채용보상금 1,000,000원</div>
	                                        </div>
	                                    </a>
	                                </div>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
<!-- 사이드바 고정 스크립트 -->
<script>
	var icon = $(".companyicon").offset().top;
	$(function () {
        $(window).scroll(function () { 
            if ($(this).scrollTop() > icon - 300) { 
                $(".rightaside").css("position", "absolute");
                $(".rightaside").css("top", "");
                $(".rightaside").css("bottom", "0px");
                
            } else {
                $(".rightaside").css("position", "fixed");
                $(".rightaside").css("top", "70px");
              
            }
        });
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
	    var modal = document.getElementById('modalTool');                                         
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