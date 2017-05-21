<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp" %>

<%--<link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/mp/not_in_mm.css">--%>
<%--<link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/mp/page_mp_article_improve.css">--%>
<%--<link rel="stylesheet" type="text/css" media="screen" href="/xigua/css/mp/page_mp_article_improve_combo.css">--%>


<style id="edui-customize-xiguaInsertFollow-style">.edui-default .edui-for-xiguaInsertFollow .edui-icon {
    background-position: -840px 0;
    width: 82px !important;
}</style>
<style id="edui-customize-xiguaInsertSign-style">.edui-default .edui-for-xiguaInsertSign .edui-icon {
    background-position: -925px 0;
    width: 58px !important;
}</style>
<style id="edui-customize-xiguaInsertOriginal-style">.edui-default .edui-for-xiguaInsertOriginal .edui-icon {
    background-position: -840px -20px;
    width: 106px !important;
}</style>

<header class="editorHeading">
    <img class="mpCover" src="${wpwxMaterialSyncAssociation.wpwxPublic.headImg}"><span
        rel="tooltip" data-placement="top" data-original-title="当前图文素材所属公众号"
        id="spnBizName">${wpwxMaterialSyncAssociation.wpwxPublic.name}</span>
    <%--<a class="btnCopyArt" href="/Material/CopyMaterialToBiz/?userMaterialId=342942" data-toggle="modal"--%>
    <%--data-target="#remoteModal"><i class="fa fa-copy"></i> 复制图文</a>--%>
    <a class="btnSetTemp"
       href="/user/modal/article_template.do?publicId=${wpwxMaterialSyncAssociation.getWpwxPublic().getId()}"
       data-toggle="modal" data-target="#remoteModal"><i
            class="fa fa-cog"></i> 配置素材模板</a>
</header>


