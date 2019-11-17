<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
                            ${app.applDate } 
                            </td>
                            <td>
                           <c:if test='${app.applStatus eq 1 }'>
                            	기업 확인중
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
				${pageBar}
			</c:if>