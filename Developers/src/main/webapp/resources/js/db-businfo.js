
$(function(){
    $('.bi_info_ta').css("height",$('.bi_info_ta')[0].scrollHeight+30+'px');
    $('.bi_info_ta').parents('.bi_info').css("height",$('.bi_info_ta')[0].scrollHeight+40+'px');
    $('.bi_main').css('height',$('.bi_main')[0].scrollHeight+70+'px');


    $('.bi_info_img').on('click',function(){
        $('body').css('overflow','hidden');
        $('.bi_img_container').slideDown();
    });
    
    $('.bi_img_close').on('click',function(){
        $('.bi_img_container').slideUp();
        $('body').css('overflow','');
    });
});