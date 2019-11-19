<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body >
	
	<div id="bodyContent">
	<form method="post" action="${path }/member/memberUpdate.lmc" name="form1" >
         <table class="table table-striped" >
            <tr>
              <th>회원 ID </th>
              <td></td>
            </tr>
 			<tr>
 			<th colspan="2">기본정보 수정</th>

 			</tr>
 			<tr>
 			<th colspan="2">지원 결과 또는 추천 포지션 정보를 받아볼 이메일/연락처 정보 입력해주세요.</th>
 			</tr>
            <tr>
              <th>이름 </th>
              <td><input type="text"  class="form-control" name="memName" value=${loginMember.memName } /></td>
            </tr>
 			<tr>
              <th>이메일 </th>
              <td><input type="text"  name="memEmail"  class="form-control" value="${loginMember.memEmail }" readonly="readonly"  /></td>
            </tr>
            <tr>
              <th>연락처 </th>
              <td>
              <c:if test="${loginMember.memPhone==null }">
              <input type="tel"   class="form-control" id="phone" name="memPhone" />
              </c:if>
              <c:if test="${loginMember.memPhone!=null }">
              <input type="tel"   class="form-control" id="phone" name="memPhone" value="${loginMember.memPhone }" />
              </c:if>
              </td>
            </tr>
            <tr class="text-center">
              <td colspan="2">
          
              
               <button type="button" class="btn btn-danger" onclick="deleteMember();">회원 탈퇴</button>
                <button type="submit" class="btn btn-primary" id="btnRegist">정보변경하기</button>
              </td>
            </tr>
         </table>
     </form>
    
     </div>
     <div style="height: 400px;" ></div>
     </body>
 
     
<script type="text/javascript">
var asd;

function deleteMember() {
	$.ajax({
		url:"${path }/member/deleteMember.lmc",
		type:"POST",
		data:{"asd":asd},
		success:function(data){
		$("#bodyContent").html("");
		$("#bodyContent").html(data);
			
		}
	});
}

</script>
</html>