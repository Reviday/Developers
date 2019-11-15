//dashboard-applications



$(function () {
    var del_applNo = 0;
    if (appl_like == 'true') {
        $("#like_check").prop("checked", true);
    }
    //인덱스 선택
    if (appl_index < 1) {
        appl_index = 1;
    }


    //리스트 가져오는 함수
    fn_appl_nav(appl_index, appl_page, appl_position);
    // $($('.appl-main-nav>ul>li')[appl_index-1]).children().addClass('ca2');

    //사이드내비
    $('.appl-leftside>h5').on('click', function () {
        if ($($(this).children('svg')).hasClass('rotate')) {
            $($(this).children('svg')).removeClass('rotate');
        } else {
            $($(this).children('svg')).addClass('rotate')
        }
        if ($(this).hasClass('slide_btn')) {
            $(this).next().next().slideToggle();
        }
    });

    $("[name='search_em']").on("keyup", function (event) {
        if (event.keyCode == '13') {
            fn_appl_nav(appl_index, appl_page, appl_position);
        }
    });
    $("#like_check").on("change", function () {
        appl_page = 1;
        fn_appl_nav(appl_index, appl_page, appl_position);
    });


    $('.appl-leftside>ul>li').on('click', function () {
        fn_appl_nav(1, 1, $(this).attr('data'));
        $(this).parent().parent().children('ul').children().removeClass('aList-click');
        if (!$(this).hasClass('aList-click')) {
            $(this).addClass('aList-click');
        }
    });

});

function fn_appl_nav(index, page, po) {
    appl_index = index;
    appl_page = page;
    appl_position = po;
    // $(".appl-applicant-list").html("<img class='bus_loading' src='"+path+"/resources/images/Developers_black_loading.gif' width='30px;'/>");
    $.ajax({
        url: path + "/business/applChange.lbc",
        data: {
            "applIndex": index,
            "applLike": $("#like_check").prop("checked"),
            "search": $("[name='search_em']").val(),
            "applPosition": appl_position,
            "cPage": page
        },
        success: function (data) {
            $(".appl-applicant-list").html(data.applInnerHtml);
            $(".appl-applicant-list").append(data.pageBar);
            $(".appl-main-nav>.nav_us").html(data.navHtml);
            $('.appl-main-nav>ul>li').children().removeClass('ca2');
            $($('.appl-main-nav>ul>li')[appl_index - 1]).children().addClass('ca2');

            //지원자 내비
            $('.appl-main-nav>ul>li>a').on('click', function () {
                // $($(this).parent().siblings()).children().removeClass('ca2');
                // $(this).addClass('ca2');
                fn_appl_nav($(this).parent().index() + 1, 1, appl_position);
            });
            $('.appl-main-nav>ul>li>a').hover(function () {
                $(this).addClass('ca4');
            }, function () {
                $(this).removeClass('ca4');
            });
            //좋아요 버튼 클릭
            $(".aList-like-btn").on("click", function () {
                if ($(this).hasClass("like_on")) {
                    $(this).removeClass("like_on");
                    fn_appl_like(event, true);
                } else {
                    $(this).addClass("like_on");
                    fn_appl_like(event, false);
                }
            });

            //삭제 모달 밖 클릭
            $(".close-modal").on("click", function () {
                $(".del-modal").hide();
            });

            //지원자 이력서 보기. 지원자클릭
            $(".aList-left").on("click", function () {
                location.href = path + "/business/applView.lbc?applNo=" + $(this).siblings(".aList-appl-no").val();
                // $.ajax({
                //     url:path+"/business/applView.lbc",
                //     data:{"applNo":$(this).children(".aList-appl-no").val()},
                //     datatype:'post',
                //     success:function(data){
                //         $(".appl-main").html(data.viewHtml);
                //         // $('.appl-leftside').css("top","0");
                //     }
                // });
            });
        }
    });

}

function fn_appl_like(event, flag) {
    var like_applNo = $(event.target).parents('.appl-aList').children('input[type="hidden"]').val();
    $.ajax({
        url: path + "/business/applLike.lbc",
        data: {
            "applNo": like_applNo,
            "flag": flag
        },
        datatype: 'post'
    });
}

function fn_del_modal(event) {
    del_applNo = $(event.target).parents('.appl-aList').children('input[type="hidden"]').val();
    var del_memName = $(event.target).parents('.aList-right').siblings('.aList-left').children('.aList-info').children(':last').html();
    $(".del-mem").html(del_memName);
    $(".del-modal").show();
}

function fn_appl_del() {
    location.href = path + "/business/applDel.lbc?applNo=" + del_applNo;
}



//반응형 처리
$(function () {
    $(window).resize(function () {
        if (window.innerWidth < 767) {
            if (!$('.appl-leftside>h5').hasClass('slide_btn')) {
                $('.appl-leftside>h5').addClass('slide_btn');
            }
        } else {
            $('.appl-leftside>h5').removeClass('slide_btn');
            $('.appl-leftside>ul').css('display', '');
        }
    });

});