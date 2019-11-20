<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/business/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<style>
.main_sub::after {
    content: "*";
    color: red;
    margin-left: 2px;
}

.subtitles.star::after {
    content: "*";
    color: red;
    margin-left: 2px;
}
*, ::after, ::before {
    box-sizing: border-box;
}
textarea.form-control{
	height: 14em;
	/* rows: 3 !important; */
} 
.dis::placeholder {
	color: #A4A4A4;
}
#customeSize{
	height: 100px;
	text-align: center;
	vertical-align:middle;
}
#customeSize>h3{
	margin-top: 30px;
}
/* .modal {
    text-align: center;
}
 
@media screen and (min-width: 768px) { 
.modal:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 90%;
     }
}
 
.modal-dialog {
    display: inline-block;
    text-align: left; 
    vertical-align: middle; 
} */

div.container>*{
	font-size:17px;
	
}

button{
	font-size:17px !important;
	font-weight: bold !important;
}
input{
	font-size:17px !important;
}
select{
	font-size:17px !important;
	height:2.8em !important;
}
textarea{
	font-size: 17px !important;
}

#list-area{
	border: 1px solid #E6E6E6;
    border-top-style: none;
    position: absolute;
    z-index: 2;
	background-color: #FFFFFF;
	border-color: #FFFFFF;
}


.dis:focus{
	border-width: 1px;
	border-color:#0080FF;
	box-shadow: none;
    outline: 0 none;
}  
.result_button{
	padding:8px;
	border-top:1px solid #E6E6E6;
}
#list-area{
	width: 100%;
	display: contents;
	/* overflow: scroll; */
	height:10em;
}
#search-business{
	max-height: 10em;
	overflow-y: scroll;
}
/* #search-business{
	border:1px solid #0080FF;
} */


.shadow-drop-bottom-first:hover, .shadow-drop-bottom-first:focus {
	/* box-shadow: 5px 10px #BDBDBD; */
	border:1px solid #0080FF;


	/* -webkit-animation: shadow-drop-bottom 0.4s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
	        animation: shadow-drop-bottom 0.4s cubic-bezier(0.250, 0.460, 0.450, 0.940) both; */
}
.shadow-drop-bottom>* {
	/* box-shadow: 0 0 10px #D8D8D8; */
	background-color: #FFFFFF;
	/* border:1px solid #D8D8D8; */
	cursor:pointer;
	/* border-radius: 5px 5px 5px 5px; */
	/* -webkit-animation: shadow-drop-bottom 0.4s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
	        animation: shadow-drop-bottom 0.4s cubic-bezier(0.250, 0.460, 0.450, 0.940) both; */
}


 @-webkit-keyframes shadow-drop-center {
  0% {
    -webkit-box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
            box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
  }
  100% {
    -webkit-box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.35);
            box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.35);
  }
}
@keyframes shadow-drop-center {
  0% {
    -webkit-box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
            box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
  }
  100% {
    -webkit-box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.35);
            box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.35);
  }
}

 @-webkit-keyframes shadow-drop-bottom {
  0% {
    -webkit-box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
            box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
  }
  100% {
    -webkit-box-shadow: 0 12px 20px -12px rgba(0, 0, 0, 0.35);
            box-shadow: 0 12px 20px -12px rgba(0, 0, 0, 0.35);
  }
}
@keyframes shadow-drop-bottom {
  0% {
    -webkit-box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
            box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
  }
  100% {
    -webkit-box-shadow: 0 12px 20px -12px rgba(0, 0, 0, 0.35);
            box-shadow: 0 12px 20px -12px rgba(0, 0, 0, 0.35);
  }
}

/* div.result_button{
	border-left-color:#0080FF;
	border-right-color:#0080FF;
} */

input.form-control{
	margin-bottom:0;
	height:2.8em;
}







</style>

<script>
	var path='${path}';
</script>

