<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp" %>


<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 class="modal-title">设置“${wpwxPublic.name}”的文章素材模板
        <%--<a data-original-title="点击查看什么是素材模板" data-placement="top"--%>
                                                              <%--rel="tooltip"--%>
                                                              <%--href="http://www.xiguaji.com/Knowledge/ShowView/?knowledgeId=24"--%>
                                                              <%--target="_blank"><i--%>
            <%--class="fa fa-exclamation-circle"></i></a>--%>
    </h4>
</div>
<div class="modal-body no-padding">
    <input type="hidden" name="bizId" value="${wpwxPublic.id}"/>

    <div class="articleTemp">
        <section>
            <h3>
                关注引导模板:
                <%--<div class="pull-right">--%>
                    <%--<label class="checkbox-inline"><input type="checkbox" name="autoInsertFollow"--%>
                                                          <%--class="checkbox style-0" ${focusTemplate!=null and focusTemplate.autoInsert == 1 ? "checked" :""}><span>自动插入</span></label>--%>
                    <%--<a data-original-title="生成图文时自动在文章头部插入以下引导内容。" data-placement="top" rel="tooltip"><i--%>
                            <%--class="fa fa-exclamation-circle"></i></a>--%>
                <%--</div>--%>
            </h3>
            <div class="articleTempEditor">
				<textarea id="followEditor635883693212818006" style="width:100%; height:200px;">
                    ${focusTemplate != null ? focusTemplate.content : ""}


                    <%--<script type="text/javascript">--%>
                        <%--var focus = '${focusTemplate != null ? (focusTemplate.content) : ""}'--%>
                        <%--document.write(htmldecode(focus))--%>
                    <%--</script>--%>
                </textarea>
            </div>
        </section>
        <section>
            <h3>
                签名模板:
                <%--<div class="pull-right">--%>
                    <%--<label class="checkbox-inline"><input type="checkbox" name="autoInsertSign"--%>
                                                          <%--class="checkbox style-0" ${signTemplate!=null and signTemplate.autoInsert == 1 ? "checked" :""}><span>自动插入</span></label>--%>
                    <%--<a data-original-title="生成图文时自动在文章末尾插入以下签名内容。" data-placement="top" rel="tooltip"><i--%>
                            <%--class="fa fa-exclamation-circle"></i></a>--%>
                <%--</div>--%>
            </h3>
            <div class="articleTempEditor">
				<textarea id="signEditor635883693212818006" style="width:100%; height:200px;">
                    ${signTemplate != null ? (signTemplate.content) : ""}
                                        <%--<script type="text/javascript">--%>
                                            <%--var sign = '${signTemplate != null ? (signTemplate.content) : ""}'--%>
                                                    <%--document.write(htmldecode(sign))--%>
                                        <%--</script>--%>
                </textarea>
            </div>
        </section>
        <section>
            <h3>
                阅读原文引导模板:
                <%--<div class="pull-right">--%>
                    <%--<label class="checkbox-inline">--%>
                        <%--<input type="checkbox" name="autoInsertOriginal"--%>
                                                          <%--class="checkbox style-0" ${originArticleTemplate!=null and originArticleTemplate.autoInsert == 1 ? "checked" :""}><span>自动插入</span></label>--%>
                    <%--<a data-original-title="生成图文时自动在文章末尾插入以下引导内容及原文链接" data-placement="top" rel="tooltip"><i--%>
                            <%--class="fa fa-exclamation-circle"></i></a>--%>
                <%--</div>--%>
            </h3>
            <div class="articleTempEditor">
				<textarea id="originalEditor635883693212818006" style="width:100%; height:200px;">
                    ${originArticleTemplate != null ? (originArticleTemplate.content) : ""}
                                                  <%--<script type="text/javascript">--%>
                                                      <%--var origin = '${originArticleTemplate != null ? (originArticleTemplate.content) : ""}'--%>
                                                              <%--document.write(htmldecode(origin))--%>
                                                  <%--</script>--%>
                </textarea>
            </div>
            <%--<h3>原文链接:</h3>--%>

            <%--<div class="articleTempEditor clearfix">--%>
                <%--<input type="text" name="originalUrl" class="form-control" placeholder=""--%>
                       <%--value="${orginArticleLink != null ?orginArticleLink.content:''}">--%>

                <%--<p class="note">勾选"自动插入"阅读原文引导模板后所有素材将插入该链接，可在编辑页面单独修改，如无须所有文章都设置该原文链接，请留空。</p>--%>
            <%--</div>--%>
        </section>
    </div>
