<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/business/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>

<section id="content">

<h3>회사정보를 등록해주세요.</h3>
<p>디벨로퍼스는 추천인/후보자들에게 좋은 일자리를 제공하기 위해, 다음 정보를 리뷰하여 회사 등록을 승인하고 있습니다.<br>
 (승인 기준은 팀원 10명, 매출액/투자유치 5억원 이상입니다.)</p>
 <br>
 <div >
 	<form action="${pageContext.request.contextPath}/business/additionalBusEnroll.do" method="post">
	      <div class="modal-body">
			     회사이름 *<input type="text" class="form-control" name="busName" placeholder="회사이름" required>
			    <br />
			    국가 *<input type="text" class="form-control" name="busCountry" placeholder="한국" required>
			    <br/>
			    지역 *<input type="text" class="form-control" name="busArea" placeholder="서울" required>
			    <br/>
			    대표주소 *<input type="text" class="form-control" name="busAddress" placeholder="대표 주소 입력" required>
			    <br/>
			    사업자 등록번호 *<input type="text" class="form-control" name="busRegNum" placeholder="'-'제외 10자" required>
			    <br/>
			     매출액/투자금액(승인기준 매출액/투자금액 5억원 이상) *<input type="text" class="form-control" name="busIncome" placeholder="매출액/투자금액 입력 (단위 : 억원)" required>
			    <br/>
			    산업군 *<input type="text" class="form-control" name="busIndustrial" placeholder="서울" required>
			    <br/>
			    직원수(승인기준 팀원 10명 이상) *<input type="text" class="form-control" name="employeerNo" placeholder="서울" required>
			    <br/>
			    회사/서비스 소개 *<input type="text" class="form-control" name="busIntroduce" placeholder="회사 정보 입력" required>
			    <br/>
			    설립연도 *<input type="text" class="form-control" name="busEstablishment" placeholder="ex) 2012년" required>
			    <br/>
			    정보 수신 이메일 *<input type="text" class="form-control" name="chargerEmail" placeholder="기존에 적었던 이메일 primary key 불러오기" required>
			    <br/>
			    담당자 연락처 *<input type="text" class="form-control" name="chargerPhone" placeholder="기존에 적었던 전화번호 불러오기" required>
			    <br/>
			    웹사이트 주소 <input type="text" class="form-control" name="busWebsite" placeholder="URL 입력" required>
			    <br/>
			    뉴스 검색 키워드 (키워드는 최대 3개까지 입력 가능합니다.) <input type="text" class="form-control" name="searchKeywords" placeholder="서비스 명 혹은 브랜드 명 입력" required>
			    <br/>
			  	가입 경로 (추천인 혹은 프로모션 코드 등을 입력해 주세요.) <input type="text" class="form-control" name="registerPath" placeholder="코드/ 추천인 연락처 입력" required>
	      </div>
	      <div>
	      	<hr>
	        <button type="submit" class="btn btn-outline-success" >제출하기</button>
	      </div>
 	</form>
</div>
</section>
<jsp:include page="/WEB-INF/views/business/footer.jsp"/>