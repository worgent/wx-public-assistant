<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript">
        window.logs = {
            pagetime: {}
        };
        window.logs.pagetime['html_begin'] = (+new Date());
    </script>

    <script type="text/javascript">
        var page_begintime = (+new Date());

        var biz = "MjM5ODE1NDM0MA==";
        var sn = "1818e3e2e74f7c5b0a52b50a3e6d8e45" || "";
        var mid = "404861047" || "";
        var idx = "2" || "";


        var is_rumor = "" * 1;
        var norumor = "" * 1;
        if (!!is_rumor && !norumor) {
            if (!document.referrer || document.referrer.indexOf("mp.weixin.qq.com/mp/rumor") == -1) {
                location.href = "http://mp.weixin.qq.com/mp/rumor?action=info&__biz=" + biz + "&mid=" + mid + "&idx=" + idx + "&sn=" + sn + "#wechat_redirect";
            }
        }


    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"/>

    <link rel="dns-prefetch" href="//res.wx.qq.com">
    <link rel="dns-prefetch" href="//mmbiz.qpic.cn">
    <link rel="shortcut icon" type="image/x-icon"
          href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/common/favicon22c41b.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <script type="text/javascript">
        String.prototype.html = function (encode) {
            var replace = ["&#39;", "'", "&quot;", '"', "&nbsp;", " ", "&gt;", ">", "&lt;", "<", "&amp;", "&", "&yen;", "¥"];
            if (encode) {
                replace.reverse();
            }
            for (var i = 0, str = this; i < replace.length; i += 2) {
                str = str.replace(new RegExp(replace[i], 'g'), replace[i + 1]);
            }
            return str;
        };

        window.isInWeixinApp = function () {
            return /MicroMessenger/.test(navigator.userAgent);
        };

        window.getQueryFromURL = function (url) {
            url = url || 'http://qq.com/s?a=b#rd'; // 做一层保护，保证URL是合法的
            var query = url.split('?')[1].split('#')[0].split('&'),
                    params = {};
            for (var i = 0; i < query.length; i++) {
                var arg = query[i].split('=');
                params[arg[0]] = arg[1];
            }
            if (params['pass_ticket']) {
                params['pass_ticket'] = encodeURIComponent(params['pass_ticket'].html(false).html(false).replace(/\s/g, "+"));
            }
            return params;
        };

        (function () {
            var params = getQueryFromURL(location.href);
            window.uin = params['uin'] || '';
            window.key = params['key'] || '';
            window.wxtoken = params['wxtoken'] || '';
            window.pass_ticket = params['pass_ticket'] || '';
        })();

    </script>

    <title>不是小鲜肉，他却抢了吴亦凡走Burberry大秀的头条！</title>

    <link rel="stylesheet" type="text/css"
          href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve2a7a3f.css">
    <style>

    </style>
    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css"
          href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_pc2a7a3f.css">
    <![endif]-->
    <script type="text/javascript">
        document.domain = "qq.com";
    </script>

</head>
<body id="activity-detail" class="zh_CN mm_appmsg" ontouchstart="">

<script type="text/javascript">
    var write_sceen_time = (+new Date());
</script>

