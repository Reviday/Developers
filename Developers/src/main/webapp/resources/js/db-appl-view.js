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
        data:{"applNo":$(".appl_applNo").val()}
    });
}