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
                                <li class="ficturelist"></li>
                                <li class="ficturelist"></li>
                                <li class="ficturelist"></li>
                                <li class="ficturelist"></li>
                            </ul>
                            <div class="ficturecount">1 / 11</div>
                        </section>
                        <section class="companytype">
                            <h2>Web Front-end Developer(웹 프론트엔드 개발자)</h2>
                            <h6>
                                <a href="">
                                    같다(gatda Corp)
                                </a>
                                <span>
                                    서울
                                    <span class="typeDot">.</span>
                                    한국
                                </span>
                            </h6>
                            <div class="companytag">
                                <ul>
                                    <li><a href="">#인원급성장</a></li>
                                    <li><a href="">#50명이하</a></li>
                                    <li><a href="">#설립3년이하</a></li>
                                    <li><a href="">#스타트업</a></li>
                                    <li><a href="">#교육비</a></li>
                                    <li><a href="">#간식</a></li>
                                    <li><a href="">#건강검진</a></li>
                                    <li><a href="">#동호회</a></li>
                                    <li><a href="">#IT, 컨텐츠</a></li>
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
                                                <span>12</span>
                                            </button>
                                            <button type="button" class="hvh1-btn1">
                                                <ul>
                                                    <li></li>
                                                    <li></li>
                                                    <li></li>
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
                                <p>
                                    <span>
[성장하는 같다의 Web Front-end 개발자를 채용합니다]
<br><br>
같다는 '사는 것'과 '버리는 것'이 같다고 생각합니다.
<br>
물건을 잘 사는 것처럼 잘 버리는 것 또한 중요하다는 생각으로 불편하고 번거로운 기존의 방식을 우리가 가장 잘 할 수 있는 앱서비스를 통해 혁신적으로 바꾸어 나가고 있는 스타트업입니다. 
<br><br>
'같다'는 구성원 개개인이 새로운 도전과 성장을 할 수 있도록 적극적으로 지원하고 있으며, 서비스 고도화 및 사세 확장을 위해 '같다'라는 로켓을 함께 만들어 가실 분들을 기다리고 있습니다.
<br><br>
흥미로운 문제를 해결하고 풀어나갈 수 있는 상상력 넘치는 분들의 많은 지원 바랍니다.
<br><br>
▣『같다』는?
<br>
2018년 3월 설립한 젊은 IT 스타트업 기업인 같다는 모바일 대형폐기물 수거서비스 ‘빼기’를 런칭하여 운영하고 있습니다.
<br>
같다 는 AI 및 O2O기술을 활용한 IOT 원천기술 특허를 다수 보유하고 있는 기술회사로써, 신용보증기금, 기술보증기금, 중소벤쳐기업부, 창업진흥원 등 다수 기관의 투자유치 및 수상을 통해 그 가능성을 인정 받았습니다.
<br>
2019년 그렇게 투자받기 어렵다는 IBK기업은행으로부터 시드투자를 당당히 받았으며, 이후 SBA서울산업진흥원, 더시드인베스트먼트와의 Pre-SeriesA 투자가 완료 되었습니다. 이후 벤처스퀘어, 코리아오메가, 한국투자파트너즈, KB인베스트먼트 등 국내 굴지의 전문 VC와의 후속 투자논의를 이어가고 있는 매우 역동적으로 사업을 운영중인 젊은 스타트업 입니다.
<br><br>
같다는 2018년 3월 첫 서비스를 런칭한 이후 800%가 넘는 성장률을 보이고 있습니다.
<br>
서비스 가입자수는 무려 2,500%가 넘게 성장했으며, 서비스 신청건수는 매월 130%넘게 성장하고 있습니다. 
<br>
앱을 다운로드 받고, 사용한 이용량의 총합은 이미 이전 4년간의 모든 경쟁사의 수를 합친것보다 많습니다. 같다는 매달 놀라운 성장률을 통해 시장을 선도하고 있고, 앞으로도 계속 성장해 나갈 것입니다!
<br><br>
같다는 향후 App을 통한 철거, 유품정리, 리사이클링, 업사이클링 등의 사업영역 확장을 통해 종합 IT Base Waste Management 그룹으로의 도약을 준비중입니다.
<br>
생활의 불편함을 통해 세상을 바꿔나가는 같다에서 함께 성장하고 싶은 분을 환영합니다!
<br><br>
▣ 투자유치 이력
<br>
• IBK기업은행 시드투자 유치 (2019.06)
<br>
• SBA서울산업진흥원 프리시리즈A 유치 (2019.09)
<br>
• 더시드인베스트먼트 프리시리즈A 유치 (2019.10)
<br>
• 한국투자파트너즈 시리즈A 유치중 (2020.02)
<br><br>
▣ 수상 이력
<br>
• 신용보증기금 Start-up NEST 선정 및 4. 0스타트업 투자유치
<br>
• 기술보증기금 기술혁신 창업기업 선정 및 자금유치
<br>
• 중소벤처기업부 마케팅지원사업 선정 및 자금유치
<br>
• 서울창조경제혁신센터 투자퍼레이드 2018년 대상 수상
<br>
• K-ICT 우수사업화 기업선정
<br>
• 서울창업허브 BI 기업 선정
<br>
• IBK창공 마포2기 기업선정
<br>
• 기술특허 4종 보유(인공지능, 위치정보기술 및 빅데이터분석기술)
<br><br>
▣ 같다 주요기사 (기사가 같다를 평가하는데 도움을 줄 것입니다)
<br>
• </span><a href="http://star.mbn.co.kr/view.php?year=2019&amp;no=785935&amp;refer=portal" rel="noopener noreferrer" target="_blank">http://star.mbn.co.kr/view.php?year=2019&amp;no=785935&amp;refer=portal</a>
<span>
    <br>