<div id="js_cmt_mine" class="discuss_container editing access" style="display:none;">
    <div class="discuss_container_inner">
        <h2 class="rich_media_title">不是小鲜肉，他却抢了吴亦凡走Burberry大秀的头条！</h2>
        <span id="log"></span>

        <div class="frm_textarea_box_wrp">
                <span class="frm_textarea_box">
                    <textarea id="js_cmt_input" class="frm_textarea" placeholder="留言将由公众号筛选后显示，对所有人可见。"></textarea>
                    <div class="emotion_tool">
                        <span class="emotion_switch" style="display:none;"></span>
                        <span id="js_emotion_switch" class="pic_emotion_switch_wrp">
                            <img class="pic_default"
                                 src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/emotion/icon_emotion_switch.2x278965.png"
                                 alt="">
                            <img class="pic_active"
                                 src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/emotion/icon_emotion_switch_active.2x278965.png"
                                 alt="">
                        </span>

                        <div class="emotion_panel" id="js_emotion_panel">
                            <span class="emotion_panel_arrow_wrp" id="js_emotion_panel_arrow_wrp">
                                <i class="emotion_panel_arrow arrow_out"></i>
                                <i class="emotion_panel_arrow arrow_in"></i>
                            </span>

                            <div class="emotion_list_wrp" id="js_slide_wrapper">


                            </div>
                            <ul class="emotion_navs" id="js_navbar">

                            </ul>
                        </div>
                    </div>
                </span>
        </div>
        <div class="discuss_btn_wrp"><a id="js_cmt_submit" class="btn btn_primary btn_discuss btn_disabled"
                                        href="javascript:;">提交</a></div>
        <div class="discuss_list_wrp" style="display:none">
            <div class="rich_tips with_line title_tips discuss_title_line">
                <span class="tips">我的留言</span>
            </div>
            <ul class="discuss_list" id="js_cmt_mylist"></ul>
        </div>
        <div class="rich_tips tips_global loading_tips" id="js_mycmt_loading">
            <img src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/common/icon_loading_white2805ea.gif"
                 class="rich_icon icon_loading_white" alt="">
            <span class="tips">加载中</span>
        </div>
        <div class="wx_poptips" id="js_cmt_toast" style="display:none;">
            <img alt="" class="icon_toast"
                 src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGoAAABqCAYAAABUIcSXAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3NpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoyMTUxMzkxZS1jYWVhLTRmZTMtYTY2NS0xNTRkNDJiOGQyMWIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MTA3QzM2RTg3N0UwMTFFNEIzQURGMTQzNzQzMDAxQTUiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MTA3QzM2RTc3N0UwMTFFNEIzQURGMTQzNzQzMDAxQTUiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NWMyOGVjZTMtNzllZS00ODlhLWIxZTYtYzNmM2RjNzg2YjI2IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjIxNTEzOTFlLWNhZWEtNGZlMy1hNjY1LTE1NGQ0MmI4ZDIxYiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pmvxj1gAAAVrSURBVHja7J15rF1TFMbXk74q1ZKHGlMkJVIhIgg1FH+YEpEQJCKmGBpThRoSs5jVVNrSQUvEEENIhGiiNf9BiERICCFIRbUiDa2qvudbOetF3Tzv7XWGffa55/uS7593977n3vO7e5+199p7v56BgQGh0tcmvAUERREUQVEERREUQVEERREUQVEERREUQVEERREUQVEERREUQVEERVAUQVEERVAUQbVYk+HdvZVG8b5F0xj4RvhouB+eCy8KrdzDJc1RtAX8ILxvx98V1GyCSkN98Cx4z/95/Wn4fj6j6tUEeN4wkFSnw1MJqj5NhBfAuwaUHREUg4lqNMmePVsHll/HFhVfe1t3FwpJI8DXCCquDrCWNN4B6Tb4M3Z98aTPmTvh0YHl18PXw29yZiKejoPvcUD6E74yFBJbVDk6Bb7K8aP/Hb4c/tRzEYIqprPhSxzlf4Uvhb/0Xoig8qnHAJ3lqPMzfDH8XZ4LEpRf2sVdA5/sqPO9Qfop70UJyn+/boaPddT5yrq7VUUvTIVJI7q74MMddXR8NB1eXcYvhBpZm0s2w72/o86HFoKvLau/pYaXzjLMdUJ6y0LwtWV9CIIaXtvA8+G9HHV03u5q+K+yH47U0NoRngPv7KjzHDwTLj0bS1BDazfJJlcnOOostC6ysnCT+q80G/sIvFVgeW09D8FPVT0uoP7VfvAD8NjA8pqmuAN+OcYAjso0RbIZ8DGB5TVNcRO8JMaHY9SXSdfa3eeANJimWBLrA7JFiZwIXye+NMUV8CcxP2SRFjXefok7NRjSGZJlWUPvw2/wtNiQirSoXWyMsR28wR7AzzYM0oXw+Y7yK+CLJGeaoqjyrJSdZJD6Ov4+z5y6NJc0Az7NUecHydIUy+v60KNyQHoM3nKI1y7YCFiq0i7uBvgER52vDdKqWn9djhY1Dn4G3n6Ecqm2rF74dvgoR53S0hQxW9RJAZAGW5bSn58QJA27dQ7uIEedjywEX5NKVxCqsY6y+qA+LxFI4+yZ6oH0trWkNan80jygtIUsc5SflgAsDXgehfdx1KkkTRE76tN+Xue2jnTU0Ru1oIbvpt30bBtKhOp5yaaRkts0lic8V1i6dPcIRx2d/l8Y8XtNNEg7OOo8bl1kmmOKnDsO88CaYzejau0hWZqiL7C83oCH4SeTHvwV2BqqsHRVztSEYOmWF80NeXZT6Hd4KflResE9vCnBOlCyGfDNAstHTVPUDWoQ1t3iW+9WNizvlhfd4aerXd+ThqiMfNR6+9LvOOro5OY5JX2H4+F7HZD+kGzlamMgldWiirQsjcwWFbjmqZJteekJLK9pisvgL6RhKvuciZiwzrWWGapfrPy30kBVcSBIrw0aD3PU0XB6cehntq7rTMf7/2iQlktDVdXJLXlg6VjmiYBn6rWSTRCH6hvJ0hQrpcGq8oidsmHpTP8t8DGO9/vcWt9qabiqPgup1yKyQwvC2tSefZ73SSpNkUJ4PlLorlHZ+446nc8f3fIyywlJhwrTuwVSjBa1ccvSxN0hjjoK5xVrYZMd9V6XbFfgBukixTwGLg8sDam3dZR/wZ6L/dJlin1en8LS+bgpFbz3Ygvzu1J1HKxYNqxGpCmaCEo12rrBorD6LRp8UbpcdR5VWhTW35KlKd6QFqjuM2XzwlpnMxTvSkuUwuG/Xlg6NtPjbT6WFimF/VG6LEvXgn8QGDjMbBukVECFwhpoS+CQatfX2Q1q6H7wENHdrfCr0lKleEB9JyxNneus+VJpsVL9TwI6W65LovWIGl3KtVJaLv7LBwYTFEERFEVQFEERFEVQFEERFEVQFEERFEVQFEERFEVQFEERFFWq/hFgADUMN4RzT6/OAAAAAElFTkSuQmCC">

            <p class="toast_content">已留言</p>
        </div>
    </div>
</div>

