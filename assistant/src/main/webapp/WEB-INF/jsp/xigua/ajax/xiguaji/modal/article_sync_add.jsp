<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp" %>


<h3 class="sendArticleTitle"><i class="fa fa-user"></i> 请选择您的公众号</h3>
    <div class="sendArticleAccount clearfix">
        <c:forEach items="${wpwxUserPublicAssociations}" var="wpwxUserPublicAssociation">
            <c:set var="wpwxPublic" value="${wpwxUserPublicAssociation.wpwxPublic}"></c:set>
            <section class="col col-md-4 no-padding sectionForAccount">
                <dl data-id="${wpwxPublic.id}" data-name="${wpwxPublic.name}" class="selected">
                    <dt><img src="${wpwxPublic.headImg}"></dt>
                    <dd>${wpwxPublic.name}</dd>
                </dl>
            </section>
        </c:forEach>

        <%--<section class="col col-md-4 no-padding">--%>
            <%--<a class="addAccount" href="/Member#/UserBiz/UserBizList" target="_blank">--%>
                <%--<i class="fa fa-cog"></i> 设置我运营的公众号--%>
            <%--</a>--%>
        <%--</section>--%>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary" id="sendToServer" type="button">
            确定
        </button>
        <button data-dismiss="modal" class="btn btn-default" type="button" id="btnCancel">
            取消
        </button>
    </div>
    <script type="text/javascript">
        if ($('div.sendArticleAccount section dl').length == 1)
        {
            $('div.sendArticleAccount section dl:first').addClass("selected");
        }
        // $('div.sendArticleAccount section dl:first').addClass("selected");
        $('div.sendArticleAccount section.sectionForAccount').click(function () {
            //   $('div.sendArticleAccount section.sectionForAccount dl').removeClass('selected');
            $('dl', $(this)).toggleClass('selected');
        });
        $('#sendToServer').click(function () {
            var articleId = [];
            var sArticleId;
            $.each($('#articleCar dl'), function (index, val) {
                articleId.push($(this).attr('data-id'));
                sArticleId = $(this).attr('data-id');
            });
            if (articleId.length == 0) {
                $.smallBox({
                    title: "提示",
                    content: "<i class='fa fa-clock-o'></i> <i>请先选择素材</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 3000
                });
                return;
            }
            var bizIds = [];
            var publicId;
            $.each($('div.sendArticleAccount section dl.selected'), function (index,val) {
                bizIds.push($(this).attr('data-id'));
                publicId = $(this).attr('data-id');
            });
            if (bizIds.length == 0)
            {
                $.smallBox({
                    title: "提示",
                    content: "<i class='fa fa-clock-o'></i> <i>请至少选择一个公众号</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 3000
                });
                return;
            }
            showLoading();
            var option =
            {
                type: 'POST',
                data: JSON.stringify({ test: "test",articleIds: articleId, publicIds: bizIds }),
//                data: { articleIds: sArticleId, publicIds: publicId },

                url: "/user/ajax/add_sync_material.do",
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                success: function (result) {
                    hideLoading();
                    if (result.Status) {
                        //清空本地缓存
                        try {
                            ClearCartFromLocal();
                            $('a.addToCar').removeClass('hasAddCart');
                        } catch (ex) { }

                        $.SmartMessageBox({
                            title: "提示",
                            content: "生成素材成功",
                            buttons: '[继续挑选素材][查看生成的图文]'
                        }, function (ButtonPressed) {
                            if (ButtonPressed === "继续挑选素材") {
                                $('#articleCar').html('');
                                $('div.articleCartNone').show();
                                $('em.faNumber').html(0);
                                $('#remoteModal').modal('hide');
                            }
                            else {
                                $('body').removeClass('modal-open');
                                $('#remoteModal').modal('hide');
                                window.location.hash = '/user/article_sync.do';
                                // window.location.href = '/Member#/Material/List';
                                //      top.location = '/Member#/Material/List';
                                //    window.navigate('/Meb')
                            }
                        });
                    }
                    else {
                        $.smallBox({
                            title: "提示",
                            content: "<i class='fa fa-clock-o'></i> <i>合成素材失败:" + result.Message + "</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 3000
                        });
                    }
                }
            };
            $.ajax(option);
        });
        //@ sourceURL=article_sync_add.js

    </script>