<div class="editorWrap" style="">
    <input type="hidden" value="${wpwxMaterialSyncAssociation.id}" name="materialId">

    <div class="editorView">

        <div id="previewItem" class="ui-sortable">


        </div>

        <div class="editorViewAdd">
            <i class="fa editorViewAddPrev">+</i>
            <span class="editorViewAddBtns">
            <a id="editorViewAdd"><i class="fa fa-plus"></i> 新建</a>
            <a href="/user/modal/material_import_new.do" data-toggle="modal" data-target="#remoteModal"><i
            class="fa fa-download"></i> 导入</a>
            </span>
        </div>
    </div>
    <div class="editorStyle" style="">
        <div class="editorGroup">
            <label class="editorLabel">标题：</label>

            <div class="editorInput">
                <input type="text" name="title" class="form-control" placeholder="标题">
            </div>
        </div>
        <div class="editorGroup">
            <label class="editorLabel">作者：<span class="note">(选填)</span></label>

            <div class="editorInput">
                <input type="text" name="author" class="form-control" placeholder="作者">
            </div>
        </div>
        <div class="editorGroup">
            <label class="editorLabel">封面：<span class="note picturenote">(大图片建议尺寸：900像素 * 500像素)</span></label>

            <div class="editorInput">
                <div class="uploadCoverBtn">
                    <a class="btn btn-default">上传</a>
                    <input type="file" name="files[]" class="uploadFile" id="fileTopicImageUrl">
                </div>

                <div class="uploadCover">
                    <div class="uploadCoverImg"><img class="WechatImage"
                                                     src="http://mmbiz.qpic.cn/mmbiz/gvr6pHrdNcW7WLfqrgKGibw4n2g4iciaaf0UlYBFauFy0pgywRdsibXMYDYOauIsymkKlnmCxsDExA85QiaY3tqCtGA/0?wx_fmt=jpeg&amp;rndx=xg"
                                                     id="imageUrl"
                                                     data-src="http://mmbiz.qpic.cn/mmbiz/gvr6pHrdNcW7WLfqrgKGibw4n2g4iciaaf0UlYBFauFy0pgywRdsibXMYDYOauIsymkKlnmCxsDExA85QiaY3tqCtGA/0?wx_fmt=jpeg">
                    </div>
                    <div class="uploadCoverProcess"><i style="height:0%;"></i></div>
                </div>

                <%--<a href="javascript:none" class="btnDeleteImage">删除</a>--%>
            </div>
            <div class="checkShowCover">
                <label class="checkbox-inline"><input type="checkbox" name="chkContainImg" class="checkbox style-0"
                                                      id="chkAllTags"><span>封面图片显示在正文中</span></label>
            </div>
        </div>
        <div class="editorGroup" style="">
            <label class="editorLabel">正文：</label>

            <div class="editorInput" style="">
                <script id="editor" type="text/plain" style="max-width: 700px; margin-top: 5px;"></script>
            </div>
            <div class="editorGroupFooter">
                <a id="btnXiGuaEditor">微普高级编辑器</a>
                <%--<a id="btnQuickEdit">切换到快速编辑模式</a>--%>
            </div>
        </div>

        <div class="editorGroup" style="display:none">
            <%--<a data-template="${focusTemplate != null ?focusTemplate.content : ''}" class="btn btn-default" id="btnInsertFollow"><i class="fa fa-pencil-square"></i> 插入关注引导</a>--%>
            <%--<a data-template="${signTemplate != null ?signTemplate.content : ''}" class="btn btn-default" id="btnInsertSign"><i class="fa fa-pencil-square"></i> 插入签名</a>--%>
            <%--<a data-template="${originArticleTemplate != null ?originArticleTemplate.content : ''}" class="btn btn-default" id="btnInsertOriginal"><i class="fa fa-pencil-square"></i>--%>

            <a class="btn btn-default"
               data-template="${focusTemplate != null ? (focusTemplate.content) : ''}"
               id="btnInsertFollow"><i class="fa fa-pencil-square"></i> 插入关注引导</a>
            <a class="btn btn-default"
               data-template="${signTemplate != null ? (signTemplate.content) : ''}"
               id="btnInsertSign"><i class="fa fa-pencil-square"></i> 插入签名</a>
            <a class="btn btn-default"
               data-template="${originArticleTemplate != null ? (originArticleTemplate.content) : ''}"
               id="btnInsertOriginal"><i class="fa fa-pencil-square"></i>
                插入原文链接引导</a>
            <a href="/Knowledge/ShowView/?knowledgeId=24" target="_blank"><i class="fa fa-exclamation-circle"></i>
                不想手动点击？了解如何自动插入</a>
        </div>
        <%--<div class="editorGroup">--%>
        <%--<a href="javascript:none" class="btnAddOrginalUrl">添加原文链接</a>--%>

        <%--<div style="display: none;" class="OrginalUrlEditor">--%>
        <%--<label class="editorLabel">原文链接：</label>--%>

        <%--<div class="editorInput">--%>
        <%--<input type="text" class="form-control" name="originalUrl" placeholder="原文链接">--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>

        <div class="editorGroup">
            <input type="button" class="btn btn-success " name="saveToServer" value="保存">
            <%--<a class="btn btn-primary btnSendToWX" href="/Material/SendToWX/?bizId=85252" data-id="85252"--%>
            <%--data-cansend="1" data-toggle="modal" data-target="#remoteModal">同步到公众号后台</a>--%>

            <a class="btn btn-primary btnMass"
               href="modal/mass_schedule.do?materialSyncId=${wpwxMaterialSyncAssociation.id}"
               data-id="${wpwxMaterialSyncAssociation.id}"
               data-toggle="modal" data-target="#remoteModal">定时群发</a>

            <input type="button" class="btn btn-default" value="返回" onclick="javascript:history.back(-1)">
        </div>
    </div>
</div>
<!-- Dynamic Modal -->
<div class="modal fade" id="remoteModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- content will be filled here from "ajax/modal-content/model-content-1.html" -->
        </div>
    </div>
</div>
<!--发送状态弹窗-->
<div id="sendStatus" style="display:none">
    <div class="modal-header">
        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
        <h4 class="modal-title">同步图文素材至公众号</h4>
    </div>
    <div class="modal-body no-padding">
        <div class="sendArticleResult" id="sending">
            <div class="sending">
                <h1><i class="fa fa-rotate-right fa-spin"></i></h1>

                <h2>发送中，请耐心等待,预计需要30~60秒左右的时间</h2>
            </div>
        </div>
        <div class="sendArticleResult" id="sendFail">
            <div class="sendFailed">
                <h1><i class="fa fa-times"></i></h1>

                <h2 id="errorMessage"></h2>
            </div>
        </div>
        <div class="sendArticleResult" id="sendSuccess">
            <div class="sendSuccess">
                <h1><i class="fa fa-check"></i></h1>

                <h2>恭喜您，同步成功，请登录微信后台查看素材</h2>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary" id="retrySendToWX" type="button">
            重试
        </button>
        <button data-dismiss="modal" class="btn btn-default" type="button" id="btnCancel">
            关闭
        </button>
    </div>