<div id="js_article" class="rich_media">

    <div id="js_top_ad_area" class="top_banner">

    </div>


    <div class="rich_media_inner">
        <div id="page-content">
            <div id="img-content" class="rich_media_area_primary">
                <h2 class="rich_media_title" id="activity-name">
                    不是小鲜肉，他却抢了吴亦凡走Burberry大秀的头条！
                </h2>

                <div class="rich_media_meta_list">
                    <em id="post-date" class="rich_media_meta rich_media_meta_text">2016-01-14</em>

                    <em class="rich_media_meta rich_media_meta_text">摩姐</em>
                    <a class="rich_media_meta rich_media_meta_link rich_media_meta_nickname" href="javascript:void(0);"
                       id="post-user">Bomoda摩登系</a>
                    <span class="rich_media_meta rich_media_meta_text rich_media_meta_nickname">Bomoda摩登系</span>

                    <div id="js_profile_qrcode" class="profile_container" style="display:none;">
                        <div class="profile_inner">
                            <strong class="profile_nickname">Bomoda摩登系</strong>
                            <img class="profile_avatar" id="js_profile_qrcode_img" src="" alt="">

                            <p class="profile_meta">
                                <label class="profile_meta_label">微信号</label>
                                <span class="profile_meta_value">bomoda</span>
                            </p>

                            <p class="profile_meta">
                                <label class="profile_meta_label">功能介绍</label>
                                <span class="profile_meta_value">来自纽约，每日送上新鲜时尚资讯，做你最好的潮流密友</span>
                            </p>

                        </div>
                            <span class="profile_arrow_wrp" id="js_profile_arrow_wrp">
                                <i class="profile_arrow arrow_out"></i>
                                <i class="profile_arrow arrow_in"></i>
                            </span>
                    </div>
                </div>


                <div class="rich_media_content " id="js_content">

                    <p></p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVePavb9icNbJnXJFIk1b8Hf8scj2EQRtHXS56Zvs4oQAGfkKv6xy8jkL1U05ib89xJZykod1D3eVJRw/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="0.0875" data-w="640" data-s="300,640"/><br/>本土化做得最好的大牌Burberry这次又发大招了，请来了当红小鲜肉吴亦凡走大秀，还是闭场时的领队！▼
                    </p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHI6iahYBiaZ8pibf0vdzT7JQBfYh5Qq8bXEibs9ic4lHHZaicMEyMZtAVcY6A/0?wx_fmt=gif"
                             data-type="gif" data-ratio="0.4925" data-w="400"/><br/></p>

                    <p><br/></p>

                    <p>Vogue中国的主编张宇也连刷数个Instagram，很骄傲自己促成了这次的联姻。满满的头条味儿！▼</p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHED0eBPul0ic5XmRdulBtCYlNCEa50bGk6Ep8fBUMdIwt7BgSpLrXJxQ/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.4780600461893764" data-w="866" data-s="300,640"/><br/></p>

                    <p><br/></p>

                    <p>但赶巧不巧，第二天的时尚报道里却被另一位音乐人的离世占满了版面，甚至连高冷的CNN和纽约时报都以Breaking News的形式推送了这条消息！▼</p>

                    <p><img style="WIDTH: 100%; HEIGHT: auto"
                            data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHrdJcgx8ic6UTzu19hTA6q6KW76lvte1Y8dRdyHOP58YukIK2bYArk4A/0?wx_fmt=png"
                            data-type="png" data-ratio="0.3940520446096654" data-w="538" data-s="300,640"/><br/></p>

                    <p><br/></p>

                    <p>David Bowie，摇滚乐的泰斗级人物，又称摇滚变色龙，粉丝们口中的宝爷，在“奔七”的路上与世长辞！▼</p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHIXPQEibBic17lcp9NvQLwcplStPXKcicXzGBTPLmibjZj5ASibsyNcnafsg/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.4322916666666667" data-w="384" data-s="300,640"/></p>

                    <p><br/></p>

                    <p>也许这个名字对大部分“九零后”摩粉来说有些陌生，那么今天摩姐就来和大家八一八，为何这位音乐人的离世可以震动整个时尚圈？▼</p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHq4AgpsvN20CdFtS3FcF5yc3ZTchviaCfnib5UbqIHxj3wcYqmRCUJB1g/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="0.6641366223908919" data-w="527" data-s="300,640"/><br/></p>

                    <p><br/></p>

                    <p>说起来，这并不是吴亦凡第一次和宝爷David Bowie扯上交集了，去年七月的Vogue中国版封面，灵感就来自David Bowie。▼</p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHqDM5WEPUlKTwsBGIeoicPplKF48o4icIElhACGa9ib9y2yDRAB3YazGrA/0?wx_fmt=png"
                             data-type="png" data-ratio="0.6942675159235668" data-w="785" data-s="300,640"/><br/></p>

                    <p><br/></p>

                    <p>封面大片中的星星和闪电元素更出现在了如今的许多当红设计中，比如Marc Jacobs 16年春的星星高跟裸靴（左）和网红Chiara Ferragni自己设计的长筒靴（右）▼</p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CH9oLcKcGR6rkFP8eeAd1r2nykW8mrtSCgAIEsIoDpGPhPnApFZ6ZZXw/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="0.7567567567567568" data-w="703" data-s="300,640"/><br/></p>

                    <p><br/></p>

                    <p>David Bowie对时尚界的贡献不仅限于此，一直以来，宝爷都是设计师的缪斯！▼</p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHrvVl8fJJxAlr5X89qMoEO5fNXeNibuwibEJStgHllJcLOPic3lnxiaLsdg/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.2133333333333333" data-w="450" data-s="300,640"/><br/></p>

                    <p><br/></p>

                    <p><span style="BACKGROUND-COLOR: rgb(0,0,0); COLOR: rgb(255,255,255)">T台缪斯David Bowie</span></p>

                    <p><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap">Givenchy在2010年推出的黑白条纹的外套，让人能瞬间联想到</span><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap">Freddie Burretti</span><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap">为David Bowie设计的著名黑白外套<span
                            style="LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important">▼</span></span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8fx5g4JJcHNHUoclp0uSrzqxjMsbQrMLr5icehpcv1KCY9GR1BKxBjWQ/640?wx_fmt=png"
                             data-type="png" data-ratio="0.7741379310344828" data-w="580" data-s="300,640"/><br/><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"></span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"><br/></span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="COLOR: rgb(0,0,0)"><span
                                style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">Balmain 2011秋冬的这件闪电连体裤灵感来自David Bowie经典专辑里<span
                                style="LINE-HEIGHT: 25px; MAX-WIDTH: 100% !important">Ziggy Stardust的风格。</span></span></span><span
                            style="BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; COLOR: rgb(0,0,0)">▼</span></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"><img
                                data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHdGqW2iaMJvNicq1shuRBXCWZPcuxJtIL1ekia0KSvFHq9OZcGTnuibiberg/0?wx_fmt=jpeg"
                                data-type="jpeg" data-ratio="0.7256176853055917" data-w="769"
                                data-s="300,640"/><br/></span></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="COLOR: rgb(0,0,0)"><span
                                style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">2012年，Miu Miu推出了光滑的丝质套装， 印花衬衫和金属领带不由让人想起</span><span
                                style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">Life on Mars里面那套著名的蓝绿色紧身戏服<span
                                style="LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important">▼</span></span></span><br
                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p>
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8xy6QOdFL7O6szck32vH8uGJPOpGQv7abIBZoJ4ltkncg9wYYdWKibQg/640?wx_fmt=png"
                             data-type="png" data-ratio="0.734375" data-w="640" data-s="300,640"/></p>

                    <p><br/></p>

                    <p>2013年Alexander Mcqueen度假系列的look模仿了Bowie&quot;Hunky Dory&quot;专辑的封底▼</p>

                    <p>
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8iaCQ9TXU8RnCswk3mDXJsaxuT2aNYcOuVx760GoF3MUibWQQBX7sJAnQ/640?wx_fmt=png"
                             data-type="png" data-ratio="0.821875" data-w="640" data-s="300,640"/></p>

                    <p><br/></p>

                    <p>同样是2013年春，Jean Paul Gaultier把很多80年代的摇滚明星带到了他的秀场，其中模特顶着宝爷标志性的红头发，星星元素也在模特的衣服上出现。▼</p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CH0YhGMgllyDeyIAJs672UPCMFq6Cja3TTalqQbRZgDNuUCc9ibiceXjOw/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="0.7399030694668821" data-w="619" data-s="300,640"/></p>

                    <p><br/></p>

                    <p>早些时候，Gucci的白色天鹅绒套装和Armani Prive亮片装饰造型灵感也来自宝爷曾经的造型。▼</p>

                    <p style="WHITE-SPACE: normal"><img
                            data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHRvhcgp4hF6wfray2HtZmza7vrloIPfUAn46BWzHf4T3ro0giaobrnWA/0?wx_fmt=jpeg"
                            data-type="jpeg" data-ratio="0.7512899896800825" data-w="969" data-s="300,640"/></p>

                    <p><br/></p>

                    <p>哪怕是在去年，Chloe还将David Bowie的摇滚风与Kate Bush的波西米亚风情完美地结合在了一起，推出了早秋系列。▼<br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8Q4TJmrMu1WqSRKeOk9fotQl2ght2PfSf8VG1y3sKrKNUIVcJMiaWeFQ/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="480" data-s="300,640"/><br
                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="BACKGROUND-COLOR: rgb(0,0,0); COLOR: rgb(255,255,255)">舞台女王David Bowie</span></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        除了成为了设计师的灵感缪斯，舞台上的宝爷也大放异彩。连我们林林公主也比不上哦！</p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="WIDTH: 100%; HEIGHT: auto"
                             data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHlibvvYcibnwiatia2nqODAQe7G2Pbic3NXbYICDrYgNXuFUGOXicfYn2K55A/0?wx_fmt=gif"
                             data-type="gif" data-ratio="0.7862453531598513" data-w="538"/><br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"><br/></span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">1973年，穿着不对称紧身裤的David Bowie顶着他著名</span><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">的</span><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">Ziggy Stardust发型，这是他的经典造型之一<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span></span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb89qGdo7RSHj9wszvicwLicRy63S1hlr3qb1nLKibopyicfoib0VBTGpAzSicQ/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        同年，他穿着东方风情的灯笼袖演出服，尝试雌雄同体风格<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb87qbWh7icEiaNYMcKt2OQc8EO5QYc9A4Micm8WNQNpmZr3ZgSYPNsN0XDg/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        1974年11月1号，David Bowie穿着短款垫肩双排扣西装，搭配70年代正流行的白色阔腿裤<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8TM2vAPUY68ice4YIMnJOp3YtL1BwzILh8dHiaZ4WmQyYwprZxGSK1zfg/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        1977年，他用暗条纹衬衫配牛仔裤，解开前两颗扣子，更加休闲随意<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8y08ChRkAiam0MTgvHokHj9s1lXULbic6iaiaM7ykm0g3jQw5G6QnKsLvlw/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        1978年5月14号，他穿着扎染的丝质衬衫，夸张的灯笼裤，戴着白色的海军帽，很年轻清新的风格<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8GbzYNqd1XEI7mkicOVzWwRbMQvguMg1hod9bVHXyTRicxaBSCnqcqROQ/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        1987年，一身猩红的大号西服套装内搭同色衬衫，符合他一惯的张扬，腰间的黑色细皮带增添了玩味<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8z6HSQv7xhxqrFSibaIuEMA5XiagVIknq2iarMmiaxK8dYebjtcSsy7b8vA/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        2000年，他演出时穿着金底花纹外套内搭长款蓝白条纹衬衫，又是满满的异域风情<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8QRd3EkXwyaHDflheD3K5036rGIXII4eEX6yXPWlhqfibCD32aknsbDQ/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="BACKGROUND-COLOR: rgb(0,0,0); COLOR: rgb(255,255,255)">时尚icon David Bowie</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        生活中的宝爷，并不像舞台上的他如此妖艳。<span style="BACKGROUND-COLOR: rgb(255,255,255)">1965年1月1号，年轻的他，穿着白衬衫灰色西裤，系着格纹领带，一副传统少年的模样</span><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; BACKGROUND-COLOR: rgb(255,255,255); MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: normal; MARGIN-BOTTOM: 20px; CLEAR: left"
                       class="dropCap adAvoidedButFlowable"><img
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; WIDTH: auto !important; WORD-WRAP: break-word !important; HEIGHT: auto; VISIBILITY: visible !important"
                            data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8RQUDey1PBIu7ickS9DZLr4tHrypV8icAPJCibuosiaLHcdCrL5S3u16DnQ/640?wx_fmt=jpeg"
                            data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        1977年，黑色皮衣配同色长裤，随意挂着的细条纹围巾潇洒又摩登。<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span><br/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; HEIGHT: auto; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8qr126OgQ6Wd0rjvMhbgULUlaUMyy0ibGIMwB9G7qBN8CCa7T0Sh8XgQ/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        1979年，David Bowie穿着和服配木屐，像个传统的日本男子，值得一提的是，他和列侬夫妻关系非常好！<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; HEIGHT: auto; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb82ZB59hc35Yhdc09PXGYzGnueyvuF9uF6FicKiaichraMdwR3KpMdGrK4g/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        1983年的他穿着中性色彩的正统西服套装，堆积的棉袜配棕色皮鞋显现了他的与众不同<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; HEIGHT: auto; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8ibSNuYtDxs8Gfom5ia2TLHFkHvRkG5ePk7ocKeA03UkfxYMvhL0XvLhw/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        80年代正是oversize流行的年代，1984年12月12号的David Bowie穿着大码的格纹拼接衬衫<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; HEIGHT: auto; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8xCByfzGv7SW3AWC96HDNSqIslG8PuhkPf93SjUuOeWa70uIUcHNREA/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        2006年1月19号的照片，他用超大号深灰大衣，搭配不同暗度的灰色高领毛衣，慢慢上了年纪的David Bowie仍没有放弃对时尚的追求<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; HEIGHT: auto; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8Ib8xx9j0405R3DHibiaefz9J43hMxnDwBXESXibWicSpXo7ibsTMPlGN1Fw/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        2008年5月5号，即使要穿黑色西服套装，David Bowie也会选择有拼接驳头这样有趣细节的<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; HEIGHT: auto; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/9c4W7JPdufXV76k3XPLpuWyOqDk2APb8SRicE8otbJWy0fXPPWibyocBr2vBb9IBXc3cO6rOHuNFChaFz8QWaLcg/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="BOX-SIZING: border-box !important; LINE-HEIGHT: 1.6; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"><br
                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/></span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="BACKGROUND-COLOR: rgb(255,255,255); WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">看起来永远不会老的宝爷就这么突然离开我们了，这不禁让摩姐想起来了另一位此前突然离世的时尚界大佬Alexander Mcqueen。巧合的是，两人在97年还曾有过合作，一起设计了下面这件大衣！</span><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <span style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"><img
                                data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CH3v9zL2AwiaQ61sULUYLeE30ibhpgOeGIXgbxbnic1uiczdIdQJGpsyXAEw/0?wx_fmt=jpeg"
                                data-type="jpeg" data-ratio="1.5" data-w="426" data-s="300,640"/><br/></span></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        如今这两位泰斗都已离世，每个人都有缅怀大师的方式，摩姐是写了这篇图文，而一名在伦敦时装周走秀的模特是将Bowie的名字写在了手上。<span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; BACKGROUND-COLOR: rgb(255,255,255); FONT-FAMILY: 宋体; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">▼</span>
                    </p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <img style="BOX-SIZING: border-box !important; LINE-HEIGHT: 22px; WIDTH: auto !important; WORD-WRAP: break-word !important; WHITE-SPACE: normal; VISIBILITY: visible !important; FONT-SIZE: 14px"
                             data-src="http://mmbiz.qpic.cn/mmbiz/ERPTeDFMalSCXyesgcs4A9bbMeG6rPjhlgR3tJEZ9n1XRAZiaiceYd5jEQ5PpFjG8yUeDNsPqT2Wp9X1PGWLZX9Q/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="0.678125" data-w="640" data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/>
                    </p>

                    <p>不少纽约客也自发前往其位于纽约大学附近老佛爷街的宝爷故居，门前堆满了蜡烛与鲜花。▼</p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHktNJWEia2ZKCmf8ZEtUhK0wUMdTpJaxia4jV0iaEny5ppv94QtYiaQiaiaLg/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1.1408199643493761" data-w="1122" data-s="300,640"/><br/></p>

                    <p><br/></p>

                    <p>柏林的故居前也满是鲜花和卡片，大家都用自己的方式纪念着这位天王巨星。一生喜欢热热闹闹的宝爷应该很高兴了吧！▼</p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVdY7iaXrE29CPM5CUe5oj0CHFobIWLZpXuSsg4FdwZOmPVHFBqTicWbr3C0vK0U6z0oO1mBxVqUesMA/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1" data-w="670" data-s="300,640"/><br/></p>

                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap; COLOR: rgb(62,62,62)">
                        <br/></p>

                    <p style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap">
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVeFibWKLEc3eDI5g6VNLaUloFJQKgQibDvdCKdDW4NRpbN0jkowzau2cvrd3MdTPjV6zdQNicP6fMn6w/640?wx_fmt=png"
                             width="auto" data-type="png" data-ratio="0.1564625850340136" data-w="588"
                             data-s="300,640"/></p>

                    <p style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap">
                        <span style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">每天摩姐都会在这个小栏目，随手拍点照片，和大家分享一些在</span><span
                            style="BOX-SIZING: border-box !important; BACKGROUND-COLOR: rgb(255,192,0); MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">纽约的好逛好吃好玩</span><span
                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">。</span>
                    </p>

                    <p><br/></p>

                    <p>
                        <section
                                style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: normal"
                                class="Powered-by-XIUMI V5">
                            <section
                                    style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                <section
                                        style="BOX-SIZING: border-box !important; MARGIN-TOP: 0.5em; WIDTH: 556px; DISPLAY: inline-block; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; MARGIN-BOTTOM: 0.5em; VERTICAL-ALIGN: top">
                                    <section
                                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"
                                            class="Powered-by-XIUMI V5">
                                        <section
                                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                            <section
                                                    style="BOX-SIZING: border-box !important; PADDING-BOTTOM: 10px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px; DISPLAY: inline-block; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; VERTICAL-ALIGN: top; PADDING-TOP: 10px; box-shadow: rgba(159, 160, 160, 0.498039) 0px 0px 10px">
                                                <section
                                                        style="BOX-SIZING: border-box !important; PADDING-BOTTOM: 7px; PADDING-LEFT: 7px; PADDING-RIGHT: 7px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; PADDING-TOP: 7px; box-shadow: rgba(0, 0, 0, 0.290196) 0px 0px 10px inset">
                                                    <section
                                                            style="BOX-SIZING: border-box !important; WIDTH: 522px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                                        <section
                                                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"
                                                                class="Powered-by-XIUMI V5">
                                                            <section
                                                                    style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"></section>
                                                        </section>
                                                    </section>
                                                </section>
                                            </section>
                                        </section>
                                    </section>
                                </section>
                            </section>
                        </section>
                    </p>
                    <p>
                        <img style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVcFRHOfFib3yNhyicSzAhxibkddbH3qU4emvh7ck61wMW656IIqFIa7ax7bvwuqM3Ct6X7GC420gyjRQ/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1" data-w="640" data-s="300,640"/></p>

                    <p>
                        <section
                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; CLEAR: both"></section>
                        <section
                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"
                                class="Powered-by-XIUMI V5">
                            <section
                                    style="BOX-SIZING: border-box !important; PADDING-BOTTOM: 5px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; PADDING-TOP: 5px">
                                <section
                                        style="BOX-SIZING: border-box !important; TEXT-ALIGN: right; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; FONT-SIZE: 19px">
                                    <section
                                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"></section>
                                </section>
                            </section>
                        </section>
                    </p>
                    <p><span
                            style="BOX-SIZING: border-box !important; BACKGROUND-COLOR: rgb(255,218,81); MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; FONT-SIZE: 16px">—Greecologies<span
                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">.</span></span>
                    </p>

                    <p>
                        <section
                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                            <section
                                    style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                <section
                                        style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                    <section
                                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"></section>
                                </section>
                            </section>
                        </section>
                    </p>
                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap">
                        女孩子们吃得再饱，胃里都有位置留给甜品。作为一个时尚精，摩姐对甜点的要求就是好吃但不会胖，今天的花擦擦就带大家去一家专吃酸奶的店，这家酸奶店名叫Greecologies，专做各色希腊酸奶。</p>

                    <p>
                        <section
                                style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: normal"
                                class="Powered-by-XIUMI V5">
                            <section
                                    style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                <section
                                        style="BOX-SIZING: border-box !important; MARGIN-TOP: 0.5em; WIDTH: 556px; DISPLAY: inline-block; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; MARGIN-BOTTOM: 0.5em; VERTICAL-ALIGN: top">
                                    <section
                                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"
                                            class="Powered-by-XIUMI V5">
                                        <section
                                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                            <section
                                                    style="BOX-SIZING: border-box !important; PADDING-BOTTOM: 10px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px; DISPLAY: inline-block; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; VERTICAL-ALIGN: top; PADDING-TOP: 10px; box-shadow: rgba(159, 160, 160, 0.498039) 0px 0px 10px">
                                                <section
                                                        style="BOX-SIZING: border-box !important; PADDING-BOTTOM: 7px; PADDING-LEFT: 7px; PADDING-RIGHT: 7px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; PADDING-TOP: 7px; box-shadow: rgba(0, 0, 0, 0.290196) 0px 0px 10px inset">
                                                    <section
                                                            style="BOX-SIZING: border-box !important; WIDTH: 522px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                                        <section
                                                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"
                                                                class="Powered-by-XIUMI V5">
                                                            <section
                                                                    style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"></section>
                                                        </section>
                                                    </section>
                                                </section>
                                            </section>
                                        </section>
                                    </section>
                                </section>
                            </section>
                        </section>
                    </p>
                    <p>
                        <img style="BOX-SIZING: border-box !important; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                             data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVcFRHOfFib3yNhyicSzAhxibkdmrWIVebMibZ4ZPG12FJx4JJtqBgXh57EzT2E2SibmDU2o4aQBaicQnnpg/640?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="0.9921875" data-w="640" data-s="300,640"/><br
                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"/><img
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; WIDTH: auto !important; WORD-WRAP: break-word !important; VISIBILITY: visible !important"
                            data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVcFRHOfFib3yNhyicSzAhxibkdHxL6uzyS5BOFoYN7d0Gia4H01tvaFa586Gh1M7xA4ArTWN0tpCDA7Nw/640?wx_fmt=jpeg"
                            data-type="jpeg" data-ratio="0.9609375" data-w="640" data-s="300,640"/></p>

                    <p>
                        <section
                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; CLEAR: both"></section>
                        <section
                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"
                                class="Powered-by-XIUMI V5">
                            <section
                                    style="BOX-SIZING: border-box !important; PADDING-BOTTOM: 5px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; PADDING-TOP: 5px">
                                <section
                                        style="BOX-SIZING: border-box !important; TEXT-ALIGN: right; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; FONT-SIZE: 19px">
                                    <section
                                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"></section>
                                </section>
                            </section>
                        </section>
                    </p>
                    <p><span
                            style="BOX-SIZING: border-box !important; BACKGROUND-COLOR: rgb(255,218,81); MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; FONT-SIZE: 16px"><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">—Greecologies</span><span
                            style="BOX-SIZING: border-box !important; LINE-HEIGHT: 25px; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">.</span><span
                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"></span></span>
                    </p>

                    <p>
                        <section
                                style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                            <section
                                    style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                <section
                                        style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important">
                                    <section
                                            style="BOX-SIZING: border-box !important; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important"></section>
                                </section>
                            </section>
                        </section>
                    </p>
                    <p style="BOX-SIZING: border-box !important; MIN-HEIGHT: 1em; MAX-WIDTH: 100% !important; WORD-WRAP: break-word !important; WHITE-SPACE: pre-wrap">
                        它家都以原味希腊酸奶为底，上面可以选择各种配料，最著名的是自制的玫瑰酱，味道非常独特。除了酸奶，还有一个超文艺的后院，是不少网红们的拍照胜地。有吃又有拍，这样的好地方怎么能错过呢？地址是379
                        Broome Street。</p>

                    <p></p>

                    <p><br/></p>

                    <p><br/></p>

                    <p>最后也别忘了关注摩姐微信号<span style="BACKGROUND-COLOR: rgb(0,0,0); COLOR: rgb(255,255,255)">摩登系BOMODA</span>，诚意满满的时尚资讯等着你！
                    </p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVeguahZnOUnwg4uaY8R365TB9aibjHp4NzEE99nPzTicBcAmgdkpMpaM2SV56Cia04BCicPXd48O9x9sw/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="1" data-w="430" data-s="300,640"/></p>

                    <p>
                        <img data-src="http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVeguahZnOUnwg4uaY8R365TEkiazwfVAREG8WEwwBNTcdlU8SD8PiaZcwHNqiaX1cvfSpwBKHckB3yjA/0?wx_fmt=jpeg"
                             data-type="jpeg" data-ratio="0.6401515151515151" data-w="528" data-s="300,640"/></p>

                    <p></p>
                </div>
                <script type="text/javascript">
                    var first_sceen__time = (+new Date());

                    if ("" == 1 && document.getElementById('js_content'))
                        document.getElementById('js_content').addEventListener("selectstart", function (e) {
                            e.preventDefault();
                        });

                    (function () {
                        if (navigator.userAgent.indexOf("WindowsWechat") != -1) {
                            var link = document.createElement('link');
                            var head = document.getElementsByTagName('head')[0];
                            link.rel = 'stylesheet';
                            link.type = 'text/css';
                            link.href = "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_winwx2b1291.css";
                            head.appendChild(link);
                        }
                    })();
                </script>
                <link rel="stylesheet" type="text/css"
                      href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_combo2a7a3f.css">


                <div class="rich_media_tool" id="js_toobar3">
                    <div id="js_read_area3" class="media_tool_meta tips_global meta_primary" style="display:none;">阅读
                        <span id="readNum3"></span></div>

                        <span style="display:none;" class="media_tool_meta meta_primary tips_global meta_praise"
                              id="like3">
                            <i class="icon_praise_gray"></i><span class="praise_num" id="likeNum3"></span>
                        </span>

                    <a id="js_report_article3" style="display:none;" class="media_tool_meta tips_global meta_extra"
                       href="javascript:void(0);">举报</a>

                </div>
            </div>

            <div class="rich_media_area_extra">


                <div class="mpda_bottom_container" id="js_bottom_ad_area">

                </div>

                <div id="js_iframetest" style="display:none;"></div>


                <div class="rich_media_extra" id="js_cmt_area" style="display:none">

                    <div class="discuss_container" id="js_cmt_main" style="display:none">
                        <div class="rich_tips with_line title_tips discuss_title_line">
                            <span class="tips">精选留言</span>
                        </div>
                        <p class="tips_global tc title_bottom_tips" id="js_cmt_nofans1" style="display:none;">
                            关注该公众号可参与留言</p>

                        <p class="discuss_icon_tips title_bottom_tips tr" id="js_cmt_addbtn1" style="display:none">

                            <a href="#comment">写留言<img class="icon_edit"
                                                       src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/icon_edit25ded2.png"
                                                       alt=""></a>
                        </p>
                        <ul class="discuss_list" id="js_cmt_list"></ul>
                    </div>


                    <div class="tips_global rich_split_tips tc" id="js_cmt_nofans2" style="display:none;">
                        关注该公众号可参与留言
                    </div>

                    <p class="discuss_icon_tips rich_split_tips tr" id="js_cmt_addbtn2" style="display:none">

                        <a href="#comment">写留言<img class="icon_edit"
                                                   src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/icon_edit25ded2.png"
                                                   alt=""></a>
                    </p>

                    <p class="rich_split_tips tc tips_global" id="js_cmt_tips" style="display:none;"></p>


                    <div class="rich_tips tips_global loading_tips" id="js_cmt_loading">
                        <img src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/common/icon_loading_white2805ea.gif"
                             class="rich_icon icon_loading_white" alt="">
                        <span class="tips">加载中</span>
                    </div>

                    <div class="rich_tips with_line tips_global" id="js_cmt_statement" style="display:none">
                        <span class="tips">以上留言由公众号筛选后显示</span>
                    </div>

                    <p class="rich_split_tips tc" id="js_cmt_qa" style="display:none;">
                        <a href="http://kf.qq.com/touch/sappfaq/150211YfyMVj150313qmMbyi.html?scene_id=kf264">
                            了解留言功能详情
                        </a>
                    </p>

                </div>
            </div>

        </div>
        <div id="js_pc_qr_code" class="qr_code_pc_outer" style="display:none;">
            <div class="qr_code_pc_inner">
                <div class="qr_code_pc">
                    <img id="js_pc_qr_code_img" class="qr_code_pc_img">

                    <p>微信扫一扫<br>关注该公众号</p>
                </div>
            </div>
        </div>

    </div>
