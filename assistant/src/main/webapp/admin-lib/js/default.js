$(function () {
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });


    var gFrameSrc;

    $('#nav-id a').click(function () {

        var aVal = $(this).text();
        /* alert(aVal);*/
        if (aVal == "充值查询") {
            gFrameSrc = "/admin/toCzSearch.do";
            $('#iframeId').attr("src", gFrameSrc);
        }
        if (aVal == "消费查询") {
            gFrameSrc = "/admin/toXfSearch.do";
            $('#iframeId').attr("src", gFrameSrc);
        }
        if (aVal == "用户充值统计") {
            gFrameSrc = "/admin/toUserCzStatistics.do";
            $('#iframeId').attr("src", gFrameSrc);
        }
        if (aVal == "用户消费统计") {
            gFrameSrc = "/admin/toUserXfStatistics.do";
            $('#iframeId').attr("src", gFrameSrc);
        }
        if (aVal == "会员数据统计") {
            gFrameSrc = "/admin/toVipDataStatistics.do";
            $('#iframeId').attr("src", gFrameSrc);
        }
        if (aVal == "会员列表") {
            gFrameSrc = "/admin/toVipList.do";
            $('#iframeId').attr("src", gFrameSrc);
        }




    });

    $("#nav-id li").click(function () {
        var liVal = $(this).text();
        /*        $(this).addClass("active");*/
        $('.active').removeClass('active');
        $(this).addClass('active');
       /* $(this).css("background-color","blue");*/
    });
});

function iframeShow() {
    $('#iframe-div').css("display", "block");
    $('#cz-search').css("display", "none");

}