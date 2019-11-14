<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<div class="_1Gv5LM5zal-f72_XSo_qJ_">
    <nav role="presentation" class="_3wSXAiIJQZ98fJ-Hi6G42Q"><button type="button" class="">제안받기 현황<span
                class="subtitle"><i class="icon-arrow_right"></i>전체</span><i
                class="icon-arrow_bottom_fill"></i></button>
        <ul class="">
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/matching" class="">프로필</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/point" class="">포인트</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><button type="button" class="">제안받기 현황<i
                        class="icon-arrow_bottom_fill"></i></button><a href="/profile/status" class="activeNav">제안받기
                    현황</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/likes" class="">좋아요</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/bookmarks" class="">북마크</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><button type="button" class="">설정<i
                        class="icon-arrow_bottom_fill"></i></button><a href="/profile/settings" class="">설정</a></li>
        </ul>
    </nav>
    <div class="_3Qcftta6FkVOkjFbE2NJ2v"><button class="statusInfoButton" type="button"><i
                class="icon-step_info_icon"></i></button>
        <div class="DS_fYpEMhiYB3fNFb0lCn">
            <h3>제안받기 현황</h3>
            <dl>
                <dt>나를 원하는 회사</dt>
                <dd>
                    <ul>
                        <li class="active"><a href="/profile/status?type=matchup-all" class="">전체<div class="label_">4
                                </div></a></li>
                        <li class=""><a href="/profile/status?type=matchup-likes" class="">원해요<div class="label_">1
                                </div></a></li>
                        <li class=""><a href="/profile/status?type=matchup-opens" class="">프로필 열람/요청<div class="label_">
                                    3</div></a></li>
                        <li class=""><a href="/profile/status?type=matchup-offers" class="">받은 제안<div class="label_">0
                                </div></a></li>
                    </ul>
                </dd>
            </dl>
        </div>
        <section>
            <div class="_2BcuDguCHGaa1TAI2sJw20">
                <div class="header">
                    <ul>
                        <li>회사명</li>
                        <li>일자</li>
                        <li>상태</li>
                    </ul>
                </div>
                <ul class="content">
                <a href="/profile" class="">
                        <li>
                            <h2 role="presentation">
                                <div class="thumbnail"
                                    style="background-image: url(&quot;https://static.wanted.co.kr/images/wdes/0_5.1a210fbc.jpg&quot;);">
                                </div>KH정보교육원
                            </h2><time datetime="2019-11-12T19:37:46">2019-11-12</time>
                            <div class="type resumeRequest">프로필 요청</div>
                        </li>
                    </a></ul>
            </div>
        </section>
    </div>
</div>

</body>
</html>