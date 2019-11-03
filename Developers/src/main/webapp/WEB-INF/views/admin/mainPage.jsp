<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<style>
	body {overflow-y: hidden; overflow-x: hidden;}

	#content svg {
		width: 100%;
		height: 100%;
		z-index:-1;
	}
	#tesk {
		position: fixed;
		color: white;
		top:50%;
		left:50%;
		transform:translateX(-50%) translateY(-50%);
	}
	#tesk h1 {
		font-size: 10em;
	}
	#tesk h2 {
		font-size: 3em;
		text-align: center;
	}
</style>

<section id="content">
	<i class="fas fa-cogs"></i>
	<div id="tesk">
		<h1>Developers</h1>
		<h2>for Admin Page</h2>
	</div>
</section>
<script>
$('#content').on('scroll touchmove mousewheel', function(event) {
	  event.preventDefault();
	  event.stopPropagation();
	  return false;
	});
</script>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>