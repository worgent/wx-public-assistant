<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp" %>



<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 class="modal-title">添加我运营的公众号</h4>
</div>
<div>

    <form class="smart-form">
        <fieldset>
            <section>
                <div class="row">
                    <label class="label col col-2">选择添加方式:</label>

                    <div class="col col-10 addMyAccountType">
                        <div class="sendArticleAccountCheck">
                            <ul class="nav nav-tabs bordered">
                                <li class="active" data-checktype="2">
                                    <a data-toggle="tab" href="#s2">微信素材管理授权<span
                                            class="badge inbox-badge bg-color-red font-weight-400">推荐</span></a>
                                </li>


                                <%--<li data-checktype="3" class="">--%>
                                    <%--<a data-toggle="tab" href="#s3">公众号AppId/Secret</a>--%>
                                <%--</li>--%>
                            </ul>
                            <div class="tab-content no-padding">

                                <div id="s2" class="tab-pane fade sendArticleAccountForm active in">

                                    <div class="form-group text-align-center">
                                        <a class="btn btn-primary btnWechat"
                                           href="${authorizeUrl}" authUUID="${authUUID}"
                                           target="_blank"><i class="fa fa-wechat"></i> 微信素材管理授权</a>
                                        <span style="display:none;" id="wxLogin">正在进行微信素材管理授权...</span>
                                        <ul class="wechatFeatures list-unstyled">
                                            <li><i class="fa fa-check-circle"></i> 微信官方许可</li>
                                            <li><i class="fa fa-cog"></i> 公众号免繁琐设置</li>
                                            <li><i class="fa fa-shield"></i> 安全可靠的授权</li>
                                        </ul>
                                    </div>
                                    <p class="text-align-center"><a href="/Knowledge/ShowView/?knowledgeId=18"
                                                                    target="_blank"><i
                                            class="fa fa-exclamation-circle"></i> 什么是微信素材管理授权？</a></p>

                                </div>
                                <%--<div id="s1" class="tab-pane fade sendArticleAccountForm ">--%>
                                    <%--<form class="smart-form">--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="input ">--%>
                                                <%--<i class="icon-append fa fa-envelope"></i>--%>
                                                <%--<input class="normalInput" placeholder="公众号帐号邮箱" name="bizAccount"--%>
                                                       <%--type="text" value="">--%>
                                            <%--</label>--%>
                                            <%--<em for="bizAccount" class="invalid" id="errorMessage"--%>
                                                <%--style="color:red"></em>--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="input">--%>
                                                <%--<i class="icon-append fa fa-lock"></i>--%>
                                                <%--<input class="normalInput" placeholder="公众号帐号密码" name="bizPassword"--%>
                                                       <%--type="password" value="">--%>
                                            <%--</label>--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group hasVerify clearfix" style="display:none">--%>
                                            <%--<label class="input">--%>
                                                <%--<input class="normalInput" placeholder="验证码" type="text" value=""--%>
                                                       <%--name="validateCode">--%>
                                            <%--</label>--%>
                                            <%--<img src="http://h.hiphotos.baidu.com/image/pic/item/8435e5dde71190efd9757edbcc1b9d16fdfa602c.jpg"--%>
                                                 <%--class="verifyImg">--%>
                                            <%--<input type="hidden" name="setCookie" value="">--%>
                                        <%--</div>--%>
                                        <%--<ul class="wechatFeatures list-unstyled" style=" width:280px;">--%>
                                            <%--<li><i class="fa fa-shield"></i> 安全可靠的授权</li>--%>
                                            <%--<li><i class="fa fa-list-ol"></i> 不受微信素材数量上限限制</li>--%>
                                        <%--</ul>--%>
                                    <%--</form>--%>
                                <%--</div>--%>
                                <%--<div id="s3" class="tab-pane fade sendArticleAccountForm">--%>
                                    <%--<p class="text-align-center">已认证的公众号可使用该方法绑定账号(不支持使用微博认证的号)</p>--%>

                                    <%--<form class="smart-form">--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="input">--%>
                                                <%--<i class="icon-append fa fa-sliders"></i>--%>
                                                <%--<input name="appId" type="text" value="" placeholder="AppId"--%>
                                                       <%--class="normalInput">--%>
                                            <%--</label>--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="input">--%>
                                                <%--<i class="icon-append fa fa-key"></i>--%>
                                                <%--<input name="appKey" type="text" value="" placeholder="AppSecret"--%>
                                                       <%--class="normalInput">--%>
                                            <%--</label>--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="input">--%>
                                                <%--<i class="icon-append fa fa-link"></i>--%>
                                                <%--<input name="mBizUrl" type="text" value="" placeholder="公众号素材网址"--%>
                                                       <%--class="normalInput">--%>
                                            <%--</label>--%>
                                        <%--</div>--%>
                                        <%--<p><a href="/Knowledge/ShowView/?knowledgeId=16" target="_blank"><i--%>
                                                <%--class="fa fa-exclamation-circle"></i> 如何找到公众号AppId及AppSecret</a><br><a--%>
                                                <%--href="/Knowledge/ShowView/?knowledgeId=14" target="_blank"><i--%>
                                                <%--class="fa fa-exclamation-circle"></i> 如何获得公众号素材网址</a></p>--%>
                                    <%--</form>--%>
                                <%--</div>--%>

                            </div>
                        </div>
                        <p class="note">基础版只可绑定1个公众号，高级版最多可绑定10个公众号，如需绑定超过10个公众号请联系客服购买<a href="/About/PricingSpecial"
                                                                                          target="_blank"
                                                                                          style=" color:#999; border-bottom:1px dotted #999;">定制版</a>。
                        </p>
                    </div>
                </div>
            </section>
        </fieldset>
    </form>

