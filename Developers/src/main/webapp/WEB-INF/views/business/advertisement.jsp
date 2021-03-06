<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">    -->
<jsp:include page="/WEB-INF/views/business/header.jsp">
<jsp:param name="pageTitle" value="메인 화면" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- <link rel="stylesheet" href="${path}/resources/css/dashboard.css"> -->
<link rel="stylesheet" href="${path}/resources/css/style_ei.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
div.ad{
	background-color: #FFFFFF;

}
#content>*{
	font-size:15px;
}
@media (min-width: 576px){
.ad-left-area{
	padding-left:4%;
	}
}
@media (min-width: 576px){
#ad-area{
	padding-right:4%;
	}
}
@media (max-width: 767px){
#db-container{
	margin-top:48px;
	}
}

p.steps{
	border: 1px solid #0489B1;
	background-color: #0489B1;
	color:#FFFFFF;
	border-radius: 15px 15px 15px 15px;
	font-size:10px;
	font-weight:bold;
	padding:3px;
	width:6em;
}
p.steps-main{
	border: 1px solid #0B3861;
	background-color: #0B3861;
	color:#FFFFFF;
	border-radius: 15px 15px 15px 15px;
	font-size:10px;
	font-weight:bold;
	padding:3px;
	width:6em;
}
p.stepText{
	color:#086A87;
	font-size:15px;
}
p.stepText-main{
	color:#0B3861;
	font-size:15px;
}
div#headingOne, div#headingThree{
	background-color: #E6E6E6;
}
#inputGroupSelect01>option{
	font-size:12px;
}
div.selectPosition{
	opacity: 0.5;
}
div.selectPosition:hover{
	opacity: 1.0;
	cursor: pointer;
}
div#explanation{
	/* /float: left;
    height: 100%;
    width: 20%;
    background-color: #086A87;
    border-radius: 20px;
    color: #FFFFFF;
    text-align: center;
	padding-top: 1em;  */
	/* width: 20%; */
}
div#payment{
	/* float: right;
	height: 100%; */
}
div#bottom-info>input{
	height:2em;
	width:60%;
	text-align: center;
	margin-bottom:15px;
	border-color: #0489B1;
}
div.category_ad>*, div.main_ad>*{
	margin-bottom:15px;
}



</style>


