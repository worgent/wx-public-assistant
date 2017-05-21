<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp"%>

	<div class="mpArticleFilter clearfix">
		<div class="row no-margin mpTagsFilter">
			<label class="filterLabel col no-padding col-md-1"><i class="fa fa-tags"></i> 标签:</label>
			<div class="col no-padding col-md-11 mpTagsSelector">
				<div class="selectAll">
					<label class="checkbox-inline"><input type="checkbox" class="checkbox style-0" id="chkAllTags"><span>全选标签</span></label>
					<%--<a class="searchAll"><i class="fa fa-search"></i> 搜索素材</a>--%>
				</div>
				<div class="mpTagsSelectorWrapper">
					<c:forEach items="${wpwxDicts}" var="category">
						<a data-tagid="${category.value}" class="${category.value == selectCategory ? 'selectedTag' : ''}">
							<i class="fa fa-check-square-o"></i>${category.label}</a>

					</c:forEach>

				</div>
			</div>
		</div>
		<div class="row mpArticleSearchForm hidden">
			<div class="col col-lg-1"></div>
			<div class="col col-lg-4"><input type="text" id="txtArticleKeyword" placeholder="文章关键词" class="form-control" value=""></div>
			<div class="col col-lg-2"><button class="btn btn-primary" id="btnArticleKeyword">搜索</button></div>
		</div>

	</div>
	<div class="mpUserArticleTimer mpArticleListTimer">
		<%--<ul class="list-unstyled artContentSelector" id="ulArticleType">--%>
			<%--<li><a class="current" data-articletype="0" data-original-title="所有类型内容" rel="tooltip"><i class="fa fa-list-ul"></i></a></li>--%>
			<%--<li><a data-articletype="1" data-original-title="纯文字内容" rel="tooltip"><i class="fa fa fa-file-text-o"></i></a></li>--%>
			<%--<li><a data-articletype="2" data-original-title="图片内容" rel="tooltip"><i class="fa fa-picture-o"></i></a></li>--%>
			<%--<li><a data-articletype="3" data-original-title="视频内容" rel="tooltip"><i class="fa fa-video-camera"></i></a></li>--%>
		<%--</ul>--%>
		<%--<ul class="list-unstyled" id="ulPubHours">--%>
			<%--<li><a data-hours="12">最近12小时</a></li>--%>
			<%--<li><a data-hours="24" class="current">最近24小时</a></li>--%>
			<%--<li><a data-hours="72">最近3天</a></li>--%>
			<%--<li><a data-hours="168">最近7天</a></li>--%>
			<%--<li><a data-hours="360">最近15天</a></li>--%>
			<%--<li><a data-hours="720">最近30天</a></li>--%>
		<%--</ul>--%>
	</div>
	<div class="alert alert-success fade in" style="margin:10px 6px; font-size:14px;">
		<i class="fa-fw fa fa-info-circle"></i>
		素材内容由机器自动筛选，不代表微普公众号助手认同或支持相关内容或观点，请遵守<a href="https://mp.weixin.qq.com/cgi-bin/readtemplate?t=business/faq_operation_tmpl&amp;type=info&amp;lang=zh_CN" target="_blank">微信公众平台运营规则</a>及相关法律法规选择合适的素材内容。
	</div>
	<div class="mpArticleList">
		<table class="table table-hover">
			<colgroup>
				<col width="95">
				<col>
				<col width="80">
				<col width="90">
				<col width="100">

				<col width="160">
			</colgroup>
			<thead>
			<tr>
				<th>传播指数
					<%--<a href="http://www.xiguaji.com/Knowledge/ShowView/?knowledgeId=11" target="_blank" rel="tooltip" data-placement="top" data-original-title="传播指数是系统通过公众号粉丝数、文章阅读数、点赞数、转发数等分析得出的综合评分。点击查看更详细描述" style="margin-top:8px;"><i class="fa fa-exclamation-circle"></i></a>--%>
				</th>
				<th>文章标题</th>
				<th class="text-align-center">类型</th>
				<th>封面</th>
				<th>来源</th>

				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${wpwxArticleAssociations}" var="article">
				<tr>
					<td>
						<span class="artRank rank2"><i class="fa fa-trophy"></i>84.73</span>
					</td>
					<td>
						<a href="${article.link}" target="_blank" class="">${article.title}</a>
					</td>
					<td class="text-align-center">
                <span class="artContentSort">
                    <i class="fa fa-picture-o"><em></em></i>
                </span>
					</td>
					<td><a href="${article.link}" target="_blank" class="myArticleCover articleCover60"><img class="WechatImage" data-src="${article.thumbnail}" src="${article.thumbnail}"></a></td>
					<c:set var="weixinPublicUrl" value="#/user/public_detail.do?publicId=${article.weixinPublicId}"></c:set>
					<td><a href="${article.wpwxPublic == null  ? 'javascript:void(0)': weixinPublicUrl }">
					${article.wpwxPublic == null ? '匿名' : article.wpwxPublic.name}</a>
						<span class="artPostTime">${article.publishTime}</span></td>

					<c:choose>
						<c:when test="${article.wpwxUserArticle == null}">
							<td>
								<a class="btn btn-primary btnIcon articlecollect" href="javascript:void(0);" data-articleid="${article.id}" data-collected="0" rel="tooltip" data-placement="top" data-original-title="加入素材库"><i class="fa fa-star"></i> 加入素材库</a>
									<%--<a class="btn btn-default btnIcon articleblack" href="javascript:void(0);" data-articleid="${article.id}" rel="tooltip" data-placement="top" data-original-title="不再出现"><i class="fa fa-thumbs-o-down"></i> 不再出现</a>--%>
									<%--<a class="btn btn-info btnIcon" href="/Analyse/ArticleDetail/?articleId=${article.id}" data-toggle="modal" data-target="#remoteModal" rel="tooltip" data-placement="top" data-original-title="指数分析"><i class="fa fa-align-left"></i> 指数分析</a>--%>
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<a class="btn btn-primary btnIcon articlecollect btnArtFavorited" href="javascript:void(0);" data-articleid="${article.id}" data-collected="1" rel="tooltip" data-placement="top" data-original-title="加入素材库"><i class="fa fa-star"></i> 已在素材库</a>


							</td>
						</c:otherwise>
					</c:choose>



				</tr>
			</c:forEach>


			</tbody>
		</table>
		<div class="loadingMorePanel"><a id="btnLoadMore" class="btn btn-default">加载更多...</a></div>
	</div>
	<div class="mpUserArticleNone" id="waitingInit" style="display:none">
		<span>正在根据您的偏好初始化今日全网素材...</span>
		<div class="progress progress-xs progress-striped active">
			<div style="width:100%" role="progressbar" class="progress-bar"></div>
		</div>
	</div>
	<div id="divNoResult" class="noResultAlert" style="display:none">
		<div class="alert alert-warning fade in">
			<strong>没有找到相应的内容</strong>
		</div>
	</div>
	<!-- Dynamic Modal -->
	<div class="modal fade" id="remoteModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-wide">
			<div class="modal-content">
				<!-- content will be filled here from "ajax/modal-content/model-content-1.html" -->
			</div>
		</div>
	</div>
	<!-- /.modal -->
	<script type="text/template" id="tempAd">
