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
#salary-main {
    background: #fff;
}
.salary-header-mid {
    max-width: 1060px;
}
@media (min-width: 1200px){
    .salary-header-mid {
        margin: 0 auto;
        width: 87.72%;
    }
}
@media (max-width: 1199px) and (min-width: 992px){
    .salary-header-mid {
        margin: 0 auto;
        width: 90%;
    }
}

@media (max-width: 991px) and (min-width: 768px){
    .salary-header-mid {
        margin: 0 auto;
        width: 90%;
    }
}



@media (min-width: 768px){
    .chartPanel {
        max-height: 400px;
    }
}
.chartPanel{
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

</style>
<div style="height: 50px"></div>
<section id="salary-main">
	<div class="chartPanel">
		<div class="salary-container-1">
			<div class="salary-header-mid">
				<div id="salary-chart" style="width: 70%"></div>
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
var chart = bb.generate({
    bindto: "#salary-chart",
    padding: {
    	top:50
       
      },
    data: {
        type: "bar",

        columns: [
        
            ["연봉", 2696, 2986, 3249, 3497, 3742, 3989, 4232, 4480, 4707, 4873, 5133]
           
        ],
        selection: {
            enabled: true,
            draggable: true
          },
        types : {
        	연봉 : "bar",
        	data2 : "line"
        },
        colors:{
        	연봉 : "#333333"
        }
    },
    axis: {
        x: {
          type: "category",
          categories: [
            "신입","1년차","2년차","3년차","4년차","5년차","6년차","7년차","8년차","9년차","10년차"
          ]
        }
    
      },
      legend: {
     	    show: false
        }

});
chart.data.names({
	    연봉: "연봉"
	 });
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

