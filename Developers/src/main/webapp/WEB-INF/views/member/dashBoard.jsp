<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mydash.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>

<div style="height: 100px"></div>
<body style="background-color: #f8f8f8;">
    <main class="container-fluid">
        <div class="col-md-3"></div>
        <div class="content" id="content">
            <div class="col-md-8 content">
                <div>
                    <div class="status-header">
                        <h2>
                            <sup>
                                <span>지원</span>
                            </sup>
                            <sup>
                                <span> ∙ </span>
                                <span>작성 중</span>
                            </sup>
                        </h2>
                    </div>
                    <div class="status-table-nav">
                        <h4>
                        	
                            <span class="count" id="count">총 ${totalData }건</span>
                        </h4>
                        <div class="inputWrapper">
                            <i class="icon-search" style="color:#505050;margin-left:10px;">
                            </i>
                            <input class="Input-hxTtdt searchbox" type="text" id="searchBox" placeholder="회사  검색">
                            <input type="hidden" id="memNo" value="${loginMember.memNo }"/>
                            <input type="hidden" id="memEmail" value="${loginMember.memEmail }"/>
                        </div>
                    </div>

                </div>
                <div id="dashTable">
                <table class="table table-hover" id="status" style="background-color: #fff;">
                    <thead>
                        <tr>
                            <th class="apl_bus">지원 회사</th> 
                            <th class="appl_postion">지원 포지션</th>
                            <th class="appl_date">작성 시간</th>
                            <th class="appl_status">진행 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty applList }">
                   
                    <c:forEach items="${applList }" var="app" >
                        <tr>
                            <td> 
                            <img src="${path }${app.busLogo }" class="company-logo">
                            ${app.busName }
                            </td>
                            <td>${app.position }</td>
                            <td>
                            <c:if test="${app.applDate ne null}">
                          <fmt:parseDate value=" ${app.applDate }" var="dateFmt" pattern="yyyy-MM-dd"/>
                          </c:if>
                          
                            </td>
                            <td>
                           <c:if test='${app.applStatus eq 1 }'>
                            	기업확인중
                            </c:if>
                            <c:if test='${app.applStatus eq 2 }'>
                            	서류 통과
                            </c:if>
                            <c:if test='${app.applStatus eq 3 }'>
                            	최종 합격
                            </c:if>
                            <c:if test='${app.applStatus eq 4 }'>
                            	불합격
                            </c:if>
                            <c:if test='${app.applStatus eq 5 }'>
                            	기간 만료
                            </c:if>
                         
                            </td>
                        </tr>
                     </c:forEach>
                  
                    </c:if>
                    <c:if test="${empty applList }">
                    	<tr>
                    		<td colspan="4" class="emptyApp">
                    			 지원하신 결과가 없습니다.
                    		</td>
                    	</tr>
                    </c:if>
                    </tbody>
                </table>
               	<c:if test="${pageBar ne null }">
               	<c:if test="${totalData >4 }">
				${pageBar}
				</c:if>
				</c:if>
			</div>
            </div>
        </div>
    </main>
<div style="height: 400px"></div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
<script>
$(document).ready(function(){
    $("#searchBox").keypress(function (e) {
     if (e.which == 13){
          var busName =$("#searchBox").val();
          var memNo=$("#memNo").val();
          var memEmail=$("#memEmail").val();
          $.ajax({
     		 url:"${path }/member/dashBoardSearch.lmc",
     		 data:{"busName":busName,
     			 	"memNo":memNo,
     			 	"memEmail":memEmail},
     		 type:"POST",
     		 success:function(data){
     			 $("#content").html("");
     			 $("#content").html(data);	  
     		 }
     	 });
     }
 });
});



</script>
</html>