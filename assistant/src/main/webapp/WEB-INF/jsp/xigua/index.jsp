<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en-us">
<head>
    <meta charset="utf-8">
    <title> 微普公众号助手</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

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

    <!-- We recommend you use "your_style.css" to override SmartAdmin
         specific styles this will also ensure you retrain your customization with each SmartAdmin update.
    <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

    <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/demo.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/xigua/xiguaji.css">

    <!-- #FAVICONS -->
    <link rel="shortcut icon" href="/xigua/img/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/xigua/img/favicon/favicon.ico" type="image/x-icon">

    <!-- #GOOGLE FONT -->
    <%--<link rel="stylesheet" href="../../../../fonts.googleapis.com/css@family=Open+Sans_3A400italic,700italic,300,400,700">--%>

    <!-- #APP SCREEN / ICONS -->
    <!-- Specifying a Webpage Icon for Web Clip
         Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon" href="/xigua/img/splash/sptouch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/xigua/img/splash/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/xigua/img/splash/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/xigua/img/splash/touch-icon-ipad-retina.png">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="/xigua/img/splash/ipad-landscape.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="/xigua/img/splash/ipad-portrait.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="/xigua/img/splash/iphone.png"
          media="screen and (max-device-width: 320px)">

</head>

<!--

TABLE OF CONTENTS.

Use search to find needed section.

===================================================================

|  01. #CSS Links                |  all CSS links and file paths  |
|  02. #FAVICONS                 |  Favicon links and file paths  |
|  03. #GOOGLE FONT              |  Google font link              |
|  04. #APP SCREEN / ICONS       |  app icons, screen backdrops   |
|  05. #BODY                     |  body tag                      |
|  06. #HEADER                   |  header tag                    |
|  07. #PROJECTS                 |  project lists                 |
|  08. #TOGGLE LAYOUT BUTTONS    |  layout buttons and actions    |
|  09. #MOBILE                   |  mobile view dropdown          |
|  10. #SEARCH                   |  search field                  |
|  11. #NAVIGATION               |  left panel & navigation       |
|  12. #MAIN PANEL               |  main panel                    |
|  13. #MAIN CONTENT             |  content holder                |
|  14. #PAGE FOOTER              |  page footer                   |
|  15. #SHORTCUT AREA            |  dropdown shortcuts area       |
|  16. #PLUGINS                  |  all scripts and plugins       |

===================================================================

-->

<!-- #BODY -->
<!-- Possible Classes

    * 'smart-style-{SKIN#}'
    * 'smart-rtl'         - Switch theme mode to RTL
    * 'menu-on-top'       - Switch to top navigation (no DOM change required)
    * 'no-menu'			  - Hides the menu completely
    * 'hidden-menu'       - Hides the main menu but still accessable by hovering over left edge
    * 'fixed-header'      - Fixes the header
    * 'fixed-navigation'  - Fixes the main menu
    * 'fixed-ribbon'      - Fixes breadcrumb
    * 'fixed-page-footer' - Fixes footer
    * 'container'         - boxed layout mode (non-responsive: will not work with fixed-navigation & fixed-ribbon)
-->
<body class="smart-style-3">

