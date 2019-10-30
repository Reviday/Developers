<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mainSearch.css">

<section id="search-main">
        <div class="search-header">
            <div class="search-header-mid">
                <ul class="mid-menuBar">
                    <li>
                        <a href="">전체</a>
                    </li>
                </ul>
                <div class="mid-content">
                    <button class="mid-type prev hidden">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <button class="mid-type next">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                    <div class="mid-type-content">
                        <ul class="contentList">
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>웹 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>서버 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>프론트엔드 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>자바 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>안드로이드 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>iOS 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>시스템,네트워크 관리자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>파이썬 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>데이터 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>DevOps/ 시스템 관리자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>C, C++ 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>Node.js 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>PHP 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>개발 매니저</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>기술지원</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>프로덕트 매니저</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>데이터 사이언티스트</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>보안 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>QA,테스트 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>머신러닝 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>빅데이터 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>루비온레일즈 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>.NET 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>웹 퍼블리셔</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>하드웨어 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>임베디드 개발자</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>블록체인 플랫폼 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>CTO, Chief Technology Officer</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>영상,음성 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>BI 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>그래픽스 엔지니어</span>
                                    </div>
                                </a>
                            </li>
                            <li class="type-content-li">
                                <a href="">
                                    <div class="content-li-text">
                                        <span>CIO,Chief Information Officer</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="search-main">
            <div class="search-main-mid">
                <div class="main-mid-menu">
                    <div class="menu-mid">
                        <div class="menu-mid-1 hidden-xs">
                            <button class="menu-mid-menu">
                                <span class="fontweight fontcolor">최신순</span>
                            </button>
                            <button class="menu-mid-menu">
                                <span class="native">국가</span>
                                <span class="fontweight fontcolor">한국</span>
                            </button>
                            <button class="menu-mid-menu">
                                <span class="native">지역</span>
                                <span class="fontweight fontcolor1">전국</span>
                            </button>
                            <button class="menu-mid-menu">
                                <span class="native">경력</span>
                                <span class="fontweight fontcolor1">전체</span>
                            </button>
                        </div>
                        <div class="menu-mid-1 visible-xs">
                            적용 중 필터
                            <p>2</p>
                        </div>
                        <div class="filter">
                            <button class="filter-btn">
                                <span class="filter-btn-1">
                                    <i class="fas fa-sliders-h"></i>
                                </span>
                                <span class="filter-btn-2">
                                    <span style="color: rgb(37, 139, 247);">필터</span>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
                <h3 class="firstCompany">적극 채용 중인 회사</h3>
                <div class="firstCompany-list">
                    <ul>
                        <a href="">
                            <li>
                                <div class="searchHeader">
                                    <div class="companyBg"></div>
                                </div>
                                <footer>
                                    <div class="logoCircle"></div>
                                    <h4>마켓보로</h4>
                                    <h5>8개 포지션</h5>
                                </footer>
                            </li>
                        </a>
                        <a href="">
                            <li>
                                <div class="searchHeader">
                                    <div class="companyBg"></div>
                                </div>
                                <footer>
                                    <div class="logoCircle"></div>
                                    <h4>마켓보로</h4>
                                    <h5>8개 포지션</h5>
                                </footer>
                            </li>
                        </a>
                        <a href="">
                            <li>
                                <div class="searchHeader">
                                    <div class="companyBg"></div>
                                </div>
                                <footer>
                                    <div class="logoCircle"></div>
                                    <h4>마켓보로</h4>
                                    <h5>8개 포지션</h5>
                                </footer>
                            </li>
                        </a>
                        <a href="">
                            <li>
                                <div class="searchHeader">
                                    <div class="companyBg"></div>
                                </div>
                                <footer>
                                    <div class="logoCircle"></div>
                                    <h4>마켓보로</h4>
                                    <h5>8개 포지션</h5>
                                </footer>
                            </li>
                        </a>
                        <a href="">
                            <li>
                                <div class="searchHeader">
                                    <div class="companyBg"></div>
                                </div>
                                <footer>
                                    <div class="logoCircle"></div>
                                    <h4>마켓보로</h4>
                                    <h5>8개 포지션</h5>
                                </footer>
                            </li>
                        </a>
                    </ul>
                </div>
                <ul class="clearfix">
                    <li>
                        <div class="company-list">
                            <a href="${path }/search/companyInfo.do">
                                <div class="buttonHeader">
                                    <button class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        8
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>Web Front-end Developer(웹 프론트엔드 개발자)</dt>
                                        <dd>
                                            같다(gatda Corp)
                                            <br>
                                            <span>서울</span>
                                            <span class="addressDot">.</span>
                                            <span>한국</span>
                                        </dd>
                                    </dl>
                                    <div class="reward">채용보상금 1,000,000원</div>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="company-list">
                            <a href="${path }/search/companyInfo.do">
                                <div class="buttonHeader">
                                    <button class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        8
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>Web Front-end Developer(웹 프론트엔드 개발자)</dt>
                                        <dd>
                                            같다(gatda Corp)
                                            <br>
                                            <span>서울</span>
                                            <span class="addressDot">.</span>
                                            <span>한국</span>
                                        </dd>
                                    </dl>
                                    <div class="reward">채용보상금 1,000,000원</div>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="company-list">
                            <a href="${path }/search/companyInfo.do">
                                <div class="buttonHeader">
                                    <button class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        8
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>Web Front-end Developer(웹 프론트엔드 개발자)</dt>
                                        <dd>
                                            같다(gatda Corp)
                                            <br>
                                            <span>서울</span>
                                            <span class="addressDot">.</span>
                                            <span>한국</span>
                                        </dd>
                                    </dl>
                                    <div class="reward">채용보상금 1,000,000원</div>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="company-list">
                            <a href="${path }/search/companyInfo.do">
                                <div class="buttonHeader">
                                    <button class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        8
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>Web Front-end Developer(웹 프론트엔드 개발자)</dt>
                                        <dd>
                                            같다(gatda Corp)
                                            <br>
                                            <span>서울</span>
                                            <span class="addressDot">.</span>
                                            <span>한국</span>
                                        </dd>
                                    </dl>
                                    <div class="reward">채용보상금 1,000,000원</div>
                                </div>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
<script>
    var sliderWrapper = document.getElementsByClassName("mid-type-content"),
        sliderContainer = document.getElementsByClassName("contentList"),
        slides = document.getElementsByClassName("type-content-li"),
        slideCount = slides.length,
        currentIndex = 0,
        topHeight = 0,
        navPrev = document.getElementsByClassName("mid-type prev"),
        navNext = document.getElementsByClassName("mid-type next");
    var slideLength = slideCount * 130;
    var slideLastCount = parseInt(slideLength / 530); 
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
        slides[i].style.left = i * 130 + 'px';
    }

    function goToSlide(idx) {
        sliderContainer[0].style.left = idx * -530 + 'px';
        currentIndex = idx;
        updateNav();
    }

    $(navPrev).click(function(e){
        e.preventDefault();
        goToSlide(currentIndex - 1);
    });

    $(navNext).click(function(e){
        e.preventDefault();
        goToSlide(currentIndex + 1);
    });

    function updateNav(){
        if(currentIndex == 0){
            $(navPrev).addClass('hidden');
        }else{
            $(navPrev).removeClass('hidden');
        }
        if(currentIndex == slideLastCount - 1){
            $(navNext).addClass('hidden');
        }else{
            $(navNext).removeClass('hidden');
        }
    }
    goToSlide(0);
</script>
