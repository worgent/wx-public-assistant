<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    //  UserService userService = (UserService) MyApplicationContextAware.getBean("userService");


%>
<!DOCTYPE html>
<!-- saved from url=(0209)http://xmt.cn/user/authorizationCallBack?userId=c69f21a2ef5b4bfa8ef32beafb282b7f&auth_code=queryauthcode@@@gZdHisLXzmawjed1S3tnQhGxSiOy3uZE1yNThKiGLv_rG_DxZXOB__qEqXWWUhRKYLT7DBGYSNokuvR4M-LZcQ&expires_in=3600 -->
<html>
<style type="text/css"></style>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>微信绑定结果页面</title>

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
<body>
<div class="content-body">
    <div class="right-content">
			<span id="auth_result_msg">

						<div class="alert alert-success text-center">
                            <h5>
                                成功！页面将在 <strong id="timeout">5</strong> 秒后跳转！
                                <a href="/user/index.do#/user/my_public.do">立即跳转</a>
                            </h5>
                        </div>
						<script type="text/javascript">
                            (function () {
                                var time = 5;
                                var timer = null;
                                timer = setInterval(function () {
                                    if (time > 0) {
                                        time--;
                                        $("#timeout").html(time);
                                    } else {
                                        location.href = "/user/index.do#/user/my_public.do";
                                        clearTimeout(timer);
                                    }
                                }, 1000);
                            })();
                        </script>

			</span>
    </div>
</div>

<!-- cnzz -->
<%--<div style="display: none;">--%>
    <%--<script src="./微信绑定结果页面_files/z_stat.php" language="JavaScript"></script>--%>
    <%--<script src="./微信绑定结果页面_files/core.php" charset="utf-8" type="text/javascript"></script>--%>
    <%--<a href="http://www.cnzz.com/stat/website.php?web_id=1256819376" target="_blank" title="站长统计">站长统计</a>--%>
    <%--<a href="http://xmt.cn/">新媒体管家</a>--%>
<%--</div>--%>


</body>


<script src='/xigua/js/libs/jquery-2.1.1.min.js'></script>
</html>