<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp" %>


<!DOCTYPE html>
<!-- saved from url=(0026)http://bianji.xiguaji.com/ -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>微普编辑器-最智能的微信编辑器</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta content="微普编辑器，微信编辑器，微信图文编辑器，微信图文美化编辑器，微信编辑器下载,微信排版工具，微信公众号内容编辑，图文排版工具，最方便的微信编辑器" name="keywords">
    <meta content="微普编辑器，微信图文素材排版编辑器。提供美化微信文章排版，微信公众号内容编辑的功能，轻松编辑美观的微信图文消息。" name="description">
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/animate.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/spectrum.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/common.css">

    <%--<link href="/xigua/js/ue/x/ueditor.css" type="text/css" rel="stylesheet">--%>

    <script src="/xigua/js/xiguaji/codemirror.js" type="text/javascript" defer="defer"></script>
    <link rel="stylesheet" type="text/css" href="/xigua/css/codemirror.css">
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
<body style="overflow: hidden;" onselectstart="return false" oncontextmenu="return false"
      onbeforeunload="window.event.returnValue=&#39;即将离开页面,请确保编辑的内容已经保存&#39;;">
<div class="header">
    <h1><a class="logo" href="http://bianji.xiguaji.com/#">微普编辑器</a></h1>
</div>
<div class="page" style="">
    <div class="nav">


        <ul>
            <%--<li class="active"><a class="navRecent">最近使用</a></li>--%>
            <%--<li class="">--%>
                <%--<a class="navMould"><em class="expandIco"></em>模板</a>--%>
                <%--<ul>--%>
                    <%--<li class="active"><a data-id="1">报道</a></li>--%>
                    <%--<li><a data-id="2">宣传</a></li>--%>
                    <%--<li><a data-id="3">节日</a></li>--%>
                    <%--<li><a data-id="4">活动</a></li>--%>
                    <%--<li><a data-id="5">其它</a></li>--%>
                <%--</ul>--%>
            <%--</li>--%>
            <li class="">
                <a class="navStyle"><em class="expandIco"></em>组件</a>
                <ul>
                    <li><a data-id="1">标题</a></li>
                    <li><a data-id="2">正文</a></li>
                    <li><a data-id="3">图片</a></li>
                    <li><a data-id="4">关注引导</a></li>
                    <li><a data-id="5">二维码签名</a></li>
                    <li><a data-id="6">阅读原文</a></li>
                </ul>
            </li>
        </ul>


    </div>
    <div class="template">
        <div class="templateHeader">
            <h3>最近使用</h3>

            <div class="colorSelector">
                配色
                <div class="colorSelectorBtn">
                    <i style="background-color:rgba(248,103,94,1);"></i>
                </div>

                <div class="colorSelectorEntry" style="display:none">
                    <ul class="colorBtns">
                        <li><i style="background-color:rgba(222,5,5,1);"></i></li>
                        <li><i style="background-color:rgba(241,79,0,1);"></i></li>
                        <li><i style="background-color:rgba(241,136,0,1);"></i></li>
                        <li><i style="background-color:rgba(250,214,16,1);"></i></li>
                        <li><i style="background-color:rgba(212,239,30,1);"></i></li>
                        <li><i style="background-color:rgba(147,225,45,1);"></i></li>
                        <li><i style="background-color:rgba(50,222,37,1);"></i></li>
                        <li><i style="background-color:rgba(32,202,96,1);"></i></li>
                        <li><i style="background-color:rgba(32,202,136,1);"></i></li>
                        <li><i style="background-color:rgba(38,208,170,1);"></i></li>
                        <li><i style="background-color:rgba(43,205,217,1);"></i></li>
                        <li><i style="background-color:rgba(48,190,225,1);"></i></li>
                        <li><i style="background-color:rgba(48,152,225,1);"></i></li>
                        <li><i style="background-color:rgba(48,85,225,1);"></i></li>
                        <li><i style="background-color:rgba(38,31,188,1);"></i></li>
                        <li><i style="background-color:rgba(43,16,145,1);"></i></li>
                        <li><i style="background-color:rgba(71,16,145,1);"></i></li>
                        <li><i style="background-color:rgba(104,25,177,1);"></i></li>
                        <li><i style="background-color:rgba(142,30,184,1);"></i></li>
                        <li><i style="background-color:rgba(198,31,204,1);"></i></li>
                        <li><i style="background-color:rgba(235,56,195,1);"></i></li>
                        <li><i style="background-color:rgba(231,39,138,1);"></i></li>
                        <li><i style="background-color:rgba(231,39,107,1);"></i></li>
                        <li><i style="background-color:rgba(248,103,94,1);"></i></li>
                        <li><i style="background-color:rgba(180,183,187,1);"></i></li>
                        <li><i style="background-color:rgba(108,109,112,1);"></i></li>
                        <li><i style="background-color:rgba(74,75,77,1);"></i></li>
                        <li><i style="background-color:rgba(0,0,0,1);"></i></li>
                        <li>
                            <div class="addColor"></div>
                        </li>
                    </ul>
                    <div class="colorSelectorFooter">
                        <a class="btnReset" id="resetColor">还原调色板</a>
                        <a class="btnReset" id="resetTemplete">还原组件样式</a>
                        <a class="btnClose">关闭</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="templateWrap">
            <div class="templateEntry">
                <ul id="mixitup-box" class="stylingList"></ul>
            </div>
        </div>
    </div>
    <div class="editorWrap" style="">
        <div class="editorEntry edui-default" id="editor" style="">

            <div class="stylingPreview" style="display:none">
                <div class="previewHeader">
                    <h3>模板预览</h3>
                    <a class="btnUse">使用模板</a>
                    <a class="btnClose"><i></i></a>
                </div>
                <div class="previewWrap">
                    <div class="previewEntry">
                        <ul id="priview-box" class="templateList"></ul>
                    </div>
                </div>
            </div>
            <script id="edui2" type="text/plain" style="width: 100%; z-index: 900;"></script>

        </div>
    </div>
