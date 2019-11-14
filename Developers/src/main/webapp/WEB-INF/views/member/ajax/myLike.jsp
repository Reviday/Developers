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
<body>
    <div class="_1Gv5LM5zal-f72_XSo_qJ_">
        <nav role="presentation" class="_1ft7OZSrbzL35bkI-omU2b"><button type="button" class="">프로필<i
                    class="icon-arrow_bottom_fill"></i></button>
                    <c:set value="${loginMember.memEmail }" var="memEmail"  />
            <ul class="">
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="activeNav">프로필</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="">포인트</a></li>
				<li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="applicantPage('${memEmail}');" class="">제안받기 현황</a></li>	
                <li class="_3wSXAiIJQZ98fJ-Hi6G42Q"><a href="#" onclick="likePage('${memEmail }');" class="">좋아요</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="myBookMark('${memEmail }')" class="">북마크</a></li>
              
            </ul>
        </nav>
        <div class="_2oEXS1kAsO9i_0mkxCxkCA">
            <ul class="clearfix">
       
            <c:forEach items="${likeList }" var="l">
                <li>
                    <div class="_3D4OeuZHyGXN7wwibRM5BJ liked">
                    <a href="/wd/29584?referer_id=835297" target="_self" class="">
                            <header
                                style="background-image: url();">
                                <button type="button" class="likeButton">
                                 <i class="fas fa-heart"></i>&nbsp;&nbsp; ${l.like_count }</button></header>
                            <div class="body">
                                <dl>
                                    <dt> ${l.position }</dt>
                                    <dd>${l.bus_name }<br><span>${l.bus_area }</span>
                                    <span class="addressDot">.</span>
                                    <span>${l.bus_country }</span></dd>
                                </dl>
                                <div class="reward">채용보상금 1,000,000원</div>
                            </div>
                        </a></div>
             	   </li>
               </c:forEach>
              
            </ul>
        </div>
    </div>
    
    
    <script>
    
	var duty=[];
    function dutyview(){
        var dutybutton =document.getElementsByClassName('_26Ms0F-WSvfKh16ALOIC20');
        if($(dutybutton).attr('disabled')){
            $(dutybutton).attr('disabled',false);
        }else{
            $(dutybutton).attr('disabled',true);
        }
     
	
    }
    
    $(function(){
    	 $('._26Ms0F-WSvfKh16ALOIC20').click(function() {
         	if($(this).hasClass("active") === false){
             $(this).addClass('active');
         	}else{
         	$(this).removeClass('active');	
         	}
         });
    });
    
   function saveInter(memEmail){
	
	   var skill = [];
	   $("input[name='skill']:checked").each(function(i){   
		   skill.push($(this).val());
	   });
	   var jobName =$("select[name=jobName]").val();
	   var experience =$("select[name=career]").val();
	   var salary =$("input[name=salary]").val();
	   for(var i=0; i<$('.active').length; i++){
	   duty.push($(document.getElementsByClassName('active')[i]).val());
  		 }
	   var objParams = {
			   "jobName":jobName,
			   "memEmail":memEmail,
			   "experience":experience,
	   			"duty":duty,
	   			"salary":salary,
	   			"skill":skill
           };
	   
	   $.ajax({
   		url:"${path }/member/insertInterests.lmc",
   		type:"POST",
   		data: objParams,
   		contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
   		success: function(data) { 
   			$("#sectionA").html("");
			$("#sectionA").html(data);
   		}
   	}); 
   }
   function updatePage(){
	   $.ajax({
		   url:"${path }/member/updatePage.lmc",
		   type:"POST",
		   success:function(data){
			   $("#sectionA").html("");
			   $("#sectionA").html(data); 
		   }
		   
	   })
   }
   function likePage(memEmail) {
	   $.ajax({
		   url:"${path }/member/likePage.lmc",
		   type:"POST",
		   data:{"memEmail":memEmail},
		   success:function(data){
			   $("#mainContent").html("");
			   $("#mainContent").html(data);
		   }
	   })	
}
   function myBookMark(memEmail) {
	   $.ajax({
		   url:"${path }/member/myBookMark.lmc",
		   type:"POST",
		   data:{"memEmail":memEmail},
		   success:function(data){
			   $("#mainContent").html("");
			   $("#mainContent").html(data);
		   }
	   })	
}   
 //로고 클릭 이벤트
	$("#logoFile").on("change",function(){
		var frm=new FormData($("#logoFrm")[0]);
		$.ajax({
			url:"${path }/member/logoChange",
			data:frm,
			type:"post",
			processData:false,
			dataType:"json",
     	    contentType:false,
			success:function(data){
				$("#logoImg").css('background-image', 'url('+data+')');
				$("#profile_img").attr("src",data);
			},error:function(data){
				console.log("실패");
			}

		})
	});
 
 function applicantPage(memEmail){
	 $.ajax({
		url:"${path }/member/applicantPage.lmc",
		data:{"memEmail":memEmail},
		type:"POST",
		success:function(data){
			  $("#mainContent").html("");
			   $("#mainContent").html(data);
		}
		 
	 });
	 
 }
 
    
    
    </script>
