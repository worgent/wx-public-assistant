<%--
  Created by IntelliJ IDEA.
  User: worgen
  Date: 2016/1/19
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp" %>

<!DOCTYPE html>
<!-- saved from url=(0052)http://www.xiguaji.com/Login/?rnd=635888097124316105 -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>登录 - 微普公众号助手</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="robots" content="noindex,noarchive">

    <!-- #CSS Links -->
    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/font-awesome.min.css">

    <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/smartadmin-production-plugins.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/smartadmin-skins.min.css">

    <!-- SmartAdmin RTL Support -->
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/smartadmin-rtl.min.css">

    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/demo.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/xigua/xiguaji.css">

    <style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
    .en-markup-crop-options {
        top: 18px !important;
        left: 50% !important;
        margin-left: -100px !important;
        width: 200px !important;
        border: 2px rgba(255, 255, 255, .38) solid !important;
        border-radius: 4px !important;
    }

    .en-markup-crop-options div div:first-of-type {
        margin-left: 0px !important;
    }
    </style>
</head>
<body class="animated fadeInDown  desktop-detected   pace-done">
<div class="pace  pace-inactive">
    <div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity"></div>
</div>

<!--[if lt IE 10]>
<h1 class="browserTips">为了获得更好的使用体验，请使用<a href="http://rj.baidu.com/soft/detail/14744.html" target="_blank">谷歌浏览器(chrome)
    <i class="fa fa-external-link"></i></a>、360浏览器极速模式、IE10或更高版本。</h1>
<![endif]-->
<div class="loginBox">
    <h2 class="logo"><a href="http://xigua.iwpoo.com/"><img src="/xigua/img/logo_login.png" alt="微普助手"></a>
    </h2>

    <div class="loginBoxInner">
        <form id="login-form" class="smart-form client-form" method="post" novalidate="novalidate">
            <fieldset>
                <section id="ErrorSection" style="display:none">
                    <label class="input">
                        <em class="invalid" style="color:red;" id="ErrorMessage">
                        </em>
                    </label>
                </section>
                <section>
                    <label class="input">
                        <i class="icon-append fa fa-user"></i>
                        <input type="text" name="email" placeholder="手机号码或者邮箱">
                        <b class="tooltip tooltip-top-right">请输入您的手机号码或邮箱</b>
                    </label>
                </section>
                <section>
                    <label class="input">
                        <i class="icon-append fa fa-lock"></i>
                        <input type="password" name="password" value="" placeholder="密码">
                        <b class="tooltip tooltip-top-right">请输入您的密码</b>
                    </label>
                </section>
                <section>
                    <label class="checkbox">
                        <input type="checkbox" name="remember" checked="" value="1">
                        <i></i>记住我的账号
                    </label>
                </section>
            </fieldset>
            <div class="loginButton">
                <button type="submit" class="btn btn-primary">
                    登录
                </button>
            </div>
        </form>
    </div>
    <div style="display:none">

    </div>
    <%--<div class="loginExtra">--%>
        <%--<a href="http://www.xiguaji.com/Login/FindPassword" class="normalLink">忘记密码?</a> - 还没有账号？ <a a=""--%>
                                                                                                     <%--href="http://www.xiguaji.com/Register/Index"--%>
                                                                                                     <%--class="btn btn-primary">免费注册</a>--%>
    <%--</div>--%>
</div>
<div class="loginCopyright">
    <div class="loginCopyrightTips">为了获得更好的使用体验，建议使用<a href="http://rj.baidu.com/soft/detail/14744.html"
                                                       target="_blank">谷歌浏览器(chrome) <i class="fa fa-external-link"></i></a>、360浏览器极速模式、IE10或更高版本。
    </div>
    Copyright © 2014-2015 微普公众号助手
</div>
<div class="modal fade" id="remoteModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>
<script src="/xigua/js/libs/jquery-2.1.1.min.js"></script>
<script src="/xigua/js/plugin/pace/pace.min.js"></script>
<script src="/xigua/js/libs/jquery-ui-1.10.3.min.js"></script>
<script src="/xigua/js/bootstrap/bootstrap.min.js"></script>
<script src="/xigua/js/plugin/jquery-validate/jquery.validate.min.js"></script>

<!-- JQUERY MASKED INPUT -->

<script src="/xigua/js/plugin/masked-input/jquery.maskedinput.min.js"></script>
<script src="/xigua/js/notification/SmartNotification.min.js"></script>



<!-- MAIN APP JS FILE -->
<script src="/xigua/js/app.min.js"></script>

<script type="text/javascript">
    runAllForms();
    var errorCount = 0;

    $(function () {
        loadScript(__uri("/xigua/js/plugin/jquery-form/jquery-form.min.js"), function () {
            // Validation
            $("#login-form").validate({
                // Rules for form validation
                rules: {
                    email: {
                        required: true,
                    },
                    password: {
                        required: true,
                        minlength: 3,
                        maxlength: 20
                    }
                },

                // Messages for form validation
                messages: {
                    email: {
                        required: '账号必须填写',
                    },
                    password: {
                        required: '请输入密码'
                    }
                },
                submitHandler: function (form) {
                    var postData = {
                        email: $('input[name=email]').val(),
                        password: $('input[name=password]').val(),
                        validateCode: $('input[name=validateCode]').val(),
                        chk: '79b618',
                    }
                    var option =
                    {
                        type: 'POST',
                        data: JSON.stringify(postData),
                        url: "/login/ajax/user.do",
                        dataType: "json",
                        contentType: "application/json;charset=utf-8",
                        success: function (result) {
                            if (result.Status) {
                                window.location.href = result.RedirectUrl;
                            }
                            else {
                                $("#ErrorSection").show();
                                $("#ErrorMessage").show();
                                $("#ErrorMessage").html(result.Message);
                            }
                        },
                        error: function (result) {
                            $.smallBox({
                                title: "提示",
                                content: "<i class='fa fa-clock-o'></i> <i>" + result.Message + "</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 3000
                            });
                        }
                    };
                    $.ajax(option);
                },
                // Do not change code below
                errorPlacement: function (error, element) {
                    error.insertAfter(element.parent());
                }
            });
        })
    });
    $("#remoteModal").on("hidden", function () {
        $(this).removeData("modal");
    });
    $("#remoteModal").on("hidden.bs.modal", function () {
        $(this).removeData("bs.modal");
    });
//    var clientId = '202f79b618064cd696a78511a3f0f9b1';
//    var fnTimer = setInterval(function () {
//        $.get('/Login/GetScanResult/?clientId=' + clientId, function (result) {
//            if (result.Status) {
//                window.location.href = '/Member';
//                clearInterval(fnTimer);
//            }
//        });
//    }, 3000);

</script>


<%--<script type="text/javascript" src="/xigua/js/plugin/jquery-form/jquery-form.min.js"></script>--%>
</body>
</html>
