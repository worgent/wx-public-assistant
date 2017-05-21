<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp"%>

<div class="appmsgListFilter">
	<ul class="mpList list-unstyled">
		<li><a class="userBizList selectedMp" data-id="0"><span class="mpListCover all"><i class="fa fa-cloud"></i></span>全部图文列表<em>${wpwxPublicArticleAssociations.size()}</em></a></li>
		<%--<li>--%>
			<%--<a class="userBizList" data-id="73270" data-img="http:wpwxPublicArticleAssociations//7xim13.com1.z0.glb.clouddn.com/BizLogo/MzA4OTkzODczNQ==.jpg-BizLogoCut" data-name="小白全攻略"><img src="http://7xim13.com1.z0.glb.clouddn.com/BizLogo/MzA4OTkzODczNQ==.jpg-BizLogoCut" class="mpListCover">小白全攻略<em>1</em></a>--%>
			<%--<i class="iconVerify"></i>--%>
		<%--</li>--%>
		<%--<li><a class="add" href="/UserBiz/AddUserBizNew" data-toggle="modal" data-target="#remoteModal"><i class="fa fa-plus"></i> 添加我运营的公众号</a></li>--%>
	</ul>
</div>
<div class="mpUserArticleTimer appmsgListTimer">
	<%--<ul class="list-unstyled">--%>
		<%--<li><a class="current" data-issend="-1">全部</a></li>--%>
		<%--<li><a data-issend="1">已同步</a></li>--%>
		<%--<li><a data-issend="0">未同步</a></li>--%>

	<%--</ul>--%>
	<%--<p class="pull-right"><a href="/Knowledge/ShowView/?knowledgeId=17" target="_blank"><i class="fa fa-exclamation-circle"></i> 如何同步图文到微信后台？</a></p>--%>
</div>
<div id="materialListBody">
	<div class="appmsgList">
		<%--<section class="addAppmsgItem materialList">--%>
			<%--<i class="fa addAppmsgItemIcon">+</i>--%>
			<%--<div class="addAppmsgItemBtns">--%>
				<%--<a class="creatMpNews" data-toggle="modal" data-target="#remoteModal" href="/Material/BizToSeleted"><i class="fa fa-plus"></i> 新建文章</a>--%>
				<%--<a class="selectMpNewsFromArticle" data-placement="top" rel="tooltip" data-html="true" data-original-title="点击素材库文章后的&lt;i class='fa fa-shopping-cart txt-color-orange'&gt;&lt;/i&gt; 图标选取文章生成图文"><i class="fa fa-shopping-cart"></i> 素材库选取</a>--%>
			<%--</div>--%>
		<%--</section>--%>
		<div class="masonryContainer masonry" style="position: relative; height: 282px;">
			<c:forEach items="${wpwxMaterialSyncAssociations}" var="wpwxMaterialSyncAssociation">
				<c:set var="wpwxMaterials" value="${wpwxMaterialSyncAssociation.wpwxMaterials}"></c:set>
				<%--<c:if test="wpwxMaterials != null  and wpwxMaterials.size() > 0">--%>
				<section class="materialList masonry-brick" style="position: absolute; top: 0px; left: 0px;">
					<div class="appmsgListInfo">
						<img src="${wpwxMaterialSyncAssociation.wpwxPublic.headImg}" data-bizid="${wpwxMaterialSyncAssociation.id}" class="mpCover bizimg" rel="tooltip" data-placement="top" data-original-title="">
						<fmt:formatDate value="${wpwxMaterialSyncAssociation.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<c:choose>
							<c:when test="${wpwxMaterialSyncAssociation.status == 0}">

								<a href="javascript:none" class="NoSend" data-id="${wpwxMaterialSyncAssociation.id}" rel="tooltip" data-placement="top" data-original-title="点击后将直接同步到微信后台"><span class="sendStatus">未同步</span></a>

							</c:when>
							<c:otherwise>

								<a href="javascript:none" class="sendDone" data-id="${wpwxMaterialSyncAssociation.id}" rel="tooltip" data-placement="top" data-original-title="已同步成功"><span class="sendStatus sendDone">同步成功</span></a>

							</c:otherwise>
						</c:choose>

					</div>
					<div class="appmsgListContent">
						<c:forEach items="${wpwxMaterials}" var="wpwxMaterial">
							<div class="appmsgItemTop">
								<h4 class="appmsgItemTitle"><a target="_blank" href="${wpwxMaterial.link}">${wpwxMaterial.title}</a></h4>
								<div class="appmsgItemThumbWrp"><img class="appmsgItemThumb WechatImage" data-src="${wpwxMaterial.thumbnail}" src="${wpwxMaterial.thumbnail}"></div>
							</div>
						</c:forEach>
					</div>
					<ul class="appmsgListOpr list-unstyled">
						<li>
							<a class="btnEdit" href="#/user/article_edit.do?materialSyncId=${wpwxMaterialSyncAssociation.id}" rel="tooltip" data-placement="top" data-original-title="
						编辑文章及调整文章顺序"><i class="fa fa-pencil"></i></a>
						</li>
						<%--<li>--%>
							<%--<a data-toggle="modal" href="/Material/CopyMaterialToBiz/?userMaterialId=306820" data-target="#remoteModal" rel="tooltip" data-placement="top" data-original-title="--%>
						<%--将该图文复制到其他公众号"><i class="fa fa-clipboard"></i></a>--%>
						<%--</li>--%>
						<li>
							<a data-toggle="modal" href="modal/mass_schedule.do?materialSyncId=${wpwxMaterialSyncAssociation.id}" data-id="${wpwxMaterialSyncAssociation.id}"
							   data-target="#remoteModal" rel="tooltip" data-placement="top" data-original-title="定时群发"><i class="fa fa-calendar"></i></a>
						</li>
						<li>
							<a class="btnDelete" data-id="${wpwxMaterialSyncAssociation.id}"><i class="fa fa-trash-o"></i></a>
						</li>
					</ul>
				</section>
				<%--</c:if>--%>
			</c:forEach>
		</div>
	</div>
	<div class="text-center">


	</div>

	<script type="text/javascript">
		$('ul.pagination a').click(function () {
			showLoading();
			var url = $(this).attr('href');
			$('#materialListBody').load(url, function (result) {
				var $result = $(result);
				//BindArticleListEvent($result);
				init();
				BindLazyImage($result);
				hideLoading();
				//瀑布流布局列表
				$('div.masonryContainer').masonry(
						{
							itemSelector: 'section.materialList',
							animate: true
						});
			});
			return false;
		});

		//更新图标