</div>

<div id="layer-device-preview" class="modal fade in" style="display:none;">
    <div class="devicePreviewLayer">
        <div class="devicePreview">
            <a id="btn-close-device-preview" class="devicePreviewClose"><i></i></a>

            <div id="device-preview-box" class="devicePreviewEntry">

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" charset="utf-8" src="/xigua/js/libs/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/xigua/js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/spectrum.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/ue/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/ue/ueditor.all.js"></script>
<%--<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/ue/lang/zh-cn/zh-cn.js"></script>--%>
<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/ZeroClipboard.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/less.min-1.7.0.js"></script>
<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/xConfirm.js"></script>
<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/xAlert.js"></script>
<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/XiGuaEditor.js"></script>
<script type="text/javascript">
    UEDITOR_CONFIG.UEDITOR_HOME_URL = '/xigua/js/xiguaji/ue/';

    var xiguaEditor = new XiGuaEditor();
    xiguaEditor.render();

</script>
<div class="sp-container sp-hidden sp-light sp-alpha-enabled sp-palette-buttons-disabled sp-palette-disabled sp-initial-disabled"
     style="position: absolute; top: 24px; left: 0px;">
    <div class="sp-palette-container">
        <div class="sp-palette sp-thumb sp-cf"></div>
        <div class="sp-palette-button-container sp-cf">
            <button type="button" class="sp-palette-toggle">less</button>
        </div>
    </div>
    <div class="sp-picker-container">
        <div class="sp-top sp-cf">
            <div class="sp-fill"></div>
            <div class="sp-top-inner">
                <div class="sp-color" style="background-color: rgb(255, 0, 0);">
                    <div class="sp-sat">
                        <div class="sp-val">
                            <div class="sp-dragger" style="display: block; top: 0px; left: 0px;"></div>
                        </div>
                    </div>
                </div>
                <div class="sp-clear sp-clear-display" title="清空重新选择" style="display: none;"></div>
                <div class="sp-hue">
                    <div class="sp-slider" style="display: block; top: 0px;"></div>
                </div>
            </div>
            <div class="sp-alpha">
                <div class="sp-alpha-inner"
                     style="background-image: linear-gradient(to right, rgba(255, 255, 255, 0), rgb(255, 255, 255)); background-position: initial initial; background-repeat: initial initial;">
                    <div class="sp-alpha-handle" style="display: block; left: 0px;"></div>
                </div>
            </div>
        </div>
        <div class="sp-input-container sp-cf"><input class="sp-input" type="text" spellcheck="false"></div>
        <div class="sp-initial sp-thumb sp-cf"></div>
        <div class="sp-button-container sp-cf"><a class="sp-cancel" href="http://bianji.xiguaji.com/#">关闭</a>
            <button type="button" class="sp-choose">确认</button>
        </div>
    </div>
</div>

<script id="edui_fixedlayer" type="text/plain" style="position: fixed; left: 0px; top: 0px; width: 0px; height: 0px; z-index: 909;"></script>

<div id="global-zeroclipboard-html-bridge" class="global-zeroclipboard-container"
     style="position: absolute; left: 0px; top: -9999px; width: 1px; height: 1px; z-index: 999999999;">
    <object id="global-zeroclipboard-flash-bridge" name="global-zeroclipboard-flash-bridge" width="100%" height="100%"
            type="application/x-shockwave-flash"
            data="http://bianji.xiguaji.com/Content/ue/third-party/zeroclipboard/ZeroClipboard.swf?noCache=1451377209987">
        <param name="allowScriptAccess" value="sameDomain">
        <param name="allowNetworking" value="all">
        <param name="menu" value="false">
        <param name="wmode" value="transparent">
        <param name="flashvars"
               value="trustedOrigins=bianji.xiguaji.com%2C%2F%2Fbianji.xiguaji.com%2Chttp%3A%2F%2Fbianji.xiguaji.com">
    </object>
</div>
</body>
<style type="text/css" id="353292363000"></style>
</html>