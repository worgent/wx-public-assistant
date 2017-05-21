<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="mpArticleFilter clearfix">
    <div class="row">
        <div class="col col-lg-1">导入微信文章:</div>
        <div class="col col-lg-11">
            <a class="btn btn-default" href="/user/modal/material_import.do" data-toggle="modal"
               data-target="#remoteModal" onclick="setWindowWide(0);">
                <i class="fa fa-cloud-download"></i> 导入微信文章</a> &nbsp;&nbsp;&nbsp;&nbsp;
            <%--<a href="/Knowledge/ShowView/?knowledgeId=17" target="_blank" class="font-weight-400"><i--%>
                    <%--class="fa fa-exclamation-circle"></i> 如何同步图文素材到微信后台？</a>--%>
        </div>
    </div>
    <%--<div class="row artTagsFilter">--%>
    <%--<label class="filterLabel col col-lg-1"><i class="fa fa-folder"></i> 素材文件夹:</label>--%>
    <%--<div id="tagPool" class="col col-lg-11 artTagsSelector">--%>
    <%--<a class="selectable selectedTag" data-tagid="0">未归类<em>2</em></a>--%>
    <%--<a class="selectable hasUsed" data-tagid="-1">已使用<em>1</em></a>--%>
    <%--<a class="selectable" data-tagid="17">自定义<em>0</em></a>--%>
    <%--<div class="hasDropNav dropdown">--%>
    <%--<a href="javascript:void(0);" data-toggle="dropdown"><i class="fa fa-gear"></i> 设置 <b class="caret"></b></a>--%>
    <%--<ul class="dropdown-menu">--%>
    <%--<li>--%>
    <%--<a href="javascript:void(0);" id="btnOperateBatch">批量管理素材</a>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<a href="/MArticleUse/TagManage" data-toggle="modal" data-target="#remoteModal" onclick="setWindowWide(0);">修改文件夹</a>--%>
    <%--</li>--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>

</div>

<%--<ul id="TagOperateGroup" class="myArticleGroup list-unstyled" style="display:none;">--%>
<%--<li>--%>
<%--<label class="checkbox-inline">--%>
<%--<input type="checkbox" class="checkbox style-0" id="chk_all">--%>
<%--<span>全选</span>--%>
<%--</label>--%>
<%--</li>--%>
<%--<li>已选择 <span id="TagOperateSelectedCount">0</span> 篇 <a href="javascript:void(0);" id="TagOperateCancelSelected">取消选择</a></li>--%>
<%--<li><a class="btn btn-primary disabled" id="btnMoveToFolder" href="/MArticleUse/AssignArticle" data-toggle="modal" data-target="#remoteModal">移动到文件夹</a></li>--%>
<%--<li><a class="btn btn-primary disabled" id="btnRemoveFromStore">从素材库移除</a></li>--%>
<%--<li><a class="btn btn-default" id="btnQuitOperateBatch">退出批量操作</a></li>--%>
<%--</ul>--%>

