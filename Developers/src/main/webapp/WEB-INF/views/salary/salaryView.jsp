<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mainSearch.css">
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<!-- Step 2) Load billboard.js with style -->
<script src="${path }/resources/js/billboard.js"></script>
<!-- Load with base style -->
<link rel="stylesheet" href="${path }/resources/css/billboard.css">
<style>
div {
	margin: 0;
    padding: 0;
    border: 0;
}
#salary-main {
	background: #fff;
}

.salary-header-mid {
	max-width: 1060px;
}

@media ( min-width : 1200px) {
	.salary-header-mid {
		margin: 0 auto;
		width: 87.72%;
	}
}

@media ( max-width : 1199px) and (min-width: 992px) {
	.salary-header-mid {
		margin: 0 auto;
		width: 90%;
	}
}

@media ( max-width : 991px) and (min-width: 768px) {
	.salary-header-mid {
		margin: 0 auto;
		width: 90%;
	}
}

@media ( min-width : 768px) {
	.chartPanel {
		max-height: 400px;
	}
}

.chartPanel {
	position: relative;
	min-height: 350px;
	padding-top: 40px;
	padding-bottom: 40px;
	margin-bottom: 40px;
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
	background-color: #22bd79;
	}
}
.iaCoI {
    position: absolute;
    left: 0;
    right: 0;
    bottom: -24px;
}
@media (max-width: 991px) and (min-width: 768px){
.cvNFVy {
    width: 90%;
	}
}
@media (max-width: 1199px) and (min-width: 992px){
.cvNFVy {
    width: 90%;
	}
}
.cvNFVy {
    position: relative;
    margin-left: auto;
    margin-right: auto;
    max-width: 1060px;
}
.hgxWgi {
    background: #FFFFFF;
    box-shadow: 0 2px 2px 0 rgba(1,1,1,0.2);
}
@media (min-width: 768px){

.DxufZ {
    display: inline-block;
    width: 23%;
    border-right: 1px solid #EEEEEE;
	}
}

.DxufZ {
    position: relative;
}
.esQZxO {
    position: relative;
}
@media (min-width: 768px){
.lhajdW {
    display: inline-block;
    width: 23%;
    border-right: 1px solid #EEEEEE;
	}
}
.lhajdW {
    position: relative;
}
.ddiEBf {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    box-shadow: none !important;
    box-sizing: border-box;
    outline: none !important;
    resize: none;
    color: #333333;
    font-size: 16px;
    margin-bottom: 0;
    padding: 13px 15px;
    border-radius: 0;
    border: 0;
    width: 100%;
    background-color: transparent;
}
.esQZxO:after {
    content: '';
    position: absolute;
    top: 50%;
    right: 15px;
    -webkit-tranform: translateY(-50%);
    tranform: translateY(-50%);
    border-top: 6px solid #B5B5B5;
    border-left: 4px solid transparent;
    border-right: 4px solid transparent;
}
@media (min-width: 768px){
.DxufZ {
    display: inline-block;
    width: 23%;
    border-right: 1px solid #EEEEEE;
	}
}
.DxufZ {
    position: relative;
}
@media (min-width: 768px){
.DxufZ {
    display: inline-block;
    width: 23%;
    border-right: 1px solid #EEEEEE;
	}
}
.DxufZ {
    position: relative;
}
@media (min-width: 768px){
.DxufZ:last-child {
    border-right: 0;
	}
}
@media (min-width: 768px){
.DxufZ {
    display: inline-block;
    width: 23%;
    border-right: 1px solid #EEEEEE;
	}
}
.DxufZ {
    position: relative;
}
select {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: black;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: menulist;
    box-sizing: border-box;
    align-items: center;
    white-space: pre;
    -webkit-rtl-ordering: logical;
    background-color: white;
    cursor: default;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-radius: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(169, 169, 169);
    border-image: initial;
}

@media (max-width: 991px) and (min-width: 768px){
.fJPCED {
    margin-left: 20px;
    margin-bottom: 20px;
    width: 23%;
	}
}
@media (max-width: 1199px) and (min-width: 992px){
.fJPCED {
    margin-left: 20px;
    margin-bottom: 20px;
    width: 23%;
	}
}
@media (min-width: 1200px){
.fJPCED {
    margin-left: 20px;
    margin-bottom: 20px;
    width: 23%;
	}
}

