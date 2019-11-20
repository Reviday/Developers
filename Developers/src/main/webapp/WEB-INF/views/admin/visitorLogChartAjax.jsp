<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="row">
	<h1 class="title">방문자 통계 - 차트(시간별)
        <select class="dropdown-select-version select ad_select_style1" name="periodSelect" id="periodSelect">
        	<option selected disabled hidden>기간선택</option>
		    <option value="A" <c:if test="${period eq 'A'}">selected</c:if>>전체</option>
        	<option value="Y" <c:if test="${period eq 'Y'}">selected</c:if>>1년</option>
		    <option value="H" <c:if test="${period eq 'H'}">selected</c:if>>6개월</option>
		    <option value="M" <c:if test="${period eq 'M'}">selected</c:if>>한 달</option>
		    <option value="W" <c:if test="${period eq 'W'}">selected</c:if>>일주일</option>
		    <option value="D" <c:if test="${period eq 'D'}">selected</c:if>>금일</option>
        </select>
        <select class="dropdown-select-version select ad_select_style1" name="timeTermSelect" id="timeTermSelect">
        	<option disabled >시간 간격</option>
        	<option value="0" <c:if test="${term eq 0}">selected</c:if>>1시간</option>
		    <option value="1" <c:if test="${term eq 1}">selected</c:if>>2시간</option>
		    <option value="2" <c:if test="${term eq 2}">selected</c:if>>3시간</option>
		    <option value="3" <c:if test="${term eq 3}">selected</c:if>>4시간</option>
		    <option value="4" <c:if test="${term eq 4}">selected</c:if>>6시간</option>
		    <option value="5" <c:if test="${term eq 5}">selected</c:if>>8시간</option>
		    <option value="6" <c:if test="${term eq 6}">selected</c:if>>12시간</option>
		    <option value="7" <c:if test="${term eq 7}">selected</c:if>>하루</option>
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
		    <option value="pie" <c:if test="${chart eq 'pie'}">selected</c:if>>파이(Pie)</option>
		    <option value="radar" <c:if test="${chart eq 'radar'}">selected</c:if>>레이더(Radar)</option>
		    <option value="polarArea" <c:if test="${chart eq 'polarArea'}">selected</c:if>>극지방(Polar Area)</option>
        </select>
	</h1>
	<script>
		var timeLabel=new Array();
       	var timeArray=[
       		[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],
       		[2,4,6,8,10,12,14,16,18,20,22,24],
       		[3,6,9,12,15,18,21,24],
       		[4,8,12,16,20,24],
       		[6,12,18,24],
       		[8,16,24],
       		[12,24],
       		[24]
       	];
       	
      	//텀 시간에 따른
		var term=0;
    	var timeTerm=${term};
		switch(timeTerm) {
    		case 0:term=1;break;
    		case 1:term=2;break;
    		case 2:term=3;break;
    		case 3:term=4;break;
    		case 4:term=6;break;
    		case 5:term=8;break;
    		case 6:term=12;break;
    		case 7:term=24;break;
		};
		for(var i=0; i< timeArray[timeTerm].length; i++) {
			if(timeArray[timeTerm][i]<10) {
				var front="0"+(timeArray[timeTerm][i]-term);
				var back="0"+timeArray[timeTerm][i];
			} else {
				if(timeArray[timeTerm][i]-term<10) {
					var front="0"+(timeArray[timeTerm][i]-term);
				} else {
					var front=""+(timeArray[timeTerm][i]-term);
				}
				var back=""+timeArray[timeTerm][i];
			}
			timeLabel[i] = front+":00~"+back+":00";
		}
       	
       	$('#timeTermSelect').on("change", function() {
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
	<canvas id="visitorChartTime" aria-label="Hello ARIA World"></canvas>
	<c:if test="${term == 0}">
		<script>	
			//chart 작성
			var ctx = document.getElementById('visitorChartTime');
			
			var myChart = new Chart(ctx, {
			    type: '${chart}',
			    data: {
			        labels: [timeLabel[0],
			        		 timeLabel[1],
			        		 timeLabel[2],
			        		 timeLabel[3],
			        		 timeLabel[4],
			        		 timeLabel[5],
					         timeLabel[6],
			        		 timeLabel[7],
			        		 timeLabel[8],
			        		 timeLabel[9],
			        		 timeLabel[10],
			        		 timeLabel[11],
			        		 timeLabel[12],
			        		 timeLabel[13],
			        		 timeLabel[14],
			        		 timeLabel[15],
			        		 timeLabel[16],
			        		 timeLabel[17],
					         timeLabel[18],
			        		 timeLabel[19],
			        		 timeLabel[20],
			        		 timeLabel[21],
			        		 timeLabel[22],
			        		 timeLabel[23]],
			        datasets: [{
			            label: '방문자 통계',
			            data: [${timeList[0].COUNT},
			            	${timeList[1].COUNT},
			            	${timeList[2].COUNT},
			            	${timeList[3].COUNT},
			            	${timeList[4].COUNT},
			            	${timeList[5].COUNT},
			            	${timeList[6].COUNT},
			            	${timeList[7].COUNT},
			            	${timeList[8].COUNT},
			            	${timeList[9].COUNT},
			            	${timeList[10].COUNT},
			            	${timeList[11].COUNT},
			            	${timeList[12].COUNT},
			            	${timeList[13].COUNT},
			            	${timeList[14].COUNT},
			            	${timeList[15].COUNT},
			            	${timeList[16].COUNT},
			            	${timeList[17].COUNT},
			            	${timeList[18].COUNT},
			            	${timeList[19].COUNT},
			            	${timeList[20].COUNT},
			            	${timeList[21].COUNT},
			            	${timeList[22].COUNT},
			            	${timeList[23].COUNT}],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)',
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)',
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)',
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
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
	<c:if test="${term == 1}">
		<script>	
			//chart 작성
			var ctx = document.getElementById('visitorChartTime');
			
			var myChart = new Chart(ctx, {
			    type: '${chart}',
			    data: {
			        labels: [timeLabel[0],
			        		 timeLabel[1],
			        		 timeLabel[2],
			        		 timeLabel[3],
			        		 timeLabel[4],
			        		 timeLabel[5],
					         timeLabel[6],
			        		 timeLabel[7],
			        		 timeLabel[8],
			        		 timeLabel[9],
			        		 timeLabel[10],
			        		 timeLabel[11]],
			        datasets: [{
			            label: '방문자 통계',
			            data: [${timeList[0].COUNT},
			            	${timeList[1].COUNT},
			            	${timeList[2].COUNT},
			            	${timeList[3].COUNT},
			            	${timeList[4].COUNT},
			            	${timeList[5].COUNT},
			            	${timeList[6].COUNT},
			            	${timeList[7].COUNT},
			            	${timeList[8].COUNT},
			            	${timeList[9].COUNT},
			            	${timeList[10].COUNT},
			            	${timeList[11].COUNT}],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)',
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
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
	<c:if test="${term == 2}">
		<script>	
			//chart 작성
			var ctx = document.getElementById('visitorChartTime');
			
			var myChart = new Chart(ctx, {
			    type: '${chart}',
			    data: {
			        labels: [timeLabel[0],
			        		 timeLabel[1],
			        		 timeLabel[2],
			        		 timeLabel[3],
			        		 timeLabel[4],
			        		 timeLabel[5],
					         timeLabel[6],
			        		 timeLabel[7]],
			        datasets: [{
			            label: '방문자 통계',
			            data: [${timeList[0].COUNT},
			            	${timeList[1].COUNT},
			            	${timeList[2].COUNT},
			            	${timeList[3].COUNT},
			            	${timeList[4].COUNT},
			            	${timeList[5].COUNT},
			            	${timeList[6].COUNT},
			            	${timeList[7].COUNT}],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)',
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)'
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
	<c:if test="${term == 3}">
		<script>	
			//chart 작성
			var ctx = document.getElementById('visitorChartTime');
			
			var myChart = new Chart(ctx, {
			    type: '${chart}',
			    data: {
			        labels: [timeLabel[0],
			        		 timeLabel[1],
			        		 timeLabel[2],
			        		 timeLabel[3],
			        		 timeLabel[4],
			        		 timeLabel[5]],
			        datasets: [{
			            label: '방문자 통계',
			            data: [${timeList[0].COUNT},
			            	${timeList[1].COUNT},
			            	${timeList[2].COUNT},
			            	${timeList[3].COUNT},
			            	${timeList[4].COUNT},
			            	${timeList[5].COUNT}],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
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
	<c:if test="${term == 4}">
		<script>	
			//chart 작성
			var ctx = document.getElementById('visitorChartTime');
			
			var myChart = new Chart(ctx, {
			    type: '${chart}',
			    data: {
			        labels: [timeLabel[0],
			        		 timeLabel[1],
			        		 timeLabel[2],
			        		 timeLabel[3]],
			        datasets: [{
			            label: '방문자 통계',
			            data: [${timeList[0].COUNT},
			            	${timeList[1].COUNT},
			            	${timeList[2].COUNT},
			            	${timeList[3].COUNT}],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)'
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
	<c:if test="${term == 5}">
		<script>	
			//chart 작성
			var ctx = document.getElementById('visitorChartTime');
			
			var myChart = new Chart(ctx, {
			    type: '${chart}',
			    data: {
			        labels: [timeLabel[0],
			        		 timeLabel[1],
			        		 timeLabel[2]],
			        datasets: [{
			            label: '방문자 통계',
			            data: [${timeList[0].COUNT},
			            	${timeList[1].COUNT},
			            	${timeList[2].COUNT}],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)'
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
	<c:if test="${term == 6}">
		<script>	
			//chart 작성
			var ctx = document.getElementById('visitorChartTime');
			
			var myChart = new Chart(ctx, {
			    type: '${chart}',
			    data: {
			        labels: [timeLabel[0],
			        		 timeLabel[1]],
			        datasets: [{
			            label: '방문자 통계',
			            data: [${timeList[0].COUNT},
			            	${timeList[1].COUNT}],
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
	<c:if test="${term == 7}">
		<script>	
			//chart 작성
			var ctx = document.getElementById('visitorChartTime');
			
			var myChart = new Chart(ctx, {
			    type: '${chart}',
			    data: {
			        labels: [timeLabel[0]],
			        datasets: [{
			            label: '방문자 통계',
			            data: [${timeList[0].COUNT}],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)'
			            ],
			            borderColor: [
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
</div>