• </span><a href="https://www.venturesquare.net/783538" rel="noopener noreferrer"
                                        target="_blank">https://www.venturesquare.net/783538</a><span>
                                            <br>
• </span><a
                                        href="http://www.ddaily.co.kr/news/article/?no=181710" rel="noopener noreferrer"
                                        target="_blank">http://www.ddaily.co.kr/news/article/?no=181710</a><span>
                                            <br>
• </span><a href="https://mk.co.kr/news/business/view/2018/11/690456/"
                                        rel="noopener noreferrer"
                                        target="_blank">https://mk.co.kr/news/business/view/2018/11/690456/</a><span><br>
• </span><a href="https://www.dailysecu.com/news/articleView.html?idxno=41991"
                                        rel="noopener noreferrer"
                                        target="_blank">https://www.dailysecu.com/news/articleView.html?idxno=41991</a><span><br>
• </span><a href="http://news.appstory.co.kr/startup11650" rel="noopener noreferrer"
                                        target="_blank">http://news.appstory.co.kr/startup11650</a><span><br>
• </span><a
                                        href="http://research-paper.co.kr/news/view/111536" rel="noopener noreferrer"
                                        target="_blank">http://research-paper.co.kr/news/view/111536</a><span><br>
• </span><a href="http://www.seoulwire.com/news/articleView.html?idxno=107789"
                                        rel="noopener noreferrer"
                                        target="_blank">http://www.seoulwire.com/news/articleView.html?idxno=107789</a><span><br>
• </span><a href="https://bit.ly/2KVBY6D" rel="noopener noreferrer"
                                        target="_blank">https://bit.ly/2KVBY6D</a><span><br>
• </span><a
                                        href="https://bit.ly/2KRG2VM" rel="noopener noreferrer"
                                        target="_blank">https://bit.ly/2KRG2VM</a><span><br><br>
▣ 채용현황 (진짜 재밌는 일을 해볼까요 :^D)
<br>
• Business Planning : 채용완료
<br>
• Marketing : 채용완료
<br>
• UX/UI Design : 채용완료
<br>
• Sales : 채용중
<br>
• iOS : 채용완료
<br>
• Back-end : 채용완료
<br>
• Android : 채용중
<br>
• Front-end : 채용중 (바로지금!)</span>
                                </p>
                                <h6>주요업무</h6>
                                <p>
