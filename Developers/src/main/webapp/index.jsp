<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>

<section id="content">
	<div id="service-main">
        <div class="_2BSYHDiCEVW0U-znbJ1IyD">
            <div class="block career background-image" style="background-image:url(${path}/resources/images/background.png)">
                <div class="content">
                    <div class="go-image"></div>
                    <h1>나에게 딱 맞는 회사,
Developers에서 찾아보세요!</h1>
                    <h4>쉽고 빠르게 가입하고, 더 편리한 이직 서비스를 경험해보세요.</h4>
                </div>
                <div class="button-group"><button type="button" class="suBtn">지금 시작하기</button></div>
            </div>
            <div class="block cards background-image">
                <div class="cards-section">
                    <div class="content card-content card-1">
                        <h2>면접 제안</h2>
                        <p>프로필 등록 한번으로 인사담당자에게 
직접 면접 제안을 받으세요.</p>
                    </div>
                    <div class="content card-content card-2">
                        <h2>탐색</h2>
                        <p>내 직군, 연차, 지역에 맞는 채용 정보, 
합격 시 보상금은 덤.</p>
                    </div>
                    <div class="content card-content card-3">
                        <h2>지인 추천</h2>
                        <p>나를 잘 아는 지인의 추천사로 
인사담당자에게 한번 더 어필하세요.</p>
                    </div>
                </div>
            </div>
            <div class="block start">
                <div class="content">
                    <h1>요즘 이직, Developers</h1>
                    <h4>회원가입 후, 지금 가장 인기있는 채용 소식을 팔로우 해보세요.</h4>
                    <ul class="favorite-companies first">
                        <li class="logo-naver"><a href="/company/1246" class=""><img
                                    src="https://static.wanted.co.kr/images/home/logos/logo_naver.png" alt=""></a></li>
                        <li class="logo-toss"><a href="/company/113" class=""><img
                                    src="https://static.wanted.co.kr/images/home/logos/logo_toss.png" alt=""></a></li>
                        <li class="logo-kakao"><a href="/company/593" class=""><img
                                    src="https://static.wanted.co.kr/images/home/logos/logo_kakao.png" alt=""></a></li>
                        <li class="logo-coupang"><a href="/company/53" class=""><img
                                    src="https://static.wanted.co.kr/images/home/logos/logo_coupang.png" alt=""></a>
                        </li>
                    </ul>
                    <ul class="favorite-companies second">
                        <li class="logo-airbnb"><a href="/company/3807" class=""><img
                                    src="https://static.wanted.co.kr/images/home/logos/logo_airbnb.png" alt=""></a></li>
                        <li class="logo-wooahan"><a href="/company/102" class=""><img
                                    src="https://static.wanted.co.kr/images/home/logos/logo_wooahan.png" alt=""></a>
                        </li>
                        <li class="logo-skt"><a href="/company/375" class=""><img
                                    src="https://static.wanted.co.kr/images/home/logos/logo_skt.png" alt=""></a></li>
                        <li class="logo-facebook"><a href="/company/670" class=""><img
                                    src="https://static.wanted.co.kr/images/home/logos/logo_facebook.png" alt=""></a>
                        </li>
                    </ul>
                    <div class="button-group"><button type="button" class="suBtn">지금 시작하기</button></div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
</section>
	