</div>


<script>window.moon_map = {
    "appmsg/emotion/caret.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/caret278965.js",
    "appmsg/emotion/map.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/map278965.js",
    "appmsg/emotion/textarea.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/textarea27cdc5.js",
    "appmsg/emotion/nav.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/nav278965.js",
    "appmsg/emotion/common.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/common278965.js",
    "appmsg/emotion/slide.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/slide2a9cd9.js",
    "biz_wap/jsapi/cardticket.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/jsapi/cardticket275627.js",
    "pages/report.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/report2a26bd.js",
    "pages/music_player.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/music_player298e98.js",
    "pages/loadscript.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/loadscript292ed8.js",
    "appmsg/emotion/dom.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/dom278965.js",
    "appmsg/emotion/emotion.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/emotion2a9cd9.js",
    "biz_wap/utils/hashrouter.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/hashrouter2805ea.js",
    "appmsg/cmt_tpl.html.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/cmt_tpl.html2a2c13.js",
    "a/gotoappdetail.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/gotoappdetail2a2c13.js",
    "a/ios.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/ios275627.js",
    "a/android.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/android275627.js",
    "a/profile.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/profile29b1f8.js",
    "a/card.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/card29b1f8.js",
    "biz_wap/utils/position.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/position29b1f8.js",
    "appmsg/a_report.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/a_report282222.js",
    "biz_common/utils/report.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/report275627.js",
    "biz_common/utils/huatuo.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/huatuo293afc.js",
    "biz_common/utils/cookie.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/cookie275627.js",
    "pages/voice_component.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/voice_component2a74ac.js",
    "new_video/ctl.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/new_video/ctl292ed8.js",
    "biz_common/utils/monitor.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/monitor2a30ee.js",
    "biz_common/utils/spin.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/spin275627.js",
    "biz_wap/jsapi/pay.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/jsapi/pay275627.js",
    "appmsg/reward_entry.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/reward_entry2b1291.js",
    "appmsg/comment.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/comment2a9cd9.js",
    "appmsg/like.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/like2a74ac.js",
    "appmsg/a.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/a2a6faf.js",
    "pages/version4video.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/version4video2a6afa.js",
    "biz_wap/utils/storage.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/storage2a74ac.js",
    "biz_common/tmpl.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/tmpl275627.js",
    "appmsg/img_copyright_tpl.html.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/img_copyright_tpl.html2a2c13.js",
    "appmsg/a_tpl.html.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/a_tpl.html2a4dd8.js",
    "biz_common/ui/imgonepx.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/ui/imgonepx275627.js",
    "biz_common/dom/attr.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/dom/attr275627.js",
    "biz_wap/utils/ajax.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/ajax2b0d03.js",
    "biz_common/utils/string/html.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/string/html29f4e9.js",
    "appmsg/report.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/report2a30ee.js",
    "biz_common/dom/class.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/dom/class275627.js",
    "appmsg/report_and_source.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/report_and_source29f4e9.js",
    "appmsg/page_pos.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/page_pos2ac32d.js",
    "appmsg/cdn_speed_report.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/cdn_speed_report275627.js",
    "appmsg/voice.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/voice2ab8bd.js",
    "appmsg/qqmusic.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/qqmusic2ab8bd.js",
    "appmsg/iframe.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/iframe2ae6ea.js",
    "appmsg/review_image.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/review_image2a5394.js",
    "appmsg/outer_link.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/outer_link275627.js",
    "biz_wap/jsapi/core.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/jsapi/core2b0d03.js",
    "biz_common/dom/event.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/dom/event275627.js",
    "appmsg/copyright_report.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/copyright_report2a2c13.js",
    "appmsg/cache.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/cache2a74ac.js",
    "appmsg/pay_for_reading.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/pay_for_reading28f721.js",
    "appmsg/async.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/async2ae6ea.js",
    "biz_wap/ui/lazyload_img.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/ui/lazyload_img2b18f6.js",
    "biz_common/log/jserr.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/log/jserr2805ea.js",
    "appmsg/share.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/share2a42af.js",
    "biz_wap/utils/mmversion.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/mmversion275627.js",
    "appmsg/cdn_img_lib.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/cdn_img_lib275627.js",
    "biz_common/utils/url/parse.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/url/parse275627.js",
    "biz_wap/utils/device.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/device27f46f.js",
    "biz_wap/jsapi/a8key.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/jsapi/a8key2a30ee.js",
    "appmsg/index.js": "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/index2a9baf.js"
};
window.moon_crossorigin = true;</script>
<script type="text/javascript" src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/moon2b0d77.js"
        crossorigin></script>