</script>
	<script type="text/javascript">
		pageSetUp();
		var p = 1;
		loadScript(__uri("/xigua/js/xiguaji/xiguauc.js"), function () {


			BindArticleListEvent($('div.mpArticleList tbody'));
			BindMore();
			BindOnceInfo();
			$('#btnArticleKeyword').click(ReloadArticle);
			$('#txtArticleKeyword').keyup(function (e) {
				if (e.keyCode == 13) {
					ReloadArticle();
				}
			});
			$('#ulPubHours a').click(function () {
				$('#ulPubHours a').removeClass('current');
				$(this).addClass('current');
				ReloadArticle();
			});
			$('#ulArticleType a').click(function () {
				$('#ulArticleType a').removeClass('current');
				$(this).addClass('current');
				ReloadArticle();
			});
			$('div.mpTagsSelectorWrapper a').click(function () {
				if (!$(this).hasClass('disabled')) {
					$(this).toggleClass('selectedTag');
					ReloadArticle();
				}
				else {
					$.SmartMessageBox({
						title: "权限受限",
						content: "基础版本只可查看您注册账号时所选标签下的相关文章，高级版本可查看所有标签下的文章。",
						buttons: '[确定]'
					});
				}
			});
			$('#chkAllTags').click(function () {
				$('div.mpTagsSelectorWrapper a').each(function () {
					if (!$(this).hasClass('disabled')) {
						if ($('#chkAllTags').prop('checked')) {
							$(this).addClass('selectedTag');
						}
						else {
							$(this).removeClass('selectedTag');
						}
					}
				});
				ReloadArticle();
			});
		});
		function ReloadArticle() {
			p = 1;
			if ($('div.mpTagsSelectorWrapper a.selectedTag').length == 0) {
				$('div.mpArticleList').hide();
				$('#divNoResult strong').html('请选择标签来查找相应的内容');
				$('#divNoResult').show();
				return;
			}
			showLoading();
			$.get(getPath(), function (result) {
				if (result.replace(/(^\s*)|(\s*$)/g, "").length > 0) {
					result = $('#tempAd').html() + result;
					var $result = $(result);
					BindArticleListEvent($result);
					$('div.mpArticleList').show();
					$('#divNoResult').hide();
					$('#btnLoadMore').html('加载更多...');
				}
				else {
					$('div.mpArticleList').hide();
					$('#divNoResult strong').html('没有找到相应的内容');
					$('#divNoResult').show();
				}
				$('div.mpArticleList tbody').html($result);
				hideLoading();
			});
		}
		function BindMore() {
			//设置翻页
			var lock = false;
			$('#btnLoadMore').html('加载更多...');
			$('#btnLoadMore').click(function () {
				if (p == -1)
					return true;
				if (lock)
					return false;
				lock = true;
				p++;
				var $this = $(this);
				$this.html('正在努力加载中...');
				$.get(getPath() + '&page=' + p, function (result) {
					if (result.replace(/(^\s*)|(\s*$)/g, "").length == 0) {
						p = -1;
						$this.html('没有更多啦~');
						//$('div.mpArticleList').hide();
						//$('#divNoResult strong').html('没有找到相应的内容');
						//$('#divNoResult').show();
					}
					else {
						var $result = $(result);
						BindArticleListEvent($result);
						$('div.mpArticleList tbody').append($result);
						$this.html('加载更多...');
						$('div.mpArticleList').show();
						$('#divNoResult').hide();
					}
					lock = false;
				});
			});
		}

		function getPath() {
			var pubHours = $('#ulPubHours a.current').attr('data-hours');
			var articleType = $('#ulArticleType a.current').attr('data-articleType');
			var tagIds = '';
			var keyword = $('#txtArticleKeyword').val();
			$('div.mpTagsSelectorWrapper a.selectedTag').each(function () {
				if (tagIds.length > 0)
					tagIds += ','
				tagIds += $(this).attr('data-tagId');
			});
			var url = '/user/ajax/more_material_global.do?'
					+ 'categoryId='+tagIds;
			if (keyword != '')
			{
				url += '&keyword=' + encodeURIComponent(keyword);
			}
			return url;
		}

		//设置列表事件
		function BindArticleListEvent($html) {
			BindLazyImage($html);
			$html.find("[rel=tooltip]").tooltip();
			$html.find('a.articlecollect').xiguauc_collection();
			$html.find("a[rel=tooltip]").tooltip();
			$html.find('a.articleblack').click(function () {
				var articleId = $(this).attr('data-articleid');
				var $this = $(this);
				$.getJSON('/MArticleCollect/SetBlack/?articleId=' + articleId, function (result) {
					if (result.Status) {
						$.smallBox({
							title: "不再出现",
							content: "<i class='fa fa-clock-o'></i> <i>成功将该文章设置为不再出现！并为您过滤" + result.FilterCount + "篇跟本文相似的文章。</i>",
							color: "#659265",
							iconSmall: "fa fa-check fa-2x fadeInRight animated",
							timeout: 3000
						});
						$this.parent().parent().hide(500);
					}
					else {
						$.smallBox({
							title: "不再出现",
							content: "<i class='fa fa-clock-o'></i> <i>设置不再出现失败</i>",
							color: "#C46A69",
							iconSmall: "fa fa-times fa-2x fadeInRight animated",
							timeout: 3000
						});
					}
				});
			});
			$html.find('a.articlebaseblack').click(function () {
				var articleId = $(this).attr('data-articleid');
				var $this = $(this);
				$.getJSON('/MArticleCollect/SetBaseBlack/?articleId=' + articleId, function (result) {
					if (result.Status) {
						$.smallBox({
							title: "不再出现",
							content: "<i class='fa fa-clock-o'></i> <i>成功将该文章设置为不再出现的文章！并为您过滤" + result.FilterCount + "篇跟本文相似的文章。</i>",
							color: "#659265",
							iconSmall: "fa fa-check fa-2x fadeInRight animated",
							timeout: 3000
						});
						$this.parent().parent().css('display', 'none');
					}
					else {
						$.smallBox({
							title: "不再出现",
							content: "<i class='fa fa-clock-o'></i> <i>设置不再出现失败</i>",
							color: "#C46A69",
							iconSmall: "fa fa-times fa-2x fadeInRight animated",
							timeout: 3000
						});
					}
				});
			});
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
		$('a.searchAll').click(function () {
			$('div.mpArticleSearchForm').toggleClass("hidden");
		});

//		ReloadArticle();
	</script>