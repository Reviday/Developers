<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/recommend.css">
	
<section id="recommend">
    <div class="margin1 margin2 margin3 margin4">
        <div class="recommend-title">
            <p class="recommed-menu selected menu1">추천하기</p>
            <p class="recommed-menu menu2">내가 받은 추천</p>
            <p class="recommed-menu menu3">내가 한 추천</p>
            <span class="hiddenspan choospan">
                <p class="introText">developers 추천 소개 ></p>
            </span>
            <span class="hiddenspan hiddenspan1">
                <i class="icon-info_icon"></i>
            </span>
        </div>
        <!-- 추천하기 -->
        <div class="recommend-body">
            <div class="recommend-section">
                <div class="recommned-content1 recommned-content2 recommned-content3 recommned-content4">
                    <div class="recommend-text1 recommend-text2 recommend-text3 recommend-text4">
                        <div class="text-ficture">
                            <i class="far fa-address-card"></i>
                        </div>
                        <p class="text-ficture-text">추천하기</p>
                    </div>
                </div>
            </div>
            <!-- 추천하기 모달 -->
            <div class="recommendModal1 recommendModal2">
                <div class="recommendmodalmain1 recommendmodalmain2 recommendmodalmain3 recommendmodalmain4">
                    <div class="modalsun1 modalsun2">
                        <button type="button" class="right modalbtn close">
                            <i class="icon-close"></i>
                        </button>
                    </div>
                    <div class="modalbody1 modalbody2">
                        <div class="modalbody-text1 modalbody-text2">
                            <p class="referText">
                                <span>
                                    Developers회원을
                                    <br>
                                    추천합니다.
                                </span>
                            </p>
                            <input type="text" class="recommendName" placeholder="지인의 이름">
                            <input type="email"class="recommendEmail" placeholder="지인의 이메일">
                            <div class="realationship">
                                <select name="" id="">
                                    <option value="none" selected>추천하실 분과의 관계를 선택해 주세요</option>
                                    <option value="colleague">(전)직장동료</option>
                                    <option value="otherCompany">가까운 회사의 직원</option>
                                    <option value="school">학교 동문</option>
                                    <option value="mentor">멘토/멘티</option>
                                    <option value="warmFriend">친한친구</option>
                                    <option value="friends">지인</option>
                                </select>
                                <i class="icon-arrow_bottom_fill"></i>
                            </div>
                        </div>
                        <div class="recommendModal-submit1 recommendModal-submit2">
                            <!-- 활성화되면 enable클래스 추가 -->
                            <div class="submitreferButton">
                                <p>추천하기</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modalpresen1 modalpresen2"></div>
            </div>
        </div>
        <!-- 내가 받은 추천 -->
        <div class="myrecievehun1 myrecievehun2">
            <div class="myreciveList1 myreciveList2 myreciveList3 myreciveList4">
                <div class="myreciveContent1 myreciveContent2 myreciveContent3 myreciveContent4">
                    <div class="requestLogo">
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <p class="requestText">추천 요청</p>
                </div>
                <div class="mypushList1 mypushList2 mypushList3 mypushList4">
                    <div class="profile1 profile2" style="background-image: url(null);"></div>
                    <p class="sentreferName">이름</p>
                    <p class="sentreferDescription">관계</p>
                    <!-- 추천사 작성 안되어있으면 request1클래스로 변경 -->
                    <div class="sentReferItemButton request">
                        <!-- 추천사 작성 되어있으면 추천사 확인 -->
                        <p>추천사 확인</p>
                    </div>
                </div>
            </div>
            <!-- 내가받은추천 모달 -->
            <div class="requestModal1 requestModal2">
                <div class="requestModalMain1 requestModalMain2">
                    <div class="reModalTitle1 reModalTitle2">
                        <span>추천 요청</span>
                        <button type="button" class="right modalbtn close">
                            <i class="icon-close"></i>
                        </button>
                    </div>
                    <div class="friendSearch1 friendSearch2">
                        <div class="searchFriends">
                            <input type="text" class="friendSearchInput" placeholder="친구 검색">
                            <i class="icon-search"></i>
                        </div>
                        <div style="max-height:inherit;overflow-y:scroll;height:inherit;">
                            <div class="networkList1 networkList2">
                                <!-- 검색결과 없을 시 -->
                                <div>
                                    <p class="emptyText">검색 결과가 없습니다</p>
                                </div>
                            </div>
                        </div>
                        <!-- 검색결과 있을 시 enable1클래스 추가 -->
                        <div class="buttonSelectFriend">
                            <p>선택 완료</p>
                        </div>
                    </div>
                </div>
                <div class="requestmodalclose1 requestmodalclose2"></div>
            </div>
        </div>
        <!-- 내가 한 추천 -->
        <div>
            <div class="mypushrecommend1 mypushrecommend2 mypushrecommend3 mypushrecommend4">
                <div class="mypushList1 mypushList2 mypushList3 mypushList4">
                    <div class="profile1 profile2" style="background-image: url(null);"></div>
                    <p class="sentreferName">이름</p>
                    <p class="sentreferDescription">관계</p>
                    <!-- 추천사 작성 되어있으면 request클래스 삭제 -->
                    <div class="sentReferItemButton request">
                        <!-- 추천사 작성 되어있으면 추천사 확인 -->
                        <p>추천사 작성</p>
                    </div>
                    <i class="icon-more_vert"></i>
                    <!-- 위의 icon 눌렀을 떄 생성 -->
                    <div class="showMoreOverlay">
                        <p>추천 취소</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- 모달관리 -->
<script>
    $(".recommend-text4").click(function(){
        $(".recommendModal2").css("display", "block");
    })
    $(".modalpresen2").click(function(){
        $(".recommendModal2").css("display", "none");
    })
    $(".close").click(function(){
        $(".recommendModal2").css("display", "none");
    })
    $(".myreciveContent4").click(function(){
        $(".requestModal2").css("display", "block");
    })
    $(".requestmodalclose2").click(function(){
        $(".requestModal2").css("display", "none");
    })
</script>
<!-- 메뉴변환 -->
<script>
    $(".recommed-menu").click(function(){
        $(".recommed-menu").next().removeClass("selected");
        $(".recommed-menu").prev().removeClass("selected");
        $(this).addClass("selected");
    })
    $(".menu1").click(function(){
        $(".myrecievehun2").css("display", "none");
        $(".mypushrecommend2").css("display", "none");
        $(".recommend-body").css("display", "block");
    })
    $(".menu2").click(function(){
        $(".myrecievehun2").css("display", "block");
        $(".mypushrecommend2").css("display", "none");
        $(".recommend-body").css("display", "none");
    })
    $(".menu3").click(function(){
        $(".myrecievehun2").css("display", "none");
        $(".mypushrecommend2").css("display", "block");
        $(".recommend-body").css("display", "none");
    })
</script>