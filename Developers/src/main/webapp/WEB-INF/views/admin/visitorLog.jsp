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
			<h1 class="title">방문자 통계</h1>
			<div class="middle">
		        <div class="counting-sec">
		            <div class="inner-width" style="margin-bottom: 10px;">
		                <div class="col">
		                    <i class="far fa-smile-wink"></i>
		                    <div class="num">${visitorStats[3]}</div>
		                    	전체 방문자
		                </div>
		
		                <div class="col">
		                    <i class="fas fa-briefcase"></i>
		                    <div class="num">${visitorStats[2]}</div>
		                    	한 달 방문자
		                </div>
		
		                <div class="col">
		                    <i class="far fa-money-bill-alt"></i>
		                    <div class="num">${visitorStats[1]}</div>
		                    	일주일 방문자
		                </div>
		
		                <div class="col">
		                    <i class="far fa-object-group"></i>
		                    <div class="num">${visitorStats[0]}</div>
		                    	금일 방문자
		                </div>
		            </div>
		            <div class="inner-width">
		                <div class="col">
		                    <i class="far fa-smile-wink"></i>
		                    <div class="num">${highestVisitor.COUNT}</div>
		                    	최고 방문자 수
		                </div>
		
		                <div class="col">
		                    <i class="fas fa-briefcase"></i>
		                    <div class="date">${highestVisitor.DATE}</div>
		                    	최고 방문 기록 일자
		                </div>
		            </div>
		        </div>
		    </div>
		
		    <script>
		        $(".num").counterUp({delay:10, time:1000});
		    </script>
		</div>
		
		<div class="row">
			<h1 class="title">방문자 통계 - 차트(통합)
				
			</h1>
			<div class="row" id="chartAreaCom">
				<canvas id="visitorChartOne" aria-label="Hello ARIA World"></canvas>
				<script>
					//chart 작성
					var ctx = document.getElementById('chartAreaCom');
				</script>
			</div>
		</div>
		
		<div class="row">
			<h1 class="title">방문자 통계 - 차트(시간별)
		        <select class="dropdown-select-version select ad_select_style1" name="periodSelect" id="periodSelect">
		        	<option selected disabled hidden>기간선택</option>
				    <option value="A" <c:if test="${data eq 'A'}">selected</c:if>>전체</option>
		        	<option value="Y" <c:if test="${data eq 'Y'}">selected</c:if>>1년</option>
				    <option value="H" <c:if test="${data eq 'H'}">selected</c:if>>6개월</option>
				    <option value="M" <c:if test="${data eq 'M'}">selected</c:if>>한 달</option>
				    <option value="W" <c:if test="${data eq 'W'}">selected</c:if>>일주일</option>
				    <option value="D" <c:if test="${data eq 'W'}">selected</c:if>>금일</option>
		        </select>
		        <select class="dropdown-select-version select ad_select_style1" name="timeTermSelect" id="timeTermSelect">
		        	<option disabled >시간 간격</option>
				    <option value="7" <c:if test="${data eq 'all'}">selected</c:if>>전체</option>
		        	<option value="0" <c:if test="${data eq 'Y'}">selected</c:if>>1시간</option>
				    <option value="1" <c:if test="${data eq 'H'}">selected</c:if>>2시간</option>
				    <option value="2" <c:if test="${data eq 'H'}">selected</c:if>>3시간</option>
				    <option value="3" <c:if test="${data eq 'H'}">selected</c:if>>4시간</option>
				    <option value="4" <c:if test="${data eq 'H'}">selected</c:if>>6시간</option>
				    <option value="5" <c:if test="${data eq 'H'}">selected</c:if>>8시간</option>
				    <option value="6" <c:if test="${data eq 'M'}">selected</c:if>>12시간</option>
		        </select>
		        <!-- 
		        <select class="dropdown-select-version select ad_select_style1" name="timeSelect" id="timeSelect">
		        	<option disabled>시간대 선택</option>
		        	<option value="24" <c:if test="${data eq 'all'}">selected</c:if>>00:00~24:00</option>
		        </select>
		         -->
		        <select class="dropdown-select-version select ad_select_style1" name="chartSelect" id="chartSelect" style="width:auto">
		        	<option disabled>차트선택</option>
		        	<option value="bar" <c:if test="${chart eq 'bar'}">selected</c:if>>막대(Bar)</option>
				    <option value="line" <c:if test="${chart eq 'line'}">selected</c:if>>라인(Line)</option>
				    <option value="doughnut" <c:if test="${chart eq 'doughnut'}">selected</c:if>>도넛(Doughnut)</option>
				    <option value="pie" <c:if test="${chart eq 'doughnut'}">selected</c:if>>파이(Pie)</option>
				    <option value="radar" <c:if test="${chart eq 'doughnut'}">selected</c:if>>레이더(Radar)</option>
				    <option value="polarArea" <c:if test="${chart eq 'doughnut'}">selected</c:if>>극지방(Polar Area)</option>
		        </select>
			</h1>
			<script>
		        	const timeArray=[
		        		[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],
		        		[2,4,6,8,10,12,14,16,18,20,22,24],
		        		[3,6,9,12,15,18,21,24],
		        		[4,8,12,16,20,24],
		        		[6,12,18,24],
		        		[8,16,24],
		        		[12,24],
		        		[24]
		        	];
		        	
		        	$('#timeTermSelect').on("change", function() {
		        		var selectTimeTerm=$('#timeTermSelect option:selected').val();
		        		var target=document.getElementById('timeSelect');
		        		$('#timeSelect').empty();
		        		
		        		//텀 시간에 따른
		        		var term=0;
		        		switch(selectTimeTerm) {
			        		case "0":term=1;break;
			        		case "1":term=2;break;
			        		case "2":term=3;break;
			        		case "3":term=4;break;
			        		case "4":term=6;break;
			        		case "5":term=8;break;
			        		case "6":term=12;break;
			        		case "7":term=24;break;
		        		};
		        		/*
		        		for(var i=0; i< timeArray[selectTimeTerm].length; i++) {
			        		var opt=document.createElement("option");
		        			opt.value=timeArray[selectTimeTerm][i];
		        			if(timeArray[selectTimeTerm][i]<10) {
		        				var front="0"+(timeArray[selectTimeTerm][i]-term);
		        				var back="0"+timeArray[selectTimeTerm][i];
	        				} else {
	        					if(timeArray[selectTimeTerm][i]-term<10) {
	        						var front="0"+(timeArray[selectTimeTerm][i]-term);
	        					} else {
		        					var front=""+(timeArray[selectTimeTerm][i]-term);
	        					}
	        					var back=""+timeArray[selectTimeTerm][i];
	        				}
		        			opt.innerHTML = front+":00~"+back+":00";
		        		    target.appendChild(opt);
		        		}*/
		        		visitor_chartChange(
			        			$('#periodSelect option:selected').val(),
			        			$('#timeTermSelect option:selected').val(),
			        			$('#chartSelect option:selected').val()
			        		)
		        	});
		        	
		        	$('#periodSelect').on("change", function(){
		        		visitor_chartChange(
		        			$('#periodSelect option:selected').val(),
		        			$('#timeTermSelect option:selected').val(),
		        			$('#chartSelect option:selected').val()
		        		)
		        	})
		        	
		        	$('#timeSelect').on("change", function(){
		        		visitor_chartChange(
		        			$('#periodSelect option:selected').val(),
		        			$('#timeTermSelect option:selected').val(),
		        			$('#chartSelect option:selected').val()
		        		)
		        	})
		        	
		        	$('#chartSelect').on("change", function(){
		        		visitor_chartChange(
		        			$('#periodSelect option:selected').val(),
		        			$('#timeTermSelect option:selected').val(),
		        			$('#chartSelect option:selected').val()
		        		)
		        	})
		        </script>
		</div>
		<div class="row" id="chartAreaTime">
			<canvas id="visitorChartOne" aria-label="Hello ARIA World"></canvas>
			<script>	
				//chart 작성
				var ctx = document.getElementById('chartAreaTime');
				
				var myChart = new Chart(ctx, {
				    type: '${chart}',
				    data: {
				        labels: [],
				        datasets: [{
				            label: '일일 로그인 통계',
				            data: [${timeMap[0]},
				            	${timeMap[1]},
				            	${timeMap[2]},
				            	${timeMap[3]},
				            	${timeMap[4]},
				            	${timeMap[5]},
				            	${timeMap[6]}],
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
		</div>
		
	</div>
</section>
<style>

</style>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/admin_main.js"></script>