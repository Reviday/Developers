<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지페이지</title>
</head>
<body>
	<c:if test="${msg ne null} }">
		<!-- msg -->
		<script>
			alert("${msg}");
			location.href='${pageContext.request.contextPath}${loc}';
		</script>
	</c:if>
	<c:if test="${msg eq null }" >
		<!-- script -->
		<c:if test="${script nq null }">
			${script }
		</c:if>
	</c:if>
</body>
</html>