</div>
<div class="xiguaEditorLayer fade in" style="display:none;">
    <div class="xiguaEditorWrap">
        <div class="xiguaEditorMain">
            <iframe name="xiguaEditorFrame" width="100%" height="100%" frameborder="0"
                    src="/user/xigua_editor.do?mode=1"></iframe>
        </div>
        <div class="xiguaEditorFooter">
            <div class="xiguaEditorBtns">
                <button class="btn btn-primary" id="btnSaveXiGuaEditor" type="button">
                    保存
                </button>
                <button data-dismiss="modal" class="btn btn-default" id="btnCancelXiGuaEditor" type="button">
                    退出
                </button>
            </div>
        </div>
    </div>
</div>
<div style="display:none;" class="quickEditorLayer fade in">
    <div class="quickEditorMain">
        <iframe width="100%" frameborder="0" name="quickEditor"></iframe>
    </div>
    <div class="quickEditorFooter">
        <div class="quickEditorBtns">
            <button class="btn btn-primary" id="btnSaveQuickEditor" type="button">
                保存
            </button>
            <button class="btn btn-default" type="button" id="btnCancelQuickEditor">
                退出
            </button>
        </div>
    </div>
</div>
<style>
    .right-fixed-wrapper {
        position: fixed;
        right: 46px;
        bottom: 95px;
        z-index:9999
    }
    .right-fixed-wrapper .up,.down {
        width: 41px;
        height: 41px;
        text-align: center;
        background-color: #ccc;
        transition: .3s;
        -webkit-transition: .3s;
    }
    .right-fixed-wrapper .up,.down i {
        font-size: 24px;
        line-height: 40px;
        color: #fff;
    }
    .right-fixed-wrapper .up:hover,.down:hover{
        background-color: #ff5f3e;
    }
</style>
<div class="right-fixed-wrapper">
    <div class="up">
        <i class="fa fa-angle-up"></i>
    </div>
    <div class="down">
        <i class="fa fa-angle-down"></i>
    </div>