<div id="ArticleUseListContent">

    <div class="mpArticleList">
        <table class="table table-hover">
            <colgroup>
                <col width="100">
                <col>
                <col width="100">
                <col width="120">
                <col width="100">
                <col width="260">
            </colgroup>
            <thead>
            <tr>
                <th>传播指数</th>
                <th>文章标题</th>
                <th class="text-align-center">内容类别</th>
                <th>文章封面图</th>
                <th>推文时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${wpwxArticleAssociations}" var="article">
                <tr data-articleid="${article.wpwxUserArticle.id}">
                    <td>
                        <span class="artRank rank3"><i class="fa fa-trophy"></i>72.07</span>
                    </td>
                    <td>
                        <a href="${article.link}" target="_blank"
                           onclick="event.stopPropagation();">${article.title}</a>
                        <ul class="list-unstyled artMpUser">
                        </ul>
                    </td>
                    <td class="text-align-center"><span class="artContentSort"><i
                            class="fa fa-file-text-o"><em></em></i></span></td>
                    <td><a href="${article.thumbnail}" target="_blank" class="myArticleCover"
                           onclick="event.stopPropagation();" rel="noreferrer"><img class="WechatImage"
                                                                                    data-src="${article.thumbnail}"
                                                                                    src="${article.thumbnail}"><span>下载封面</span></a>
                    </td>
                    <td>${article.publishTime}</td>
                    <td>
                        <a class="btn btn-success addToCar btnIcon" data-articleid="${article.wpwxUserArticle.id}"
                           data-url="${article.thumbnail}" data-title="${article.title}" rel="tooltip"
                           data-placement="top" data-original-title="加入图文生成器"><i class="fa fa-shopping-cart"></i>加入到图文生成器后，同步到微信后台</a>
                        <a class="btn btn-default btnIcon articleuse " style="display: inline-block"
                           data-articleid="${article.wpwxUserArticle.id}" data-use="0" onclick="setDelete(this)"
                           rel="tooltip" data-placement="top" data-original-title="删除素材">
                            <i class="fa fa-trash-o">
                            </i> 删除
                        </a>
                            <%--<a class="btn btn-default btnIcon articleuse " style="display: inline-block" data-articleid="46870371" data-use="0" onclick="setUsed(this)" rel="tooltip" data-placement="top" data-original-title="标记已使用">--%>
                            <%--<i class="fa fa-wrench">--%>
                            <%--</i> 标记已使用--%>
                            <%--</a>--%>
                            <%--<a class="btn btn-default btnIcon" href="/MArticleUse/AssignArticle/?articleId=46870371" onclick="setWindowWide(0); event.preventDefault();" data-toggle="modal" data-target="#remoteModal" rel="tooltip" data-placement="top" data-original-title="移动到文件夹"><i class="fa fa-folder-open"></i> 移动到文件夹</a>--%>
                            <%--<a class="btn btn-info btnIcon" href="/Analyse/ArticleDetail/?articleId=46870371" data-toggle="modal" data-target="#remoteModal" onclick="setWindowWide(1); event.preventDefault();" rel="tooltip" data-placement="top" data-original-title="指数分析"><i class="fa fa-align-left"></i> 指数分析</a>--%>

                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="text-center">


    </div>
    <script type="text/javascript">
        $('ul.pagination a').click(function () {
            showLoading();
            var url = $(this).attr('href');
            $('#ArticleUseListContent').load(url, function (result) {
                var $result = $(result);
                hideLoading();
                //BindArticleListEvent($result);
                BindLazyImage($result);
                initPartial();
            });
            return false;
        });

        try {
            BindOperateBatch();
        } catch (ex) {
        }
        BindLazyImage($('#ArticleUseListContent'));
    </script>

</div>
<div class="articleCart">
    <a class="cartBtn"><i class="fa fa-list-ol"></i> 图文生成器<em class="faNumber">0</em></a>

    <div class="articleCartList">
        <div class="articleCartNone">
            <i class="fa fa-shopping-cart"></i>
            请从素材库中选择文章来合成图文<br>
            [可在图文编辑页面对文章自定义排序]
        </div>
        <div>
            <div id="articleCar"></div>
            <div class="articleCartFooter">
                <a class="btn btn-primary addToServer" data-toggle="modal" data-target="#remoteModal"
                   href="/user/modal/article_sync_add.do"><i class="fa fa-cloud"></i> 生成图文素材</a>
            </div>
        </div>
    </div>
</div>
<!-- Dynamic Modal -->
<div class="modal fade" id="remoteModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-wide">
        <div class="modal-content">
            <!-- content will be filled here from "ajax/modal-content/model-content-1.html" -->
        </div>
    </div>