<span>• Admin 페이지 고도화 및 개선<br>• Web-site 개발 및 기술탑재 (반응형)</span>
                                </p>
                                <h6>자격요건</h6>
                                <p>
<span>• Nodejs 기반의 Front-end 개발 경력 3년이상 혹은 그에 준하는 실력<br>• Front-end framework
(Angularjs, Vuejs, Reactjs) 유경험자<br>• HTML, CSS, Javascript 에 대한 기본적인 이해<br>•
REST API 클라이언트 개발 경험<br>• Git을 통한 형상관리 경험</span>
                                </p>
                                <h6>우대사항</h6>
                                <p>
<span>• Ionic framework 를 이용한 웹개발 또는 하이브리드 앱 개발 경험<br>• 웹 표준 / 웹 접근성에 대한 이해<br>• 크로스
브라우징 구현 경험<br>• 더 편리한 UI/UX에 대한 고민<br>• 스타트업 유경험자<br>• 새로운 기술이나 언어에 대해 거부감이
없는자</span>
                                </p>
                                <h6>혜택 및 복지</h6>
                                <p>
span>개발팀 구성 (Team Organization)<br>• Web Front-end : 채용중<br>• iOS Swift<br>• AOS
Java/Kotlin<br>• Back-End<br>• Data Scientist<br><br>보상 제도<br>• 스톡옵션 (Stock
Option)보상<br>• 성과에 따른 직무보상금/인센티브/Annual Bonus 보상<br>• 폐기물 수거서비스 무상 제공<br>• 4대보험,
퇴직연금<br>• 연차휴가, 창립일 휴무, 명절 선물<br>• 도서지원비, 교육비 지원 (업무 관련), 자격증 수당 등<br>• 보직수당,
장기근속자 포상, 경조사 지원, 건강검진비, 동호회 지원금<br><br>업무 환경<br>• 최신기종의 맥북 Pro / 듀얼 모니터 제공<br>•
최신기종의 Window PC 및 Lab-top / 듀얼 모니터 제공<br>• 간식제공<br>• 자유로운 휴가 (묻지도 따지지도 않는 휴가신청
가능)<br>• 연1회이상 야유회/워크샵 (주중에 갑니다!)</span>
                                </p>
                            </section>
                            <hr class="company-info-text-hr">
                            <section class="company-map">
                                <div>
                                    <span class="header">마감일</span>
                                    <span class="body">2020.01.24</span>
                                </div>
                                <div>
                                    <span class="header">근무지역</span>
                                    <span class="body">마포구 백범로 31길 21 (서울창업허브) 814호</span>
                                </div>
                                <div id="map">이건 맵api로 쓸거임</div>
                            </section>
                        </div>
                        <section class="companyicon">
                            <button type="button" class="left">
                                <div class="logo"></div>
                                <div>
                                    <h5>같다(gatda Corp)</h5>
                                    <h6>IT, 컨텐츠</h6>
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
                                        	<span>12</span>
                                    </button>
                                    <button type="button" class="people suBtn">
                                        <ul>
                                            <li></li>
                                            <li></li>
                                            <li></li>
                                        </ul>
                                    </button>
                                    <button type="button" class="share-btn suBtn">
                                        <i class="fas fa-bookmark"></i>
                                    </button>
                                    </c:if>
                                    <c:if test="${not empty loginMember }">
                                    	<button type="button" class="likes">
                                        	<i class="far fa-heart"></i>
                                        	<span>12</span>
                                    </button>
                                    <button type="button" class="people">
                                        <ul>
                                            <li></li>
                                            <li></li>
                                            <li></li>
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
                </div>
                <div class="choochun">
                    <h5 class="choochun-title">추천 채용</h5>
                    <div class="choochun-content">
                        <ul class="clearfix">
                            <li>
                                <div class="choochun-content-context">
                                    <a href="">
                                        <div class="contextHeader">
                                            <button class="likeButton">
                                                <i class="fas fa-heart" style="margin-right: 10px"></i>
                                                0
                                            </button>
                                        </div>
                                        <div class="body">
                                            <dl>
                                                <dt>웹 개발자(프론트엔드/HTML)</dt>
                                                <dd>
                                                    로켓뷰(RocketView)
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
                                <div class="choochun-content-context">
                                    <a href="">
                                        <div class="contextHeader">
                                            <button class="likeButton">
                                                <i class="fas fa-heart" style="margin-right: 10px"></i>
                                                0
                                            </button>
                                        </div>
                                        <div class="body">
                                            <dl>
                                                <dt>웹 개발자(프론트엔드/HTML)</dt>
                                                <dd>
                                                    로켓뷰(RocketView)
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
                                <div class="choochun-content-context">
                                    <a href="">
                                        <div class="contextHeader">
                                            <button class="likeButton">
                                                <i class="fas fa-heart" style="margin-right: 10px"></i>
                                                0
                                            </button>
                                        </div>
                                        <div class="body">
                                            <dl>
                                                <dt>웹 개발자(프론트엔드/HTML)</dt>
                                                <dd>
                                                    로켓뷰(RocketView)
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
                                <div class="choochun-content-context">
                                    <a href="">
                                        <div class="contextHeader">
                                            <button class="likeButton">
                                                <i class="fas fa-heart" style="margin-right: 10px"></i>
                                                0
                                            </button>
                                        </div>
                                        <div class="body">
                                            <dl>
                                                <dt>웹 개발자(프론트엔드/HTML)</dt>
                                                <dd>
                                                    로켓뷰(RocketView)
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
                                <div class="choochun-content-context">
                                    <a href="">
                                        <div class="contextHeader">
                                            <button class="likeButton">
                                                <i class="fas fa-heart" style="margin-right: 10px"></i>
                                                0
                                            </button>
                                        </div>
                                        <div class="body">
                                            <dl>
                                                <dt>웹 개발자(프론트엔드/HTML)</dt>
                                                <dd>
                                                    로켓뷰(RocketView)
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
                                <div class="choochun-content-context">
                                    <a href="">
                                        <div class="contextHeader">
                                            <button class="likeButton">
                                                <i class="fas fa-heart" style="margin-right: 10px"></i>
                                                0
                                            </button>
                                        </div>
                                        <div class="body">
                                            <dl>
                                                <dt>웹 개발자(프론트엔드/HTML)</dt>
                                                <dd>
                                                    로켓뷰(RocketView)
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
                                <div class="choochun-content-context">
                                    <a href="">
                                        <div class="contextHeader">
                                            <button class="likeButton">
                                                <i class="fas fa-heart" style="margin-right: 10px"></i>
                                                0
                                            </button>
                                        </div>
                                        <div class="body">
                                            <dl>
                                                <dt>웹 개발자(프론트엔드/HTML)</dt>
                                                <dd>
                                                    로켓뷰(RocketView)
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
                                <div class="choochun-content-context">
                                    <a href="">
                                        <div class="contextHeader">
                                            <button class="likeButton">
                                                <i class="fas fa-heart" style="margin-right: 10px"></i>
                                                0
                                            </button>
                                        </div>
                                        <div class="body">
                                            <dl>
                                                <dt>웹 개발자(프론트엔드/HTML)</dt>
                                                <dd>
                                                    로켓뷰(RocketView)
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
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
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
            // var asideBottom = $('.rightaside').offset().top;
            // var companyiconBottom = $('.companyicon').offset().top;

            // $(window).scroll(function () { 
            //     console.log(asideBottom, companyiconBottom);
            //     if(asideBottom >= companyiconBottom - 220) {
            //         $(".rightaside").addClass("rightasidefix");
            //         $(".rightaside").removeClass("rightaside");
            //     }
            //     if($(this).scrollTop <= companyiconBottom){
            //         $(".rightaside").addClass("rightaside");
            //         $(".rightaside").removeClass("rightasidefix");
            //     }
            // });

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