<!-- #HEADER -->
<header id="header">
    <div id="logo-group">

        <!-- PLACE YOUR LOGO HERE -->
        <span id="logo"> <img src="/xigua/img/logo.png" alt="SmartAdmin"> </span>
        <!-- END LOGO PLACEHOLDER -->

        <!-- Note: The activity badge color changes when clicked and resets the number to 0
             Suggestion: You may want to set a flag when this happens to tick off all checked messages / notifications -->
        <%--<span id="activity" class="activity-dropdown"> <i class="fa fa-user"></i> <b class="badge"> 21 </b> </span>--%>

        <!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
        <%--<div class="ajax-dropdown">--%>

            <%--<!-- the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->--%>
            <%--<div class="btn-group btn-group-justified" data-toggle="buttons">--%>
                <%--<label class="btn btn-default">--%>
                    <%--<input type="radio" name="activity" id="ajax/notify/mail.html">--%>
                    <%--Msgs (14) </label>--%>
                <%--<label class="btn btn-default">--%>
                    <%--<input type="radio" name="activity" id="ajax/notify/notifications.html">--%>
                    <%--notify (3) </label>--%>
                <%--<label class="btn btn-default">--%>
                    <%--<input type="radio" name="activity" id="ajax/notify/tasks.html">--%>
                    <%--Tasks (4) </label>--%>
            <%--</div>--%>

            <%--<!-- notification content -->--%>
            <%--<div class="ajax-notifications custom-scroll">--%>

                <%--<div class="alert alert-transparent">--%>
                    <%--<h4>Click a button to show messages here</h4>--%>
                    <%--This blank page message helps protect your privacy, or you can show the first message here--%>
                    <%--automatically.--%>
                <%--</div>--%>

                <%--<i class="fa fa-lock fa-4x fa-border"></i>--%>

            <%--</div>--%>
            <%--<!-- end notification content -->--%>

            <%--<!-- footer: refresh area -->--%>
					<%--<span> Last updated on: 12/12/2013 9:43AM--%>
						<%--<button type="button" data-loading-text="<i class='fa fa-refresh fa-spin'></i> Loading..."--%>
                                <%--class="btn btn-xs btn-default pull-right">--%>
                            <%--<i class="fa fa-refresh"></i>--%>
                        <%--</button> </span>--%>
            <%--<!-- end footer -->--%>

        <%--</div>--%>
        <!-- END AJAX-DROPDOWN -->
    </div>

    <!-- #PROJECTS: projects dropdown -->
    <%--<div class="project-context hidden-xs">--%>

        <%--<span class="label">Projects:</span>--%>
        <%--<span class="project-selector dropdown-toggle" data-toggle="dropdown">Recent projects <i--%>
                <%--class="fa fa-angle-down"></i></span>--%>

        <%--<!-- Suggestion: populate this list with fetch and push technique -->--%>
        <%--<ul class="dropdown-menu">--%>
            <%--<li>--%>
                <%--<a href="javascript:void(0);">Online e-merchant management system - attaching integration with the--%>
                    <%--iOS</a>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<a href="javascript:void(0);">Notes on pipeline upgradee</a>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<a href="javascript:void(0);">Assesment Report for merchant account</a>--%>
            <%--</li>--%>
            <%--<li class="divider"></li>--%>
            <%--<li>--%>
                <%--<a href="javascript:void(0);"><i class="fa fa-power-off"></i> Clear</a>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <%--<!-- end dropdown-menu-->--%>

    <%--</div>--%>
    <!-- end projects dropdown -->

    <!-- #TOGGLE LAYOUT BUTTONS -->
    <!-- pulled right: nav area -->
    <div class="pull-right">

        <!-- collapse menu button -->
        <div id="hide-menu" class="btn-header pull-right">
            <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i
                    class="fa fa-reorder"></i></a> </span>
        </div>
        <!-- end collapse menu -->

        <!-- #MOBILE -->
        <!-- Top menu profile link : this shows only when top menu is active -->
        <ul id="mobile-profile-img" class="header-dropdown-list hidden-xs padding-5">
            <li class="">
                <a href="#" class="dropdown-toggle no-margin userdropdown" data-toggle="dropdown">
                    <img src="/xigua/img/avatars/sunny.png" alt="John Doe" class="online"/>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li>
                        <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"><i
                                class="fa fa-cog"></i> Setting</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#ajax/profile.html" class="padding-10 padding-top-0 padding-bottom-0"> <i
                                class="fa fa-user"></i> <u>P</u>rofile</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"
                           data-action="toggleShortcut"><i class="fa fa-arrow-down"></i> <u>S</u>hortcut</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"
                           data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i> Full <u>S</u>creen</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="/login/user.do" class="padding-10 padding-top-5 padding-bottom-5" data-action="userLogout">
                            <i class="fa fa-sign-out fa-lg"></i> <strong><u>L</u>ogout</strong></a>
                    </li>
                </ul>
            </li>
        </ul>

        <!-- logout button -->
        <div id="logout" class="btn-header transparent pull-right">
            <span> <a href="/login/user.do" title="Sign Out" data-action="userLogout"
                      data-logout-msg="You can improve your security further after logging out by closing this opened browser">
                <i class="fa fa-sign-out"></i></a> </span>
        </div>
        <!-- end logout button -->

        <!-- search mobile button (this is hidden till mobile view port) -->
        <div id="search-mobile" class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
        </div>
        <!-- end search mobile button -->

        <!-- #SEARCH -->
        <!-- input: search field -->
        <%--<form action="#ajax/search.html" class="header-search pull-right">--%>
            <%--<input id="search-fld" type="text" name="param" placeholder="Find reports and more">--%>
            <%--<button type="submit">--%>
                <%--<i class="fa fa-search"></i>--%>
            <%--</button>--%>
            <%--<a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>--%>
        <%--</form>--%>
        <!-- end input: search field -->

        <!-- fullscreen button -->
        <div id="fullscreen" class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i
                    class="fa fa-arrows-alt"></i></a> </span>
        </div>
        <!-- end fullscreen button -->

        <!-- #Voice Command: Start Speech -->
        <!-- NOTE: Voice command button will only show in browsers that support it. Currently it is hidden under mobile browsers.
                   You can take off the "hidden-sm" and "hidden-xs" class to display inside mobile browser-->
        <%--<div id="speech-btn" class="btn-header transparent pull-right hidden-sm hidden-xs">--%>
            <%--<div>--%>
                <%--<a href="javascript:void(0)" title="Voice Command" data-action="voiceCommand"><i--%>
                        <%--class="fa fa-microphone"></i></a>--%>

                <%--<div class="popover bottom">--%>
                    <%--<div class="arrow"></div>--%>
                    <%--<div class="popover-content">--%>
                        <%--<h4 class="vc-title">Voice command activated <br>--%>
                            <%--<small>Please speak clearly into the mic</small>--%>
                        <%--</h4>--%>
                        <%--<h4 class="vc-title-error text-center">--%>
                            <%--<i class="fa fa-microphone-slash"></i> Voice command failed--%>
                            <%--<br>--%>
                            <%--<small class="txt-color-red">Must <strong>"Allow"</strong> Microphone</small>--%>
                            <%--<br>--%>
                            <%--<small class="txt-color-red">Must have <strong>Internet Connection</strong></small>--%>
                        <%--</h4>--%>
                        <%--<a href="javascript:void(0);" class="btn btn-success" onclick="commands.help()">See Commands</a>--%>
                        <%--<a href="javascript:void(0);" class="btn bg-color-purple txt-color-white"--%>
                           <%--onclick="$('#speech-btn .popover').fadeOut(50);">Close Popup</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <!-- end voice command -->

        <!-- multiple lang dropdown : find all flags in the flags page -->
        <%--<ul class="header-dropdown-list hidden-xs">--%>
            <%--<li>--%>
                <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="/xigua/img/blank.gif"--%>
                                                                                 <%--class="flag flag-us"--%>
                                                                                 <%--alt="United States"> <span> US</span>--%>
                    <%--<i class="fa fa-angle-down"></i> </a>--%>
                <%--<ul class="dropdown-menu pull-right">--%>
                    <%--<li class="active">--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-us"--%>
                                                           <%--alt="United States"> English (US)</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-fr" alt="France">--%>
                            <%--Français</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-es"--%>
                                                           <%--alt="Spanish"> Español</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-de" alt="German">--%>
                            <%--Deutsch</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-jp" alt="Japan">--%>
                            <%--日本語</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-cn" alt="China">--%>
                            <%--中文</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-it" alt="Italy">--%>
                            <%--Italiano</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-pt"--%>
                                                           <%--alt="Portugal"> Portugal</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-ru" alt="Russia">--%>
                            <%--Русский язык</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="javascript:void(0);"><img src="/xigua/img/blank.gif" class="flag flag-kr" alt="Korea">--%>
                            <%--한국어</a>--%>
                    <%--</li>--%>

                <%--</ul>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <!-- end multiple lang -->

    </div>
    <!-- end pulled right: nav area -->

