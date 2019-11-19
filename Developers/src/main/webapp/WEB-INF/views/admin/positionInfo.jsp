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
	<c:if test="${not empty position }">
    <div class="alert" role="alert">
    	<div class="panel panel-primary">
            <div class="panel-heading">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h3 style="text-align: center">
		        	<span style="font-weight: 600">${position.busName}</span> 기업 포지션 정보
		        </h3>
            </div>
           
            <div class="panel-body">
              <div class="col-md-3">
                <strong>포지션 번호 : </strong>
                <span>${position.positionNo }</span>
              </div>
              
              <div class="col-md-3">
                <strong>기업 번호 : </strong>
                <span>${position.busNo }</span>
              </div>
              
              <div class="col-md-3">
                <strong>기업 이름 : </strong>
                <span>${position.busName }</span>
              </div>
              
              <div class="col-md-3">
                <strong>등록이메일 : </strong>
                <span>${position.applyEmail }</span>
              </div>
              
              <div class="col-md-3">
                <strong>직무 : </strong>
                <span>
					<c:forEach items="${position.jobType }" var="j" varStatus="s">
						${jobFiled[j] }<c:if test="${!s.last}">,</c:if>
					</c:forEach>
                </span>
              </div>
              
              <div class="col-md-3">
                <strong>커리어 : </strong>
                <span>
                	<c:forEach items="${position.career }" var="j" varStatus="s">
						${j }<c:if test="${!s.last}">~</c:if>
					</c:forEach> 
                </span>
              </div>
              
              <div class="col-md-3">
                <strong>태그 : </strong>
                <span>
                	<c:forEach items="${position.tag }" var="j" varStatus="s">
						${j }<c:if test="${!s.last}">,</c:if>
					</c:forEach> 
                </span>
              </div>
              
              <div class="col-md-3">
                <strong>등록일자 : </strong>
                <span><fmt:formatDate value="${position.enrollDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
              </div>
              
              <div class="col-md-3">
                <strong>마감일자 : </strong>
                <span><fmt:formatDate value="${position.deadDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
              </div>

              <div class="col-md-3">
                <strong>포지션 : </strong>
                <span>${position.position }</span>
              </div>
              
              <div class="col-md-3">
                <strong>예상연봉 : </strong>
                <span>
                	<c:forEach items="${position.positionSalary }" var="j" varStatus="s">
						${j }<c:if test="${!s.last}">만원~</c:if><c:if test="${s.last}">만원</c:if>
					</c:forEach> 
				</span>
              </div>
              
              <div class="clearfix"></div>
              
              <div class="col-md-12">
                <strong>포지션 정보 : </strong>
                <textarea id="servicio" name="servicio" 
                  class="form-control" placeholder="None" type="text" 
                  disabled="disabled" style="height:300px;">${position.positionInfo}</textarea>
              </div>
              
              <div class="col-md-12">
                <strong>주요업무 : </strong>
                <textarea id="servicio" name="servicio" 
                  class="form-control" placeholder="None" type="text" 
                  disabled="disabled" style="height:300px;">${position.mainbusiness}</textarea>
              </div>
              
              <div class="col-md-12">
                <strong>자격요건 : </strong>
                <textarea id="servicio" name="servicio" 
                  class="form-control" placeholder="None" type="text" 
                  disabled="disabled" style="height:300px;">${position.qualification}</textarea>
              </div>
              
              <div class="col-md-12">
                <strong>우대사항 : </strong>
                <textarea id="servicio" name="servicio" 
                  class="form-control" placeholder="None" type="text" 
                  disabled="disabled" style="height:300px;">${position.preference}</textarea>
              </div>
              
              <div class="col-md-12">
                <strong>혜택 및 복지 : </strong>
                <textarea id="servicio" name="servicio" 
                  class="form-control" placeholder="None" type="text" 
                  disabled="disabled" style="height:300px;">${position.benefit}</textarea>
              </div>
           </div>
    	</div><!-- .panel -->
    </div><!-- .alert -->
	</c:if>
	<c:if test="${empty position }">
		<h3 style="text-align: center">
        	<span style="font-weight: 600">등록된 정보가 없습니다.</span> 
        </h3>
	</c:if>
</div><!-- .container -->
