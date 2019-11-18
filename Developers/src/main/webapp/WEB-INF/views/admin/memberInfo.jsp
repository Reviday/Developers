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

    <div class="alert" role="alert">
    	<div class="panel panel-primary">
            <div class="panel-heading">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h3 style="text-align: center">
		        	<span style="font-weight: 600"><c:if test="${Member.memName ne null}">${Member.memName}</c:if></span> 회원 정보
		        </h3>
            </div>
           
            <div class="panel-body">
              <c:if test="${member.memIcon ne null }">
	              <div class="col-md-3">
	                <img src="${path }/${member.memIcon }" style="max-width: 50px; max-height: 50px;"/>
	              </div>
              </c:if>
              <div class="col-md-3">
                <strong>회원 번호 : </strong>
                <span>${Member.memNo}</span>
              </div>
              
              <div class="col-md-3">
                <strong>회원 이메일 : </strong>
                <span>${Member.memEmail }</span>
              </div>
              
              <div class="col-md-3">
                <strong>가입일자 : </strong>
                <span><fmt:formatDate value="${Member.memEnrollDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
              </div>
              
              <div class="col-md-3">
                <strong>회원 레벨 : </strong>
                <span>${Member.memLevel }</span>
              </div>
              
              
              <div class="clearfix"></div>
              
              <div class="col-md-6">
                <strong>회원 전화번호 : </strong>
                <span>${Member.memPhone }</span>
              </div>
              
              <div class="clearfix"></div>

              <div class="col-md-12">
                <strong>관리자 메모 : <br/></strong>
                <input id="servicio" name="servicio" 
                  class="form-control" placeholder="None" type="text" 
                  disabled="disabled" value="${Member.memAdminmemo}">
              </div><!-- .col-md-12 -->
              
              <div class="clearfix"></div>

    	</div><!-- .panel -->
    </div><!-- .alert -->
</div><!-- .container -->