</div>
<!-- /.modal -->
<script type="text/javascript">
    pageSetUp();

    function init() {
        BindOnceInfo();
        //绑定关键字回车
        $('input[name=TitleKeyword]').bind('keypress', function (event) {
            if (event.keyCode == "13") {
                $('#btnKeyword').click();
            }
        });

        //标签设置
        $('#tagPool a.selectable').click(function () {
            $('#tagPool a.selectable').removeClass("selectedTag");
            $(this).addClass("selectedTag");
            triggerArticleFilter();
        });

        //设置关键字搜索
        $('#btnKeyword').unbind('click').click(function () {
            var TitleKeyword = $('input[name=TitleKeyword]').val();
            window.location.hash = '/MArticleUse/ArticleUseListNew/?keyword=' + encodeURIComponent(TitleKeyword);
        });

        //批量操作切换
        $('#btnOperateBatch').unbind('click').click(function () {
            toggleOperateBatchMode();
        });
        $('#btnQuitOperateBatch').unbind('click').click(function () {
            toggleOperateBatchMode();
        });

        $('#TagOperateCancelSelected').unbind('click').click(function () {
            $('#ArticleUseListContent tbody tr').removeClass('hasSelected');
            $('#TagOperateSelectedCount').text(0);
            $("#chk_all").prop('checked', false);
        });

        $('#btnMoveToFolder').unbind('click').click(function (event) {
            var $this = $(this);
            if ($this.hasClass('disabled')) {
                event.stopPropagation();
                event.preventDefault();
            } else {
                //如果只选中一个文章，小窗口就显示该文章的所有文件夹
                if ($('#ArticleUseListContent tbody tr.hasSelected').length == 1) {
                    var articleId = $($('#ArticleUseListContent tbody tr.hasSelected')[0]).attr('data-articleid');
                    $this.attr('href', '/MArticleUse/AssignArticle/?articleId=' + articleId);
                } else {
                    $this.attr('href', '/MArticleUse/AssignArticle');
                }

                setWindowWide(0);
            }
        });
        $('#btnRemoveFromStore').click(function () {
            CancelCollectBatch();
        });

        $("#chk_all").click(function () {
            if ($(this).prop("checked") == true) {
                var $trarr = $('#ArticleUseListContent tbody tr');
                $trarr.addClass('hasSelected');
                $('#TagOperateSelectedCount').text($trarr.length);

                $('#btnMoveToFolder').removeClass('disabled');
                $('#btnRemoveFromStore').removeClass('disabled');
            } else {
                var $trarr = $('#ArticleUseListContent tbody tr');
                $trarr.removeClass('hasSelected');
                $('#TagOperateSelectedCount').text(0);

                $('#btnMoveToFolder').addClass('disabled');
                $('#btnRemoveFromStore').addClass('disabled');
            }
        });

        initPartial();

        //加载本地缓存

    }
    init();

    function initPartial() {
        $("a[rel=tooltip]").tooltip();
        $("li[rel=tooltip]").tooltip();
        //设置列表事件
        //BindArticleListEvent($('#ArticleUseListContent'));
        $('a.addToCar').click(function () {
            if ($('#articleCar dl').length >= 8) {
                $.smallBox({
                    title: "提示",
                    content: "<i class='fa fa-clock-o'></i> <i>最多添加8条</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 3000
                });
                return;
            }
            var articleId = $(this).attr('data-articleid');
            var isExist = false;
            $.each($('#articleCar dl'), function (index, val) {
                if ($(this).attr('data-id') == articleId) {
                    $.smallBox({
                        title: "提示",
                        content: "<i class='fa fa-clock-o'></i> <i>该文章已经存在</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 3000
                    });
                    isExist = true;
                }
            });
            if (!isExist) {
                var title = $(this).attr('data-title');
                var imageUrl = $(this).parents('tr').find('img.WechatImage').attr('src');
                $('div.articleCartNone').hide();
                addCartDetail(title, imageUrl, articleId);
                $(this).addClass('hasAddCart');
                //动画特效
                var $btnHtml = $($.parseHTML($(this).get(0).outerHTML));
                $btnHtml.appendTo(document.body).css('position', 'absolute').css('z-index', 9999).offset($(this).offset());
                var targetOffset = $('div.articleCart').offset();
                $btnHtml.animate(targetOffset, 500, function () {
                    $(this).remove();
                    $('em.faNumber').html($('#articleCar dl').length);
                });
            }
        });

        loadCartFromLocal();
    }

    function setWindowWide(type) {
        if (type == 0) {
            $('.modal-dialog').removeClass('modal-dialog-wide');
        } else if (type == 1) {
            $('.modal-dialog').addClass('modal-dialog-wide');
        }
    }

    function initArticleSelected(moveToTagIdStr, singleArticleId) {
        //移动到别的文件夹后 当前这些文件隐藏
        if (parseInt(singleArticleId) > 0) {
            if ($('#tagPool a.selectedTag').attr('data-tagid') != moveToTagIdStr)
                $('#ArticleUseListContent tbody tr[data-articleid=' + singleArticleId + ']').css('display', 'none');
        } else {
            var $trarr = $('#ArticleUseListContent tbody tr.hasSelected');
            if ($('#tagPool a.selectedTag').attr('data-tagid') != moveToTagIdStr) {

                $trarr.css('display', 'none');
            }
            $trarr.removeClass('hasSelected');
            $('#TagOperateSelectedCount').text(0);

            $('#btnMoveToFolder').addClass('disabled');
            $('#btnRemoveFromStore').addClass('disabled');
        }

    }

    function UpdateTagPanel() {
        $.getJSON('/MArticleUse/GetUserTagInfo/?t=' + new Date().getTime(), function (result) {
            var selectedTagId = parseInt($('#tagPool a.selectedTag').attr('data-tagid'));
            $('#tagPool a.selectable').remove();
            for (var i = result.length - 1; i >= 0; i--) {
                $('#tagPool').prepend('<a class="selectable' + (result[i].TagName == '已使用' ? ' hasUsed' : '') + '" data-tagid="' + result[i].TagId + '">' + result[i].TagName + '<em>' + result[i].ArticleCount + '</em></a>');
            }
            $('#tagPool a.selectable').click(function () {
                $('#tagPool a.selectable').removeClass("selectedTag");
                $(this).addClass("selectedTag");
                triggerArticleFilter();
            });
            if ($('#tagPool a.selectable[data-tagid=' + selectedTagId + ']').length > 0) {
                $('#tagPool a.selectable[data-tagid=' + selectedTagId + ']').addClass('selectedTag');
            } else {
                $('#tagPool a.selectable[data-tagid=0]').click();
            }

        });
    }

    //获取选中的文章列表
    function getSelectedArticleIdArray() {
        var arr = [];
        $('#ArticleUseListContent tbody tr.hasSelected').each(function () {
            arr.push(parseInt($(this).attr('data-articleid')));
        });
        return arr;
    }

    function toggleOperateBatchMode() {
        if ($('#TagOperateGroup').css('display') == 'none') {
            $('#TagOperateGroup').css('display', '');
            $('#ArticleUseListContent').addClass('selectMark');

            $('#btnMoveToFolder').addClass('disabled');
            $('#btnRemoveFromStore').addClass('disabled');

            $('#TagOperateSelectedCount').text(0);
            $('#ArticleUseListContent tbody tr.hasSelected').removeClass('hasSelected');
            $("#chk_all").prop('checked', false);

            $('#ArticleUseListContent tbody tr').click(function (event) {
                if (event.isDefaultPrevented())
                    return;

                var count = parseInt($('#TagOperateSelectedCount').text());
                $(this).toggleClass('hasSelected');
                count = $(this).hasClass('hasSelected') ? count + 1 : count - 1;
                $('#TagOperateSelectedCount').text(count);

                if (count > 0) {
                    $('#btnMoveToFolder').removeClass('disabled');
                    $('#btnRemoveFromStore').removeClass('disabled');
                } else {
                    $('#btnMoveToFolder').addClass('disabled');
                    $('#btnRemoveFromStore').addClass('disabled');
                }
            });

        } else {
            $('#TagOperateGroup').css('display', 'none');
            $('#ArticleUseListContent').removeClass('selectMark');
            $('#ArticleUseListContent tbody tr').unbind('click');
        }
    }

    function BindOperateBatch() {
        if ($('#TagOperateGroup').css('display') != 'none') {
            $('#TagOperateSelectedCount').text(0);
            $('#ArticleUseListContent tbody tr.hasSelected').removeClass('hasSelected');
            $("#chk_all").prop('checked', false);

            $('#btnMoveToFolder').addClass('disabled');
            $('#btnRemoveFromStore').addClass('disabled');

            $('#ArticleUseListContent tbody tr').click(function (event) {
                if (event.isDefaultPrevented())
                    return;

                var count = parseInt($('#TagOperateSelectedCount').text());
                $(this).toggleClass('hasSelected');
                count = $(this).hasClass('hasSelected') ? count + 1 : count - 1;
                $('#TagOperateSelectedCount').text(count);

                if (count > 0) {
                    $('#btnMoveToFolder').removeClass('disabled');
                    $('#btnRemoveFromStore').removeClass('disabled');
                } else {
                    $('#btnMoveToFolder').addClass('disabled');
                    $('#btnRemoveFromStore').addClass('disabled');
                }
            });
        }
    }

    //批量移除
    function CancelCollectBatch() {
        $.SmartMessageBox({
            title: "确认删除？",
            content: "请您确认是否将这些文件从素材库中移除",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed == "取消") {
                return;
            }
            var articleIds = getSelectedArticleIdArray();
            var postData = {articleIds: articleIds};
            $.ajax({
                url: '/MArticleCollect/CancelCollectBatch',
                data: JSON.stringify(postData),
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if (result.Status) {
                        $.smallBox({
                            title: "移除该素材",
                            content: "<i class='fa fa-clock-o'></i> <i>已将该文章从素材库中移除</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 3000
                        });
                        $('#ArticleUseListContent tbody tr.hasSelected').each(function () {
                            var $this = $(this);
                            $this.removeClass('hasSelected');
                            $this.css('display', 'none');
                        });
                        UpdateTagPanel();
                    }
                    else {
                        $.smallBox({
                            title: "移除该素材",
                            content: "<i class='fa fa-clock-o'></i> <i>移除素材失败</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 3000
                        });
                    }
                }
            });

        });
    }

    function setUsed(element) {

        if (!element)
            return;
        var articleId = $(element).attr('data-articleid');
        var $this = $(element);
        var isUnsed = $this.attr('data-use') == '0';

        if (isUnsed) {
            $.getJSON('/MArticleUse/SetUsed/?articleId=' + articleId, function (result) {
                if (result.Status) {
                    $.smallBox({
                        title: "使用设置",
                        content: "<i class='fa fa-clock-o'></i> <i>设置成功</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 2000
                    });
                    $this.addClass('btnArtUsed');
                    $this.attr('data-use', '1');
                    $this.html('<i class="fa fa-cog"></i> 已被使用');

                    $this.parent().parent().css('display', 'none');
                    UpdateTagPanel();
                    //$('a.btnArtFavorited[data-articleid=' + articleId + ']').css('display', 'none');
                }
                else {
                    $.smallBox({
                        title: "使用设置",
                        content: "<i class='fa fa-clock-o'></i> <i>设置失败</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 2000
                    });
                }
            });
        } else {
            $.getJSON('/MArticleUse/SetUnused/?articleId=' + articleId, function (result) {
                if (result.Status) {
                    $.smallBox({
                        title: "使用设置",
                        content: "<i class='fa fa-clock-o'></i> <i>设置成功</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 2000
                    });
                    $this.removeClass('btnArtUsed');
                    $this.attr('data-use', '0');
                    $this.html('<i class="fa fa-cog"></i> 标记已使用');

                    $('a.btnArtFavorited[data-articleid=' + articleId + ']').css('display', 'inline-block');
                }
                else {
                    $.smallBox({
                        title: "使用设置",
                        content: "<i class='fa fa-clock-o'></i> <i>设置失败</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 2000
                    });
                }
            });
        }
    }

    function setDelete(element) {

        if (!element)
            return;
        var articleId = $(element).attr('data-articleid');
        var $this = $(element);
//		var isUnsed = $this.attr('data-use') == '0';

//		if (isUnsed) {
        $.getJSON('/user/ajax/deleteMaterial.do?userArticleId=' + articleId, function (result) {
            if (result.Status) {
                $.smallBox({
                    title: "删除设置",
                    content: "<i class='fa fa-clock-o'></i> <i>删除成功</i>",
                    color: "#659265",
                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                    timeout: 2000
                });
//					$this.addClass('btnArtUsed');
//					$this.attr('data-use', '1');
                $this.html('<i class="fa fa-cog"></i> 已删除');

                $this.parent().parent().css('display', 'none');
                //删除元素
//					UpdateTagPanel();
                //$('a.btnArtFavorited[data-articleid=' + articleId + ']').css('display', 'none');
            }
            else {
                $.smallBox({
                    title: "删除设置",
                    content: "<i class='fa fa-clock-o'></i> <i>删除失败</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 2000
                });
            }
        });

    }

    function setFavorite(element) {
        var articleId = $(element).attr('data-articleid');
        var $this = $(element);
        $.getJSON('/MArticleCollect/CancelCollect/?articleId=' + articleId, function (result) {
            if (result.Status) {
                $.smallBox({
                    title: "移除该素材",
                    content: "<i class='fa fa-clock-o'></i> <i>已将该文章从素材库中移除</i>",
                    color: "#659265",
                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                    timeout: 3000
                });
                $this.parent().parent().css('display', 'none');
                UpdateTagPanel();
            }
            else {
                $.smallBox({
                    title: "移除该素材",
                    content: "<i class='fa fa-clock-o'></i> <i>移除素材失败</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 3000
                });
            }
        });
    }

    //设置列表事件
    /*
     function BindArticleListEvent($html) {
     $html.find('a.articleuse').click(function () {
     alert("aa");
     if (this)
     var articleId = $(this).attr('data-articleid');
     var $this = $(this);
     var isUnsed = $this.attr('data-use') == '0';

     if (isUnsed) {
     $.getJSON('/MArticleUse/SetUsed/?articleId=' + articleId, function (result) {
     if (result.Status) {
     $.smallBox({
     title: "使用设置",
     content: "<i class='fa fa-clock-o'></i> <i>设置成功</i>",
     color: "#659265",
     iconSmall: "fa fa-check fa-2x fadeInRight animated",
     timeout: 3000
     });
     $this.addClass('btnArtUsed');
     $this.attr('data-use', '1');
     $this.html('<i class="fa fa-cog"></i> 已被使用');
     }
     else {
     $.smallBox({
     title: "使用设置",
     content: "<i class='fa fa-clock-o'></i> <i>设置失败</i>",
     color: "#C46A69",
     iconSmall: "fa fa-times fa-2x fadeInRight animated",
     timeout: 3000
     });
     }
     });
     } else {
     $.getJSON('/MArticleUse/SetUnused/?articleId=' + articleId, function (result) {
     if (result.Status) {
     $.smallBox({
     title: "使用设置",
     content: "<i class='fa fa-clock-o'></i> <i>设置成功</i>",
     color: "#659265",
     iconSmall: "fa fa-check fa-2x fadeInRight animated",
     timeout: 3000
     });
     $this.removeClass('btnArtUsed');
     $this.attr('data-use', '0');
     $this.html('<i class="fa fa-cog"></i> 标记已使用');
     }
     else {
     $.smallBox({
     title: "使用设置",
     content: "<i class='fa fa-clock-o'></i> <i>设置失败</i>",
     color: "#C46A69",
     iconSmall: "fa fa-times fa-2x fadeInRight animated",
     timeout: 3000
     });
     }
     });
     }
     });
     $html.find('a.btnArtFavorited').click(function () {
     var articleId = $(this).attr('data-articleid');
     var $this = $(this);
     $.getJSON('/MArticleCollect/CancelCollect/?articleId=' + articleId, function (result) {
     if (result.Status) {
     $.smallBox({
     title: "移除该素材",
     content: "<i class='fa fa-clock-o'></i> <i>已将该文章从素材库中移除</i>",
     color: "#659265",
     iconSmall: "fa fa-check fa-2x fadeInRight animated",
     timeout: 3000
     });
     $this.parent().parent().css('display', 'none');
     }
     else {
     $.smallBox({
     title: "移除该素材",
     content: "<i class='fa fa-clock-o'></i> <i>移除素材失败</i>",
     color: "#C46A69",
     iconSmall: "fa fa-times fa-2x fadeInRight animated",
     timeout: 3000
     });
     }
     });
     });

     }
     */
    var ArticleFilterDelayHandle;
    //文章过滤
    function triggerArticleFilter(delay) {
        if (delay) {
            if (ArticleFilterDelayHandle) {
                clearInterval(ArticleFilterDelayHandle);
                ArticleFilterDelayHandle = null;
            }
            ArticleFilterDelayHandle = window.setTimeout(function () {
                showLoading();
                $('#ArticleUseListContent').load(getPath() + '&partial=1', function () {
                    //BindArticleListEvent($('#ArticleUseListContent'));
                    //$("a[rel=tooltip]").tooltip();
                    //$("li[rel=tooltip]").tooltip();
                    hideLoading();
                    initPartial();
                });
            }, delay);
        } else {
            showLoading();
            $('#ArticleUseListContent').load(getPath() + '&partial=1', function () {
                //BindArticleListEvent($('#ArticleUseListContent'));
                //$("a[rel=tooltip]").tooltip();
                //$("li[rel=tooltip]").tooltip();
                hideLoading();
                initPartial();
            });
        }
    }

    function addCartDetail(title, imageUrl, articleId) {
        //保存到本地
        saveCartToLocal(title, imageUrl, articleId);

        var cartDetail = ' <dl data-id="' + articleId + '"><dt><img src="' + imageUrl + '"></dt>'
                + '<dd class="articleTitle">' + title + '</dd>'
                + '<dd class="btnRemove"><a class="btnDeleteArticleDetail"><i class="fa fa-trash-o"></i></a></dd></dl>';
        var $cd = $(cartDetail);
        $cd.find('a.btnDeleteArticleDetail').click(function () {
            RemoveCartFromLocal(parseInt($(this).parent().parent().data('id'))); //移除缓存
            $(this).parent().parent().remove();
            $('em.faNumber').html($('#articleCar dl').length);
            if ($('#articleCar dl').length == 0) {
                $('div.articleCartNone').show();
            }
            $('a.addToCar[data-articleid=' + articleId + ']').removeClass('hasAddCart');
        });
        $cd.appendTo('#articleCar');
    }
    //加载本地缓存
    function loadCartFromLocal() {
        if (!window.localStorage)
            return;

        $('#articleCar').empty();

        var mapstr = window.localStorage.getItem("ArticleCartMap");
        var cartMap;
        if (mapstr != null && mapstr != "") {
            cartMap = JSON.parse(mapstr);
        } else {
            cartMap = {};
        }
        var count = 0;
        for (var o in cartMap) {
            var item = cartMap[o];
            var articleId = item.ArticleId;
            var imageUrl = item.ImageUrl;
            var title = item.Title;

            var cartDetail = ' <dl data-id="' + articleId + '"><dt><img src="' + imageUrl + '"></dt>'
                    + '<dd class="articleTitle">' + title + '</dd>'
                    + '<dd class="btnRemove"><a class="btnDeleteArticleDetail"><i class="fa fa-trash-o"></i></a></dd></dl>';
            var $cd = $(cartDetail);
            $cd.find('a.btnDeleteArticleDetail').click(function () {
                RemoveCartFromLocal(parseInt($(this).parent().parent().data('id'))); //移除缓存
                $(this).parent().parent().remove();
                $('em.faNumber').html($('#articleCar dl').length);
                if ($('#articleCar dl').length == 0) {
                    $('div.articleCartNone').show();
                }

                $('a.addToCar[data-articleid=' + articleId + ']').removeClass('hasAddCart');
            });
            $cd.appendTo('#articleCar');
            $('a.addToCar[data-articleid=' + articleId + ']').addClass('hasAddCart');
            count++;
        }

        if (count > 0) {
            $('div.articleCartNone').hide();
            $('em.faNumber').html($('#articleCar dl').length);
        }
    }

    //保存到本地缓存
    function saveCartToLocal(title, imageUrl, articleId) {
        if (window.localStorage) {
            var mapstr = window.localStorage.getItem("ArticleCartMap");
            var cartMap;
            if (mapstr != null && mapstr != "") {
                cartMap = JSON.parse(mapstr);
            } else {
                cartMap = {};
            }
            cartMap['' + articleId] = {Title: title, ImageUrl: imageUrl, ArticleId: articleId};
            window.localStorage.setItem("ArticleCartMap", JSON.stringify(cartMap));
        }
    }
    //从本地缓存移除
    function RemoveCartFromLocal(articleId) {
        if (window.localStorage) {
            var mapstr = window.localStorage.getItem("ArticleCartMap");
            var cartMap;
            if (mapstr != null && mapstr != "") {
                cartMap = JSON.parse(mapstr);
            } else {
                cartMap = {};
            }
            delete cartMap['' + articleId];
            window.localStorage.setItem("ArticleCartMap", JSON.stringify(cartMap));
        }
    }
    //清空本地缓存
    function ClearCartFromLocal(articleId) {
        if (window.localStorage) {
            window.localStorage.removeItem("ArticleCartMap");
        }
    }

    $('a.addToServer').click(function () {
        var articleId = [];
        $.each($('#articleCar dl'), function (index, val) {
            articleId.push($(this).attr('data-id'));
        });
        if (articleId.length == 0) {
            $.smallBox({
                title: "提示",
                content: "<i class='fa fa-clock-o'></i> <i>请先选择素材</i>",
                color: "#C46A69",
                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                timeout: 3000
            });
            return false;
        }
        setWindowWide(0);
    });
    function getPath() {
        var TitleKeyword = '';
        var OnlyUnused = $('input[name=OnlyUnused]').prop('checked');
        var tagId = $('#tagPool a.selectedTag').attr('data-tagid');
        return '/MArticleUse/ArticleUseListNew/?keyword=' + encodeURIComponent(TitleKeyword) + '&onlyUnused=' + OnlyUnused + '&tagId=' + tagId;
    }

    //一次性提示按钮
    function BindOnceInfo() {
        $('.onceinfo').each(function () {
            if (window.localStorage) {
                var $this = $(this);
                $this.find('.onceinfo-close').click(function () {
                    window.localStorage.setItem($this.attr('data-localstorage'), "true");
                    $this.css('display', 'none');
                });

                if (window.localStorage.getItem($this.attr('data-localstorage')) == "true") {
                    $this.css('display', 'none');
                }
            }
        });
    }

    $("#remoteModal").on("hidden", function () {
        $(this).removeData("modal");
        $("#remoteModal div.modal-content").html('');
    });
    $("#remoteModal").on("hidden.bs.modal", function () {
        $(this).removeData("bs.modal");
        $("#remoteModal div.modal-content").html('');
    });
    //@ sourceURL=my_material.js
</script>