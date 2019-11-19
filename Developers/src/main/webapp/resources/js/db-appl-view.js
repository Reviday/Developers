//dashboard-applications



$(function(){

    //사이드내비
    $('.appl-leftside>h5').on('click',function(){
        if($($(this).children('svg')).hasClass('rotate')){
            $($(this).children('svg')).removeClass('rotate');
        }else{
            $($(this).children('svg')).addClass('rotate')
        }
        if($(this).hasClass('slide_btn')){
                $(this).next().next().slideToggle();
            }
    });

    $('.appl-leftside>ul>li').on('click', function(){
        $(this).parent().parent().children('ul').children().removeClass('aList-click');
        if(!$(this).hasClass('aList-click')){
            $(this).addClass('aList-click');
        }
    });
});

function fn_appl_offer(){   
    $.ajax({
        url:path+"/business/applOffer.lbc",
        data:{"applNo":$(".appl_applNo").val()},
        success:function(data){
            alert("지원자에게 제안을 보냈습니다.");
            $(".appl_view_header").html("<div class='appl_offering'>제안 중...</div>");
        }
    });
}

function fn_appl_pf(flag){
    $(event.target).siblings().remove();
    $.ajax({
        url:path+"/business/applPassFail.lbc",
        data:{"applNo":$(".appl_applNo").val(),"applPf":flag},
        success:function(){
            alert("지원자에게 합격여부를 전달했습니다.");
           $('.appl_offer_btn').attr("disabled","disabled");
        }
    });
}