<section id="content">
	<div class="header_fe hidden-xs">
		<div class="header_nav">
			<div class="hidden-xs">
				<nav class="nav">
					<ul class="ei_nav nav_us">
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/applicants.lbc">지원자</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/matchup.lbc">개발자 인재풀</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/position.lbc">채용 공고</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/ad.lbc">네트워크 광고</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/busInfo.lbc">회사정보</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/settings.lbc">계정 관리</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<div id='db-container' class='db-container'>
		<div class="ad-area row" style="background-color: #F2F2F2;">
			<div class="ad-left-area col-12 col-sm-4">
				<div class="bottom center favList">
					<div class="list-group left-menu" style="text-align:center; padding:5%;">
						<div><h4 style="color: #848484; padding:5%; text-align: justify;">광고를 등록하기 위해서는 최소 1개의 포지션을 등록해 놓아야 합니다. 포지션을 등록하지 않았다면 여기를 클릭해 주세요.</h4></div>
						<div class="top center forOpen" style="height: 100px;">
							<button id="enrollPosition" class="btn btn-success" style="background-color: #7B39BD; border-color: #7B39BD; padding:5%; margin-top:6%; font-size:15px;" onclick="location.href='${path}/business/enrollPosition.lbc?poNo=0'">포지션 등록하기</button>
						</div>
					</div>
					<div class="list-group left-menu">
						<a href="#" class="list-group-item list-group-item-action active" onclick="location.reload()">채용 광고 홈</a>
						<a href="#" class="list-group-item list-group-item-action" onclick="categoryAd('category'); return false;">직무 상단 광고<div class='countSelected'></div></a>
						<a href="#" class="list-group-item list-group-item-action" onclick="mainAd('main');return false;">메인 상단 광고<div class='countSelected'></div></a>
					</div>
				</div>
			</div>
			<div id="ad-area" class="col-12 col-sm-8">
				<div class="" style="text-align: center;">
					<div class="ad category_ad" style="margin-top:15px; padding-top:15px;">
						<h4>회사 홍보를 특정 직무에 하고 싶으신가요?</h4>
						<img  style="height:12em;" src="${path}/resources/images/categoryPageAd.png" alt="categoryAd">
						<p>디벨로퍼스의 직무별 잠재 구직자들을 타겟팅하여
							세분화된 직무마다 효율적으로 홍보할 수 있습니다.</p>
						<button class="btn btn-primary" style="font-size:15px;" onclick="categoryAd('category');">직무 상단 광고</button>
					</div>
					<div class="ad main_ad" style="margin-top:15px; padding-top:15px;">
						<h4>회사 홍보를 메인 페이지에 하고 싶으신가요?</h4>
						<img style="height:12em;" src="${path}/resources/images/mainPageAd.png" alt="mainAd">
						<p>디벨로퍼스의 메인 페이지에 모든 직무에 구분 없이
							노출하여 극도의 홍보효과를 누릴 수 있습니다.</p>
						<button class="btn btn-primary" style="font-size:15px;" onclick="mainAd('main');">메인 페이지 광고</button>
					</div>
				</div>
				<!-- 광고 노출 효과  -->
				<div class="ad_result" style="margin-top:20px;">
					<h4 style="background-color: #FFFFFF; font-weight:bold; text-align:center; padding:0.5em;">직무 상단 광고 결과</h4>
					<div class="category_table" style="height: 11em; overflow:scroll;">
						<table class="table table-sm table-dark" style="text-align:center;">
							<thead>
								<tr>
								<th scope="col">번호</th>
								<th scope="col">광고 내역</th>
								<th scope="col">상태</th>
								<th scope="col">기간</th>
								<th scope="col">클릭수</th>
								</tr>
							</thead>
							<tbody>
								<!-- 여기부터 자바스크립트  -->
								<c:if test="${not empty categoryList}">
									<c:forEach items="${categoryList}" var="c" varStatus="s">
										<tr>
										<th scope="row">${s.index+1}</th>
										<td>${c.position}</td>
										<td>
											<c:set var = "now" value = "<%= new java.util.Date()%>"/>
											<c:if test="${c.adEndDate ge now }">계제중</c:if>
											<c:if test="${c.adEndDate lt now }">종료</c:if>
										</td>
										<td><fmt:formatDate type = "date" 
											value = "${c.adStartDate}" /> ~ <fmt:formatDate type = "date" 
											value = "${c.adEndDate}" /></td>
										<td>${c.clickTimes}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<c:if test="${empty categoryList}">
							<div class="emptyCategory" style="text-align: center; padding:5em;">
								<p style="color:#585858">아직 진행중인 직무 상단 광고가 없습니다.<br>
									상단의 광고버튼으로 광고를 시작해보세요
								</p>
							</div>
						</c:if>
					</div>
					<h4 style="background-color: #FFFFFF; font-weight:bold; text-align:center; padding:0.5em; margin-top:2em;">메인 상단 광고 결과</h4>
						<div class="category_table" style="height: 11em; overflow:scroll; margin-bottom:15px;">
							<table class="table table-sm table-dark" style="text-align:center;">
								<thead>
									<tr>
									<th scope="col">번호</th>
									<th scope="col">광고 내역</th>
									<th scope="col">상태</th>
									<th scope="col">기간</th>
									<th scope="col">클릭수</th>
									</tr>
								</thead>
								<tbody>
									<!-- 여기부터 자바스크립트  -->
									<c:if test="${not empty mainList}">
										<c:forEach items="${mainList}" var="m" varStatus="s">
											<tr>
											<th scope="row">${s.index+1}</th>
											<td>${m.position}</td>
											<td>
												<c:set var = "now" value = "<%= new java.util.Date()%>"/>
												<c:if test="${m.adEndDate ge now }">계제중</c:if>
												<c:if test="${m.adEndDate lt now }">종료</c:if>
											</td>
											<td><fmt:formatDate type = "date" 
												value = "${m.adStartDate}" /> ~ <fmt:formatDate type = "date" 
												value = "${m.adEndDate}" /></td>
											<td>${m.clickTimes}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<c:if test="${empty categoryList}">
								<div class="emptyCategory" style="text-align: center; padding:5em;">
									<p style="color:#585858">아직 진행중인 직무 상단 광고가 없습니다.<br>
										상단의 광고버튼으로 광고를 시작해보세요
									</p>
								</div>
							</c:if>
						</div>
				</div>
			</div>
		</div>
	</div>	