<section id="content-enroll">
 <div class="container">
 <br>
 	<form class="form" action="${pageContext.request.contextPath}/business/businessEnroll" method="post">
	 <div>
		<div><h2>안녕하세요 회원님!<br> 먼저 회사정보를 등록해주세요.</h2></div>
		<br>
		<div><p>저희 디벨로퍼스 블랙은 추천인/후보자들에게 좋은 일자리를 제공하기 위해, 다음 정보를 리뷰하여 회사 등록을 승인하고 있습니다.
		 <small>(승인 기준은 팀원 10명, 매출액/투자유치 5억원 이상입니다.)</small></p></div>
		 <br>
		 <p style="color:#2E64FE"><small>먼저 회사 이름을 검색해 선택 해주시기 바랍니다. 검색으로 찾지 못할 시 수동으로 입력주십시오.</small></p>
	 </div>	
	 	<br>
	      <div class="">
				<div>
				   <div class="main_sub">
				     회사 이름
				     <!-- ::after -->
				   </div>
				   <div>
					   <div class="search-business" id="search-business">
					   		<input id="busSearch" type="text" placeholder="회사 이름" 
								   class="shadow-drop-bottom-first form-control search-bar must" name="busName" 
								   onclick="bus_reset();" onkeypress="bus_search();" autofocus>
								<div class="list-area shadow-drop-bottom" id="list-area"></div>					   			
					   			<!-- <button type="button" class="search-cancle">
					   			<i class="icon-close"></i>
					   			</button> -->
					   		<!-- <div class="list-group" id="list-group"></div> -->
					   	</div>
				     <!-- <input type="text" class="form-control" name="busName" placeholder="회사 이름" required> -->
				   </div>
			     </div>
			    				 <br>
			    <div class="row" style="z-index: 1;">
			    	<div class="form-group col-md-6">
					   <div class="subtitles star">
					     국가
					     <!-- ::after -->
					   </div>
					   <div>
					      <input type="text" id="busCountry" class="form-control dis must" name="busCountry" placeholder="한국" value="" required>
					   </div>
					</div>
					<div class="form-group col-md-6">
						<div class="subtitles star">
						   	지역
						     <!-- ::after -->
						 </div>
						 <div>
						  <select class="form-control dis must" id="city" name="busArea"><option value="">지역</option><option value="서울">서울</option><option value="부산">부산</option><option value="대구">대구</option><option value="인천">인천</option><option value="광주">광주</option><option value="대전">대전</option><option value="울산">울산</option><option value="세종">세종</option><option value="경기">경기</option><option value="강원">강원</option><option value="충북">충북</option><option value="충남">충남</option><option value="전북">전북</option><option value="전남">전남</option><option value="경북">경북</option><option value="경남">경남</option><option value="제주">제주</option></select>
						    <!-- <input type="text" class="form-control" name="busArea" placeholder="서울" required> -->
						</div>
					</div>
			     </div>
			     			     <br>
			    <div>
				   <div class="subtitles star">
				      대표주소
				     <!-- ::after -->
				   </div>
				   <div>
				      <input type="text" class="form-control dis must" id="busAddress" name="busAddress" placeholder="대표 주소 입력" required>
				   </div>
			     </div>
			     			     <br>
			    <div class="row">
			    	<div class="form-group col-md-6">
					   <div class="subtitles star">
					     사업자 등록번호 
					     <!-- ::after -->
					   </div>
					   <div>
					      <input type="text" class="form-control dis must" name="busRegNo" placeholder="'-'제외 10자" required>
					   </div>
					 </div>
			    	<div class="form-group col-md-6"> 
					   <div class="subtitles star">
					     매출액/투자금액 <small>(승인기준 매출액/투자금액 5억원 이상)</small> 
					     <!-- ::after -->
					   </div>
					   <div>
					      <input type="text" class="form-control dis must" name="busIncome" placeholder="매출액/투자금액 입력 (단위 : 억원)" required>
					   </div>
					 </div> 
			     </div>
	 			     			     <br>
	 			     			     
			    <div class="row">
			     	<div class="form-group col-md-6">
					   <div class="subtitles star">
					     산업군 
					     <!-- ::after -->
					   </div>
					   <div>
					      <input type="text" id="category" class="form-control dis must" name="busIndustrial" placeholder="IT" required>
					   </div>
					 </div>
					 <div class="form-group col-md-6">  
					   <div class="subtitles star">
					     직원수 <small>(승인기준 팀원 10명 이상)</small> 
					     <!-- ::after -->
					   </div>
					   <div>
					   	  <select class="form-control dis must" name="busTotalEmp"><option value="">회사규모</option><option value="1~4">1~4명</option><option value="5~10">5~10명</option><option value="11~50">11~50명</option><option value="51~200">51~200명</option><option value="201~500">201~500명</option><option value="501~1000">501~1000명</option><option value="1001~5000">1001~5000명</option><option value="5001~10000">5001~10000명</option><option value="10001~">10000명 이상</option></select>
					      <!-- <input type="text" class="form-control" name="busTotalEmp" placeholder="회사규모" required> -->
					   </div>
					 </div>  
			     </div>
			     			     <br>
			    <div>
				   <div class="subtitles star">
				     회사/서비스 소개 
				     <!-- ::after -->
				   </div>
				   <div>
				      <textarea class="form-control dis must" name="busIntroduce" placeholder="회사 정보 입력" rows="60"></textarea>
				      <!-- <input type="text" class="form-control" name="busIntroduce" placeholder="회사 정보 입력" required> -->
				   </div>
			     </div>
			     			     			     <br>
			    <div class="row">
			    	<div class="form-group col-md-6">
						   <div class="subtitles star">
						     설립연도  
						     <!-- ::after -->
						   </div>
						   <div>
						 	  <select class="form-control dis must" name="busEstablishment"><option value="">ex) 2012년</option><option value="2019">2019년</option><option value="2018">2018년</option><option value="2017">2017년</option><option value="2016">2016년</option><option value="2015">2015년</option><option value="2014">2014년</option><option value="2013">2013년</option><option value="2012">2012년</option><option value="2011">2011년</option><option value="2010">2010년</option><option value="2009">2009년</option><option value="2008">2008년</option><option value="2007">2007년</option><option value="2006">2006년</option><option value="2005">2005년</option><option value="2004">2004년</option><option value="2003">2003년</option><option value="2002">2002년</option><option value="2001">2001년</option><option value="2000">2000년</option><option value="1999">1999년</option><option value="1998">1998년</option><option value="1997">1997년</option><option value="1996">1996년</option><option value="1995">1995년</option><option value="1994">1994년</option><option value="1993">1993년</option><option value="1992">1992년</option><option value="1991">1991년</option><option value="1990">1990년</option><option value="1989">1989년</option><option value="1988">1988년</option><option value="1987">1987년</option><option value="1986">1986년</option><option value="1985">1985년</option><option value="1984">1984년</option><option value="1983">1983년</option><option value="1982">1982년</option><option value="1981">1981년</option><option value="1980">1980년</option><option value="1979">1979년</option><option value="1978">1978년</option><option value="1977">1977년</option><option value="1976">1976년</option><option value="1975">1975년</option><option value="1974">1974년</option><option value="1973">1973년</option><option value="1972">1972년</option><option value="1971">1971년</option><option value="1970">1970년</option><option value="1969">1969년</option><option value="1968">1968년</option><option value="1967">1967년</option><option value="1966">1966년</option><option value="1965">1965년</option><option value="1964">1964년</option><option value="1963">1963년</option><option value="1962">1962년</option><option value="1961">1961년</option><option value="1960">1960년</option><option value="1959">1959년</option><option value="1958">1958년</option><option value="1957">1957년</option><option value="1956">1956년</option><option value="1955">1955년</option><option value="1954">1954년</option><option value="1953">1953년</option><option value="1952">1952년</option><option value="1951">1951년</option><option value="1950">1950년</option><option value="1949">1949년</option><option value="1948">1948년</option><option value="1947">1947년</option><option value="1946">1946년</option><option value="1945">1945년</option><option value="1944">1944년</option><option value="1943">1943년</option><option value="1942">1942년</option><option value="1941">1941년</option><option value="1940">1940년</option><option value="1939">1939년</option><option value="1938">1938년</option><option value="1937">1937년</option><option value="1936">1936년</option><option value="1935">1935년</option><option value="1934">1934년</option><option value="1933">1933년</option><option value="1932">1932년</option><option value="1931">1931년</option><option value="1930">1930년</option><option value="1929">1929년</option><option value="1928">1928년</option><option value="1927">1927년</option><option value="1926">1926년</option><option value="1925">1925년</option><option value="1924">1924년</option><option value="1923">1923년</option><option value="1922">1922년</option><option value="1921">1921년</option><option value="1920">1920년</option><option value="1919">1919년</option><option value="1918">1918년</option><option value="1917">1917년</option><option value="1916">1916년</option><option value="1915">1915년</option><option value="1914">1914년</option><option value="1913">1913년</option><option value="1912">1912년</option><option value="1911">1911년</option><option value="1910">1910년</option><option value="1909">1909년</option><option value="1908">1908년</option><option value="1907">1907년</option><option value="1906">1906년</option><option value="1905">1905년</option><option value="1904">1904년</option><option value="1903">1903년</option><option value="1902">1902년</option><option value="1901">1901년</option><option value="1900">1900년</option></select>
						      <!-- <input type="text" class="form-control" name="busEstablishment" placeholder="ex) 2012년" required> -->
						   </div>
					</div>
					<div class="form-group col-md-6">						   
						   <div class="subtitles star">
						     정보 수신 이메일  
						     <!-- ::after -->
						   </div>
						   <div>
						 	 	 <c:if test="${not empty loginMember}">
						     		 <input type="text" class="form-control dis must" name="busEmail" placeholder="기존에 적었던 이메일 primary key 불러오기" value="${loginMember.memEmail}" required>
						     	</c:if> 
   						 	 	 <c:if test="${empty loginMember}">
						     		 <input type="text" class="form-control dis must" name="busEmail" placeholder="기존에 적었던 이메일 primary key 불러오기" required>
						     	</c:if> 
						   </div>
					</div>	   
			     </div>
			     	<br>
			    <div class="row">
			    	<div class="form-group col-md-6">
					   <div class="subtitles star">
					     담당자 연락처  
					     <!-- ::after -->
					   </div>
					   <div>
					  	  	<c:if test="${not empty loginMember}">
					      		<input type="text" class="form-control dis must" name="busPhone" placeholder="기존에 적었던 전화번호 불러오기" value="${loginMember.memPhone}" required>
					      	</c:if>
				      		 <c:if test="${ empty loginMember}">
				       			 <input type="text" class="form-control dis must" name="busPhone" placeholder="기존에 적었던 전화번호 불러오기" required>
					      	</c:if>
					   </div>
					</div>	   
					<div class="form-group col-md-6">	   
						   <div class="subtitles">
						     웹사이트 주소  
						   </div>
						   <div>
						      <input type="text" id="busSite" class="form-control dis" name="busWebsite" placeholder="URL 입력" required>
						   </div>
				   	</div>
			     </div>
			     			     			     <br>
			    <div>
				   <div class="subtitles">
				     뉴스 검색 키워드 <small>(키워드는 최대 3개까지 입력 가능합니다.)</small>  
				   </div>
				   <div>
				      <input type="text" class="form-control dis" name="searchKeywords" placeholder="서비스 명 혹은 브랜드 명 입력">
				   </div>
			     </div>
			     			     			     <br>
			    <div>
				   <div class="subtitles">
				     가입 경로 <small>(추천인 혹은 프로모션 코드 등을 입력해 주세요.)</small>  
				   </div>
				   <div>
				      <input type="text" class="form-control dis" name="regPath" placeholder="코드/ 추천인 연락처 입력">
				   </div>
			     </div>  
	      	</div>
 		</form>
 		<br>
	</div>
