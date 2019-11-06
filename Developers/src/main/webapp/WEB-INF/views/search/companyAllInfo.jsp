<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/companyAllInfo.css">
	
    <section id="conmanyInfo">
        <div class="companyHeader">
            <div class="comheader">
                <img src="" alt="Company Logo">
                <h2>카플랫</h2>
            </div>
        </div>
        <div class="commanyBody">
            <div class="companyTag">
                <h3>태그</h3>
                <ul>
                    <li><a href="">#연봉업계평균이상</a></li>
                    <li>
                        <button type="button" class="tagModalOpen">+ 태그 의견보내기</button>
                    </li>
                </ul>
                <div class="item-gradient end"></div>

                <!-- 태그모달창 -->
                <div class="tagModal">
                    <div class="tagModal-body">
                        <div class="tagmodal-header">
                            태그 의견
                            <button type="button" class="tagmodal-close">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                        <div id="MODAL_BODY" class="modaltag_body">
                            <div class="tag-body">
                                <p class="tag-body-title">
                                    해당 회사의 다양한 태그 의견을 받습니다
                                    <br>
                                    보내주신 태그는 developers에서 검토 후 반영됩니다
                                </p>
                                <div class="tagInput">
                                    <div class="tagInput-div">
                                        <input type="text" name="" id="" placeholder="태그를 이곳에 입력해주세요.">
                                        <button type="button">추가</button>
                                    </div>
                                </div>
                                <button type="button" class="tagSubmit tagSubmit1" disabled>의견 보내기</button>
                            </div>
                        </div>
                    </div>
                    <div role="presentation" class="chang11 chang22"></div>
                </div>
            </div>
            <div class="companyInfoBody">
                <div class="company-position">
                    <h3>채용 중인 포지션</h3>
                    <div class="positionList">
                        <a href="" class="positionInfo">
                            <h4>[사업개발]제휴사업 발굴 및 신규사업 제안</h4>
                            <h5>채용보상금 1,000,000원</h5>
                            <p>2019.11.30 까지</p>
                            <button type="button">
                                18
                                <i class="far fa-heart"></i>
                            </button>
                        </a>
                        <a href="" class="positionInfo">
                            <h4>[사업개발]제휴사업 발굴 및 신규사업 제안</h4>
                            <h5>채용보상금 1,000,000원</h5>
                            <p>2019.11.30 까지</p>
                            <button type="button">
                                18
                                <i class="far fa-heart"></i>
                            </button>
                        </a>
                    </div>
                </div>
                <div class="companyContent">
                    <h3>회사 소개</h3>
                    <div class="companyFicture">
                        <button class="fictureBtn">
                            <img src="https://static.wanted.co.kr/images/company/2086/lgkogufqjwi1ngpg__1080_790.jpg"
                                alt="">
                        </button>
                        <button class="fictureBtn">
                            <img src="https://static.wanted.co.kr/images/company/2086/lgkogufqjwi1ngpg__1080_790.jpg"
                                alt="">
                        </button>
                        <button class="fictureBtn">
                            <img src="https://static.wanted.co.kr/images/company/2086/lgkogufqjwi1ngpg__1080_790.jpg"
                                alt="">
                        </button>
                        <button class="fictureBtn">
                            <img src="https://static.wanted.co.kr/images/company/2086/lgkogufqjwi1ngpg__1080_790.jpg"
                                alt="">
                        </button>
                        <p class="companyTextInfo companyTextInfo1">
                            회사소개내용
                        </p>
                        <!-- 회사사진모달창 -->
                        <div class="modalChang">
                            <div class="modalbig">
                                <div class="modalbody">
                                    <ul class="fictureUl">
                                        <li><img src="https://static.wanted.co.kr/images/company/2086/lgkogufqjwi1ngpg__1080_790.jpg"
                                            alt="" class="modalficture"></li>
                                        <li><img src="https://static.wanted.co.kr/images/company/2086/7zebrsm0fctwqm6f__1080_790.jpg"
                                            alt="" class="modalficture"></li>
                                        <li><img src="https://static.wanted.co.kr/images/company/2086/lgkogufqjwi1ngpg__1080_790.jpg"
                                            alt="" class="modalficture"></li>
                                        <li><img src="https://static.wanted.co.kr/images/company/2086/lgkogufqjwi1ngpg__1080_790.jpg"
                                            alt="" class="modalficture"></li>
                                    </ul>
                                    <button type="button" class="closebtn">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <button type="button" class="leftbtn">
                                        <div class="leftbtn-div">
                                            <i class="fas fa-chevron-left"></i>
                                        </div>
                                    </button>
                                    <button type="button" class="rightbtn">
                                        <div class="rightbtn-div">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div role="presentation" class="chang1 chang2"></div>
                        </div>
                    </div>
                    <p class="companyText"></p>
                </div>
                <div class="companyIncome">
                    <div>
                        <div class="pungIncome">
                            <h3>평균 연봉</h3>
                            <h4 class="gook">출처 : 국민연금</h4>
                            <div class="incomeHeader">
                                <div class="incomeNew">
                                    <h4 class="incomeNew-header">신규 입사자</h4>
                                    <div class="newPrice">2,433 만원</div>
                                </div>
                                <div class="incomeAll">
                                    <h4 class="incomeAll-header">전체</h4>
                                    <div class="allPrice">3,203 만원</div>
                                </div>
                            </div>
                        </div>
                        <div></div>
                    </div>
                </div>
                <div class="companyIncome">
                    <div>
                        <div class="pungIncome">
                            <h3>직원수</h3>
                            <div class="companyCount">
                                <h4 class="companyCount-header">전체 인원</h4>
                                <div class="companyCount-body">59</div>
                            </div>
                        </div>
                        <div></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
<!-- 회사사진슬라이드 -->
    <script>
        $(function () {
            $(".fictureBtn").click(function () {
                $(".modalChang").css("display", "block");
            });

            $(".closebtn").on("click", function () {
                $(".modalChang").css("display", "none");
            });
            $(".chang1").on("click", function () {
                $(".modalChang").css("display", "none");
            });
        })

        var sliderWrapper = document.getElementsByClassName("modalbody"),
            sliderContainer = document.getElementsByClassName("fictureUl"),
            slides = document.getElementsByClassName("modalficture"),
            slideCount = slides.length,
            currentIndex = 0,
            topHeight = 0,
            navPrev = document.getElementsByClassName("leftbtn"),
            navNext = document.getElementsByClassName("rightbtn");

        function calculateTallestSlide() {
            for (var i = 0; i < slideCount; i++) {
                if (slides[i].offsetHeight > topHeight) {
                    topHeight = slides[i].offsetHeight;
                }
            }
            sliderWrapper[0].style.height = topHeight + 'px';
            sliderContainer[0].style.height = topHeight + 'px';
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
    </script>
    <!-- 태그모달창 -->
    <script>
        $(function () {
            $(".tagModalOpen").click(function () {
                $(".tagModal").css("display", "block");
            });

            $(".tagmodal-close").on("click", function () {
                $(".tagModal").css("display", "none");
            });
            $(".chang11").on("click", function () {
                $(".tagModal").css("display", "none");
            });
        })
    </script>