</section>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var path = "${path}";
	var db_index = "${dbIndex}";
	var db_html = "${dbHtml}";
	var appl_index = "${applIndex}";

	var adLength=0;
	var positionName="";
	var positionNumber=0;


	function clickPositions(position){
		// $('#positionName').append(position[0].children[2].innerText);
		document.querySelectorAll("div.selectPosition").forEach(function(e){
			e.style.opacity="0.5";
		});
		position[0].style.opacity="1.0";
		positionName=position[0].children[2].innerText;
		document.querySelector('#positionName').value=positionName;
		document.querySelector('#until').value=position[0].children[4].innerText;
		positionNumber=position[0].children[5].value;
	
	}

	function clickOptions(option){
		let num=parseInt(option);
		if(num>0){
			adLength=num;
			document.querySelector('#adDate').value=num+"일";
		}else{
			document.querySelector('#adDate').value="";
		}
	}
	
	// var payment = function(email, name, phone, price, position, adLength){
	// 	this.email=memEmail;
	// 	this.name=memName;
	// 	this.phone=memPhone;
	// 	this.price=price;
	// 	this.positionName=positionName;
	// 	this.adLength=adLength;
	// }

	function agreeCheck(checked){
		console.log(checked);
		if(checked.target.checked!=true){
			checked.path[2].children[3].firstChild.setAttribute("disabled","disabled");
		}else{
			checked.path[2].children[3].firstChild.removeAttribute("disabled");
		}
	}

	var memEmail="${loginMember.memEmail}";
	var memName="${loginMember.memName}";
	var memPhone="${loginMember.memPhone}";

	
	// 결제 로직 
	function fn_payment(type){
		var finalPrice=0;
		var adType="";
		var msg="";
		if($("#positionName").val()!=""&&$("#until").val()!=""&&$("#adDate").val()!=""){ 
		if(type>1){
			// 메인 광고 
			let firstPrice=390000;
			let secondPrice= 680000;
			let thirdPrice= 970000;
			let forthPrice= 1200000;
			adType="메인 페이지 상단 광고";
			switch(adLength){
				case 7: finalPrice=firstPrice; break;
				case 14: finalPrice=secondPrice; break;
				case 21: finalPrice=thirdPrice; break;
				case 29: finalPrice=forthPrice; break;
				default: finalPrice=0;
					break;
			}
		}else{
			// 직무(category) 광고 
			let firstPrice=150000;
			let secondPrice= 290000;
			let thirdPrice= 430000;
			let forthPrice= 520000;
			adType="직무 페이지 상단 광고";
			switch(adLength){
				case 7: finalPrice=firstPrice; break;
				case 14: finalPrice=secondPrice; break;
				case 21: finalPrice=thirdPrice; break;
				case 29: finalPrice=forthPrice; break;
				default: finalPrice=0;
					break;
			}
		} 
	   var IMP = window.IMP;
	   IMP.init('iamport');
	   IMP.request_pay({
		   pg : 'html5_inicis',
		   pay_method : 'vbank',
		   merchant_uid : 'merchant_' + new Date().getTime(),
		   name : adType+" "+adLength+"일",
		   amount : finalPrice,
		   buyer_email : memEmail,
		   buyer_name : memName,
		   buyer_tel : memPhone,
		   buyer_addr : "",
		   buyer_postcode :""
	   }, function(rsp) {
		   if ( rsp.success ) {
			$.ajax({
				url:path+"/business/paySuccess",
				type:"post",
				async:false,
				data:{
					"adType":adType,
					"days":adLength,
					"positionNo":positionNumber
				},
				success:function(result){
					msg=JSON.parse(result);
				}
			});
			//   location.href="${path}/business/paySuccess?adType="+adType+"&days="+adLength+"&positionNo="+positionNumber;
			  alert(msg);
			  location.reload()
		   } 
		});
	}else{
			alert("선택하지 않은 정보가 있습니다. 단계별로 진행해 주세요.");
		}
	};

	




// $(function(){
// 	let msg="${msg}";
// 	console.log(typeof "${msg}");
// 	console.log(msg);
// 	if(msg!=undefined||msg!=null||msg!=""){
// 		alert(msg);
// 	}
// });


	
	// function payment(num){
    // if($("#positionName").val()!=""&&$("#until").val()!=""&&$("#adDate").val()!=""){ console.log("결제하기로");
    // }else{ alert("선택이 안된 정보가 있습니다. 단계별로 진행해 주세요.")}};


	// var agreeCheck=document.querySelectorAll('.agree');
	// var paymentBtn=document.querySelectorAll('.pay');
	
	// agreeCheck.forEach(function(e){
	// 	console.log(e);
	// 	});

	// alert("1단계 2단계 모두 선택해야 결재가 가능합니다.");


</script>
<!-- <script src="${path}/resources/js/db-main.js"></script>  -->

<script src="${path}/resources/js/advertisement.js"></script>



<jsp:include page="/WEB-INF/views/business/footer.jsp" />