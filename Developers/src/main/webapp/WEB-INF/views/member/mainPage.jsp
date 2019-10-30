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
                    <i class="fas fa-chevron-left" style="margin-right: 0px"></i>
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
                    </div>
                </div>
                <button type="button" class="slided-btn next">
                    <i class="fas fa-chevron-right" style="margin-right: 0px"></i>
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
                <a href="" class="position-title-a">더 보기</a>
            </div>
            <div class="position-content">
                <ul class="clearfix">
                    <li>
                        <div class="position-content-company">
                            <a href="">
                                <div class="position-company-header">
                                    <button type="button" class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        0
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>백엔드 개발자</dt>
                                        <dd>
                                            위펀(스낵24)
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
                        <div class="position-content-company">
                            <a href="">
                                <div class="position-company-header">
                                    <button type="button" class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        0
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>백엔드 개발자</dt>
                                        <dd>
                                            위펀(스낵24)
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
                        <div class="position-content-company">
                            <a href="">
                                <div class="position-company-header">
                                    <button type="button" class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        0
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>백엔드 개발자</dt>
                                        <dd>
                                            위펀(스낵24)
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
                        <div class="position-content-company">
                            <a href="">
                                <div class="position-company-header">
                                    <button type="button" class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        0
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>백엔드 개발자</dt>
                                        <dd>
                                            위펀(스낵24)
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
        <div class="newCompany">
            <div class="newCompany-title">
                <h2 class="newCompany-title-text">신규 채용 회사</h2>
            </div>
            <div class="newCompany-content">
                <ul class="clearfix">
                    <li>
                        <div class="newCompany-company">
                            <a href="">
                                <div class="company-header"></div>
                                <div class="company-content">
                                    <dl>
                                        <dt>
                                            딜리버리히어로 코리아 (Delivery Hero Korea)
                                        </dt>
                                        <dd>IT, 컨텐츠</dd>
                                    </dl>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="newCompany-company">
                            <a href="">
                                <div class="company-header"></div>
                                <div class="company-content">
                                    <dl>
                                        <dt>
                                            딜리버리히어로 코리아 (Delivery Hero Korea)
                                        </dt>
                                        <dd>IT, 컨텐츠</dd>
                                    </dl>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="newCompany-company">
                            <a href="">
                                <div class="company-header"></div>
                                <div class="company-content">
                                    <dl>
                                        <dt>
                                            딜리버리히어로 코리아 (Delivery Hero Korea)
                                        </dt>
                                        <dd>IT, 컨텐츠</dd>
                                    </dl>
                                </div>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="newCompany-company">
                            <a href="">
                                <div class="company-header"></div>
                                <div class="company-content">
                                    <dl>
                                        <dt>
                                            딜리버리히어로 코리아 (Delivery Hero Korea)
                                        </dt>
                                        <dd>IT, 컨텐츠</dd>
                                    </dl>
                                </div>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="weekchoochun">
            <div class="weekchoochun-title">
                <h2 class="weekchoochun-title-text">금주의 추천</h2>
            </div>
            <div class="weekchoochun-content">
                <ul class="clearfix">
                    <li>
                        <div class="weekchoochun-company">
                            <a href="">
                                <div class="weekchoochun-company-header">
                                    <button type="button" class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        156
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>
                                            Back-End 개발자(산업기능요원 전직/보충역 포함)
                                        </dt>
                                        <dd>
                                            피플펀드컴퍼니(PeopleFundCompany)
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
                        <div class="weekchoochun-company">
                            <a href="">
                                <div class="weekchoochun-company-header">
                                    <button type="button" class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        156
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>
                                            Back-End 개발자(산업기능요원 전직/보충역 포함)
                                        </dt>
                                        <dd>
                                            피플펀드컴퍼니(PeopleFundCompany)
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
                        <div class="weekchoochun-company">
                            <a href="">
                                <div class="weekchoochun-company-header">
                                    <button type="button" class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        156
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>
                                            Back-End 개발자(산업기능요원 전직/보충역 포함)
                                        </dt>
                                        <dd>
                                            피플펀드컴퍼니(PeopleFundCompany)
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
                        <div class="weekchoochun-company">
                            <a href="">
                                <div class="weekchoochun-company-header">
                                    <button type="button" class="likeButton">
                                        <i class="fas fa-heart"></i>
                                        156
                                    </button>
                                </div>
                                <div class="body">
                                    <dl>
                                        <dt>
                                            Back-End 개발자(산업기능요원 전직/보충역 포함)
                                        </dt>
                                        <dd>
                                            피플펀드컴퍼니(PeopleFundCompany)
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