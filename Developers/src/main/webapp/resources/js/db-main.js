//dashborad-main
$(window).ready(function(){
  
    if(db_index==1){
        $("#db-container").html(db_html);
        $($(".ei_nav>li>a")[db_index-1]).addClass("ca1");
        
    }else{
        location.href=path+"/business/applicants.lbc";
    }
});


$(function(){
    $('.ei_nav>li>a').hover(function(){
        $(this).addClass('ca3');
    },function(){
        $(this).removeClass('ca3');
    });	
});