</section>
 		<div class="fixed-bottom position-sticky" style="height:6em; background-color: #F2F2F2;">
		    <div class="sticky-button">
		       <button type="button" id="startButton" style="width:7em; padding:8px; margin-top:8px; float:right; margin-right:7%;" class="btn btn-primary">시작하기</button>
		    </div>
	    </div> 
	    
	<div class="modal fade" id="confirmModal" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color: #151515;">
	      	  <img src="${path }/resources/images/Developers_black_logo.png" style="height:30px; width:30%; margin-left:5px;"/>
	      </div>
	      <div class="modal-body" id="customeSize">
	        <h3> 회사이름 수정 시 입력 한 회사 정보가 초기화 됩니다.</h3>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-outline-secondary btn-lg col-md-6" onclick="modalClose()">취소</button>
	      	<button type="button" class="btn btn-primary btn-lg col-md-6" onclick="location.reload()">초기화</button>
	      </div>
	    </div>
	  </div>
	</div>


<script type="text/javascript" src="${path}/resources/js/business-enroll.js"></script>


<!-- 접속자 통계 API 네이버 애널리스트 -->
<!-- <script type="text/javascript" id="" src="//wcs.naver.net/wcslog.js"></script> -->

<%-- <jsp:include page="/WEB-INF/views/business/footer.jsp"/> --%>