<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<footer class="footer row">
		<div class="footer_nav">
			<div class="footer_nav_items">
				<div class="footer_developers_icon">
					<img src="https://s3.ap-northeast-2.amazonaws.com/static.wanted.co.kr/images/logo_wanted.png" alt="" width="100">
				</div>
				<div class="footer_nav_item">
					<a href="/newintro" class="">서비스 소개</a>
					<a href="/terms" class="">이용약관 및 정책</a>
					<a href="/faq" class="">자주 묻는 질문</a>
				</div>
			</div>
			<div class="footer_language">
				<img class="countryIcon" src="https://s3.ap-northeast-2.amazonaws.com/wanted-public/ico_KR.svg" alt="country flag KR">
				<select>
					<option value="WW" disabled="" hidden="">Select Country</option>
					<option value="KR">한국 (한국어)</option>
					<option value="JP">日本 (日本語)</option>
					<option value="TW">台灣 (繁體中文)</option>
					<option value="HK">Hong Kong (English)</option>
					<option value="SG">Singapore (English)</option>
				</select>
				<div class="img_ico"></div>
			</div>
		</div>
		<div class="footer_int">
			<p class="developers_int">(주)원티드랩 (대표이사:이복기) | 서울특별시 강남구 테헤란로 142 | 개인정보보호관리자 : 황리건 | 통신판매번호 : 2016-서울강남-00207<br>
			유료직업소개사업등록번호 : (국내) 제2016-3220163-14-5-00001호 | (국외) F1201020170005 | 사업자등록번호 : 299-86-00021<br>
			서비스 및 기업문의 02-539-7118<br>
			© Wantedlab, Inc.</p>
		</div>
	</footer>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/main.js"></script>
</html>