<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp"%>

<div class="myMpAccountTips">
	<div class="alert alert-success no-margin fade in">
		<button data-dismiss="alert" class="close" id="btnCloseUserTypeInfo">
			×
		</button>
		<i class="fa-fw fa fa-info-circle"></i>
		添加“我运营的公众号”用于为该公众号匹配专享素材及同步素材文章到该公众号微信公众号后台。
	</div>
</div>
<div class="myMpAccount clearfix">
	<c:forEach items="${wpwxUserPublicAssociations}" var="wpwxUserPublicAssociation">
		<c:set var="wpwxPublic" value="${wpwxUserPublicAssociation.wpwxPublic}"></c:set>
		<section class="col no-padding col-md-3 col-20-percent">
			<div class="myMpAccountItem">
				<%--<div class="myMpAccountBtn">--%>
					<%--<a class="btn btn-default btnUpdateFile" data-id="${wpwxPublic.id}" data-original-title="更新公众号头像及资料" rel="tooltip"><i class="fa fa-refresh"></i></a>--%>

				<%--</div>--%>
				<div class="mpCover"><a href="#/user/public_detail.do?publicId=${wpwxPublic.id}"><img src="${wpwxPublic.headImg}"></a></div>
				<h3 class="mpName">
					<a href="#/user/public_detail.do?publicId=${wpwxPublic.id}">${wpwxPublic.name}</a>
					<i class="iconVerify"></i>
				</h3>
				<p class="mpInfo">[微信号: ${wpwxPublic.alias}]</p>
				<ul class="btns no-margin list-unstyled">
					<li><a class="btn btn-default" href="/user/modal/article_template.do?publicId=${wpwxPublic.id}" data-toggle="modal" data-target="#remoteModal"><i class="fa fa-cog"></i> 素材模板</a></li>
					<%--<li><a class="btn btn-default IsAuth" data-canremind="1" href="/Mass/MassRemind/?bizId=${wpwxPublic.id}" data-toggle="modal" data-target="#remoteModal"><i class="fa fa-bell"></i> 群发提醒</a></li>--%>
					<li><a class="btn btn-default" href="#/user/mass_log.do?publicId=${wpwxPublic.id}"><i class="fa fa-trello"></i> 群发日志</a></li>
					<li><a class="btn btn-danger btnDeleteMyBiz" data-id="${wpwxPublic.id}" data-delete="0"><i class="fa fa-unlink"></i> 解除绑定</a></li>
				</ul>
			</div>
		</section>

	</c:forEach>
	<section class="col no-padding col-md-3 col-20-percent">
		<a class="myMpAccountAdd" href="/user/modal/public_add.do?userId=${wpwxUser.id}" data-toggle="modal" data-target="#remoteModal">
			<i class="fa fa-plus"></i> 添加我运营的公众号
		</a>
	</section>
</div>
<!-- Dynamic Modal -->
<div class="modal fade" id="remoteModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-wide">
		<div class="modal-content">
			<!-- content will be filled here from "ajax/modal-content/model-content-1.html" -->
		</div>
	</div>
</div>
<script type="text/javascript">
	pageSetUp();
	$("#remoteModal").on("hidden", function () {
		$(this).removeData("modal");
	});
	$("#remoteModal").on("hidden.bs.modal", function () {
		$(this).removeData("bs.modal");
	});
	$('a.btnDeleteMyBiz').click(function () {
		var self = $(this);
		var canDelete = $(this).attr("data-delete");
//		if (canDelete == "0") {
//			$.smallBox({
//				title: "提示",
//				content: "<i class='fa fa-clock-o'></i> <i>新添加的公众号需要3天后才能解绑</i>",
//				color: "#C46A69",
//				iconSmall: "fa fa-times fa-2x fadeInRight animated",
//				timeout: 3000
//			});
//			return;
//		}
		$.SmartMessageBox({
			title: "提示",
			content: "您确认要解绑该公众号吗",
			buttons: '[取消][确认]'
		}, function (ButtonPressed) {
			if (ButtonPressed == "确认") {
				showLoading();
				$.getJSON('/user/ajax/del_public.do?publicId=' + self.attr('data-id'), function (result) {
					hideLoading();
					if (result.Status) {
						self.parent().parent().parent().parent().remove();
					}
					else {
						$.smallBox({
							title: "解除绑定失败",
							content: "<i class='fa fa-clock-o'></i> <i>解除绑定失败：" + result.Message + "</i>",
							color: "#C46A69",
							iconSmall: "fa fa-times fa-2x fadeInRight animated",
							timeout: 3000
						});
					}
				});
			}
		});

	});
	$('a.IsAuth').click(function () {
		var canRemind = $(this).attr("data-canRemind");
		if (canRemind != 1) {
			$.smallBox({
				title: "提示",
				content: "<i class='fa fa-clock-o'></i>微信规定，必须是认证的公众号才能允许第三方进行定时群发<i></i>",
				color: "#C46A69",
				iconSmall: "fa fa-times fa-2x fadeInRight animated",
				timeout: 3000
			});
			return false;
		}
	});
	$('a.btnUpdateFile').click(function () {
		var bizId = $(this).attr('data-id');
		showLoading();
		$.getJSON('/UserBiz/UpdateBizInfo/?bizId=' + bizId, function (result) {
			hideLoading();
			if (result.Status) {
				showInfo(result.Message);
				window.location.reload();
			}
			else
			{
				showErrorInfo(result.Message);
			}
		});
	});
	//@ sourceURL=my_public.js
</script>