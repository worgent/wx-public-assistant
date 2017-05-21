(function (window) {

    var _ue = null;
    var _lessParser = new less.Parser;
    var _extend = function () {
        var i, len, arg, prop, src, copy, target = arguments[0] || {};
        for (i = 1, len = arguments.length; i < len; i++) {
            if ((arg = arguments[i]) != null) {
                for (prop in arg) {
                    if (arg.hasOwnProperty(prop)) {
                        src = target[prop];
                        copy = arg[prop];
                        if (target === copy) {
                            continue;
                        }
                        if (copy !== undefined) {
                            target[prop] = copy;
                        }
                    }
                }
            }
        }
        return target;
    };
    var _globalConfig = {
        serverUrlKey: 1,
        serverUrl: '/user/ajaxGetTemplates.do',
        showHeader: true,
        showTemplate: true,
        enableDraft: true,
        enableAutoSave: true,
        saveInterval: 10000,
        showRegisterUI: true,
        showContentSave: true,
        showContentPreview: true,
        showContentCopy: true,
        showContentClear: true,
        toolbars: [
             ["source", "removeformat", "|", "fontsize", "|", "bold", "italic", "underline", "|", "forecolor", "backcolor", "|", "blockquote", "horizontal", "|", "insertimage", "insertvideo", "|", "justifyleft", "justifycenter", "justifyright"],
             ["rowspacingtop", "rowspacingbottom", "lineheight", "|", "insertorderedlist", "insertunorderedlist", "|", "imagenone", "imageleft", "imageright", "imagecenter"],
             []]
    };
    var _storage = {
        _init: function () {
            if (!window.localStorage) {
                alert('你的浏览器版本较低,将无法临时保存你编辑的内容,请及时自行保存');
                return !1;
            }
        },
        save: function (key, val) {
            this._init();
            localStorage[key] = val;
        },
        get: function (key) {
            this._init();
            return localStorage[key];
        },
        del: function (key) {
            this._init();
            localStorage[key] = '';
        }
    };
    var _synchronous = function () {
        var key = 'xiguaVersion';
        var version = _storage.get(key);
        if (version) {
            if (version != XiGuaEditor.version) {
                _editor.storageLatest.del();
                _editor.storage.del();
            }
        }
        else {
            _editor.storageLatest.del();
            _editor.storage.del();
        }
        _storage.save(key, XiGuaEditor.version);
    };
    var _editor = {

        init: function () {
            this.getEditor();

            //使用模板
            $('.previewHeader .btnUse').click(function () {
                $('#editor .stylingPreview').hide();
                var html = $('#priview-box').html();
                _ue.setContent(html);
                var dom = $("#mixitup-box>li[data-id='" + $(this).data('id') + "']").get(0).outerHTML;
                _editor.addToLatestUse(dom);
            });
        },

        registerUI: function () {
            if (_globalConfig.showContentSave) {
                UE.registerUI('contentsave', function (editor, uiName) {
                    var btn = new UE.ui.Button({
                        name: uiName,
                        className: 'edui-for-contentsave',
                        onclick: function () {
                            _ue.undoManger.save();
                            _editor.storage.save(_ue.getContent() + '');
                            _ue.undoManger.save();
                            _eventBase.showOkMsg('草稿保存成功');
                        }
                    });
                    return btn;
                });
            }
            if (_globalConfig.showContentPreview) {
                UE.registerUI('contentpreview', function (editor, uiName) {
                    var btn = new UE.ui.Button({
                        name: uiName,
                        className: 'edui-for-contentpreview',
                        onclick: function () {
                            if (_ue.hasContents()) {
                                $('#device-preview-box').html(_ue.getContent());
                                $('#layer-device-preview').show();
                            }
                            else {
                                _eventBase.showMsg('没有预览内容');
                            }
                        }
                    });
                    return btn;
                });
            }
            if (_globalConfig.showContentCopy) {
                UE.registerUI('contentcopy', function (editor, uiName) {
                    var btn = new UE.ui.Button({
                        id: 'xigua-ContentCopy',
                        name: uiName,
                        className: 'edui-for-contentcopy'
                    });
                    return btn;
                });
            }
            if (_globalConfig.showContentClear) {
                UE.registerUI('contentclear', function (editor, uiName) {
                    var btn = new UE.ui.Button({
                        name: uiName,
                        className: 'edui-for-contentclear',
                        onclick: function () {
                            if (_ue.hasContents()) {
                                _eventBase.confirm("您确定要清空所有内容吗?", function () {
                                    _editor.storage.del();
                                    _ue.setContent('');
                                });
                            }
                            else {
                                _eventBase.showMsg('没有任何内容');
                            }

                        }
                    });
                    return btn;
                });
            }
        },

        //初始化编辑器
        getEditor: function () {
            _ue = UE.getEditor('editor');
            if (_globalConfig.showRegisterUI) {
                this.registerUI();
            }

            _ue.addListener('contentChange', function (editor) {
                _editor.autoHeight();
            });

            _ue.ready(function () {
                _editor.setToolBarIcon();
                if (_globalConfig.showRegisterUI && _globalConfig.showContentCopy) {
                    var clipId = $(_ue.container.firstChild).find('.edui-toolbar').find('#xigua-ContentCopy');
                    var client = new ZeroClipboard(clipId);
                    client.on('ready', function (event) {
                        client.on('copy', function (event) {
                            if (_ue.hasContents()) {
                                $(_ue.body).find('.xEditor').removeAttr('style');
                                event.clipboardData.setData('text/html', _ue.getContent());
                                event.clipboardData.setData('text/plain', _ue.getContent());
                                _eventBase.showOkMsg("已成功复制到剪切板");
                            } else {
                                _eventBase.showMsg("没有任何内容");
                            }

                        });
                    });
                }

                //滚动滚轮,可以修改列表序号
                _editor.xNum(this.selection.document);

                //初始化编辑器内容
                if (_globalConfig.enableDraft) {
                    if (_editor.storage.get()) {
                        _ue.setContent(_editor.storage.get() + '');
                    } else {
                        _ue.setContent('');
                    }
                }

                //设置编辑器高度
                setTimeout(function () {
                    _editor.autoHeight();
                }, 300);

                //自动保存草稿
                if (_globalConfig.enableAutoSave) {
                    setInterval(function () {
                        _ue.undoManger.save();
                        _editor.storage.save(_ue.getContent());
                        _ue.undoManger.save();

                    }, _globalConfig.saveInterval);
                }
            });

            var current_active_pItem = null;

            var clickPop = new baidu.editor.ui.Popup({
                content: "",
                editor: _ue,
                _remove: function () {
                    $(clickPop.anchorEl).remove();
                    clickPop.hide();
                },
                _blank: function () {
                    $('<p><br/></p>').insertAfter(clickPop.anchorEl);
                },
                _preblank: function () {
                    $('<p><br/></p>').insertBefore(clickPop.anchorEl);
                },
                _P_clearStyle: function () {
                    var clearedText = current_active_pItem.find('.xBrush').text();
                    if (clearedText != '') {
                        current_active_pItem.html(clearedText);
                    }
                },
                _pItem: null,
                className: 'edui-bubble'
            });

            _ue.addListener("click", function (t, evt) {
                evt = evt || window.event;
                var el = evt.target || evt.srcElement;
                if (el.tagName == "IMG") {
                    $(el).css({
                        'max-width': '100%',
                        'max-weight': '100%'
                    })
                }
                else if ($(el).parents('.xEditor').size() > 0) {
                    el = $(el).parents('.xEditor:first').get(0);
                    if (current_active_pItem) {
                        current_active_pItem.removeAttr('style');
                    }

                    current_active_pItem = $(el);
                    current_active_pItem.css({
                        'outline': '1px dotted #0faeff'
                    });
                    clickPop.render();
                    var html = clickPop.formatHtml('<nobr class="otf-poptools">'
                        + '<span onclick="$$._remove()" stateful>'
                    + '删除组件</span>'
                    + '<span onclick="$$._P_clearStyle()" stateful>'
                    + '清除该组件样式</span>'
                    + '<span onclick="$$._preblank()" stateful>'
                    + '前面插入空行</span>'
                    + '<span onclick="$$._blank()" stateful>'
                    + '后面插入空行</span>'
                    + '</nobr>');
                    var content = clickPop.getDom('content');
                    content.innerHTML = html;
                    clickPop.anchorEl = el;
                    clickPop.showAnchor(clickPop.anchorEl);
                }
                else {
                    if (current_active_pItem) {
                        current_active_pItem.removeAttr('style');
                        current_active_pItem = null;
                    }
                }
            });
        },

        //设置工具栏图标
        setToolBarIcon: function () {

            // 设置编辑器图标
            var tool_bar_icon = $(_ue.container.firstChild).find('.edui-toolbar').children();

            // 获取当前toolbars配置信息
            var toolName = _ue.getOpt('toolbars')[0].concat(_ue.getOpt('toolbars')[1]);
            $.each(toolName, function (index, val) {

                // 获取title名称
                var title = $(tool_bar_icon[index]).find('.edui-button-body').attr('title') || $(tool_bar_icon[index]).children().attr('title');

                // 清除原有title
                $(tool_bar_icon[index]).find('.edui-button-body').attr('title', null);
                $(tool_bar_icon[index]).children().attr('title', null);

                // 新增title
                $(tool_bar_icon[index]).attr({
                    'data-toggle': 'tooltip',
                    'data-placement': 'bottom',
                    'title': title
                }).tooltip();
            });
        },

        //设置编辑器高度
        autoHeight: function () {
            var h = $(window).height() - $('.edui-editor-toolbarbox').height();
            if (_globalConfig.showHeader) {
                h = h - 50;
            }

            _ue.setHeight(h);
            $(_ue.body).height(h - 16);
            $('.edui-editor-iframeholder iframe').css({
                height: h - 16,
                display: "block"
            });
        },

        //滚动滚轮,可以修改列表序号
        xNum: function (num_wrap) {
            $(num_wrap).on('mousewheel', '.xNum', function (event) {
                var num = parseInt($(this).html());
                if (!isNaN(num)) {
                    if (event.originalEvent.deltaY < 0) {
                        $(this).html(num + 1);
                    } else {
                        if (num > 1) {
                            $(this).html(num - 1);
                        };
                    }
                }
                return false;
            });
        },

        //编辑器内容存储
        storage: {
            _key: 'xiguaContent',
            save: function (val) {
                _storage.save(this._key, val);
            },
            get: function () {
                return _storage.get(this._key);
            },
            del: function () {
                _storage.del(this._key);
            }
        },

        //最近使用
        storageLatest: {
            _key: 'xiguaLatestUse',
            save: function (val) {
                _storage.save(this._key, val);
            },
            get: function () {
                return _storage.get(this._key);
            },
            del: function () {
                _storage.del(this._key);
            }
        },

        //添加至最近使用
        addToLatestUse: function (dom) {
            var id = $(dom).data('id');
            if (!id || id == undefined || id == 'undefined' || id == '') {
                return false;
            }

            if (this.storageLatest.get()) {
                var storage = this.storageLatest.get();
                var array = JSON.parse(storage);

                var isAdd = true;
                for (var i = 0; i < array.length; i++) {
                    if (array[i].id == id) {
                        isAdd = false;
                        break;
                    }
                }

                if (isAdd) {
                    if (array.length >= 10) {
                        array.pop();
                    }
                    array.unshift({ id: id, content: $(dom).html() });
                    this.storageLatest.save(JSON.stringify(array));
                }
            }
            else {
                var array = new Array();
                array.push({ id: id, content: $(dom).html() });
                this.storageLatest.save(JSON.stringify(array));
            }
        }
    };
    var _eventBase = {

        _self: this,

        showErrorMsg: function (msg) {
            xAlert(msg, "error");
        },
        showOkMsg: function (msg) {
            xAlert(msg, "success");
        },
        showMsg: function (msg) {
            xAlert(msg);
        },
        confirm: function (msg, fn) {
            var fun = fn || function () { };
            xConfirm(msg, fun);
        },

        //获取模板组件列表
        getTemplates: function (id, pi, ps) {

            $.ajax({
                url: _globalConfig.serverUrl,
                type: 'GET',
                data: { id: id, pageIndex: 1, pageSize: 200 },
                error: function (e) {
                    console.log(e);
                },
                success: function (rsp) {
                    if (rsp.code == 0) {
                        var str = '';

                        if (rsp.type == 1) {
                            $.each(rsp.result, function (index, val) {
                                var modules = '';
                                $.each(val.modules, function (i, v) {
                                    modules += "<section class='xEditor'>" + v + "</section>";
                                });

                                str += "<li class='animated' data-id=" + val.id + "><img src='" + val.imgUrl + "'>"
                                           + "<a class='btnPreview'>预览</a>"
                                           + "<div class='btnMore'>"
                                               + "<a class='insert' data-toggle='tooltip' data-placement='top' title='插入此模板'></a>"
                                               + "<a class='detail' data-toggle='tooltip' data-placement='top' data-name='" + val.name + "' title='查看模板所含组件'></a>"
                                           + "</div>"
                                           + "<div class='temp-content' style='display:none'>" + modules + "</div>"
                                       + "</li>";

                            });
                            $('#mixitup-box').removeClass().addClass('stylingList');
                        }

                        if (rsp.type == 2) {
                            $.each(rsp.result, function (index, val) {
                                str += "<li class='animated' data-toggle='tooltip' data-placement='left' title='点击可以插入此样式'><section class='xEditor'>" + val.content + "</section></li>";
                            });
                            $('#mixitup-box').removeClass().addClass('templateList');
                        }

                        $('#mixitup-box').html(str);

                        _eventBase.afterGetTemplates();

                        _eventBase.bindTemplatesEvent();
                    }
                }
            })
        },

        afterGetTemplates: function () {
            function randomAnimate() {
                var arr = ["bounce",
                "pulse",
                "rubberBand",
                "swing",
                "tada",
                "wobble",
                "bounceIn",
                "bounceInDown",
                "bounceInLeft",
                "bounceInRight",
                "bounceInUp",
                "fadeIn",
                "fadeInDown",
                "fadeInDownBig",
                "fadeInLeft",
                "fadeInLeftBig",
                "fadeInRight",
                "fadeInRightBig",
                "fadeInUp",
                "fadeInUpBig",
                "flip",
                "flipInX",
                "flipInY",
                "lightSpeedIn",
                "slideInUp",
                "slideInDown",
                "slideInLeft",
                "slideInRight",
                "zoomIn",
                "zoomInDown",
                "zoomInLeft",
                "zoomInRight",
                "zoomInUp",
                "hinge"];
                var animator = arr[parseInt(Math.random() * arr.length) - 1];
                return animator;
            }
            var animator = randomAnimate();

            //添加组件动态效果
            $('#mixitup-box li.animated').addClass(animator);

            //组件点击事件
            $('#mixitup-box .xEditor').click(function () {

                var xEditor = $(this)

                function getSelectionHtml() {
                    var range = _ue.selection.getRange();
                    range.select();
                    var selectionObj = _ue.selection.getNative();
                    var rangeObj = selectionObj.getRangeAt(0);
                    var docFragment = rangeObj.cloneContents();
                    var testDiv = document.createElement("div");
                    testDiv.appendChild(docFragment);
                    var selectHtml = testDiv.innerHTML;
                    return selectHtml;
                }

                xEditor.find('.xNum').html(parseInt(xEditor.find('.xNum').html()));

                // 如果有选中的文字,就用当前模板格式化该文字内容
                var timestr = new Date().getTime();
                // 给模板添加id标识
                $('body').append(
                        "<div class='id" + timestr + " fly-tmpl'>"
                                + xEditor.get(0).outerHTML + "</div>");
                if (getSelectionHtml()) {
                    if ($('.fly-tmpl.id' + timestr).find('.xBrush').size()) {
                        var brush = $('.fly-tmpl.id' + timestr).find('.xBrush');
                        brush.eq(0).html(getSelectionHtml());
                    } else {
                        _eventBase.showErrorMsg("此盖模板不支持该操作<br/>请先添加模板在修改内容");
                        return false;
                    }
                }


                var value = $('.fly-tmpl.id' + timestr).html();

                // 获取当前模板坐标x,y
                var pagex = xEditor.offset().left;
                var pagey = xEditor.offset().top;
                var w1 = xEditor.parent().get(0).offsetWidth;
                var pagex2 = $("#ueditor_0").offset().left;

                var pagey2 = $(_ue.selection.getStart()).offset().top - $(_ue.body).scrollTop() + $('.edui-editor-toolbarbox').height() - 16 + 60;
                var w2 = _ue.selection.getStart().offsetWidth + 15;
                setTimeout(function () {
                    var selectObj = $(_ue.selection.getStart()).closest(".xEditor");
                    if (selectObj.size() > 0) {
                        if (selectObj.selector) {
                            var html = selectObj.find(".xBrush").map(function () {
                                return this.innerText.replace(/\n+/g, "");
                            }).get().join();
                            $('.fly-tmpl.id' + timestr).find('.xBrush').eq(0).html(html);
                            value = $('.fly-tmpl.id' + timestr).html();
                        }
                        $(ue.selection.getStart()).closest(".xEditor").replaceWith(value);
                    } else {
                        _ue.execCommand("insertHtml", value);
                    }
                    if (_globalConfig.enableDraft) {
                        _ue.undoManger.save();
                        _editor.storage.save(_ue.getContent() + '');
                        _ue.undoManger.save();
                    }
                }, 300);

                if (_globalConfig.enableDraft) {
                    _ue.undoManger.save();
                    _editor.storage.save(_ue.getContent() + '');
                    _ue.undoManger.save();
                }

                $('.fly-tmpl.id' + timestr).css({
                    left: pagex,
                    top: pagey,
                    width: w1
                }).show(10).delay(10).animate({
                    left: pagex2,
                    top: pagey2,
                    width: w2,
                }, 300, function () {
                    $('.fly-tmpl.id' + timestr).remove();
                });

                xEditor.find('.xNum').html(parseInt(xEditor.find('.xNum').html()) + 1);
            });

            $('[data-toggle="tooltip"]').tooltip();

            _editor.xNum('.xEditor');
        },

        bindTemplatesEvent: function () {
            //预览模板
            $('#mixitup-box a.btnPreview').click(function () {
                var html = $(this).parent().find('.temp-content').html();
                $('#priview-box').html(html);
                $('.stylingPreview').show();

                var id = $(this).parent().data('id');
                $('.previewHeader .btnUse').data('id', id);
            });

            //插入模板
            $('#mixitup-box .insert').click(function () {
                $('#editor .stylingPreview').hide();
                var html = $(this).parent().next('.temp-content').html();
                _ue.setContent(html);
                var dom = $(this).parent().parent().get(0).outerHTML;
                _editor.addToLatestUse(dom);

            });

            //查看模板包含组件
            $('#mixitup-box .btnMore>a.detail').click(function () {
                $('#editor .stylingPreview').hide();
                var hid = $(this).parent().next('.temp-content').children();
                var html = '';
                for (var i = 0; i < hid.length; i++) {
                    html += "<li class='animated' data-toggle='tooltip' data-placement='left' title='点击可以插入此样式'>" + hid[i].outerHTML + "</li>";
                }
                $('#mixitup-box').html(html);
                $('.templateHeader h3').html($(this).data("name") + "<a>[返回]</a>");
                $('.templateHeader h3').click(function () {
                    var id = $('.nav>ul>li>ul>li.active>a').data('id') || -1;
                    if (id >= 0) {
                        _eventBase.getTemplates(id, 1, 200);
                    }
                    else {
                        _eventBase.getTemplates(_globalConfig.serverUrlKey, 1, 200);
                    }

                    $('.templateHeader h3').html($('.nav>ul>li>ul>li.active>a').html());
                });

                $('#mixitup-box').removeClass().addClass('templateList');

                _eventBase.afterGetTemplates();

                var dom = $(this).parent().parent().get(0).outerHTML;
                _editor.addToLatestUse(dom);
                $('#editor .stylingPreview').hide();
            });
        }
    };
    var _color = {

        init: function () {

            var _self = this;
            if (this.storage.get() === undefined) {
                this.storage.save("");
            }

            //从本地获取颜色
            if (this.storage.get()) {
                var arr = this.storage.get().split("||");
                var html = '';
                $.each(arr, function (k, v) {
                    if (v != "") {
                        html += '<li class="definedColor"><i style="background-color: ' + v + ';"></i></li>';
                    }
                });
                $('.colorBtns>li[class!=definedColor]').last().before(html);
            }

            //还原调色板
            $('#resetColor').click(function () {
                removedefinedStyle();
                function removedefinedStyle() {
                    if ($(".colorBtns .definedColor").size() > 0) {
                        $(".colorBtns .definedColor").eq($(".colorBtns .definedColor").size() - 1).animate({
                            marginBottom: -100,
                            opacity: 0,
                        }, 200, function () {
                            $(this).remove();
                            removedefinedStyle();
                        });
                    }
                }
                if (_self.storage.get() != '') {
                    _self.storage.save("");
                    _self.init();
                }
            });

            //切换颜色
            $('.colorBtns i').click(function (event) {
                _self.colorBoxClick(event);
            });

            //打开调色板
            $('.colorSelectorBtn').click(function () {
                if ($('.colorSelectorEntry').is(":hidden")) {
                    $('.colorSelectorEntry').show();
                }
                else {
                    $('.colorSelectorEntry').hide();
                }
            });

            //关闭调色板
            $('.colorSelectorFooter .btnClose').click(function () {
                $('.colorSelectorEntry').hide();
            });

            //初始化调色板
            $('.addColor').spectrum(_self.fnSpectrum());
        },

        storage: {
            _key: 'xiguaColor',
            save: function (val) {
                _storage.save(this._key, val);
            },
            get: function () {
                return _storage.get(this._key);
            },
            del: function () {
                _storage.del(this._key);
            }
        },

        fnSpectrum: function () {
            return {
                color: '#fff',
                showInput: true,
                preferredFormat: 'rgb',
                showAlpha: true,
                change: function (c) {
                    pColor = {
                        r: parseInt(c['_r']),
                        g: parseInt(c['_g']),
                        b: parseInt(c['_b'])
                    };
                    //添加一个色块
                    _color.addColorBox(c, $(this));
                    var rgb = "||rgb(" + pColor.r + "," + pColor.g + "," + pColor.b + ")";
                    _color.storage.save(_color.storage.get() + rgb);
                },
                show: function () {
                    $(".sp-picker-container").width(400);
                    $(this).spectrum("reflow");
                }
            };
        },

        addColorBox: function (c, tag) {
            var _self = this;
            var event = event || window.event;
            var pColor = [
                parseInt(c['_r']),
                parseInt(c['_g']),
                parseInt(c['_b'])
            ];
            var bg_color = 'rgb(' + pColor[0] + ',' + pColor[1] + ',' + pColor[2] + ')';
            tag.parent().siblings().children().removeClass('selected');

            var dom = '<li class="definedColor"><i class="selected" style="background-color:' + bg_color + ';"></i></li>';
            _self.changeColor($('#mixitup-box .xEditor'), bg_color, '#ffe');
            tag.parent().before(dom);
            $('.colorSelectorEntry .colorBtns i').css({
                borderColor: bg_color
            }).children().css({
                backgroundColor: bg_color
            });

            tag.parent().prev().click(function (event) {
                _self.colorBoxClick(event)
            });

            //重置添加按钮颜色
            tag.siblings('.sp-replacer').find('.sp-preview-inner').css({
                backgroundColor: 'rgb(244, 244, 244)'
            })

            $('.colorSelectorBtn').css({
                borderColor: bg_color
            }).children().css({
                background: bg_color
            });

        },

        colorBoxClick: function (event) {
            var event = event || window.event;
            var _this = $(event.target);

            _this.addClass('selected').parent().siblings().children().removeClass('selected');

            //data-color为前景色，bgcolor为背景色，或者无背景文字的前景色
            var color = _this.data('color') || '#ffe';
            var bg_color = _this.css('backgroundColor');

            $('.colorSelectorBtn').css({
                borderColor: bg_color
            }).children().css({
                background: bg_color
            });

            this.changeColor($('#mixitup-box .xEditor'), bg_color, color);
        },

        changeColor: function (obj, bgcolor, color) {

            var _self = this;

            if (_self.isGreyColor(bgcolor)) {
                return false;
            }
            obj.find("*").each(function () {
                if (this.nodeName == "HR" || this.nodeName == "hr") {
                    $(this).css('border-color', bgcolor);
                    return;
                }
                if (this.nodeName == "") {
                    return;
                }
                if ($(this).data('ct') == 'fix') {
                    return;
                }
                var bgimg = $(this).css('backgroundImage');
                if (bgimg.substring(0, 24) == '-webkit-linear-gradient(') {
                    var colors;
                    var type;
                    if (bgimg.substring(0, 30) == '-webkit-linear-gradient(left, ') {
                        type = 'left';
                        colors = bgimg.substring(30, (bgimg.length - 1));
                    } else if (bgimg.substring(0, 29) == '-webkit-linear-gradient(top, ') {
                        type = 'top';
                        colors = bgimg.substring(29, (bgimg.length - 1));
                    } else if (bgimg.substring(0, 31) == '-webkit-linear-gradient(right, ') {
                        type = 'right';
                        colors = bgimg.substring(31, (bgimg.length - 1));
                    } else if (bgimg.substring(0, 32) == '-webkit-linear-gradient(bottom, ') {
                        type = 'bottom';
                        colors = bgimg.substring(32, (bgimg.length - 1));
                    }
                    if (colors) {
                        var color_arr = colors.split('),');
                        var txt_color, gradient_color, main_color;
                        if (_self.isLightenColor(bgcolor)) {
                            txt_color = _self.getColor(rgb2hex(bgcolor), 'darken', '50%');
                            txt_color = _self.getColor(rgb2hex(txt_color), 'saturate', '30%');
                            gradient_color = _self.getColor(rgb2hex(bgcolor), 'darken', '10%');
                            main_color = _self.getColor(rgb2hex(bgcolor), 'saturate', '20%');
                        } else {
                            txt_color = '#FFFFFF';
                            _self.getColor(_self.rgb2hex(bgcolor), 'lighten', '50%');
                            gradient_color = _self.getColor(_self.rgb2hex(bgcolor), 'lighten', '10%');
                            main_color = _self.getColor(_self.rgb2hex(bgcolor), 'lighten', '5%');
                            main_color = _self.getColor(_self.rgb2hex(main_color), 'desaturate', '10%');
                            main_color = _self.getColor(_self.rgb2hex(main_color), 'fadein', '20%');
                        }
                        if (color_arr.length == 3) {
                            $(this).css('backgroundImage', '-webkit-linear-gradient(' + type + ', ' + main_color + ', ' + gradient_color + ', ' + main_color + ')');
                            $(this).css('color', txt_color);
                        } else if (color_arr.length == 2) {
                            $(this).css('backgroundImage', '-webkit-linear-gradient(' + type + ', ' + main_color + ', ' + gradient_color + ')');
                            $(this).css('color', txt_color);
                        }
                    }
                }
                var persent = $(this).data('clessp') ? $(this).data('clessp') : '50%';
                var hasSetBgColor = false;
                var bgC = $(this).get(0).style.backgroundColor;
                if (!bgC || bgC === 'initial' || bgC === 'transparent' || bgC === "") {
                    var fc = $(this).get(0).style.color;
                    if (fc && fc != "" && fc != 'inherit' && !_self.isGreyColor(fc)) {
                        var txt_color;
                        if (_self.isLightenColor(bgcolor)) {
                            txt_color = _self.getColor(_self.rgb2hex(bgcolor), 'darken', persent);
                            $(this).css('color', txt_color);
                        } else {
                            $(this).css('color', bgcolor);
                        }
                    }
                } else {
                    if ($(this).data('bgless')) {
                        var bgpersent = $(this).data('bglessp') ? $(this).data('bglessp') : '30%';
                        var bg_color;
                        if ($(this).data('bgless') == "true" || $(this).data('bgless') == true) {
                            if (_self.isLightenColor(bgcolor)) {
                                bg_color = _self.getColor(_self.rgb2hex(bgcolor), 'darken', bgpersent);
                                bg_color = _self.getColor(_self.rgb2hex(bg_color), 'saturate', '20%');
                            } else {
                                bg_color = _self.getColor(_self.rgb2hex(bgcolor), 'lighten', bgpersent);
                            }
                        } else {
                            bg_color = _self.getColor(_self.rgb2hex(bgcolor), $(this).data('bgless'), bgpersent);
                        }
                        if (_self.isLightenColor(bg_color)) {
                            txt_color = _self.getColor(_self.rgb2hex(bg_color), 'darken', persent)
                        } else {
                            txt_color = color;
                        }
                        hasSetBgColor = true;
                        $(this).css('backgroundColor', bg_color);
                        $(this).css('color', txt_color);
                    } else if (!_self.isGreyColor(bgC)) {
                        hasSetBgColor = true;
                        $(this).css('backgroundColor', bgcolor);
                        var txt_color;
                        if (_self.isLightenColor(bgcolor)) {
                            txt_color = _self.getColor(_self.rgb2hex(bgcolor), 'darken', persent)
                        } else {
                            txt_color = color;
                        }
                        $(this).css('color', txt_color);
                    } else {
                        var fc = $(this).get(0).style.color;
                        if (fc && fc != "" && fc != 'inherit' && !_self.isGreyColor(fc)) {
                            $(this).css('color', bgcolor);
                        }
                    }
                }
                if ($(this).data('bcless') || hasSetBgColor) {
                    var bc_color;
                    if (_self.isLightenColor(bgcolor) || $(this).data('bcless') == 'darken') {
                        var persent = $(this).data('bclessp') ? $(this).data('bclessp') : '5%';
                        bc_color = _self.getColor(_self.rgb2hex(bgcolor), 'darken', persent);
                        bc_color = _self.getColor(_self.rgb2hex(bc_color), 'saturate', '30%');
                    } else {
                        var persent = $(this).data('bclessp') ? $(this).data('bclessp') : '20%';
                        bc_color = _self.getColor(_self.rgb2hex(bgcolor), 'lighten', persent);
                        bc_color = _self.getColor(_self.rgb2hex(bc_color), 'desaturate', '20%');
                        bc_color = _self.getColor(_self.rgb2hex(bc_color), 'fadein', '20%');
                    }
                    if (this.style.borderBottomColor || this.style.borderTopColor || this.style.borderLeftColor || this.style.borderRightColor) {
                        this.style.borderBottomColor = bc_color;
                        this.style.borderTopColor = bc_color;
                        this.style.borderLeftColor = bc_color;
                        this.style.borderRightColor = bc_color;
                    } else {
                        this.style.borderColor = bc_color;
                    }
                } else {
                    if (this.style.borderBottomColor || this.style.borderTopColor || this.style.borderLeftColor || this.style.borderRightColor) {
                        _self.setColor(this, 'borderBottomColor', bgcolor);
                        _self.setColor(this, 'borderTopColor', bgcolor);
                        _self.setColor(this, 'borderLeftColor', bgcolor);
                        _self.setColor(this, 'borderRightColor', bgcolor);
                    } else {
                        _self.setColor(this, 'borderColor', bgcolor);
                    }
                }
            });
            obj.find("*").each(function () {
                var fc = $(this).css('color');
                $(this).find('*').each(function () {
                    var nfc = $(this).css('color');
                    if (nfc == fc) {
                        $(this).css('color', 'inherit')
                    }
                });
            });
            return obj;
        },

        getColor: function (color, type, num) {
            var str = '';
            _lessParser.parse('*{color:' + type + '(' + color + ',' + num + ')}',
            function (err, tree) {
                str = tree.toCSS();
                str = str.replace(/\n/g, '').replace(/ /g, '').replace('*{color:', '').replace(';}', '');
            });
            return str;
        },

        setColor: function (obj, colorType, color) {
            var c = $(obj).css(colorType);
            if (c === 'transparent') {
                return;
            } else {
                if (!this.isGreyColor(c)) {
                    $(obj).css(colorType, color);
                }
            }
        },

        rgb2hex: function (color) {
            var rgb = color.match(/^rgba?[\s+]?\([\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?/i);
            return (rgb && rgb.length === 4) ? "#" + ("0" + parseInt(rgb[1], 10).toString(16)).slice(-2) + ("0" + parseInt(rgb[2], 10).toString(16)).slice(-2) + ("0" + parseInt(rgb[3], 10).toString(16)).slice(-2) : color;
        },

        isGreyColor: function (color) {
            var c = this.rgb2hex(color);
            var r = "" + c.substring(1, 3);
            var g = "" + c.substring(3, 5);
            var b = "" + c.substring(5, 7);
            if (r == g && g == b) {
                return true;
            } else {
                return false;
            }
        },

        isLightenColor: function (color) {
            var c = this.rgb2hex(color);
            var r = ("" + c.substring(1, 3));
            var g = ("" + c.substring(3, 5));
            var b = ("" + c.substring(5, 7));
            if (r > 'C0' && g > 'C0' && b > 'C0') {
                return true;
            } else {
                return false;
            }
        }
    };

    var XiGuaEditor = function (options) {
        if (!(this instanceof XiGuaEditor)) {
            return new XiGuaEditor(options);
        }
        if (options) {
            XiGuaEditor.config(options);
        }
    };
    XiGuaEditor.version = '1.0.120711';
    XiGuaEditor.config = function (options) {
        if (typeof options === "object" && options !== null) {
            _extend(_globalConfig, options);
        }
        if (typeof options === "string" && options) {
            if (_globalConfig.hasOwnProperty(options)) {
                return _globalConfig[options];
            }
            return;
        }
        var copy = {};
        for (var prop in _globalConfig) {
            if (_globalConfig.hasOwnProperty(prop)) {
                if (typeof _globalConfig[prop] === "object" && _globalConfig[prop] !== null) {
                    if ("length" in _globalConfig[prop]) {
                        copy[prop] = _globalConfig[prop].slice(0);
                    } else {
                        copy[prop] = _extend({}, _globalConfig[prop]);
                    }
                } else {
                    copy[prop] = _globalConfig[prop];
                }
            }
        }
        return copy;
    };

    var _init = function () {
        //document.domain = 'xiguaji.com';

        $('body').attr({
            "onselectstart": "return false",
            "oncontextmenu": "return false",
            "onbeforeunload": "window.event.returnValue='即将离开页面,请确保编辑的内容已经保存';"
        });

        //关闭模板预览
        $('.previewHeader .btnClose').click(function () {
            $('#editor .stylingPreview').hide();
        });
        //关闭设备预览
        $('.devicePreview #btn-close-device-preview').click(function () {
            $('#layer-device-preview').hide();
        });

        _synchronous();


    }();

    XiGuaEditor.prototype.getContent = function () {
        return _ue.getContent();
    };
    XiGuaEditor.prototype.setContent = function (content) {
        _ue.setContent(content + '');
    };
    XiGuaEditor.prototype.render = function () {

        if (!_globalConfig.showHeader) {
            $('body').addClass('noHeader');
        }

        _editor.init();
        _color.init();
        _eventBase.getTemplates(_globalConfig.serverUrlKey, 1, 200);

        // 当页面高度发生变化时,再次修改编辑区域高度,始终保持可控
        $(window).resize(function (event) {
            _editor.autoHeight();
        });

        //导航栏点击
        $('.nav>ul>li').click(function () {

            var type = $(this).children('a').attr('class');
            $(this).addClass('active').siblings().removeClass('active');

            //最近使用
            if (type == 'navRecent') {

                if (_editor.storageLatest.get()) {
                    var dom = _editor.storageLatest.get();
                    var array = JSON.parse(dom);
                    var str = '';
                    for (var i = 0; i < array.length; i++) {
                        str += "<li class='animated' data-id=" + array[i].id + ">" + array[i].content + "</li>";
                    }

                    $('#mixitup-box').removeClass().addClass('stylingList');
                    $('#mixitup-box').html(str);

                    //因botstrap tooltip关系, 需要过滤 包含tooltip的div
                    $('#mixitup-box .tooltip').remove();

                    _eventBase.afterGetTemplates();
                    _eventBase.bindTemplatesEvent();
                }
                else {
                    $('#mixitup-box').removeClass().addClass('stylingList');
                    $('#mixitup-box').html('');
                }

                $('.templateHeader h3').html('最近使用');
            }

        });

        //二级导航栏点击
        $('.nav>ul>li>ul>li>a').click(function () {
            var obj = $(this);
            $('.nav>ul>li>ul>li').removeClass('active');
            $(this).parent().addClass('active').siblings().removeClass('active');

            var id = obj.data("id") || -1;
            if (id >= 0) {
                _eventBase.getTemplates(id, 1, 10);
                $('.templateHeader h3').html(obj.html());
            }

        });

        //还原组件样式
        $('#resetTemplete').click(function () {
            var id = $('.nav>ul>li>ul>li.active>a').data('id') || -1;
            if (id >= 0) {
                _eventBase.getTemplates(id, 1, 200);
            }
            else {
                _eventBase.getTemplates(_globalConfig.serverUrlKey, 1, 200);
            }
            $('.colorBtns>li>i').removeClass('selected');
        });
    };
    if (typeof define === "function" && define.amd) {
        define(function () {
            return XiGuaEditor;
        });
    } else if (typeof module === "object" && module && typeof module.exports === "object" && module.exports) {
        module.exports = XiGuaEditor;
    } else {
        window.XiGuaEditor = XiGuaEditor;
    }
})(function () {
    return this;
}());


/*
   组件样式约定:
     格式刷: .xBrush 
     数字滚动: .xNum
*/