//		$('.bizimg').each(function () {
//			var $this = $(this);
//			var $biz = $('ul.mpList a[data-id=' + $this.data('bizid') + ']');
//			$this.attr('src', $biz.data('img'));
//			$this.data('original-title', $biz.data('name'));
//		});
//		BindLazyImage($('#materialListBody'));

		$('a.creatMpNews').click(function () {

		});
		$('a.selectMpNewsFromArticle').click(function () {
			window.location.hash = '/MArticleUse/ArticleUseListNew';
		});
		$('a.NoSend').click(function () {
			var self = $(this);
			if (self.children().hasClass("sending") || self.children().hasClass("sendDone"))
			{
				return;
			}
			var userMaterialId = self.attr('data-id');
			self.children().removeClass("sendFailed");
			self.children().addClass("sending");
			self.children().html('<i class="fa fa-refresh fa-spin"></i>同步中,请耐心等候哦');
			self.attr('disabled', 'disabled');
			$.getJSON('ajax/weixin/sync_material.do?materialSyncId='+userMaterialId, function (result) {
				self.children().removeClass('sending');
				if (result.Status) {
					self.removeClass("NoSend");
					self.children().text("同步成功");
					self.children().addClass("sendDone");
					self.attr("data-original-title", "已同步成功");
				}
				else
				{
					self.children().html('<i class="fa fa-warning"></i> 同步失败');
					self.children().addClass("sendFailed");
					self.attr("data-original-title", result.Message);
				}
				self.removeAttr('disabled');
			});
		});
	</script>
</div>
<!-- Dynamic Modal -->
<div class="modal fade" id="remoteModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- content will be filled here from "ajax/modal-content/model-content-1.html" -->
		</div>
	</div>
</div>
<!-- /.modal -->
<script type="text/javascript">
	pageSetUp();
	if ($("[rel=tooltip]").length) {
		$("[rel=tooltip]").tooltip();
	}
	$("#remoteModal").on("hidden", function () {
		$(this).removeData("modal");
	});
	$("#remoteModal").on("hidden.bs.modal", function () {
		$(this).removeData("bs.modal");
	});
	//同步查询切换
	$('.mpUserArticleTimer a').click(function () {
		$('.mpUserArticleTimer a.current').removeClass('current');
		$(this).addClass('current');

		loadMaterialList();
	});

	//公众号切换
	$('ul.mpList a').click(function () {
		$('ul.mpList a.selectedMp').removeClass('selectedMp');
		$(this).addClass('selectedMp');

		loadMaterialList();
	});
	loadScript(__uri("/xigua/js/xiguaji/jquery.masonry.min.js"), function () {

		//瀑布流布局列表
		$('div.masonryContainer').masonry(
				{
					itemSelector: 'section.materialList',
					animate: true,
				});
	});
	//加载公众号列表
	function loadMaterialList() {
		showLoading();
		$('#materialListBody').load(getPath() + '&partial=1', function () {
			init();
			hideLoading();
			if ($("[rel=tooltip]").length) {
				$("[rel=tooltip]").tooltip();
			}
			//瀑布流布局列表
			$('div.masonryContainer').masonry(
					{
						itemSelector: 'section.materialList',
						animate: true
					});
		});
	}
	function getPath() {
		var bizId = $('ul.mpList a.selectedMp').attr('data-id');
		var isSend = $('.mpUserArticleTimer a.current').data('issend');
		return '/Material/List/?bizId=' + bizId + '&isSend=' + isSend;
	}

	function init() {
		$('a.btnDelete').unbind('click');
		$('a.btnDelete').click(function () {
			var self = $(this);
			$.SmartMessageBox({
				title: "提示",
				content: "您确认要该素材吗",
				buttons: '[取消][确认]'
			}, function (ButtonPressed) {
				if (ButtonPressed == "确认") {
					var userMaterialId = self.attr("data-id");
					$.getJSON('ajax/del_sync_material.do?materialSyncId=' + userMaterialId, function (result) {
						if (result.Status) {
							self.parent().parent().parent().remove();
							//瀑布流布局列表
							$('div.masonryContainer').masonry(
									{
										itemSelector: 'section.materialList',
										animate: true
									});
						}
						else {
							$.smallBox({
								title: "删除失败",
								content: "<i class='fa fa-clock-o'></i> <i>删除失败</i>",
								color: "#C46A69",
								iconSmall: "fa fa-times fa-2x fadeInRight animated",
								timeout: 3000
							});
						}
					});
				}
			});
		});
	}
	init();

	//@ sourceURL=article_sync.js

</script>