</header>
<!-- END HEADER -->

<!-- #NAVIGATION -->
<!-- Left panel : Navigation area -->
<!-- Note: This width of the aside area can be adjusted through LESS/SASS variables -->
<aside id="left-panel">

    <!-- User info -->
    <div class="login-info">
				<span> <!-- User image size is adjusted inside CSS, it should stay as is --> 
					
					<%--<a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">--%>
                    <a href="javascript:void(0);">
                        <img src="/xigua/img/avatars/sunny.png" alt="me" class="online"/>
						<span>
							john.doe 
						</span>
                        <i class="fa fa-angle-down"></i>
                    </a>
					
				</span>
    </div>
    <!-- end user info -->

    <!-- NAVIGATION : This navigation is also responsive

    To make this navigation dynamic please make sure to link the node
    (the reference to the nav > ul) after page load. Or the navigation
    will not initialize.
    -->
    <nav>
        <!--
        NOTE: Notice the gaps after each icon usage <i></i>..
        Please note that these links work a bit different than
        traditional href="" links. See documentation for details.
        -->

        <ul>
            <li class="">
                <a href="/user/dashBoard.do" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span
                        class="menu-item-parent">工作台</span></a>
            </li>
            <li>
                <a href="#"><i class="fa fa-lg fa-fw fa-bar-chart-o"></i> <span class="menu-item-parent">素材收集</span></a>
                <ul>
                    <li>
                        <a href="/user/material_global.do">全网优质素材</a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="/user/material_focus.do">我关注的</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="/user/material_blackhorse.do">黑马爆文</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="/user/material_vip.do">专享素材</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="/user/material_original.do">原创优选</a>--%>
                    <%--</li>--%>
                </ul>
            </li>
            <li>
                <a href="/user/my_material.do"><i class="fa fa-lg fa-fw fa-inbox"></i> <span class="menu-item-parent">我的素材库</span><span
                        class="badge pull-right inbox-badge">14</span></a>
            </li>
            <li>
                <a href="/user/article_sync.do"><i class="fa fa-lg fa-fw fa-inbox"></i> <span class="menu-item-parent">图文同步</span></a>
            </li>
            <li>
                <a href="#"><i class="fa fa-lg fa-fw fa-bar-chart-o"></i> <span
                        class="menu-item-parent">公众号管理</span></a>
                <ul>
                    <li>
                        <a href="/user/my_public.do">我运营的</a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="/user/public_hot.do">热门公众号榜单</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="/user/public_global_search.do">全网公众号搜索</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="/user/public_diagnosis.do">公众号诊断</a>--%>
                    <%--</li>--%>
                </ul>
            </li>


        </ul>
    </nav>


    <!--<a href="#ajax/difver.html" class="btn btn-primary nav-demo-btn">AngularJS, PHP and .Net Versions</a>-->


    <span class="minifyme" data-action="minifyMenu"> <i class="fa fa-arrow-circle-left hit"></i> </span>

