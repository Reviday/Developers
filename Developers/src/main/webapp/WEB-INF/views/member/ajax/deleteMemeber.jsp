<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section>
    <div class="_2U0JYXOwa1z5l3UaD8zNeP">
        <div class="block">
            <h3>탈퇴 시 주의 사항</h3>
            <ul>
                <li>탈퇴 시 회원님의 이력서를 포함하여 회원님의 계정에 저장된 <strong>모든 정보가 영구적으로 삭제되며, 다시는 복구할 수 없습니다. </strong></li>
                <li>이력서의 저장을 원하실 경우, 탈퇴 이전에 <a href="/cv/list">이력서 관리 페이지</a>에서 다운로드 해주세요.</li>
                <li>다른 계정에 이미 제출된 추천 정보는 추천받은 계정의 소유로 간주되어 <strong>자동으로 삭제되지 않으며, 탈퇴 시 수정이나 삭제가 불가능합니다.</strong></li>
                <li>제출된 추천서의 수정이나 삭제를 원하실 경우, 탈퇴 이전에 <a href="/referral">추천 페이지</a>에서 추천서를 수정, 또는 삭제 해주세요.</li>
                <li>기업에 대한 채용 수수료 정산과 부정이용 방지를 위해, <strong>기업에 대한 지원 내역은 관련 법령에 의거하여 탈퇴 후 최장 5년간 저장됩니다.</strong></li>
                <li><strong>원티드 회원에서 탈퇴하실 경우, 추천 및 채용 보상금을 받으실 수 없습니다.</strong> 받으실 보상금이 있으시다면 탈퇴 이전에 모든 수속을 마쳐주세요.</li>
                <li>회원 탈퇴 시 계정에 적립된 <strong>포인트는 자동으로 환급되지 않으며, 재가입시에도 복구되지 않습니다.</strong></li>
                <li>탈퇴 이전에 신청해주신 <strong>교육 및 이벤트 참가 신청은 자동으로 취소되지 않습니다.</strong> 취소를 원하실 경우 탈퇴 이전에 별도로 요청해주세요.</li>
                <li>기업 서비스에 등록되어 있는 계정일 경우, <strong>기업 서비스 접속권한도 동시에 삭제됩니다. </strong></li>
                <li>이상의 내용에 동의하여 탈퇴를 원하실 경우, 아래의 “동의하기” 버튼을 클릭 부탁드립니다.</li>
            </ul>
        </div>
        <c:set value="${loginMember.memNo }" var="memNo"/>
        
        <button type="button" onclick="RealdeleteMember(${memNo});">동의하기</button>
    </div>
</section>

<script>
function RealdeleteMember(memNo) {
	location.href="${path}/member/RealdeleteMember.lmc?memNo="+memNo;
}

</script>