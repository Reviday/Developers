<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mainPage.css">
<section id="loginMain">
        <div class="fictureintro">
            <div class="slick-slider slick-initialized" dir="ltr">
                <button type="button" class="slided-btn prev">
                    <i class="fas fa-chevron-left" style="margin-right: 0px;font-size: 14px;"></i>
                </button>
                <div class="slick-list">
                    <div class="slick-track">
                        <div class="slick-slide">
                            <div>
                                <a href="">
                                    <div class="slide-ficture">
                                        <div class="slide-ficture-msg showDesc">
                                            <div>
                                                <h2>프로필만 등록하면 이직 준비 끝</h2>
                                                <h3>프로필 등록하기</h3>
                                            </div>
                                            <hr>
                                            <button type="button">
                                                <span>바로가기</span>
                                                <i class="fas fa-chevron-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="slick-slide">
                            <div>
                                <a href="">
                                    <div class="slide-ficture">
                                        <div class="slide-ficture-msg showDesc">
                                            <div>
                                                <h2>이건 다른거야</h2>
                                                <h3>프로필 등록하기</h3>
                                            </div>
                                            <hr>
                                            <button type="button">
                                                <span>바로가기</span>
                                                <i class="fas fa-chevron-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="slick-slide">
                            <div>
                                <a href="">
                                    <div class="slide-ficture">
                                        <div class="slide-ficture-msg showDesc">
                                            <div>
                                                <h2>이것도!</h2>
                                                <h3>프로필 등록하기</h3>
                                            </div>
                                            <hr>
                                            <button type="button">
                                                <span>바로가기</span>
                                                <i class="fas fa-chevron-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="slided-btn next">
                    <i class="fas fa-chevron-right" style="margin-right: 0px;font-size: 14px;"></i>
                </button>
            </div>
        </div>
        <a href="" class="resumematching">
            <h3>
                <div class="resumeIcon resumeIconBorder">
                    <div class="resumePercent">
                        60%
                    </div>
                </div>
                <p class="resumeP resumeA">
                    프로필에 이력서 추가하고, 인사담당자에게 직접 면접 제안 받으세요
                </p>
            </h3>
            <button type="button">이력서 강화하기</button>
        </a>
        <div class="choochun">
            <div class="choochun-title">
                <div>
                    <h2 class="choochun-title-text">
                        추천할만한 사람
                        <a href="">
                            <i class="fas fa-cog"></i>
                        </a>
                    </h2>
                </div>
            </div>
            <div class="choochun-content">
                <p class="choochun-content-content">
                    추천 가능한 지인이 없습니다. 친구를 초대해보세요.
                </p>
                <button class="choochun-content-btn" type="button">친구 초대하기</button>
            </div>
        </div>
        <div class="position">
            <div class="position-title">
                <h2 class="position-title-text">
                    나에게 딱 맞는 포지션
                    <a href="">
                        <i class="fas fa-cog"></i>
                    </a>
                </h2>
            </div>
            <div class="position-content">
                <ul class="clearfix">
	                <c:if test="${not empty psList }">
	                	<c:forEach var="p" items="${psList }" begin="1" varStatus="s">
		                    <c:if test="${s.count < 5 }">
			                    <li>
			                        <div class="position-content-company">
			                            <a href="${path }/search/companyInfo.do?positionNo=${p.position_no }&memNo=${loginMember.memNo}">
			                                <div class="position-company-header" style="background-image: url(${p.bus_images});">
			                                    <button type="button" class="likeButton">
			                                        <i class="fas fa-heart"></i>
			                                        <c:out value="${p.like_count }"/>
			                                    </button>
			                                </div>
			                                <div class="body">
			                                    <dl>
			                                        <dt><c:out value="${p.position }"/></dt>
			                                        <dd>
			                                            <c:out value="${p.bus_name }"/>
			                                            <br>
			                                            <span><c:out value="${p.bus_area }"/></span>
			                                            <span class="addressDot">.</span>
			                                            <span><c:out value="${p.bus_country }"/></span>
			                                        </dd>
			                                    </dl>
			                                    <div class="reward">채용보상금 1,000,000원</div>
			                                </div>
			                            </a>
			                        </div>
			                    </li>
		                    </c:if>
	                    </c:forEach>
                    </c:if>
                     <c:if test="${empty psList }">
	                	<c:forEach var="p" items="${psList1 }" begin="1" varStatus="s">
		                    <c:if test="${s.count < 5 }">
			                    <li>
			                        <div class="position-content-company">
			                            <a href="${path }/search/companyInfo.do?positionNo=${p.position_no }&memNo=${loginMember.memNo}">
			                                <div class="position-company-header" style="background-image: url(${p.bus_images});">
			                                    <button type="button" class="likeButton">
			                                        <i class="fas fa-heart"></i>
			                                        <c:out value="${p.like_count }"/>
			                                    </button>
			                                </div>
			                                <div class="body">
			                                    <dl>
			                                        <dt><c:out value="${p.position }"/></dt>
			                                        <dd>
			                                            <c:out value="${p.bus_name }"/>
			                                            <br>
			                                            <span><c:out value="${p.bus_area }"/></span>
			                                            <span class="addressDot">.</span>
			                                            <span><c:out value="${p.bus_country }"/></span>
			                                        </dd>
			                                    </dl>
			                                    <div class="reward">채용보상금 1,000,000원</div>
			                                </div>
			                            </a>
			                        </div>
			                    </li>
		                    </c:if>
	                    </c:forEach>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="newCompany">
            <div class="newCompany-title">
                <h2 class="newCompany-title-text">신규 채용 회사</h2>
            </div>
            <div class="newCompany-content">
                <ul class="clearfix">
                	<c:forEach var="f" items="${firstList }" begin="1" varStatus="s">
                		<c:if test="${s.count < 5 }">
		                    <li>
		                        <div class="newCompany-company">
		                            <a href="">
		                                <div class="company-header" style="background-image: url(${f.bus_images});"></div>
		                                <div class="company-content">
		                                    <dl>
		                                        <dt>
		                                            <c:out value="${f.bus_name }"/>
		                                        </dt>
		                                        <dd><c:out value="${f.bus_industrial }"/></dd>
		                                    </dl>
		                                </div>
		                            </a>
		                        </div>
		                    </li>
                    	</c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="weekchoochun">
            <div class="weekchoochun-title">
                <h2 class="weekchoochun-title-text">금주의 추천</h2>
            </div>
            <div class="weekchoochun-content">
                <ul class="clearfix">
                	<c:if test="${not empty weekList }">
	                    <c:forEach var="w" items="${weekList }" begin="1" varStatus="s">
	                    	<c:if test="${s.count < 5 }">
			                    <li>
			                        <div class="weekchoochun-company">
			                            <a href="${path }/search/companyInfo.do?positionNo=${w.position_no }&memNo=${loginMember.memNo}">
			                                <div class="weekchoochun-company-header" style="background-image:url(${w.bus_images});">
			                                    <button type="button" class="likeButton">
			                                        <i class="fas fa-heart"></i>
			                                        <c:out value="${w.like_count }"/>
			                                    </button>
			                                </div>
			                                <div class="body">
			                                    <dl>
			                                        <dt>
			                                            <c:out value="${w.position }"/>
			                                        </dt>
			                                        <dd>
			                                            <c:out value="${w.bus_name }"/>
			                                            <br>
			                                            <span><c:out value="${w.bus_area }"/></span>
			                                            <span class="addressDot">.</span>
			                                            <span><c:out value="${w.bus_country }"/></span>
			                                        </dd>
			                                    </dl>
			                                    <div class="reward">채용보상금 1,000,000원</div>
			                                </div>
			                            </a>
			                        </div>
			                    </li>
	                    	</c:if>
	                    </c:forEach>
                    </c:if>
                    <c:if test="${empty weekList && not empty psList }">
	                    <c:forEach var="w" items="${psList }" begin="1" varStatus="s">
	                    	<c:if test="${s.count < 5 }">
			                    <li>
			                        <div class="weekchoochun-company">
			                            <a href="${path }/search/companyInfo.do?positionNo=${w.position_no }&memNo=${loginMember.memNo}">
			                                <div class="weekchoochun-company-header" style="background-image:url(${w.bus_images});">
			                                    <button type="button" class="likeButton">
			                                        <i class="fas fa-heart"></i>
			                                        <c:out value="${w.like_count }"/>
			                                    </button>
			                                </div>
			                                <div class="body">
			                                    <dl>
			                                        <dt>
			                                            <c:out value="${w.position }"/>
			                                        </dt>
			                                        <dd>
			                                            <c:out value="${w.bus_name }"/>
			                                            <br>
			                                            <span><c:out value="${w.bus_area }"/></span>
			                                            <span class="addressDot">.</span>
			                                            <span><c:out value="${w.bus_country }"/></span>
			                                        </dd>
			                                    </dl>
			                                    <div class="reward">채용보상금 1,000,000원</div>
			                                </div>
			                            </a>
			                        </div>
			                    </li>
	                    	</c:if>
	                    </c:forEach>
                    </c:if>
                    <c:if test="${empty weekList && empty psList }">
	                    <c:forEach var="w" items="${psList1 }" begin="1" varStatus="s">
	                    	<c:if test="${s.count < 5 }">
			                    <li>
			                        <div class="weekchoochun-company">
			                            <a href="${path }/search/companyInfo.do?positionNo=${w.position_no }&memNo=${loginMember.memNo}">
			                                <div class="weekchoochun-company-header" style="background-image:url(${w.bus_images});">
			                                    <button type="button" class="likeButton">
			                                        <i class="fas fa-heart"></i>
			                                        <c:out value="${w.like_count }"/>
			                                    </button>
			                                </div>
			                                <div class="body">
			                                    <dl>
			                                        <dt>
			                                            <c:out value="${w.position }"/>
			                                        </dt>
			                                        <dd>
			                                            <c:out value="${w.bus_name }"/>
			                                            <br>
			                                            <span><c:out value="${w.bus_area }"/></span>
			                                            <span class="addressDot">.</span>
			                                            <span><c:out value="${w.bus_country }"/></span>
			                                        </dd>
			                                    </dl>
			                                    <div class="reward">채용보상금 1,000,000원</div>
			                                </div>
			                            </a>
			                        </div>
			                    </li>
	                    	</c:if>
	                    </c:forEach>
                    </c:if>
                </ul>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
    var sliderWrapper = document.getElementsByClassName("slick-list"),
        sliderContainer = document.getElementsByClassName("slick-track"),
        slides = document.getElementsByClassName("slick-slide"),
        slideCount = slides.length,
        currentIndex = 0,
        topHeight = 0,
        navPrev = document.getElementsByClassName("prev"),
        navNext = document.getElementsByClassName("next");
    function calculateTallestSlide() {
        for (var i = 0; i < slideCount; i++) {
            if (slides[i].offsetHeight > topHeight) {
                topHeight = slides[i].offsetHeight;
            }
        }
        sliderWrapper[0].style.width = slideCount * $( window ).width() + "px";
        sliderWrapper[0].style.height = '300px';
        sliderContainer[0].style.height = '300px';
    }
    calculateTallestSlide();

    for (var i = 0; i < slideCount; i++) {
        slides[i].style.left = i * 100 + '%';
    }

    function goToSlide(idx) {
        sliderContainer[0].style.left = idx * -100 + '%';
        currentIndex = idx;
        // updateNav();
    }

    $(navPrev).click(function (e) {
        e.preventDefault();
        if (currentIndex > 0) {
            goToSlide(currentIndex - 1);
        } else {
            goToSlide(slideCount - 1);
        }
    });

    $(navNext).click(function (e) {
        e.preventDefault();
        if (currentIndex < slideCount - 1) {
            goToSlide(currentIndex + 1);
        } else {
            goToSlide(0);
        }
    });

    function updateNav() {
        if (currentIndex == 0) {
            $(navPrev).addClass('disabled');
        } else {
            $(navPrev).removeClass('disabled');
        }
        if (currentIndex == slideCount - 1) {
            $(navNext).addClass('disabled');
        } else {
            $(navNext).removeClass('disabled');
        }
    }
    goToSlide(0);
    
    $(".choochun-content-btn").click(function(){
    	location.href = '${path}' + "/recommend/recommendMain.lmc?memNo=" + '${loginMember.memNo}';
    })

</script>
