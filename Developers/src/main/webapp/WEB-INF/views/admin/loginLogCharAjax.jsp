<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