</aside>
<!-- END NAVIGATION -->

<!-- #MAIN PANEL -->
<div id="main" role="main">

    <!-- RIBBON -->
    <div id="ribbon">

				<span class="ribbon-button-alignment"> 
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"
                          rel="tooltip" data-placement="bottom"
                          data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings."
                          data-html="true"
                          data-reset-msg="Would you like to RESET all your saved widgets and clear LocalStorage?"><i
                            class="fa fa-refresh"></i></span>
				</span>

        <!-- breadcrumb -->
        <ol class="breadcrumb">
            <!-- This is auto generated -->
        </ol>
        <!-- end breadcrumb -->

        <!-- You can also add more buttons to the
        ribbon for further usability

        Example below:

        <span class="ribbon-button-alignment pull-right" style="margin-right:25px">
            <a href="#" id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa fa-grid"></i> Change Grid</a>
            <span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa fa-plus"></i> Add</span>
            <button id="search" class="btn btn-ribbon" data-title="search"><i class="fa fa-search"></i> <span class="hidden-mobile">Search</span></button>
        </span> -->

    </div>
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content">

    </div>

    <!-- END #MAIN CONTENT -->

</div>
<!-- END #MAIN PANEL -->

<!-- #PAGE FOOTER -->
<div class="page-footer">
    <div class="row">
        <div class="col-xs-12 col-sm-12">
            <span class="txt-color-white">微普公众号助手 0.1
                <span class="hidden-xs"> - Web Application Framework</span>
                © 2014-2015 <span style="color:yellow;font-size:20px">联系QQ:418251346</span>

            </span>
        </div>

        <%--<div class="col-xs-6 col-sm-6 text-right hidden-xs">--%>
            <%--<div class="txt-color-white inline-block">--%>
                <%--<i class="txt-color-blueLight hidden-mobile">Last account activity <i class="fa fa-clock-o"></i>--%>
                    <%--<strong>52 mins ago &nbsp;</strong> </i>--%>

                <%--<div class="btn-group dropup">--%>
                    <%--<button class="btn btn-xs dropdown-toggle bg-color-blue txt-color-white" data-toggle="dropdown">--%>
                        <%--<i class="fa fa-link"></i> <span class="caret"></span>--%>
                    <%--</button>--%>
                    <%--<ul class="dropdown-menu pull-right text-left">--%>
                        <%--<li>--%>
                            <%--<div class="padding-5">--%>
                                <%--<p class="txt-color-darken font-sm no-margin">Download Progress</p>--%>

                                <%--<div class="progress progress-micro no-margin">--%>
                                    <%--<div class="progress-bar progress-bar-success" style="width: 50%;"></div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li class="divider"></li>--%>
                        <%--<li>--%>
                            <%--<div class="padding-5">--%>
                                <%--<p class="txt-color-darken font-sm no-margin">Server Load</p>--%>

                                <%--<div class="progress progress-micro no-margin">--%>
                                    <%--<div class="progress-bar progress-bar-success" style="width: 20%;"></div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li class="divider"></li>--%>
                        <%--<li>--%>
                            <%--<div class="padding-5">--%>
                                <%--<p class="txt-color-darken font-sm no-margin">Memory Load <span class="text-danger">*critical*</span>--%>
                                <%--</p>--%>

                                <%--<div class="progress progress-micro no-margin">--%>
                                    <%--<div class="progress-bar progress-bar-danger" style="width: 70%;"></div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li class="divider"></li>--%>
                        <%--<li>--%>
                            <%--<div class="padding-5">--%>
                                <%--<button class="btn btn-block btn-default">refresh</button>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
                <%--<!-- end btn-group-->--%>
            <%--</div>--%>
            <%--<!-- end div-->--%>
        <%--</div>--%>
        <!-- end col -->
    </div>
    <!-- end row -->


