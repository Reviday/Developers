<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<style>
	.sortBtn {
		font-size: 0.6em;
    	margin: 3px 0 0 4px;
    	vertical-align: top;
	}
	@media (max-width : 767px) {
		#chartAreaMapDiv {
			dispaly: none !important;
		}
		.num {
			font-size: 3em !important;
		}
	}
	@media (min-width : 1200px) {
		.col-margin {
			margin-left:40px;
		}
	}
}
</style>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${path}/resources/css/adminstyle.css" rel="stylesheet" id="bootstrap-css">
<section id="content">
	<div class="container" style="height: 60px"></div>
	<div class="container" id="stats_area">
		<div class="row">
			<h1 class="title">홈페이지 기능 통계</h1>
		</div>
		<div class="row" style="margin-bottom: 20px">
			<div class="middle">
		        <div class="counting-sec">
		            <div class="inner-width" style="margin-bottom: 20px">
		                <div class="col">
		                    <i class="fas fa-copy"></i>
		                    <div class="num">${divCount[1]}</div>
		                    	페이지 전환 횟수
		                </div>
						<div class="row chartArea">
							<canvas id="chartAreaMapDiv" style="margin:auto; padding: 10px; height:40vh; min-height:150px; max-height:205px; width:50vw; min-width:180px; max-width:270px"></canvas>
							<script>
								//chart 작성
								var ctx = document.getElementById('chartAreaMapDiv');
								
								var myChart = new Chart(ctx, {
								    type: 'doughnut',
								    data: {
								        labels: ['페이지 기능 횟수',
								        		'페이지 전환 횟수'],
								        datasets: [{
								            label: '방문자 통계',
								            data: [${divCount[0]},
								            	${divCount[1]}],
								            backgroundColor: [
								                'rgba(255, 99, 132, 0.2)',
								                'rgba(54, 162, 235, 0.2)'
								            ],
								            borderColor: [
								                'rgba(255, 99, 132, 1)',
								                'rgba(54, 162, 235, 1)'
								            ],
								            borderWidth: 1
								        }]
								    },
								    options: {
								    	responsive: false,
										scales: {
											yAxes: [{
												ticks: {
													beginAtZero: true
												}
											}]
										},
								    }
								});
							</script>
						</div>
		                <div class="col">
		                    <i class="fab fa-google-wallet"></i>
		                    <div class="num">${divCount[0]}</div>
		                    	페이지 기능 횟수
		                </div>
		            </div>
		            <div class="inner-width" style="height:auto">
		            	<div class="row">
			                <div class="col col-margin">
			                	<canvas id="chartAreaMapAdmin" style="margin:auto; padding: 10px; height:40vh; max-height:205px; width:50vw; max-width:200px"></canvas>
								<script>
									//chart 작성
									var ctx = document.getElementById('chartAreaMapAdmin');
									
									var myChart = new Chart(ctx, {
									    type: 'doughnut',
									    data: {
									        labels: ['페이지 기능 횟수',
									        		'페이지 전환 횟수'],
									        datasets: [{
									            label: '방문자 통계',
									            data: [${adminCount[0]},
									            	${adminCount[1]}],
									            backgroundColor: [
									            	'rgba(255, 206, 86, 0.2)',
									                'rgba(75, 192, 192, 0.2)'
									            ],
									            borderColor: [
									            	'rgba(255, 206, 86, 1)',
									                'rgba(75, 192, 192, 1)'
									            ],
									            borderWidth: 1
									        }]
									    },
									    options: {
									    	responsive: false,
											scales: {
												yAxes: [{
													ticks: {
														beginAtZero: true
													}
												}]
											},
									    }
									});
								</script>
			                    <i class="fab fa-redhat"></i>
			                    <div class="num">${authCount[0]}</div>
			                    	관리자권한 사용 횟수
			                </div>
			                <div class="col col-margin">
								<canvas id="chartAreaMapBus" style="margin:auto; padding: 10px; height:40vh; max-height:205px; width:50vw; max-width:200px"></canvas>
								<script>
									//chart 작성
									var ctx = document.getElementById('chartAreaMapBus');
									
									var myChart = new Chart(ctx, {
									    type: 'doughnut',
									    data: {
									        labels: ['페이지 기능 횟수',
									        		'페이지 전환 횟수'],
									        datasets: [{
									            label: '방문자 통계',
									            data: [${busCount[0]},
									            	${busCount[1]}],
									            backgroundColor: [
									            	'rgba(153, 102, 255, 0.2)',
									                'rgba(255, 159, 64, 0.2)'
									            ],
									            borderColor: [
									            	'rgba(153, 102, 255, 1)',
									                'rgba(255, 159, 64, 1)'
									            ],
									            borderWidth: 1
									        }]
									    },
									    options: {
									    	responsive: false,
											scales: {
												yAxes: [{
													ticks: {
														beginAtZero: true
													}
												}]
											},
									    }
									});
								</script>
			                    <i class="fas fa-building"></i>
			                    <div class="num">${authCount[1]}</div>
			                    	기업권한 사용 횟수
			                </div>
						</div>
						<div class="row">
			                <div class="col col-margin">
			                	<canvas id="chartAreaMapMem" style="margin:auto; padding: 10px; height:40vh; max-height:205px; width:50vw; max-width:200px"></canvas>
								<script>
									//chart 작성
									var ctx = document.getElementById('chartAreaMapMem');
									
									var myChart = new Chart(ctx, {
									    type: 'doughnut',
									    data: {
									        labels: ['페이지 기능 횟수',
									        		'페이지 전환 횟수'],
									        datasets: [{
									            label: '방문자 통계',
									            data: [${memCount[0]},
									            	${memCount[1]}],
									            backgroundColor: [
									                'rgba(39, 204, 153, 0.2)',
									                'rgba(73, 105, 255, 0.2)'
									            ],
									            borderColor: [
									            	'rgba(39, 204, 153, 1)',
									                'rgba(73, 105, 255, 1)'
									            ],
									            borderWidth: 1
									        }]
									    },
									    options: {
									    	responsive: false,
											scales: {
												yAxes: [{
													ticks: {
														beginAtZero: true
													}
												}]
											},
									    }
									});
								</script>
			                    <i class="fas fa-user-tie"></i>
			                    <div class="num">${authCount[3]}</div>
			                    	회원권한 사용 횟수
			                </div>
			
			                <div class="col col-margin">
			                	<canvas id="chartAreaMapNon" style="margin:auto; padding: 10px; height:40vh; max-height:205px; width:50vw; max-width:200px"></canvas>
								<script>
									//chart 작성
									var ctx = document.getElementById('chartAreaMapNon');
									
									var myChart = new Chart(ctx, {
									    type: 'doughnut',
									    data: {
									        labels: ['페이지 기능 횟수',
									        		'페이지 전환 횟수'],
									        datasets: [{
									            label: '방문자 통계',
									            data: [${nonCount[0]},
									            	${nonCount[1]}],
									            backgroundColor: [
									                'rgba(255, 250, 219, 0.2)',
									                'rgba(156, 169, 255, 0.2)'
									            ],
									            borderColor: [
									                'rgba(255, 250, 219, 1)',
									                'gba(156, 169, 255, 1)'
									            ],
									            borderWidth: 1
									        }]
									    },
									    options: {
									    	responsive: false,
											scales: {
												yAxes: [{
													ticks: {
														beginAtZero: true
													}
												}]
											},
									    }
									});
								</script>
			                    <i class="fas fa-cubes"></i>
			                    <div class="num">${authCount[2]}</div>
			                    	기본권한 사용 횟수
			                </div>
		                </div>
		            </div>
		        </div>
		    </div>
		
		    
		</div>
		<div class="row">
			<h1 class="title">홈페이지 기능 통계 - 권한 별 사용 기능(상위 5개)</h1>
		</div>
		<div class="row" style="margin-bottom: 20px">
			<div class="middle">
		        <div class="counting-sec">
		            <div class="inner-width" style="height:auto">
		            	<div class="row">
			                <div class="col col-margin">
			                	<span>관리자권한</span>
			                	<canvas id="chartAreaMapAdminUse" style="padding: 10px; height: 40vh; max-height:400px; width:40vw; max-width:500px"></canvas>
								<script>
									//chart 작성
									var ctx = document.getElementById('chartAreaMapAdminUse');
									
									var myChart = new Chart(ctx, {
									    type: 'pie',
									    data: {
									        labels: ['${adminUsedCount[0].DETAIL}',
									        	'${adminUsedCount[1].DETAIL}',
									        	'${adminUsedCount[2].DETAIL}',
									        	'${adminUsedCount[3].DETAIL}',
									        	'${adminUsedCount[4].DETAIL}',],
									        datasets: [{
									            label: '관리자 권한 통계',
									            data: [${adminUsedCount[0].COUNT},
									            	${adminUsedCount[1].COUNT},
									            	${adminUsedCount[2].COUNT},
									            	${adminUsedCount[3].COUNT},
									            	${adminUsedCount[4].COUNT}],
									            backgroundColor: [
									            	'rgba(255, 99, 132, 0.2)',
									                'rgba(54, 162, 235, 0.2)',
									                'rgba(255, 206, 86, 0.2)',
									                'rgba(75, 192, 192, 0.2)',
									                'rgba(153, 102, 255, 0.2)'
									            ],
									            borderColor: [
									            	'rgba(255, 99, 132, 1)',
									                'rgba(54, 162, 235, 1)',
									                'rgba(255, 206, 86, 1)',
									                'rgba(75, 192, 192, 1)',
									                'rgba(153, 102, 255, 1)'
									            ],
									            borderWidth: 1
									        }]
									    },
									    options: {
									    	responsive: false,
											scales: {
												yAxes: [{
													ticks: {
														beginAtZero: true
													}
												}]
											},
									    }
									});
								</script>
			                    
			                </div>
			                <div class="col col-margin">
			                	<span>기업권한</span>
								<canvas id="chartAreaMapBusUse" style="padding: 10px; height: 40vh; max-height:400px; width:40vw; max-width:500px"></canvas>
								<script>
									//chart 작성
									var ctx = document.getElementById('chartAreaMapBusUse');
									
									var myChart = new Chart(ctx, {
									    type: 'pie',
									    data: {
									        labels: ['${busUsedCount[0].DETAIL}',
									        	'${busUsedCount[1].DETAIL}',
									        	'${busUsedCount[2].DETAIL}',
									        	'${busUsedCount[3].DETAIL}',
									        	'${busUsedCount[4].DETAIL}',],
									        datasets: [{
									            label: '기업 권한 통계',
									            data: [${busUsedCount[0].COUNT},
									            	${busUsedCount[1].COUNT},
									            	${busUsedCount[2].COUNT},
									            	${busUsedCount[3].COUNT},
									            	${busUsedCount[4].COUNT}],
									            backgroundColor: [
									            	'rgba(255, 99, 132, 0.2)',
									                'rgba(54, 162, 235, 0.2)',
									                'rgba(255, 206, 86, 0.2)',
									                'rgba(75, 192, 192, 0.2)',
									                'rgba(153, 102, 255, 0.2)'
									            ],
									            borderColor: [
									            	'rgba(255, 99, 132, 1)',
									                'rgba(54, 162, 235, 1)',
									                'rgba(255, 206, 86, 1)',
									                'rgba(75, 192, 192, 1)',
									                'rgba(153, 102, 255, 1)'
									            ],
									            borderWidth: 1
									        }]
									    },
									    options: {
									    	responsive: false,
											scales: {
												yAxes: [{
													ticks: {
														beginAtZero: true
													}
												}]
											},
									    }
									});
								</script>
			                </div>
						</div>
						<div class="row">
			                <div class="col col-margin">
			                	<span>멤버권한</span>
			                	<canvas id="chartAreaMapMemUse" style="padding: 10px; height: 40vh; max-height:400px; width:40vw; max-width:500px"></canvas>
								<script>
									//chart 작성
									var ctx = document.getElementById('chartAreaMapMemUse');
									
									var myChart = new Chart(ctx, {
									    type: 'pie',
									    data: {
									        labels: ['${memUsedCount[0].DETAIL}',
									        	'${memUsedCount[1].DETAIL}',
									        	'${memUsedCount[2].DETAIL}',
									        	'${memUsedCount[3].DETAIL}',
									        	'${memUsedCount[4].DETAIL}',],
									        datasets: [{
									            label: '멤버 권한 통계',
									            data: [${memUsedCount[0].COUNT},
									            	${memUsedCount[1].COUNT},
									            	${memUsedCount[2].COUNT},
									            	${memUsedCount[3].COUNT},
									            	${memUsedCount[4].COUNT}],
									            backgroundColor: [
									            	'rgba(255, 99, 132, 0.2)',
									                'rgba(54, 162, 235, 0.2)',
									                'rgba(255, 206, 86, 0.2)',
									                'rgba(75, 192, 192, 0.2)',
									                'rgba(153, 102, 255, 0.2)'
									            ],
									            borderColor: [
									            	'rgba(255, 99, 132, 1)',
									                'rgba(54, 162, 235, 1)',
									                'rgba(255, 206, 86, 1)',
									                'rgba(75, 192, 192, 1)',
									                'rgba(153, 102, 255, 1)'
									            ],
									            borderWidth: 1
									        }]
									    },
									    options: {
									    	responsive: false,
											scales: {
												yAxes: [{
													ticks: {
														beginAtZero: true
													}
												}]
											},
									    }
									});
								</script>
			                </div>
			
			                <div class="col col-margin">
			                	<span>기본권한</span>
			                	<canvas id="chartAreaMapNonUse" style="padding: 10px; height: 40vh; max-height:400px; width:40vw; max-width:500px"></canvas>
								<script>
									//chart 작성
									var ctx = document.getElementById('chartAreaMapNonUse');
									
									var myChart = new Chart(ctx, {
									    type: 'pie',
									    data: {
									        labels: ['${nonUsedCount[0].DETAIL}',
									        	'${nonUsedCount[1].DETAIL}',
									        	'${nonUsedCount[2].DETAIL}',
									        	'${nonUsedCount[3].DETAIL}',
									        	'${nonUsedCount[4].DETAIL}',],
									        datasets: [{
									            label: '기본 권한 통계',
									            data: [${nonUsedCount[0].COUNT},
									            	${nonUsedCount[1].COUNT},
									            	${nonUsedCount[2].COUNT},
									            	${nonUsedCount[3].COUNT},
									            	${nonUsedCount[4].COUNT}],
									            backgroundColor: [
									            	'rgba(255, 99, 132, 0.2)',
									                'rgba(54, 162, 235, 0.2)',
									                'rgba(255, 206, 86, 0.2)',
									                'rgba(75, 192, 192, 0.2)',
									                'rgba(153, 102, 255, 0.2)'
									            ],
									            borderColor: [
									            	'rgba(255, 99, 132, 1)',
									                'rgba(54, 162, 235, 1)',
									                'rgba(255, 206, 86, 1)',
									                'rgba(75, 192, 192, 1)',
									                'rgba(153, 102, 255, 1)'
									            ],
									            borderWidth: 1
									        }]
									    },
									    options: {
									    	responsive: false,
											scales: {
												yAxes: [{
													ticks: {
														beginAtZero: true
													}
												}]
											},
									    }
									});
								</script>
		                </div>
		            </div>
		        </div>
		    </div>
		    <script>
		        $(".num").counterUp({delay:10, time:1000});
		    </script>
	</div>
	<div class="container" id="mapperCounter">
		<div class="row">
			<h1 class="title">기능별 사용 횟수</h1>
		</div>
		<div class="row">
			<table class="table table-list-search rwd-table" id="mappingCountListTB">
				<thead>
					<tr>
						<th style="max-width:200px !important">매핑값<button class="sortBtn" type="button" id="mapperDESC">▼</button></th>
						<th>구분</th>
						<th style="max-width:200px !important">상세정보</th>
						<th>권한</th>
						<th>횟수<button class="sortBtn" type="button" id="countDESC">▼</button></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty mcList}">
						<c:forEach items="${mcList }" var="m">
						<tr>
							<td data-th="매핑값" style="max-width:200px !important">${m.mapper }</td>
							<td data-th="구분">${m.mapDiv }</td>
							<td data-th="상세정보" style="max-width:200px !important">${m.detail }</td>
							<td data-th="권한">${m.authority }</td>
							<td data-th="횟수">${m.count } 회</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty mcList}">
						<tr>
							<td colspan="5">
								결과가 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<script>
				$('.sortBtn').on('click', function() {
					var id = $(this).attr('id');
					mapperCountSort(id);
				});
			</script>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/admin_main.js"></script>