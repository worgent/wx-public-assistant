
// 创建一个闭包    
(function ($) {
    if (!$.fn.xiguauc_collection) {
        // 插件的定义    
        $.fn.xiguauc_collection = function (options) {
            // build main options before element iteration    
            var opts = $.extend({}, $.fn.xiguauc_collection.defaults, options);
            // iterate and reformat each matched element

            var $this = $(this);
            ////$.getJSON('/MArticleCollect/GetUserTagInfoForCollection/?t=' + new Date().getTime(), function (result) {
            //
            //    $this.each(function () {
            //        $this = $(this);
            //        // build element specific options
                    var o = $.meta ? $.extend({}, opts, $this.data()) : opts;

                    rendererElement($this, o);
            //
            //    });
            //});

        };

        //生成页面元素
        function rendererElement($element, opts, tagData) {

            //if (tagData.length > 0) {
            //    var hlist = $('<ul>').addClass('dropdown-menu');
            //    if (tagData.length >= 6) {
            //        hlist.addClass('dropdown-menu-2col');
            //    }
            //    for (var i = 0; i < tagData.length; i++) {
            //        var a = $('<a href="javascript:void(0);" data-tagid="' + tagData[i].TagId + '" data-articleid="' + $element.attr('data-articleid') + '"><i class="fa fa-check"></i>' + tagData[i].TagName + '</a>');
            //        a.click(defaultTagSelectedClickCallback($element, opts));
            //        var li = $('<li>').append(a);
            //        li.appendTo(hlist);
            //    }
            //
            //    var outterDiv = $('<div>').addClass('setFolderDrop ').addClass('dropdown');
            //    $element.attr('data-toggle', 'dropdown');
            //
            //    $element.wrap(outterDiv);
            //    $element.parent().append(hlist);
            //} else {
                $element.unbind('click').click(defaultDirectCollection(opts));
            //}

        }

        //没有文件夹时的收藏方法 不弹出菜单
        function defaultDirectCollection(opts) {
            return function () {
                if (this)
                    var articleId = $(this).attr('data-articleid');
                var $this = $(this);
                var isCollect = !$this.attr('data-collected') || $this.attr('data-collected') =='0';

                if (isCollect) {
                    /*
                    $.getJSON('/MArticleCollect/GetLikeUserArticle/?articleId=' + articleId, function (result) {
                        if (result.LikeArticleCount > 0) {
                            var buttons = '[知道了][仍然加入]';
                            $.SmartMessageBox({
                                title: "提示",
                                content: '素材库中已存在相似文章',
                                buttons: buttons
                            }, function (ButtonPressed) {
                                if (ButtonPressed == '仍然加入') {
                                    $.getJSON('/MArticleCollect/SetCollect/?articleId=' + articleId, function (result) {
                                        if (result.Status) {
                                            $.smallBox({
                                                title: "加入素材库",
                                                content: "<i class='fa fa-clock-o'></i> <i>添加该文章到素材库成功！并为您过滤" + result.FilterCount + "篇跟本文相似的文章。</i>",
                                                color: "#659265",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 3000
                                            });
                                            $this.addClass('btnArtFavorited');
                                            $this.attr('data-collected', '1');
                                            $this.html(opts.cancelCollectableText);
                                        }
                                        else {
                                            $.smallBox({
                                                title: "加入素材库",
                                                content: "<i class='fa fa-clock-o'></i> <i>添加该文章到素材库失败</i>",
                                                color: "#C46A69",
                                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                                timeout: 3000
                                            });
                                        }
                                    });
                                }
                            });
                        } else {
                        */
                            $.getJSON('/user/ajax/collect_material.do?articleId=' + articleId, function (result) {
                                if (result.Status) {
                                    $.smallBox({
                                        title: "加入素材库",
                                        content: "<i class='fa fa-clock-o'></i> <i>添加该文章到素材库成功！</i>",
                                        color: "#659265",
                                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                        timeout: 3000
                                    });
                                    $this.addClass('btnArtFavorited');
                                    $this.attr('data-collected', '1');
                                    $this.html(opts.cancelCollectableText);
                                }
                                else {
                                    $.smallBox({
                                        title: "加入素材库",
                                        content: "<i class='fa fa-clock-o'></i> <i>添加该文章到素材库失败</i>",
                                        color: "#C46A69",
                                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                        timeout: 3000
                                    });
                                }
                            });
                        //}
                    //});
                } else {
                    $.getJSON('/MArticleCollect/CancelCollect/?articleId=' + articleId, function (result) {
                        if (result.Status) {
                            $.smallBox({
                                title: "移除素材",
                                content: "<i class='fa fa-clock-o'></i> <i>已将该文章从素材库移除</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 3000
                            });
                            $this.removeClass('btnArtFavorited');
                            $this.attr('data-collected', '0');
                            $this.html(opts.collectableText);
                        }
                        else {
                            $.smallBox({
                                title: "移除素材",
                                content: "<i class='fa fa-clock-o'></i> <i>从素材库移除该文章失败</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 3000
                            });
                        }
                    });
                }
            }
        }

        //选择菜单来收藏的方法
        function defaultTagSelectedClickCallback($element, opts) {
            return function () {
                var $this = $(this);
                var tagId = $this.attr('data-tagid');
                var articleId = $this.attr('data-articleid');
                //将用户选择的标签记入到缓存中
                /*
                if (localStorage)
                    localStorage.setItem("StoreBizTags", JSON.stringify(tagIds));
                */
                /*
                $.getJSON('/MArticleCollect/GetLikeUserArticle/?articleId=' + articleId, function (result) {
                    if (result.LikeArticleCount > 0) {
                        var buttons = '[知道了][仍然加入]';
                        $.SmartMessageBox({
                            title: "提示",
                            content: '素材库中已存在相似文章',
                            buttons: buttons
                        }, function (ButtonPressed) {
                            if (ButtonPressed == '仍然加入') {
                                $.getJSON('/MArticleCollect/SetCollect/?articleId=' + articleId + '&tagId=' + tagId, function (result) {
                                    if (result.Status) {
                                        $.smallBox({
                                            title: "加入素材库",
                                            content: "<i class='fa fa-clock-o'></i> <i>添加该文章到素材库成功！并为您过滤" + result.FilterCount + "篇跟本文相似的文章。</i>",
                                            color: "#659265",
                                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                            timeout: 3000
                                        });
                                        $element.addClass('btnArtFavorited');
                                        $element.attr('data-collected', '1');
                                        $element.html(opts.cancelCollectableText);

                                        $element.attr('data-toggle', '');

                                        //移除素材库
                                        $element.one('click', function () {
                                            var $this = $(this);
                                            $.getJSON('/MArticleCollect/CancelCollect/?articleId=' + articleId, function (result) {
                                                 if (result.Status) {
                                                    $.smallBox({
                                                        title: "移除素材",
                                                        content: "<i class='fa fa-clock-o'></i> <i>已将该文章从素材库移除</i>",
                                                        color: "#659265",
                                                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                        timeout: 3000
                                                    });
                                                    $this.removeClass('btnArtFavorited');
                                                    $this.attr('data-collected', '0');
                                                    $this.html(opts.collectableText);

                                                    $this.attr('data-toggle', 'dropdown');
                                                }
                                                else {
                                                    $.smallBox({
                                                        title: "移除素材",
                                                        content: "<i class='fa fa-clock-o'></i> <i>从素材库移除该文章失败</i>",
                                                        color: "#C46A69",
                                                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                                        timeout: 3000
                                                    });
                                                }
                                            });
                                        });
                                    }
                                    else {
                                        $.smallBox({
                                            title: "加入素材库",
                                            content: "<i class='fa fa-clock-o'></i> <i>添加该文章到素材库失败</i>",
                                            color: "#C46A69",
                                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                            timeout: 3000
                                        });
                                    }
                                });
                            }
                                
                        });
                    } else {
                    */
                        $.getJSON('/MArticleCollect/SetCollect/?articleId=' + articleId + '&tagId=' + tagId, function (result) {
                            if (result.Status) {
                                $.smallBox({
                                    title: "加入素材库",
                                    content: "<i class='fa fa-clock-o'></i> <i>添加该文章到素材库成功！并为您过滤" + result.FilterCount + "篇跟本文相似的文章。</i>",
                                    color: "#659265",
                                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                    timeout: 3000
                                });
                                $element.addClass('btnArtFavorited');
                                $element.attr('data-collected', '1');
                                $element.html(opts.cancelCollectableText);

                                $element.attr('data-toggle', '');

                                //移除素材库
                                $element.one('click', function () {
                                    var $this = $(this);
                                    $.getJSON('/MArticleCollect/CancelCollect/?articleId=' + articleId, function (result) {

                                        if (result.Status) {
                                            $.smallBox({
                                                title: "移除素材",
                                                content: "<i class='fa fa-clock-o'></i> <i>已将该文章从素材库移除</i>",
                                                color: "#659265",
                                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                timeout: 3000
                                            });
                                            $this.removeClass('btnArtFavorited');
                                            $this.attr('data-collected', '0');
                                            $this.html(opts.collectableText);

                                            $this.attr('data-toggle', 'dropdown');
                                        }
                                        else {
                                            $.smallBox({
                                                title: "移除素材",
                                                content: "<i class='fa fa-clock-o'></i> <i>从素材库移除该文章失败</i>",
                                                color: "#C46A69",
                                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                                timeout: 3000
                                            });
                                        }
                                    });
                                });
                            }
                            else {
                                $.smallBox({
                                    title: "加入素材库",
                                    content: "<i class='fa fa-clock-o'></i> <i>添加该文章到素材库失败</i>",
                                    color: "#C46A69",
                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                    timeout: 3000
                                });
                            }
                        });
                    //}
                    
                //});
            };
        }



        // 插件的defaults    
        $.fn.xiguauc_collection.defaults = {
            collectableText: '<i class="fa fa-star"></i> 加入素材库',
            cancelCollectableText: '<i class="fa fa-star"></i> 已在素材库',
        };
        // 闭包结束    
    }
})(jQuery);