</div>
<!-- END FOOTER -->

<!-- #SHORTCUT AREA : With large tiles (activated via clicking user name tag)
     Note: These tiles are completely responsive, you can add as many as you like -->
<div id="shortcut">
    <ul>
        <li>
            <a href="#ajax/inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i
                    class="fa fa-envelope fa-4x"></i> <span>Mail <span
                    class="label pull-right bg-color-darken">14</span></span> </span> </a>
        </li>
        <li>
            <a href="#ajax/calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i
                    class="fa fa-calendar fa-4x"></i> <span>Calendar</span> </span> </a>
        </li>
        <li>
            <a href="#ajax/gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i
                    class="fa fa-map-marker fa-4x"></i> <span>Maps</span> </span> </a>
        </li>
        <li>
            <a href="#ajax/invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i
                    class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span>
            </a>
        </li>
        <li>
            <a href="#ajax/gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i
                    class="fa fa-picture-o fa-4x"></i> <span>Gallery </span> </span> </a>
        </li>
        <li>
            <a href="#ajax/profile.html" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span
                    class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My Profile </span> </span> </a>
        </li>
    </ul>
</div>
<!-- END SHORTCUT AREA -->
<div id="loadingLayer" class="fullLayer" style="display:none;">
    <p class="centerLoading"><i class="fa fa-gear fa-spin"></i> 努力加载中...</p>