</div>
<div class="modal-footer">
    <button type="button" id="addMBizBtn" class="btn btn-primary">
        确定
    </button>
    <button id="btnCancel" type="button" class="btn btn-default" data-dismiss="modal">
        取消
    </button>
</div>

<script src="/Scripts/jquery.md5.js" type="text/javascript"></script>
<script type="text/javascript">
    $('div.modal-dialog').removeClass('modal-dialog-wide');
    var intervalHandler;
    $('a.btnWechat').click(function () {
        $(this).hide();
        $('#wxLogin').show();
        intervalHandler = setInterval(checkLoginStatus, 2000);
    });
    function checkLoginStatus() {
        var authUUID = $('a.btnWechat').attr('authUUID');
        $.getJSON("/ajax/CheckWXLoginStatus.do?authUUID="+authUUID, function (result) {
            if (result.Status) {
                clearInterval(intervalHandler);
                checkURL();
                $(document.body).removeClass('modal-open');
            }
        });
    }
    $('#remoteModal').on('hide.bs.modal', function () {
        clearInterval(intervalHandler);
    })
    $('#chkEnableSync').click(function () {
        if ($(this).is(':checked')) {
            $('div.sendArticleAccountCheck').show();
        }
        else {
            $('div.sendArticleAccountCheck').hide();
        }
    });
    $('#addMBizBtn').click(function () {
        var currentType = $('div.sendArticleAccountCheck ul.nav>li.active').attr('data-checkType');
        if (currentType == "2") {
            var url = $('a.btnWechat').attr('href');
            $('a.btnWechat').hide();
            $('#wxLogin').show();
            intervalHandler = setInterval(checkLoginStatus, 2000);
            window.open(url);
            return;
        }
        var bizUrl = $('input[name=mBizUrl]').val();
        var appId = $('input[name=appId]').val();
        var appKey = $('input[name=appKey]').val();
        var bizAccout = $('input[name=bizAccount]').val();
        var bizPassword = $('input[name=bizPassword]').val();
        if (currentType == "3") {
            if (bizUrl == '') {
                $.smallBox({
                    title: "提示",
                    content: "<i class='fa fa-clock-o'></i> <i>素材网址不能空</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 3000
                });
                return;
            }
            if (appId == '' || appKey == '') {
                $.smallBox({
                    title: "提示",
                    content: "<i class='fa fa-clock-o'></i> <i>AppId或AppSecret不能为空</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 3000
                });
                return;
            }
        }
        if (currentType == "2") {
            if (bizAccout == '' || bizPassword == '') {
                $.smallBox({
                    title: "提示",
                    content: "<i class='fa fa-clock-o'></i> <i>账号或密码不能为空</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 3000
                });
                return;
            }
        }

        var postData = {
            BizUrl: $('input[name=mBizUrl]').val(),
            Type: currentType,
            AppId: $('input[name=appId]').val(),
            AppKey: $('input[name=appKey]').val(),
            UserAccount: bizAccout,
            Password: $.md5(bizPassword),
            ValidateCode: $('input[name=validateCode]').val(),
            Cookies: $('input[name=setCookie]').val()
        }
        showLoading();
        var option =
        {
            type: 'POST',
            data: JSON.stringify(postData),
            url: "/UserBiz/AddUserBiz",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            success: function (result) {
                hideLoading();
                if (result.Status) {
                    $(document.body).removeClass('modal-open');
                    checkURL();
                }
                else {
                    if (result.Ret == -99)//输入验证码
                    {
                        $('div.hasVerify').show();
                        $('input[name=setCookie]').val(result.SetCookie);
                        $('img.verifyImg').attr('src', result.ValidateCodeUrl);
                        showErrorInfo('请输入验证码');
                    }
                    else if (result.Ret == -8)//验证码不正确
                    {
                        $('div.hasVerify').show();
                        $('img.verifyImg').click();
                        showErrorInfo('验证码输入不正确')
                    }
                    else if (result.Ret == -21 || result.Ret == -23)//用户名或密码输入不正确
                    {
                        showErrorInfo('用户名或密码输入不正确')
                    }
                    else if (result.Ret == -1 || result.Ret == -3)//APPID或AppKey输入不正确
                    {
                        showErrorInfo(result.Message);
                    }
                    else if (result.Ret == -2) {
                        showErrorInfo('您是未经过微信认证的公众号，不能使用AppId和AppSecret进行绑定');
                    }
                    else if (result.Ret == -5) {
                        showErrorInfo('您的账号开启了微信登陆保护，需要关闭后才能进行素材同步');
                    }
                    else {
                        showErrorInfo(result.Message);
                    }
                }
            },
            error: function (result) {

            }
        };
        $.ajax(option);
    });
</script>