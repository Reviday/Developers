<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style type = "text/css"> 
	#loading{
		 text-align: center;
		 margin: 0 auto;
	}
	#Progress_Loading {
		position: absolute;
		left: 50%;
		top: 50%;
		background: transparent;
		z-index:99999;
	}
</style>
<script type="text/javascript" language="javascript">
 
$(document).ready(function(){
	
   $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
})
.ajaxStart(function(){
	$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
})
.ajaxStop(function(){
	$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
});
</script>
 

<div id="loading">
	<div id="Progress_Loading"><!-- 로딩바 -->
		<img src="${path}/resources/images/Progress_Loading.gif"/>
	</div>
</div>

<div id="Parse_Area"></div> <!--받아온 데이터들이 들어갈 div -->