</div>
<iframe id="fraPreload" width="100%" height="1" style="border:none"></iframe>

<!--================================================== -->

<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<%--<script data-pace-options='{ "restartOnRequestAfter": true }' src="/xigua/js/plugin/pace/pace.min.js"></script>--%>


<!-- #PLUGINS -->
<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<%--<script src="../../../../ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>--%>
<script>
    if (!window.jQuery) {
        var url = __uri('/xigua/js/libs/jquery-2.1.1.min.js');
        document.write('<script src='+url+'><\/script>');
    }
</script>

<%--<script src="../../../../ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>--%>
<script>
    if (!window.jQuery.ui) {
        var url = __uri('/xigua/js/libs/jquery-ui-1.10.3.min.js');
        document.write('<script src='+url+'><\/script>');
    }
</script>
<%--<script src="/js/jquery-1.8.1.min.js"></script>--%>

<!-- IMPORTANT: APP CONFIG -->
<script src="/xigua/js/app.config.js"></script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="/xigua/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script>

<!-- BOOTSTRAP JS -->
<script src="/xigua/js/bootstrap/bootstrap.min.js"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="/xigua/js/notification/SmartNotification.min.js"></script>

<!-- JARVIS WIDGETS -->
<script src="/xigua/js/smartwidgets/jarvis.widget.min.js"></script>

<!-- EASY PIE CHARTS -->
<script src="/xigua/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

<!-- SPARKLINES -->
<script src="/xigua/js/plugin/sparkline/jquery.sparkline.min.js"></script>

<!-- JQUERY VALIDATE -->
<script src="/xigua/js/plugin/jquery-validate/jquery.validate.min.js"></script>

<!-- JQUERY MASKED INPUT -->
<script src="/xigua/js/plugin/masked-input/jquery.maskedinput.min.js"></script>

<!-- JQUERY SELECT2 INPUT -->
<script src="/xigua/js/plugin/select2/select2.min.js"></script>

<!-- JQUERY UI + Bootstrap Slider -->
<script src="/xigua/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

<!-- browser msie issue fix -->
<script src="/xigua/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

<!-- FastClick: For mobile devices: you can disable this in app.js -->
<script src="/xigua/js/plugin/fastclick/fastclick.min.js"></script>

<!--[if IE 8]>
<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
<![endif]-->

<!-- Demo purpose only -->
<script src="/xigua/js/demo.min.js"></script>
<script src="/xigua/js/xiguaji/xiguauc.js"></script>

<script type="text/javascript">
    //			document.domain = 'localhost';
    function showLoading() {
        $('#loadingLayer').show();
    }
    function hideLoading() {
        $('#loadingLayer').hide();
    }
    $('#btnSearchMBiz').click(function () {
        var bizName = $('#search-fld').val();
        window.location.href = '#/MyMBiz/SystemBizList/?bizName=' + encodeURIComponent(bizName);
    });
    function LoadImage(img) {
        console.log('hi img:' + img.src);
        window.parent.$('img[data-src="' + img.src.replace('&rndx=xg', '').replace('?rndx=xg', '') + '"]').attr('src', img.src);
    }
    function BindLazyImage($html) {
        $html.find("img.WechatImage").each(function () {
            try {
                var src = $(this).attr('data-src');
                if (src.indexOf('?') > 0) {
                    src += '&rndx=xg';
                } else {
                    src += '?rndx=xg';
                }
                $(document.getElementById('fraPreload').contentWindow.document.body).append('<img src="' + src + '" onload="window.parent.LoadImage(this)" />');
            }
            catch (e) {
                $(this).attr('src', src);
                console.log(e);
            }
        });
    }