<script id="voice_tpl" type="text/html">
    <span id="voice_main_<#=voiceid#>_<#=posIndex#>" class="db audio_area <#if(!musicSupport){#> unsupport<#}#>">
            <span class="tc tips_global unsupport_tips" <#if(show_not_support!==true){#>style="display:none;"
        <#}#>>
            当前浏览器不支持播放音乐或语音，请在微信或其他浏览器中播放            </span>
    <span class="audio_wrp db">
                <span id="voice_play_<#=voiceid#>_<#=posIndex#>" class="audio_play_area">
                    <i class="icon_audio_default"></i>
                    <i class="icon_audio_playing"></i>
                    <img src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/audio/icon_audio_unread26f1f1.png"
                         alt="" class="pic_audio_default">
                </span>
                <span class="audio_length tips_global"><#=duration_str#></span>
                <span class="db audio_info_area">
                    <strong class="db audio_title">
                        <#=title#>
                    </strong>
                    <span class="audio_source tips_global"><#if(window.nickname){#>来自
                        <#=window.nickname#>
                            <#}#></span>
                </span>
                <span id="voice_progress_<#=voiceid#>_<#=posIndex#>" class="progress_bar" style="width:0px;"></span>
            </span>
    </span>
</script>

<script id="qqmusic_tpl" type="text/html">
    <span id="qqmusic_main_<#=comment_id#>_<#=posIndex#>" class="db qqmusic_area <#if(!musicSupport){#> unsupport<#}#>">
            <span class="tc tips_global unsupport_tips" <#if(show_not_support!==true){#>style="display:none;"
        <#}#>>
            当前浏览器不支持播放音乐或语音，请在微信或其他浏览器中播放            </span>
    <span class="db qqmusic_wrp">
                <span class="db qqmusic_bd">
                    <span id="qqmusic_play_<#=musicid#>_<#=posIndex#>" class="play_area">
                        <i class="icon_qqmusic_switch"></i>
                        <img src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/qqmusic/icon_qqmusic_default.2x26f1f1.png"
                             alt="" class="pic_qqmusic_default">
                        <img src="<#=music_img#>" data-autourl="<#=audiourl#>" data-musicid="<#=musicid#>"
                             class="qqmusic_thumb" alt="">
                    </span>
                                        <a id="qqmusic_home_<#=musicid#>_<#=posIndex#>" href="javascript:void(0);"
                                           class="access_area">
                                            <span class="qqmusic_songname"><#=music_name#></span>
                                            <span class="qqmusic_singername"><#=singer#></span>
                                            <span class="qqmusic_source"><img
                                                    src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/qqmusic/icon_qqmusic_source263724.png"
                                                    alt=""></span>
                                        </a>
                </span>
            </span>
    </span>
