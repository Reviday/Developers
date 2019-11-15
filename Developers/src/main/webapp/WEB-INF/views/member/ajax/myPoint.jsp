<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="_1Gv5LM5zal-f72_XSo_qJ_">
<nav role="presentation" class="_3wSXAiIJQZ98fJ-Hi6G42Q"><button type="button" class="">프로필<i
                    class="icon-arrow_bottom_fill"></i></button>
                    <c:set value="${loginMember.memEmail }" var="memEmail"  />
            <ul class="">
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="" onclick="profilePage('${memEmail }')">프로필</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="activeNav">포인트</a></li>
				<li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="applicantPage('${memEmail}');" class="">제안받기 현황</a></li>	
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="likePage('${memEmail }');" class="">좋아요</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#"  onclick="myBookMark('${memEmail }')" >북마크</a></li>
              
            </ul>
        </nav>
    <div class="td6wqJhLQdPOONbxJ7n_L">
        <div class="_11enTe2iYpGpnJJhQYaE-Z">
            <div class="status">
                <div class="numbers">
                    <div class="clearfix">
                        <div class="point"><a href="/points/welcome" target="_blank" class="introLink">포인트 안내</a>
                            <dl>
                                <dt>포인트</dt>
                                <dd>1,000<sub>p</sub></dd>
                            </dl>
                        </div>
                        <div class="refunds">
                            <dl>
                                <dt>환급 가능 금액</dt>
                                <dd>0<sub>원</sub></dd>
                            </dl>
                        </div>
                    </div>
                    <p class="message">*포인트 환급신청은 모바일 앱에서 가능합니다</p>
                </div>
            </div>
        </div>
        <div xs="12" sm="8" class="_3fymZO37jWS_MEUN4hKK1x">
            <section>
                <div><time class="month">2019.10</time>
                    <ul>
                        <li><time class="day">10.11</time>
                            <dl class="description">
                                <dt>회원가입</dt>
                                <dd> </dd>
                            </dl>
                            <dl class="value earn">
                                <dt>1,000</dt>
                                <dd>1,000</dd>
                            </dl>
                        </li>
                    </ul>
                </div>
            </section>
        </div>
        <div class="_2WhBEdcqd_iAu05grmMED5">
            <div class="message">포인트 환급신청은 모바일 앱에서!</div><a href="wanted://points">[앱에서 환급]</a>
        </div>
    </div>
</div>