.fJPCED {
    position: relative;
    margin-left: 10px;
    margin-bottom: 10px;
    float: left;
    width: 23%;
}
.fhqaWK::after {
    content: "만원";
    position: absolute;
    top: 50%;
    right: 15px;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
    color: #B5B5B5;
}
.eSpziA {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    box-shadow: none !important;
    box-sizing: border-box;
    outline: none !important;
    resize: none;
    color: #333333;
    font-size: 16px;
    margin-bottom: 0;
    padding: 13px 15px;
    border-radius: 0;
    border: 0;
    width: 100%;
}
</style>
<div style="height: 50px"></div>
<section id="salary-main">
	<div class="chartPanel">
		<div class="salary-header-mid">
			<!--연봉 그래프 시작  -->
			<div id="salary-chart"></div>
			<div>연봉정보</div>
		</div>
		<!--연봉 그래프 완료 -->
	
		<!--직군별 연봉 검색시작  -->
		<div class="salary-header-mid">
			<div class="Absolute-ievQjk iaCoI">
				<div class="Container-gZqETv cvNFVy">
					<div class="Box-cwadsP hgxWgi">
						<div class="InputBox-eMDCpm DxufZ">
							<span class="Select__SelectBox-gLnYwz esQZxO">
							<select class="Input-hxTtdt ddiEBf" id="jobGroup">
									<option value="" disabled="disabled">직군</option>
									<option value="j0">개발</option>
									<option value="j1">비개발</option>
							</select>
							</span>
						</div>

						<div class="InputBox-eMDCpm DxufZ">
							<span class="Select__SelectBox-gLnYwz esQZxO"> 
							<select class="Input-hxTtdt ddiEBf" id="jobField">
									<option value="" disabled="">직무</option>
									<option value="f0">전체</option>
									<option value="f1">C,C++개발자</option>
									<option value="f2">CTO,Chief Technology Officer</option>
									<option value="f3">DevOps / 시스템 관리자</option>
									<option value="f4">iOS 개발자</option>
									<option value="f5">.NET 개발자</option>
									<option value="f6">Node.js 개발자</option>
									<option value="f7">PHP 개발자</option>
									<option value="f8">QA,테스트 엔지니어</option>
									<option value="f9">개발 매니저</option>
									<option value="f10">그래픽스 엔지니어</option>
									<option value="f11">데이터 엔지니어</option>
									<option value="f12">루비온레일즈 개발자</option>
									<option value="f13">보안 엔지니어</option>
									<option value="f14">서버 개발자</option>
									<option value="f15">시스템,네트워크 관리자</option>
									<option value="f16">안드로이드 개발자</option>
									<option value="f17">영상,음성 엔지니어</option>
									<option value="f18">웹 개발자</option>
									<option value="f19">웹 퍼블리셔</option>
									<option value="f20">임베디드 개발자</option>
									<option value="f21">자바 개발자</option>
									<option value="f22">파이썬 개발자</option>
									<option value="f23">프로덕트 매니저</option>
									<option value="f24">프론트엔드 개발자</option>
									<option value="f25">하드웨어 엔지니어</option>
							</select>
							</span>
						</div>

						<div class="InputBox-eMDCpm lhajdW">
							<span class="Select__SelectBox-gLnYwz esQZxO"> <select
								class="Input-hxTtdt ddiEBf">
									<option selected="" value="" disabled="">경력</option>
									<option value="0">신입</option>
									<option value="1">1년</option>
									<option value="2">2년</option>
									<option value="3">3년</option>
									<option value="4">4년</option>
									<option value="5">5년</option>
									<option value="6">6년</option>
									<option value="7">7년</option>
									<option value="8">8년</option>
									<option value="9">9년</option>
									<option value="10">10년</option>
							</select>
							</span>
						</div>
						<div class="SalaryInputBox-ktBCnJ fhqaWK InputBox-eMDCpm DxufZ"
							style="width: 25%;">
							<input class="Input-hxTtdt eSpziA" type="text" placeholder="연봉">
						</div>
					</div>
				</div>
			</div>
			<!--직군별 연봉 검색완료  -->
		</div>
	</div>

</section>

<!-- ajax통신 -->
<!--선택된 연봉정보 DB에서 가지고 오기 시작  -->
<script type="text/javascript">
$("#jobGroup").change(function(){
 	var jobGroup= $(this).val();
	console.log(jobGroup);
		location.href='${path }/salary/salaryJobGroupSelect.do?jobGroup'+jobGroup;
});


$("#jobField").change(function(){
	var jobField= $(this).val();
	console.log(jobField);	
	location.href='${path }/salary/salaryJobGroupSelect.do?jobField='+jobField;
});






</script>
<!--선택된 직군정도 DB에서 가지고 오기 완료  -->

<!--연봉차트 생성 시작  -->
<script type="text/javascript">
	var chart = bb.generate({
		bindto : "#salary-chart",
		padding : {
			top : 50

		},
		data : {
			type : "bar",

			columns : [

			[ "연봉", 2696, 2986, 3249, 3497, 3742, 3989, 4232, 4480, 4707, 4873,
					5133 ]

			],
			selection : {
				enabled : true,
				draggable : true
			},
			types : {
				연봉 : "bar",
				data2 : "line"
			},
			colors : {
				연봉 : "#333333"
			}
		},
		axis : {
			x : {
				type : "category",
				categories : [ "신입", "1년차", "2년차", "3년차", "4년차", "5년차", "6년차",
						"7년차", "8년차", "9년차", "10년차" ]
			},
	

		},
		legend : {
			show : false
		}

	});
	chart.data.names({
		연봉 : "연봉"
	});
</script>
<!--연봉차트 생성  완료 -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>








