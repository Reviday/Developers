<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,800&display=swap&subset=korean" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
	body {
		font-family: 'Nanum Gothic', sans-serif;
	}
	.form-param{
	    padding : 5px;
	}
	strong {
		font-weight: 600;
		font-size:1.1em;
	}
	.panel-body div {
		margin:5px;
	}
</style>
<div class="container">
	<c:if test="${not empty business }">
    <div class="alert" role="alert">
    	<div class="panel panel-primary">
            <div class="panel-heading">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h3 style="text-align: center">
		        	<span style="font-weight: 600">${business.busName}</span> 기업 정보
		        </h3>
            </div>
           
            <div class="panel-body">
              <c:if test="${business.busLogo ne null }">
	              <div class="col-md-3">
	                <img src="${path }/${business.busLogo }" style="max-width: 50px; max-height: 50px;"/>
	              </div>
              </c:if>
              <div class="col-md-3">
                <strong>기업 번호 : </strong>
                <span>${business.busNo }</span>
              </div>
              
              <div class="col-md-3">
                <strong>기업명 : </strong>
                <span>${business.busName }</span>
              </div>
              
              <div class="col-md-3">
                <strong>가입일자 : </strong>
                <span><fmt:formatDate value="${business.busEnrollDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
              </div>

              <div class="col-md-3">
                <strong>국가 : </strong>
                <span>${business.busCountry }</span>
              </div>
              
              <div class="col-md-3">
                <strong>지역 : </strong>
                <span>${business.busArea }</span>
              </div>
              
              <div class="clearfix"></div>

              <div class="col-md-6">
                <strong>주소 : </strong>
                <span>${business.busAddress }</span>
              </div><!-- .col-md-6 -->
              
              <div class="clearfix"></div>

              <div class="col-md-6">
                <strong>산업 : </strong>
                <span>${business.busIndustrial }</span>
              </div><!-- .col-md-6 -->
              
              <div class="col-md-6">
                <strong>매출 : </strong>
                <span>${business.busIncome}</span>
              </div><!-- .col-md-6 -->
              
              <div class="clearfix"></div>

              <div class="col-md-12">
                <strong>기업 이메일 : </strong>
                <span>${business.busEmail}</span>
              </div>
              
              <div class="col-md-12">
                <strong>기업 대표번호 : </strong>
                <span>${business.busPhone}</span>
              </div>
              
              <div class="col-md-12">
                <strong>기업 사원수 : </strong>
                <span>${business.busTotalEmp}</span>
              </div>
              
              <div class="col-md-12">
                <strong>기업 홈페이지 : </strong>
                <span><a href="${business.busWebsite}">${business.busWebsite}</a></span>
              </div>
              
              <div class="col-md-12">
                <strong>기업 소개 : <br/></strong>
                <textarea id="servicio" name="servicio" 
                  class="form-control" placeholder="None" type="text" 
                  disabled="disabled" style="height:300px;">${business.busIntroduce}</textarea>
              </div><!-- .col-md-12 -->
              
              <div class="clearfix"></div>

    	</div><!-- .panel -->
    </div><!-- .alert -->
    </c:if>
	<c:if test="${empty business }">
		<h3 style="text-align: center">
        	<span style="font-weight: 600">등록된 정보가 없습니다.</span> 
        </h3>
	</c:if>
</div><!-- .container -->