</div>
<%--<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/ue/ueditor.config.js"></script>--%>
<%--<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/ue/ueditor.all.js"></script>--%>
<%--<script type="text/javascript" charset="utf-8" src="/xigua/js/xiguaji/ue/lang/zh-cn/zh-cn.js"></script>--%>
<script type="text/javascript">
    pageSetUp();
    showLoading();
    //为上传图片传值
    function getUploadImageParams() {
        return "85252";
    }

    $(document).keydown(function (e) {
        var doPrevent;
        if (e.keyCode == 8) {
            var d = e.srcElement || e.target;
            if (d.tagName.toUpperCase() == 'INPUT' || d.tagName.toUpperCase() == 'TEXTAREA') {
                doPrevent = d.readOnly || d.disabled;
            }
            else
                doPrevent = true;
        }
        else
            doPrevent = false;

        if (doPrevent) {
            if (!confirm('确定要离开此页吗？')) {
                e.preventDefault();
            }
        }
    });
    $('#btnXiGuaEditor').click(function () {
        $('div.xiguaEditorLayer').show();
        var content = UE.getEditor('editor').getContent();
        xiguaEditorFrame.xiguaEditor.setContent(content);
        $(document.body).addClass('modal-open');
    });
    $('#btnSaveXiGuaEditor').click(function () {
        var content = xiguaEditorFrame.xiguaEditor.getContent();
        UE.getEditor('editor').setContent(content, false);
        $('div.xiguaEditorLayer').hide();
        $(document.body).removeClass('modal-open');
    });
    $('#btnCancelXiGuaEditor').click(function () {
        $('div.xiguaEditorLayer').hide();
        $(document.body).removeClass('modal-open');
    });
    $('#btnQuickEdit').click(function () {
        var dataId = $('#previewItem section.itemSelected').attr('data-id');
        $('#btnSaveQuickEditor').attr('data-id', dataId);
        var $form = $($.parseHTML('<form target="quickEditor" method="post" action="/Material/PreviewMaterialDetail/?XiguaEditor=1"><input name="bizName" type="text" /><input name="detail" type="text" /><input type="submit" name="submit" /></form>'));
        $(document.body).append($form);
        $form.find('input[name="detail"]').val(JSON.stringify(materialData[dataId]));
        $form.find('input[name="bizName"]').val($('#spnBizName').html());
        $form.find("input[type=submit]").click();
        $('div.quickEditorLayer iframe').attr('height', $(window).height() - 82);
        $('div.quickEditorLayer').show();
        $(document.body).addClass('modal-open');
        $form.remove();
        //alert(materialData[dataId].Content);
    });
    //    $('#btnSaveQuickEditor').click(function () {
    //        var dataId = $('#btnSaveQuickEditor').attr('data-id');
    //        var content = $('div.quickEditorLayer iframe').get(0).contentWindow.getMaterialContent();
    //        materialData[dataId].Content = content;
    //        UE.getEditor('editor').setContent(content, false);
    //        $('div.quickEditorLayer').hide();
    //        $(document.body).removeClass('modal-open');
    //    });
    $('#btnCancelQuickEditor').click(function () {
        $('div.quickEditorLayer').hide();
        $(document.body).removeClass('modal-open');
    });
    $("#remoteModal").on("hidden", function () {
        $(this).removeData("modal");
    });
    $("#remoteModal").on("hidden.bs.modal", function () {
        $(this).removeData("bs.modal");
    });
    var materialData = [];
    var isSend = "0";
    function pageLoad() {
        //编辑
        $('a.previewItemEdit').unbind("click");
        $('a.previewItemEdit').click(function () {
            saveMaterialData();
            var self = $(this);
            $('div.editorView section').removeClass('itemSelected');
            self.parent().parent().addClass('itemSelected');
            var articleIdex = self.parent().parent().attr('data-id');
            if (articleIdex == 0) {
                $('span.picturenote').html("(大图片建议尺寸：900像素 * 500像素)");
            }
            else {
                $('span.picturenote').html("(小图片建议尺寸：200像素 * 200像素)");
            }
            $.each(materialData, function (index, val) {
                if (index == articleIdex) {
                    setNextData(materialData[index]);
                }
            });
        });
        $('a.previewDelete').unbind("click");
        //删除
        $('a.previewDelete').click(function () {
            var leftCount = materialData.length;
            if (leftCount == 1) {
                $.smallBox({
                    title: "提示",
                    content: "<i class='fa fa-clock-o'></i> <i>至少保留一条图文</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 3000
                });
                return;
            }
            var self = $(this);
            var articleIndex = self.parent().parent().attr('data-id');

            self.parent().parent().remove();
            $('#previewItem section:first').addClass('topItem');

            $.each(materialData, function (index, val) {
                if (index == articleIndex) {
                    materialData.remove(articleIndex);
                }
            });
            $.each($('div.editorView section'), function (index, val) {
                $(this).attr('data-id', index);
            });
            if (self.parent().parent().hasClass('itemSelected')) {
                var changeIndex = articleIndex == materialData.length ? articleIndex - 1 : articleIndex
                $('a.previewItemEdit', $('#previewItem section').eq(changeIndex)).click();
            }

        });
    }
    function PreViewItem(title, imageUrl, articleIndex) {
        var self = this;
        var content = '<section class="editorViewItem ' + (articleIndex == 0 ? 'topItem' : '') + '" data-id=' + articleIndex + '><i class="arrow"></i><div class="appmsgWrap"><h4 class="appmsgTitle">' + title + '</h4><div class="appmsgCover"><img class="WechatImage" data-src="' + imageUrl + '" src="' + imageUrl + '" id="preImg"><i class="defaultCover">封面图片</i></div>'
                + '</div><div class="appmsgMark"><a class="appmsgBtn previewItemEdit"><i class="fa fa-pencil "></i></a><a class="appmsgBtn previewDelete"><i class="fa fa-trash-o"></i></a><p class="appmsgTips">按住拖动可上下调整位置</p></div></section>';
        return content;
    }
    function saveMaterialData() {
        var dataId = $('#previewItem section.itemSelected').attr('data-id');
        if (dataId != undefined) {
            materialData[dataId].Content = UE.getEditor('editor').getContent();
        }
    }
    function setNextData(materialDetail) {
        $('input[name=title]').val(materialDetail.Title);
        $('input[name=author]').val(materialDetail.Author);

        document.getElementById("chkAllTags").checked = materialDetail.IsContainImage == 1;
        $('#imageUrl').attr('data-src', materialDetail.ImageUrl);
        BindLazyImage($('div.uploadCoverImg'));
        $('input[name=originalUrl]').val(materialDetail.OriginalUrl);
        UE.getEditor('editor').setContent(materialDetail.Content, false);
        if (materialDetail.ImageUr != '') {
            $('a.btnDeleteImage').show();
        }
        if (materialDetail.OriginalUrl != '') {
            $('div.OrginalUrlEditor').show();
            $('a.btnAddOrginalUrl').hide();
        }
        else {
            $('div.OrginalUrlEditor').hide();
            $('a.btnAddOrginalUrl').show();
        }
    }
    $('input[name=btnCannotMass]').click(function () {
        $.SmartMessageBox({
            title: "提示",
            content: "微信规定，需要微信认证的公众号才能使用图文群发接口功能",
            buttons: '[确定]'
        }, function (ButtonPressed) {

        });
    });
    $('a.btnMass').click(function () {
//        if (isSend != "1") {
//            showErrorInfo("请先同步素材到微信后台");
//            return false;
//        }
        return true;
    });

    loadScript(__uri("/xigua/js/xiguaji/ue/ueditor.config.js"), function () {
        loadScript(__uri("/xigua/js/xiguaji/ue/ueditor.all.js"), function () {
//            loadScript("/xigua/js/xiguaji/ue/lang/zh-cn/zh-cn.js", function () {
//            var config = {
//                UEDITOR_HOME_URL: '/xigua/js/xiguaji/ue/'
//                , toolbars: [["fontsize", "|", "blockquote", "horizontal", "|", "removeformat", "|", "insertimage", "insertvideo"], ["source", "bold", "italic", "underline", "forecolor", "backcolor", "|", "justifyleft", "justifycenter", "justifyright", "|", "rowspacingtop", "rowspacingbottom", "lineheight", "|", "insertorderedlist", "insertunorderedlist", "|", "imagenone", "imageleft", "imageright", "imagecenter"], []]
//                , zIndex: 900
//            };
            UE.registerUI('xiguaInsertFollow', function (editor, uiName) {
                var btn = new UE.ui.Button({
                    name: uiName,
                    title: '在文首插入关注引导',
                    cssRules: 'background-position: -840px 0; width:82px !important;',
                    onclick: function () {
                        $('#btnInsertFollow').click();
//                        btnInsertFollow_click();
                        var fra = $('#editor iframe').get(0);
                        fra.contentWindow.scrollTo(0, 0);
                    }
                });
                return btn;
            });
            UE.registerUI('xiguaInsertSign', function (editor, uiName) {
                var btn = new UE.ui.Button({
                    name: uiName,
                    title: '在文末插入签名',
                    cssRules: 'background-position: -925px 0; width:58px !important;',
                    onclick: function () {
                        $('#btnInsertSign').click();
//                        btnInsertSign_click();
                        //滚动到底部
                        var fra = $('#editor iframe').get(0);
                        fra.contentWindow.scrollTo(0, fra.contentWindow.document.body.scrollHeight);
                    }
                });
                return btn;
            });
            UE.registerUI('xiguaInsertOriginal', function (editor, uiName) {
                var btn = new UE.ui.Button({
                    name: uiName,
                    title: '在文末插入原文链接引导',
                    cssRules: 'background-position: -840px -20px; width:106px !important;',
                    onclick: function () {
                        $('#btnInsertOriginal').click();
//                        btnInsertOriginal_click();
                        var fra = $('#editor iframe').get(0);
                        fra.contentWindow.scrollTo(0, fra.contentWindow.document.body.scrollHeight);
                    }
                });
                return btn;
            });
            if ($('#btnInsertImg').length > 0) {
                UE.registerUI('xiguaInsertImg', function (editor, uiName) {
                    var btn = new UE.ui.Button({
                        name: uiName,
                        title: '插入隐藏图片',
                        cssRules: 'background-position: -840px -40px; width:82px !important;',
                        onclick: function () {
                            $('#btnInsertImg').click();
                        }
                    });
                    return btn;
                });
            }


            //模板数据刷新
//            function _updateTemplate(template) {
//                $('#btnInsertFollow').data('template', template.FollowTemplate);
//                $('#btnInsertSign').data('template', template.SignTemplate);
//                $('#btnInsertOriginal').data('template', template.OriginalTemplate);
//            }

            //模板插入
            $('#btnInsertFollow').click(function () {
                var html = $('#btnInsertFollow').data('template');
                if (html == '') {
                    configTemplate();
                }
                console.log("attr html:"+$('#btnInsertFollow').attr('data-template'))
                console.log("html:"+html)
//                console.log("decode html:"+htmldecode(html))
                var u = UE.getEditor('editor');
                //u.focus(false);
//                console.log("ueditor content before:"+ u.getContent())
                u.setContent(html.replace(/&nbsp;/g, " ") + u.getContent());
//                console.log("ueditor content after:"+ u.getContent())

            });

            //插入签名
            $('#btnInsertSign').click(function () {

                var html = $('#btnInsertSign').data('template');
                if (html == '') {
                    configTemplate();
                }
                var u = UE.getEditor('editor');
                //u.focus(false);
                u.setContent(u.getContent() + htmldecode(html));
            });

            //插入阅读原文引导
            $('#btnInsertOriginal').click(function () {
                var html = $('#btnInsertOriginal').data('template');
                if (html == '') {
                    configTemplate();
                }
                var u = UE.getEditor('editor');
                //u.focus(false);
                u.setContent(u.getContent() + htmldecode(html));
            });

            function configTemplate() {
                $.SmartMessageBox({
                    title: "提示",
                    content: "您需要配置素材模板后才能使用",
                    buttons: '[取消][马上配置]'
                }, function (ButtonPressed) {
                    if (ButtonPressed == "马上配置") {
                        $('a.btnSetTemp').click();
                    }
                });

            }

            //排序
            $('#previewItem').sortable().bind('sortstop', function (event, ui) {
                // alert(ui.item.html());
                //    alert(ui.item);
                $('#previewItem section').removeClass('topItem');
                $('#previewItem section:first').addClass('topItem');
                var newdata = [];
                $.each($('div.editorView section'), function (index, val) {
                    var dataId = $(this).attr('data-id');
                    $.each(materialData, function (articleIndex, val) {
                        if (dataId == articleIndex) {
                            newdata.push(materialData[articleIndex]);
                        }
                    });
                    $(this).attr('data-id', index);
                });
                materialData = newdata;
            });
            //标题
            $('input[name=title]').keyup(function () {
                var dataId = $('#previewItem section.itemSelected').attr('data-id');
                $('h4.appmsgTitle', $('#previewItem section.itemSelected')).html($(this).val());
                materialData[dataId].Title = $(this).val();
            });
            //原作者
            $('input[name=author]').keyup(function () {
                var dataId = $('#previewItem section.itemSelected').attr('data-id');
                materialData[dataId].Author = $(this).val();
            });
            //原文链接
            $('input[name=originalUrl]').keyup(function () {
                var dataId = $('#previewItem section.itemSelected').attr('data-id');
                materialData[dataId].OriginalUrl = $(this).val();
            });
            //正文显示在封面中
            $('input[name=chkContainImg]').click(function () {
                var dataId = $('#previewItem section.itemSelected').attr('data-id');
                materialData[dataId].IsContainImage = $(this).is(":checked") ? 1 : 0;
            });
            $('a.btnAddOrginalUrl').click(function () {
                $('div.OrginalUrlEditor').show();
                $(this).hide();
            });
            //删除图文
            $('a.btnDeleteImage').click(function () {
                var dataId = $('#previewItem section.itemSelected').attr('data-id');
                materialData[dataId].ImageUrl = '';
                $('#imageUrl').attr('src', '');
                $('#preImg', $('#previewItem section.itemSelected')).attr('src', '');
                $(this).hide();
            })
            //添加新图文
            $('#editorViewAdd').click(function () {
                if ($('#previewItem section').length >= 8) {
                    $.smallBox({
                        title: "提示",
                        content: "<i class='fa fa-clock-o'></i> <i>最多只能添加8条图文</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 3000
                    });
                    return;
                }
                $('#previewItem section:last').after(PreViewItem('', '', materialData.length));
                pageLoad();
                materialData.push({
                    MaterialDetailId: 0,
                    UserMaterialId: 0,
                    ArticleId: 0,
                    Title: '',
                    Content: '',
                    ImageUrl: '',
                    Author: '',
                    IsContainImage: 0
                })
                $('a.previewItemEdit', $('#previewItem section:last')).click();
            });

            var mConfig = {
                UEDITOR_HOME_URL: '/xigua/js/xiguaji/ue/'
                , toolbars: [["fontsize", "|", "blockquote", "horizontal", "|", "removeformat", "|", "insertimage", "insertvideo"], ["source", "bold", "italic", "underline", "forecolor", "backcolor", "|", "justifyleft", "justifycenter", "justifyright", "|", "rowspacingtop", "rowspacingbottom", "lineheight", "|", "insertorderedlist", "insertunorderedlist", "|", "imagenone", "imageleft", "imageright", "imagecenter"], []]
                , zIndex: 900
            };
            UE.delEditor('editor');
            var ue = UE.getEditor('editor', mConfig);
//            var ue = new UE.ui.Editor();
//            ue.render("editor");
            ue.ready(function () {
                var defaultId = {
                    //nowId: allData[0].id
                }

                $.getJSON('/user/ajax/ajaxGetMaterialDetailList.do?materialSyncId=' + $('input[name=materialId]').val(), function (result) {
                    if (result.Status) {
                        for (var i = 0; i < result.DataList.length; i++) {
                            materialData.push(result.DataList[i]);
                        }
                        setNextData(materialData[0]);
                        $.each(materialData, function (index, materialDetail) {
                            $('#previewItem').append(PreViewItem(materialDetail.Title, materialDetail.CdnImageUrl, index));
                        });
                        $('#previewItem section:first').addClass('itemSelected');
                        BindLazyImage($('#previewItem'));
                        pageLoad();
                    }
                    else {
                        //数据加载失败
                    }
                    hideLoading();
                });
                ue.addListener('selectionchange',
                        function (ue) {
                            //  saveTargetData();
                            saveMaterialData();
                        });

                // Load Upload js
                loadScript(__uri("/xigua/js/xiguaji/jquery.fileupload.js"), function () {
                    //绑定图片上传事件
                    $('#fileTopicImageUrl').fileupload({
                        url: '/upload?materialId=85252',
                        dataType: 'json',
                        limitMultiFileUploads: 1,
                        done: function (e, data) {
                            $.each(data.result.files, function (index, file) {
                                if (file.url) {
                                    var dataId = $('#previewItem section.itemSelected').attr('data-id');
                                    $('#imageUrl').attr('src', file.url);
                                    $('#preImg', $('#previewItem section.itemSelected')).attr('src', file.url);
                                    materialData[dataId].ImageUrl = file.url;
                                    $('a.btnDeleteImage').show();
                                    $.smallBox({
                                        title: "提示",
                                        content: "<i class='fa fa-clock-o'></i> <i>图片上传成功</i>",
                                        color: "#659265",
                                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                        timeout: 3000
                                    });
                                } else if (file.error) {
                                    alert(file.error);
                                }
                            });
                        },
                        progressall: function (e, data) {
                            var progress = parseInt(data.loaded / data.total * 100, 10);
                            $('div.uploadCoverProcess i').css(
                                    'height',
                                    (100 - progress) + '%'
                            );
                        }
                    }).prop('disabled', !$.support.fileInput)
                            .on('fileuploadadd', function (e, data) {
                                // $(this).parent().find('.progress-bar').css('width', '0%');
                            });

                });
            });
            $('input[name=saveToServer]').click(function () {
                if (!validateForm()) {
                    return;
                }
                saveMaterialData();
                showLoading();
                var userMaterialId = $('input[name=materialId]').val();
                var postData = {
                    UserMaterialId: userMaterialId,
                    MaterialDetailList: materialData,
                    bizId: $('a.btnSendToWX').attr('data-id')
                }
                var option =
                {
                    type: 'POST',
                    data: JSON.stringify(postData),
                    url: "ajax/saveMaterialSync.do",
                    dataType: "json",
                    contentType: "text/html;charset=utf-8",
                    success: function (result) {
                        var self = $(this);
                        $.SmartMessageBox({
                            title: "提示",
                            content: "保存成功，请确认是否需要同步到微信后台",
                            buttons: '[取消][确认]'
                        }, function (ButtonPressed) {
                            if (ButtonPressed == "确认") {
                                showLoading();
                                $.getJSON('ajax/weixin/sync_material.do?materialSyncId=' + userMaterialId, function (result) {
                                    if (result.Status) {
                                        $.smallBox({
                                            title: "同步成功",
                                            content: "<i class='fa fa-clock-o'></i> <i>同步成功</i>",
                                            color: "#C46A69",
                                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
//                                            timeout: 3000
                                        });
                                    }
                                    else
                                    {
                                        $.smallBox({
                                            title: "同步失败",
                                            content: "<i class='fa fa-clock-o'></i> <i>同步失败</i>",
                                            color: "#C46A69",
                                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
//                                            timeout: 3000
                                        });
                                    }
                                    hideLoading();
                                });
                            }
                        });
//                        $('input[name=materialId]').val(result.UserMaterialId);
//                        $.smallBox({
//                            title: "提示",
//                            content: "<i class='fa fa-clock-o'></i> <i>保存成功</i>",
//                            color: "#659265",
//                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
//                            timeout: 3000
//                        });
                        hideLoading();
                    }
                };
                $.ajax(option);
            });
            $('#retrySendToWX').click(function () {
                return sendToWX();
            });
            $('a.btnSendToWX').click(function () {
                return sendToWX();
            });
            function sendToWX() {
                if (!validateForm()) {
                    return false;
                }
                saveMaterialData();
                var seletecdBizId = $('a.btnSendToWX').attr('data-id');
                var canSend = $('a.btnSendToWX').attr('data-canSend');
                if (canSend == "0") {
                    return true;
                }
                var postData = {
                    UserMaterialId: $('input[name=materialId]').val(),
                    MaterialDetailList: materialData,
                    bizId: seletecdBizId,
                    canSend: canSend,
                };
                showSendingStatus();
                var option =
                {
                    type: 'POST',
                    data: JSON.stringify(postData),
                    url: "/Material/SendToWX",
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (result) {
                        hideLoading();
                        if (result.Status) {
                            //$.smallBox({
                            //    title: "提示",
                            //    content: "<i class='fa fa-clock-o'></i> <i>保存成功</i>",
                            //    color: "#659265",
                            //    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            //    timeout: 3000
                            //});
//                            $('input[name=materialId]').val(result.UserMaterialId);
                            showSuccessStatus();

                        }
                        else if (result.Ret != undefined && result.Ret != 0)//输入验证码
                        {
                            if (result.Ret == -5) {
                                $('#remoteModal').modal('hide');
                                $('body').removeClass('modal-open');
                                $.SmartMessageBox({
                                    title: "提示",
                                    content: "您的账号开启了微信登陆保护，需要关闭后才能进行素材同步",
                                    buttons: '[确认]'
                                }, function (ButtonPressed) {

                                });
                            }
                            else {
                                $('div.modal-content').load("/Material/SendToWX/?bizId=" + seletecdBizId, function () {
                                    $('#remoteModal').modal('show');
                                    showError(result);
                                })
                            }
                        }
                        else {
                            showFailStatus(result.Message);
                        }
                    }
                };

                $.ajax(option);
                return false;
            }

            function showSendingStatus() {
                $('div.modal-content').html($('#sendStatus').html());
                $('div.sendArticleResult').hide();
                $('#sending').show();
                $('#retrySendToWX').hide();
                $('#remoteModal').modal('show');
            }

            function showFailStatus(message) {
                $('div.sendArticleResult').hide();
                $('#retrySendToWX').show();
                $('#errorMessage').html(message);
                $('#sendFail').show();
            }

            function showSuccessStatus() {
                $('div.sendArticleResult').hide();
                $('#retrySendToWX').hide();
                $('#sendSuccess').show();
                isSend = "1";
            }

            function validateForm() {
                var validate = true;
                var validateIndex = 0;
                var errorMessage = '';
                $.each(materialData, function (index, val) {
                    if (materialData[index].Content.length >= 524288) {
                        errorMessage = '内容长度超过微信限制';
                        validate = false;
                        validateIndex = index;
                        return;
                    }
                    if (materialData[index].Title == '') {
                        $('input[name=Title]').focus();
                        //  $("html,body").animate({ scrollTop: $('input[name=Title]').offset().top }, 1000);
                        errorMessage = '标题不能为空';
                        validate = false;
                        validateIndex = index;
                        return;
                    }
//                        if (materialData[index].ImageUrl == '') {
//                            errorMessage = '封面图片不能为空';
//                            validate = false;
//                            validateIndex = index;
//                            return;
//                        }
                    if (materialData[index].Content == '') {
                        errorMessage = '内容不能为空';
                        validate = false;
                        validateIndex = index;
                        return;
                    }
                    //if (!replaceAllContent(materialData[index].Content))
                    //{
                    //    errorMessage = '微信现在禁止外链图片，请删除后再试试';
                    //    validate = false;
                    //    validateIndex = index;
                    //    return;
                    //}
                });
                if (!validate) {
                    $('a.previewItemEdit', $('#previewItem section').eq(validateIndex)).click();
                    $.smallBox({
                        title: "提示",
                        content: "<i class='fa fa-clock-o'></i> <i>" + errorMessage + "</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 3000
                    });
                }
                return validate;
            }

            function replaceAllContent(content) {
                var isWeixinImg = true;

                content.replace(/<img [^>]*src=['"]([^'"]+)[^>]*>/gi, function (match, capture) {
                    if (capture.indexOf('mmbiz') == -1) {
                        isWeixinImg = false
                    }
                });
                return isWeixinImg;
            }

            Array.prototype.remove = function (dx) {
                if (isNaN(dx) || dx > this.length) {
                    return false;
                }
                for (var i = 0, n = 0; i < this.length; i++) {
                    if (this[i] != this[dx]) {
                        this[n++] = this[i]
                    }
                }
                this.length -= 1
            }
            var GetLength = function (str) {
                ///<summary>获得字符串实际长度，中文2，英文1</summary>
                ///<param name="str">要获得长度的字符串</param>
                var realLength = 0, len = str.length, charCode = -1;
                for (var i = 0; i < len; i++) {
                    charCode = str.charCodeAt(i);
                    if (charCode >= 0 && charCode <= 128) realLength += 1;
                    else realLength += 2;
                }
                return realLength;
            };
//            });
        });
    });
    //@ sourceURL=article_edit.js
</script>

<script src="/xigua/js/mp/moon.js"></script>
<script>
    function clickGoUp(){
        var ob = $(".right-fixed-wrapper .up");
        var obDown = $(".right-fixed-wrapper .down");
        ob.bind("click", function(){
            $("html,body").animate({"scrollTop":0}, 500);
            ob.hide();
            obDown.show();
        });
        obDown.bind("click", function(){
            $("html,body").animate({"scrollTop":$("body").height()}, 500);
            obDown.hide();
            ob.show();
        });
        ob.hide();
        obDown.show();
    }
    clickGoUp()
</script>