</script>
<script type="text/javascript">
    var not_in_mm_css = "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/not_in_mm2a7a3f.css";
    var windowwx_css = "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_winwx2b1291.css";
    var tid = "";
    var aid = "";
    var clientversion = "0";
    var appuin = "MjM5ODE1NDM0MA==";

    var source = "6";
    var scene = 75;

    var itemidx = "";

    var _copyright_stat = "0";
    var _ori_article_type = "";

    var nickname = "Bomoda摩登系";
    var appmsg_type = "9";
    var ct = "1452774281";
    var user_name = "gh_01601a02ae86";
    var user_name_new = "";
    var fakeid = "";
    var version = "";
    var is_limit_user = "0";
    var msg_title = "不是小鲜肉，他却抢了吴亦凡走Burberry大秀的头条！";
    var msg_desc = "&nbsp;本土化做得最好的大牌Burberry这次又发大招了，请来了当红小鲜肉吴亦凡走大秀，还是闭场时的领队！▼Vo";
    var msg_cdn_url = "http://mmbiz.qpic.cn/mmbiz/HlYicPlnmEVfVAdE0ymxcic9ScVj4mqvTicCQtlOFSSqxLOZQoo4T88MoZE0jGogqNjkOHZ3eRjYQCiagsyazCVsBA/0?wx_fmt=jpeg";
    var msg_link = "http://mp.weixin.qq.com/s?__biz=MjM5ODE1NDM0MA==&amp;mid=404861047&amp;idx=2&amp;sn=1818e3e2e74f7c5b0a52b50a3e6d8e45#rd";
    var user_uin = "0" * 1;
    var msg_source_url = '';
    var img_format = 'jpeg';
    var srcid = '';
    var networkType;
    var appmsgid = '' || '404861047';
    var comment_id = "525694975" * 1;
    var comment_enabled = "" * 1;
    var is_need_reward = "0" * 1;
    var is_https_res = ("" * 1) && (location.protocol == "https:");

    var devicetype = "";
    var source_username = "";
    var profile_ext_signature = "" || "";
    var reprint_ticket = "";
    var source_mid = "";
    var source_idx = "";

    var show_comment = "";
    var __appmsgCgiData = {
        can_use_page: "0" * 1,
        is_wxg_stuff_uin: "0" * 1,
        card_pos: "",
        copyright_stat: "0",
        source_biz: "",
        hd_head_img: "http://wx.qlogo.cn/mmhead/Q3auHgzwzM4V5ia6ibXiasAsITFOOnh63hrm0hFKy5oAicJdjcJMZUMibEA/0" || (window.location.protocol + "//" + window.location.host + "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/pic/appmsg/pic_rumor_link.2x264e76.jpg")
    };
    var _empty_v = "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/pic/pages/voice/empty26f1f1.mp3";

    var copyright_stat = "0" * 1;

    var pay_fee = "" * 1;
    var pay_timestamp = "";
    var need_pay = "" * 1;

    var need_report_cost = "0" * 1;

    window.wxtoken = "";
    if (!!window.__initCatch) {
        window.__initCatch({
            idkey: 27613,
            startKey: 0,
            limit: 9,
            reportOpt: {
                uin: uin,
                biz: biz,
                mid: mid
            }


        });
    }
</script>

<script type="text/javascript">
    seajs.use('appmsg/index.js');
</script>


</body>
</html>

 
