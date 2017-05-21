<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp" %>




<div class="modal-header">
    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
    <h4 class="modal-title">群发图文</h4>
</div>
    <div class="modal-body no-padding">
        <!--绑定判断结束-->
        <!--设置群发时间开始-->
        <div class="sendArticleAccountForm" id="setMassTime" style="display:block">
            <form class="smart-form">
                <fieldset>
                    <section>
                        <div class="row">
                            <label class="label col col-4 text-align-right">设置群发时间</label>
                            <div class="col col-8 no-padding">
                                <label class="input settingTime ">
                                    <i class="icon-append fa fa-clock-o"></i>
                                    <input type="text" value="" class="DatePicker" name="massTime">
                                </label>
                                <c:if test="${wpwxMaterialSync.scheduleTime != null}">
                                    <p class="settingTimeReset">已设置群发时间，<a href="javascript:none" class="cancelMass">[取消群发]</a></p>
                                </c:if>
                            </div>
                        </div>
                        <div class="sendArticleWarn">
                            1、定时群发使用的是微信官方授权的接口，因此只能针对认证公众号进行定时群发；<a href="http://mp.weixin.qq.com/wiki/15/5380a4e6f02f2ffdc7981a8ed7a40753.html" target="_blank">微信官方接口说明</a><br>
                            2、群发的最终结果以同步到微信后台的素材为准，对素材的修改也请在微信后台进行；<br>
                            3、群发后不能删除微信后台的素材内容，否则群发的内容也会删除；<br>
                        </div>
                    </section>

                </fieldset>
            </form>
        </div>
        <!--设置群发时间结束-->
    </div>
    <div class="modal-footer">
        <button class="btn btn-danger" type="button" name="btnMassSend">
            立即群发
        </button>
        <button class="btn btn-primary" type="button" name="btnSetMassTime">
            确定
        </button>
        <button data-dismiss="modal" class="btn btn-default" type="button" id="btnCancel">
            取消
        </button>
    </div>
    <link rel="stylesheet" type="text/css" media="screen" href="/xigua/js/plugin/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <script type="text/javascript">
        loadScript(__uri("/xigua/js/plugin/bootstrap-datetimepicker/bootstrap-datetimepicker.js"), function () {
            // 日期控件初始化
            $('input.DatePicker').datetimepicker({
                format: "yyyy-mm-dd hh:ii",
                autoclose: true,
                //  todayBtn: true,
                pickerPosition: "bottom-left",
                startView: 1,
                maxView: 1,
                startDate: '2015-12-30 11:20'
            });
            $('button[name=btnSetMassTime]').click(function () {
                //判断是否输入Appkey
                if ($('#setMassTime').is(":hidden")) {
                    var appID = $('input[name=AppID]').val();
                    var appKey = $('input[name=AppSecret]').val();
                    if (appID==''||appKey == '') {
                        $.smallBox({
                            title: "提示",
                            content: "<i class='fa fa-clock-o'></i> <i>AppID或AppSecret不能为空</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 3000
                        });
                        return;
                    }
                    showLoading();
                    $.getJSON('/Mass/SetAppKey/?materialSyncId=${materialSyncId}' + "&appKey=" + appKey+"&appID="+appID, function (result) {
                        hideLoading();
                        if (result.Status) {
                            $('#setAppKey').hide();
                            $('#setMassTime').show();
                        }
                        else {
                            $.smallBox({
                                title: "提示",
                                content: "<i class='fa fa-clock-o'></i> <i>" + result.Message + "</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 3000
                            });
                        }
                    });
                }
                else {
                    var massTime = $('input[name=massTime]').val();
                    if (massTime == '') {
                        $.smallBox({
                            title: "提示",
                            content: "<i class='fa fa-clock-o'></i> <i>群发时间不能为空</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 3000
                        });
                        return;
                    }
                    showLoading();
                    var isforce = "0";
                    $.getJSON('ajax/weixin/SetMassTime.do?materialSyncId=${materialSyncId}' + "&massTime=" + massTime, function (result) {
                        hideLoading();
                        if (result.Status) {

                            $.smallBox({
                                title: "提示",
                                content: "<i class='fa fa-clock-o'></i> <i>保存成功</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 3000
                            });
                            if (window.location.href.indexOf("MassLogList") != -1) {
                                checkURL();
                            }
                            else {
                                window.location.href = '/user/index.do#/user/mass_log.do?publicId=${wpwxMaterialSync.publicId}';

                            }
                        }
                        else {
                            $.smallBox({
                                title: "提示",
                                content: "<i class='fa fa-clock-o'></i> <i>" + result.Message + "</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 3000
                            });
//                            if (result.Message.indexOf('重新设置时间') != -1) {
//                                $.SmartMessageBox({
//                                    title: "提示",
//                                    content: "该天已经设定群发任务，是否重新设定时间？",
//                                    buttons: '[重新设置][查看群发日志][仍然加入]'
//                                }, function (ButtonPressed) {
//                                    if (ButtonPressed == "仍然加入") {
//                                        showLoading();
//
//                                        $.getJSON('/Mass/SetMassTime/?force=1&userMaterialId=342942' + "&massTime=" + massTime, function (result) {
//                                            hideLoading();
//                                            if (result.Status) {
//
//                                                $.smallBox({
//                                                    title: "提示",
//                                                    content: "<i class='fa fa-clock-o'></i> <i>保存成功</i>",
//                                                    color: "#659265",
//                                                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
//                                                    timeout: 3000
//                                                });
//                                                if (window.location.href.indexOf("MassLogList") != -1) {
//                                                    checkURL();
//                                                }
//                                                else {
//                                                    window.location.href = '/Member#/Mass/MassLogList/?bizId=${wpwxMaterialSync.publicId}';
//
//                                                }
//                                            }
//                                            else {
//                                                $.smallBox({
//                                                    title: "提示",
//                                                    content: "<i class='fa fa-clock-o'></i> <i>" + result.Message + "</i>",
//                                                    color: "#C46A69",
//                                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
//                                                    timeout: 3000
//                                                });
//                                            }
//                                        });
//                                    }
//                                    else if (ButtonPressed == "查看群发日志") {
//                                        window.location.href = '/Member#/Mass/MassLogList/?bizId=${wpwxMaterialSync.publicId}';
//                                    }
//                                });
//                            }
//                            else {
//                                $.smallBox({
//                                    title: "提示",
//                                    content: "<i class='fa fa-clock-o'></i> <i>" + result.Message + "</i>",
//                                    color: "#C46A69",
//                                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
//                                    timeout: 3000
//                                });
//                            }
                        }
                    });
                }
            });
            $('button[name=btnMassSend]').click(function () {
                    showLoading();
                    $.getJSON('ajax/weixin/massSend.do?materialSyncId=${materialSyncId}', function (result) {
                        hideLoading();
                        if (result.Status) {

                            $.smallBox({
                                title: "提示",
                                content: "<i class='fa fa-clock-o'></i> <i>发送成功</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
//                                timeout: 3000
                            });
                            <%--if (window.location.href.indexOf("MassLogList") != -1) {--%>
                                <%--checkURL();--%>
                            <%--}--%>
                            <%--else {--%>
                                <%--window.location.href = '/user/index.do#/user/mass_log.do?publicId=${wpwxMaterialSync.publicId}';--%>

                            <%--}--%>
                        }
                        else {
                            $.smallBox({
                                title: "提示",
                                content: "<i class='fa fa-clock-o'></i> <i>" + result.Message + "</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 3000
                            });
                        }
                    });

            });

            $('a.cancelMass').click(function () {
                showLoading();
                $.getJSON('ajax/weixin/CancelMass.do?materialSyncId=${materialSyncId}', function (result) {
                    hideLoading();
                    if (result.Status) {
                        $('#remoteModal').modal('hide');
                        $.smallBox({
                            title: "提示",
                            content: "<i class='fa fa-clock-o'></i> <i>已取消群发</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 3000
                        });
                        $('a[data-id=${materialSyncId}]').parent().parent().remove();
                    }
                    else {
                        $.smallBox({
                            title: "提示",
                            content: "<i class='fa fa-clock-o'></i> <i>" + result.Message + "</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 3000
                        });
                    }
                });
            });
            $('a.resetMassTime').click(function () {
                $('input[name=massTime]').val("");
                $('label.settingTime').removeClass("state-disabled");

            });
        });
    </script>