</div>
<div class="modal-footer">
    <button type="button" id="btnSaveTemplate" class="btn btn-primary">
        保存
    </button>
    <button id="btnCancel" type="button" class="btn btn-default" data-dismiss="modal">
        取消
    </button>
</div>

<script type="text/javascript">
    pageSetUp();

    //为上传图片传值
    function getUploadImageParams() {
        return "85252";
    }

    if (!$('div.modal-dialog').hasClass('modal-dialog-wide')) {
        $('div.modal-dialog').addClass('modal-dialog-wide');
    }
    loadScript(__uri("/xigua/js/xiguaji/ue/ueditor.config.js"), function () {
        loadScript(__uri("/xigua/js/xiguaji/ue/ueditor.all.js"), function () {

            //初始化编辑器
            UEDITOR_CONFIG.UEDITOR_HOME_URL = '/xigua/js/xiguaji/ue/';
            UEDITOR_CONFIG.toolbars = [["html", 'fontsize', "bold", "italic", "underline", "forecolor", "backcolor", "justifyleft", "justifycenter", "justifyright", "justifyjustify", "insertimage"]];
            UEDITOR_CONFIG.zIndex = 1500;
				var config = {
					UEDITOR_HOME_URL: '/xigua/js/xiguaji/ue/'
					, toolbars: [["html", 'fontsize', "bold", "italic", "underline", "forecolor", "backcolor", "justifyleft", "justifycenter", "justifyright", "justifyjustify", "insertimage"]]
					, zIndex : 1500
				};
            UE.delEditor('followEditor635883693212818006');
            UE.delEditor('signEditor635883693212818006');
            UE.delEditor('originalEditor635883693212818006');
            var followUE = UE.getEditor('followEditor635883693212818006', config);
            var signUE = UE.getEditor('signEditor635883693212818006', config);
            var originalUE = UE.getEditor('originalEditor635883693212818006', config);
            //模板数据刷新
            function _updateTemplate(template) {
                $('#btnInsertFollow').data('template', htmldecode(template.FollowTemplate));
                $('#btnInsertSign').data('template', htmldecode(template.SignTemplate));
                $('#btnInsertOriginal').data('template', htmldecode(template.OriginalTemplate));
            }
            $('#btnSaveTemplate').click(function () {

                showLoading();
                var ubTemplate = {
                    FollowTemplate: htmlencode(followUE.getContent()),
                    SignTemplate: htmlencode(signUE.getContent()),
                    OriginalTemplate: htmlencode(originalUE.getContent()),
//                    AutoInsertFollow: $('input[name=autoInsertFollow]', $('div.articleTemp')).is(":checked") ? 1 : 0,
//                    AutoInsertSign: $('input[name=autoInsertSign]', $('div.articleTemp')).is(":checked") ? 1 : 0,
//                    AutoInsertOriginal: $('input[name=autoInsertOriginal]', $('div.articleTemp')).is(":checked") ? 1 : 0,
                    OriginalUrl: ""
                }
                var postData = {
                    bizId: $('input[name=bizId]').val(),
                    ubTemplate: ubTemplate
                }
                var option =
                {
                    type: 'POST',
                    data: JSON.stringify(postData),
                    url: "/user/ajax/saveArticleTemplate.do",
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (result) {
                        if (result.Status) {
                            $.smallBox({
                                title: "提示",
                                content: "<i class='fa fa-clock-o'></i> <i>保存成功</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 3000
                            });
                            hideLoading();

                            try {
                                _updateTemplate(ubTemplate)
                            } catch (ex) {
                            }
                            $('#btnCancel').click();
                        } else {
                            $.smallBox({
                                title: "提示",
                                content: "<i class='fa fa-clock-o'></i> <i>保存失败！内容超出范围</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 3000
                            });
                            hideLoading();
                        }
                    }
                };
                $.ajax(option);
            });
        });
    });
    //@ sourceURL=article_template.js

</script>