//    (function () {
//        var fn = arguments.callee;
//        $('#newMessageCount').hide();
//        $.get('/UserMessage/GetNewCount', function (count) {
//            if (count.indexOf('您的账号已在另一台电脑登录') >= 0) {
//                top.location.href = '/Login/?msg=' + encodeURIComponent('您的账号已在另一台电脑登录，请重新登录');
//                return;
//            }
//            if (count.indexOf('购买续费') >= 0) {
//                top.location.href = '/Purchase/';
//                return;
//            }
//            if (parseInt(count) > 0) {
//                //$('#newMessageCount').removeClass('bounceIn').removeClass('animated').addClass('bounceIn').addClass('animated');
//                $('#newMessageCount').html(count).show();
//            }
//            else {
//                $('#newMessageCount').hide();
//            }
//            setTimeout(fn, 30 * 1000);
//        });
//    })();
    $('#activity').click(function () {
        if (!$('#messagePanel').hasClass('loading')) {
            $('#messagePanel').addClass('loading').load('/UserMessage', function () {
                BindMessageList($('ul.messageBody'));
                $('#tabsMessage>a').click(function () {
                    $('#tabsMessage>a').removeClass('active');
                    $(this).addClass('active');
                    $('div.messageList ul.messageBody').load('/UserMessage/MessageList/?state=' + $(this).attr('data-state'), function () {
                        if ($(this).find('li').length == 0) {
                            $('div.noMessageAlert').show();
                            $('div.messageList').hide();
                        }
                        else {
                            $('div.noMessageAlert').hide();
                            $('div.messageList').show();
                            if ($(this).find('li').length == 6) {
                                $('a.moreMessage').show();
                            }
                            else {
                                $('a.moreMessage').hide();
                            }
                            BindMessageList($('ul.messageBody'));
                        }
                        $('a.moreMessage').attr('data-page', 1);
                    });
                });
                $(this).removeClass('loading');
                $('#messagePanel a.moreMessage').click(function () {
                    var state = $('#tabsMessage>a.active').attr('data-state');
                    var page = $(this).attr('data-page') * 1 + 1;
                    $(this).hide().attr('data-page', page);
                    $.get('/UserMessage/MessageList/?state=' + $(this).attr('data-state') + '&page=' + page, function (result) {
                        var $html = $($.parseHTML(result));
                        BindMessageList($html);
                        $('div.messageList ul.messageBody').append($html);
                        if ($html.find('li').length == 6) {
                            $('#messagePanel a.moreMessage').show();
                        }
                        else {
                            $('#messagePanel a.moreMessage').hide();
                        }
                    });
                });
            });
        }
    });
    function BindMessageList($html) {
        $html.find('a.setRead').click(function () {
            var $this = $(this);
            $.get('/UserMessage/Read/?messageId=' + $this.attr('data-messageId'), function (result) {
                if (result == '1') {
                    $this.parents('li').addClass('hasRead');
                    var count = $('a.tabNewCount span.message-count').html() * 1;
                    if (count > 0) {
                        count--;
                    }
                    $('#newMessageCount').html(count);
                    if (count <= 0) {
                        $('#newMessageCount').hide();
                    }
                    $('a.tabNewCount span.message-count').html(count);
                    $('a.tabReadCount span.message-count').html($('a.tabReadCount span.message-count').html() * 1 + 1);
                    $this.remove();
                }
            });
        });
    }
    function showErrorInfo(message) {
        $.smallBox({
            title: "提示",
            content: "<i class='fa fa-clock-o'></i> <i>" + message + "</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 3000
        });
    }
    function showInfo(message) {
        $.smallBox({
            title: "提示",
            content: "<i class='fa fa-clock-o'></i> <i>" + message + "</i>",
            color: "#659265",
            iconSmall: "fa fa-check fa-2x fadeInRight animated",
            timeout: 3000
        });
    }
</script>
<!-- MAIN APP JS FILE -->
<script src="/xigua/js/app.min.js"></script>


<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
<!-- Voice command : plugin -->
<%--<script src="/xigua/js/speech/voicecommand.min.js"></script>--%>

<!-- SmartChat UI : plugin -->
<%--<script src="/xigua/js/smart-chat-ui/smart.chat.ui.min.js"></script>--%>
<%--<script src="/xigua/js/smart-chat-ui/smart.chat.manager.min.js"></script>--%>

<!-- Your GOOGLE ANALYTICS CODE Below -->
<!--ipt type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</scri-->

</body>

</html>