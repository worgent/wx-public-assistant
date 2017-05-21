<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp" %>




<div class="modal-header">
		<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
		<h4 class="modal-title">导入微信文章</h4>
	</div>
	<div class="modal-body no-padding">
		<form class="smart-form">
			<fieldset>
				<section>
					<div class="row">
						<label class="label col col-2">微信文章网址:</label>
						<div class="col col-10 addMyAccountType">
							<label class="input">
								<i class="icon-append fa fa-link"></i>
								<input class="normalInput" name="mBizUrl" placeholder="请输入微信文章网址" type="text" value="">
							</label>

						</div>
					</div>
				</section>

				<section>
					<div class="row">
						<label class="label col col-2"></label>
						<div class="col col-10 addMyAccountType">
							<p>请输入以http://mp.weixin.qq.com打头的微信文章网址。<br><a href="/Knowledge/ShowView/?knowledgeId=41" target="_blank"><i class="fa fa-exclamation-circle"></i> 如何将外部的微信文章导入到“我的素材库”</a></p>
						</div>
					</div>
				</section>
			</fieldset>
		</form>

		<div class="sendArticleResult" style="display:none" id="sendArticleLoading">
			<div class="sending">
				<h1><i class="fa fa-rotate-right fa-spin"></i></h1>
				<h2>导入中，请稍后</h2>
			</div>
		</div>
		<div class="sendArticleResult" style="display:none" id="sendArticleFail">
			<div class="sendFailed">
				<h1><i class="fa fa-times"></i></h1>
				<h2>很抱歉，导入失败啦</h2>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary" id="btnLoadMPUrl" type="button">
			确定
		</button>
	</div>

	<script type="text/javascript">
		//通过URL加载内容
		$('#btnLoadMPUrl').click(function () {
			var mpUrl = $('input[name=mBizUrl]').val();
			var tagId = $('#selectUserTag').val();
			if (mpUrl == "" || mpUrl.indexOf("mp.weixin.qq.com") == -1) {
				$.smallBox({
					title: "提示",
					content: "<i class='fa fa-clock-o'></i> <i>文章地址不能为空，并且要是http://mp.weixin.qq.com打头的素材网址</i>",
					color: "#C46A69",
					iconSmall: "fa fa-times fa-2x fadeInRight animated",
					timeout: 3000
				});
				return;
			}
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
			$('#sendArticleLoading').show();
			$('#sendArticleFail').hide();
			$.getJSON('/user/ajax/material_import_new.do?mpUrl=' + encodeURIComponent(mpUrl), function (result) {
				if (result.Status) {
//					window.location.reload();
					$('#previewItem section:last').after(
							PreViewItem(result.wpwxArticle.title, result.wpwxArticle.thumbnail, materialData.length));
					pageLoad();
					materialData.push({
						MaterialDetailId: 0,
						UserMaterialId: 0,
						ArticleId: result.wpwxArticle.id,
						Title: result.wpwxArticle.title,
						Content: result.wpwxArticleContent.content,
						ImageUrl: result.wpwxArticle.thumbnail,
						Author: result.wpwxArticle.author,
						IsContainImage: 0.
					})
					$('a.previewItemEdit', $('#previewItem section:last')).click();
					$('#sendArticleLoading').hide();
//					$(this).hide();
//					window.close();
					$('#remoteModal').modal('hide');
					$('body').removeClass('modal-open');
				}
				else {
					$('#sendArticleLoading').hide();
					$('#sendArticleFail').show();
				}
			});
		});
		//@ sourceURL=my_material_new.js
	</script>