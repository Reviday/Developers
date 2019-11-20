<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${path}/resources/css/adminstyle.css" rel="stylesheet" id="bootstrap-css">
<section id="content">
	<div class="container" style="height: 60px"></div>
	<div class="container chart_area">
		<div class="row" style="margin-bottom: 20px">
			<div class="middle">
		        <div class="counting-sec">
		            <div class="inner-width">
		                <div class="col">
		                    <i class="fas fa-sign-in-alt"></i>
		                    <div class="num">${statsList[3]}</div>
		                    	로그인 시도<br>(누계)
		                </div>
		
		                <div class="col">
		                    <i class="fas fa-check-circle"></i>
		                    <div class="num">${statsList[2]}</div>
		                    	로그인 성공<br>(누계)
		                </div>
		
		                <div class="col">
		                    <i class="fas fa-sun"></i>
		                    <div class="num">${statsList[1]}</div>
		                    	로그인 시도<br>(금일)
		                </div>
		
		                <div class="col">
		                    <i class="far fa-check-circle"></i>
		                    <div class="num">${statsList[0]}</div>
		                    	로그인 성공<br>(금일)
		                </div>
		            </div>
		        </div>
		    </div>
		
		    <script>
		        $(".num").counterUp({delay:10, time:1000});
		    </script>
		</div>
		<div class="row">
			<h1 class="title">로그인 로그 - 통계(7Days)
		        <select class="dropdown-select-version select ad_select_style1 chartTrigger" name="chartDataSelect" id="chartDataSelect">
		        	<option selected disabled hidden>데이터선택</option>
				    <option value="all" <c:if test="${data eq 'all'}">selected</c:if>>전체</option>
		        	<option value="Y" <c:if test="${data eq 'Y'}">selected</c:if>>로그인성공</option>
				    <option value="N" <c:if test="${data eq 'N'}">selected</c:if>>로그인실패</option>
		        </select>
		        <select class="dropdown-select-version select ad_select_style1 chartTrigger" name="chartSelect" id="chartSelect" style="width:auto">
		        	<option selected disabled hidden>차트선택</option>
		        	<option value="bar" <c:if test="${chart eq 'bar'}">selected</c:if>>막대(Bar)</option>
				    <option value="line" <c:if test="${chart eq 'line'}">selected</c:if>>라인(Line)</option>
				    <option value="doughnut" <c:if test="${chart eq 'doughnut'}">selected</c:if>>도넛(Doughnut)</option>
				    <option value="pie" <c:if test="${chart eq 'doughnut'}">selected</c:if>>파이(Pie)</option>
				    <option value="radar" <c:if test="${chart eq 'doughnut'}">selected</c:if>>레이더(Radar)</option>
				    <option value="polarArea" <c:if test="${chart eq 'doughnut'}">selected</c:if>>극지방(Polar Area)</option>
		        </select>
			</h1>
			
		</div>
		
		<div class="row" id="chartArea">
			<canvas id="memberLoginLogChart" aria-label="Hello ARIA World"></canvas>
			<script>
				//날짜 저장용 배열
				var arrDate = new Array(); //배열선언
				
				//날짜 사용하기
				for(var i=0; i<7; i++) {
					var date=new Date();
					var tempDate=date.getTime()-(i*24*60*60*1000);
					date.setTime(tempDate);
					var year=date.getFullYear();
					var month=date.getMonth()+1;
					var day=date.getDate();
					
					if(month<10) { month="0"+month } 
					if(day<10) { day="0"+day }
					
					arrDate[i]=year+"-"+month+"-"+day;
				}
			</script>
			<c:if test="${data eq 'all'}">
			<script>	
				//chart 작성
				var ctx = document.getElementById('memberLoginLogChart');
				
				var myChart = new Chart(ctx, {
				    type: '${chart}',
				    data: {
				        labels: [arrDate[6], arrDate[5], arrDate[4], arrDate[3], arrDate[2], arrDate[1], arrDate[0]+'(Today)'],
				        datasets: [{
				            label: '로그인 성공',
				            data: [${chartListS[0].COUNT},
				            	${chartListS[1].COUNT},
				            	${chartListS[2].COUNT},
				            	${chartListS[3].COUNT},
				            	${chartListS[4].COUNT},
				            	${chartListS[5].COUNT},
				            	${chartListS[6].COUNT}],
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(255, 96, 6, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)',
				                'rgba(54, 162, 235, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(255, 96, 6, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)',
				                'rgba(54, 162, 235, 1)'
				            ],
				            borderWidth: 1
				        },
				        {
				            label: '로그인 실패',
				            data: [${chartListF[0].COUNT},
				            	${chartListF[1].COUNT},
				            	${chartListF[2].COUNT},
				            	${chartListF[3].COUNT},
				            	${chartListF[4].COUNT},
				            	${chartListF[5].COUNT},
				            	${chartListF[6].COUNT}],
				            backgroundColor: [
				                'rgba(255, 206, 86, 0.5)',
				                'rgba(255, 159, 64, 0.5)',
				                'rgba(153, 102, 255, 0.5)',
				                'rgba(75, 192, 192, 0.5)',
				                'rgba(54, 162, 235, 0.5)',
				                'rgba(255, 96, 6, 0.5)',
				                'rgba(255, 99, 132, 0.5)'
				            ],
				            borderColor: [
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 159, 64, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(255, 96, 6, 1)',
				                'rgba(255, 99, 132, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero: true
				                }
				            }]
				        }
				    }
				});
			</script>
			</c:if>
			<c:if test="${data ne 'all'}">
			<script>	
				//chart 작성
				var ctx = document.getElementById('memberLoginLogChart');
				
				var myChart = new Chart(ctx, {
				    type: '${chart}',
				    data: {
				        labels: [arrDate[6], arrDate[5], arrDate[4], arrDate[3], arrDate[2], arrDate[1], arrDate[0]+'(Today)'],
				        datasets: [{
				            label: '일일 로그인 통계',
				            data: [${chartList[0].COUNT},
				            	${chartList[1].COUNT},
				            	${chartList[2].COUNT},
				            	${chartList[3].COUNT},
				            	${chartList[4].COUNT},
				            	${chartList[5].COUNT},
				            	${chartList[6].COUNT}],
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)',
				                'rgba(255, 96, 6, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)',
				                'rgba(255, 96, 6, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero: true
				                }
				            }]
				        }
				    }
				});
			</script>
			</c:if>
		</div>
	</div>
	<div class="container mainContent">
		<div class="row">
			<h1 class="title">로그인 로그</h1>
		</div>
		<div class="row">
			<div class="input-group" style="width: 50%;">
				<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
				<input class="form-control" id="system-search" 
					placeholder="Search for" required> <span
					class="input-group-btn">
					<button type="button" class="btn btn-default" onclick="mll_search(0);">
						<i class="fas fa-search"></i>
					</button>
				</span>
			</div>
			<table class="table table-list-search rwd-table">
				<thead>
					<tr>
						<th>No.</th>
						<th>
							<div class="dropdown" style="display: inline-block;">
						        <select class="dropdown-select-version select" name="mllSuccess" id="mllSuccess" style="vertical-align: top; height: 21px; width: 62px; margin: 0; margin-left: 10px; color: #dd5;">
						        	<option value="R" selected disabled hidden>결과</option>
						        	<option value="A" <c:if test="${mllSuccess eq 'A'}">selected</c:if>>전체</option>
						        	<option value="Y" <c:if test="${mllSuccess eq 'Y'}">selected</c:if>>성공</option>
								    <option value="N" <c:if test="${mllSuccess eq 'N'}">selected</c:if>>실패</option>
						        </select>
						    </div>
						</th>
						<th class="hidden_th">사유</th>
						<th>이메일</th>
						<th>일시</th>
						<th>접속IP</th>
						<th class="hidden_th">UserAgent</th>
						<th class="hidden_th">URL</th>
						<th class="hidden_th">Referer</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty logList}">
						<c:forEach items="${logList }" var="l">
						<tr>
							<td data-th="No.">${l.mllNo }</td>
							<td class="mb-text-align-left" data-th="수행결과" style="text-align: center">
								<c:if test="${l.mllSuccess eq 'Y'}">성공</c:if>
								<c:if test="${l.mllSuccess eq 'N'}">실패</c:if>
							</td>
							<td class="hidden_td" data-th="사유">${l.mllReason}</td>
							<td data-th="이메일">${l.mllUserEmail}</td>
							<td data-th="일시">
								<c:if test="${l.mllDatetime ne null }">
									<fmt:formatDate value="${l.mllDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</c:if>
							</td>
							<td data-th="접속IP">${l.mllIp }</td>
							<td class="hidden_td" data-th="UserAgent">${l.mllUseragent}</td>
							<td class="hidden_td" data-th="URL">${l.mllUrl}</td>
							<td class="hidden_td" data-th="Referer">${l.mllReferer}</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty logList}">
						<tr>
							<td colspan="9">
								결과가 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<div class="container text-align-center">
			<c:if test="${pageBar ne null }">
				${pageBar}
			</c:if>
			<input type="hidden" value="${cPage}" id="cPage"/>
			<input type="hidden" value="${numPerPage}" id="numPerPage"/> 
			<script>
				$('#system-search').on("keyup", function(key) {
					if(key.keyCode == 13) {
						mll_search(0);
					}
				});
				$('#mllSuccess').on('change', function() {
					mll_search(0);
				});
			</script>
		</div>
	</div>
</section>
<style>

</style>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/admin_main.js"></script>