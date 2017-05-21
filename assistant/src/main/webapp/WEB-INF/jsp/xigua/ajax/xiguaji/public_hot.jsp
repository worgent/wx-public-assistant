<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp"%>

<div class="popularTimer clearfix">
	<%--<ul class="timerSelector list-unstyled">--%>
		<%--<li class="disabled"><a class="timerBtns timerBtnsPre"><i class="fa fa-long-arrow-left"></i></a></li>--%>
		<%--<li class="timerSelectorList dropdown">--%>
			<%--&lt;%&ndash;<a>12月15日公众号榜单 <b class="caret"></b></a>&ndash;%&gt;--%>
			<%--<ul class="dropdown-menu">--%>
				<%--<li data-index="0" data-datecode="20151215"><a href="javascript:void(0);">12月15日公众号榜单</a></li>--%>
				<%--<li data-index="1" data-datecode="20151214"><a href="javascript:void(0);">12月14日公众号榜单</a></li>--%>
				<%--<li data-index="2" data-datecode="20151213"><a href="javascript:void(0);">12月13日公众号榜单</a></li>--%>
				<%--<li data-index="3" data-datecode="20151212"><a href="javascript:void(0);">12月12日公众号榜单</a></li>--%>
				<%--<li data-index="4" data-datecode="20151211"><a href="javascript:void(0);">12月11日公众号榜单</a></li>--%>
				<%--<li data-index="5" data-datecode="20151210"><a href="javascript:void(0);">12月10日公众号榜单</a></li>--%>
				<%--<li data-index="6" data-datecode="20151209"><a href="javascript:void(0);">12月09日公众号榜单</a></li>--%>
				<%--<li data-index="7" data-datecode="20151208"><a href="javascript:void(0);">12月08日公众号榜单</a></li>--%>
				<%--<li data-index="8" data-datecode="20151207"><a href="javascript:void(0);">12月07日公众号榜单</a></li>--%>
				<%--<li data-index="9" data-datecode="20151206"><a href="javascript:void(0);">12月06日公众号榜单</a></li>--%>
			<%--</ul>--%>
		<%--</li>--%>
		<%--<li><a class="timerBtns timerBtnsNext"><i class="fa fa-long-arrow-right"></i></a></li>--%>
	<%--</ul>--%>
	<div class="timerLatest">公众号榜单根据每个公众号当天发文的阅读转发情况进行排名，如此才能更加真实反应公众号的每天发文质量</div>
</div>
	<div class="popularTab">
		<ul class="list-unstyled">
			<c:forEach items="${wpwxDicts}" var="category">
				<li data-tagid="${category.id}" class="${category.id == selectCategory ? 'current' : ''}"><a>${category.label}</a></li>

			</c:forEach>
			<li data-tagid="33"><a>女人时尚</a></li>

		</ul>
	</div>
	<div class="popularArticleList">
		<table class="table table-hover">
			<colgroup>
				<col width="80">
				<col>
				<col width="100">
				<col width="120">
				<col width="100">
				<col width="100">
				<col width="80">
				<col width="120">
			</colgroup>
			<thead>
			<tr>
				<th class="text-align-center">排名</th>
				<th>公众号</th>
				<th>预估粉丝 <a rel="tooltip" data-placement="top" data-original-title="根据公众号历史7天的阅读点赞数据进行活跃粉丝的预估" style="margin-top:8px;"><i class="fa fa-exclamation-circle"></i></a></th>
				<th>首小时阅读 <a rel="tooltip" data-placement="top" data-original-title="根据公众号发文后第一个小时收获到的阅读数进行排名，可以更加有效的反应出公众号的当天文章真实表现" style="margin-top:8px;"><i class="fa fa-exclamation-circle"></i></a></th>
				<th>24小时阅读</th>
				<th>24小时点赞</th>
				<th>文章数</th>
				<th>备注</th>
			</tr>
			</thead>
			<tbody id="tbRankList">
			<c:forEach items="${wpwxPublics}" var="wpwxPublic" varStatus="status">
				<tr>
					<td class="text-align-center"><span class="popularRankIco popularRank1">${status.index+1}</span></td>
					<td>
						<div class="rankMpCover"><img src="${wpwxPublic.headImg}"></div>
						<div class="rankMpName"><a href="#/user/public_detail.do?publicId=${wpwxPublic.id}">${wpwxPublic.name}</a><em>${wpwxPublic.alias}</em></div>
					</td>
					<td>
							${wpwxPublic.estimateFans}        </td>
					<td>42895</td>
					<td>100000+</td>
					<td>2296</td>
					<td>8</td>
					<td></td>

					<%--<td class="bizFollowButton" data-bizid="${wpwxPublic.id}">--%>
						<%--<a class="btn btn-default disabled">已关注</a>--%>
					<%--</td>--%>
				</tr>
			</c:forEach>

			<tr>
				<td class="text-align-center"><span class="popularRankIco popularRank2">2</span></td>
				<td>
					<div class="rankMpCover"><img src="http://7xim13.com1.z0.glb.clouddn.com/BizLogo/MjM5MDMyMzg2MA==.jpg-BizLogoCut"></div>
					<div class="rankMpName"><a href="#/MBiz/Detail/fe84bd/173">十点读书</a><em>duhaoshu</em></div>
				</td>
				<td>
					299万        </td>
				<td>42124</td>
				<td>100000+</td>
				<td>776</td>
				<td>8</td>
				<td class="bizFollowButton" data-bizid="173">
					<a class="btn btn-default" href="/MyMBiz/StoreBiz/?bizId=173" data-toggle="modal" data-target="#remoteModal"><i class="fa fa-plus"></i> 关注</a>
				</td>
			</tr>

			</tbody>
		</table>

	</div>
	<div class="modal fade" id="remoteModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- content will be filled here from "ajax/modal-content/model-content-1.html" -->
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var page = 1;
		var tagId = '35';
		var dateCode = '20151215';
		var dataCodeIndex = 0;
		var lock = false;
		$(function () {
			//$('#btnLoadMore').click(function () {
			//    if (lock) return;
			//    lock = true;
			//    page++;
			//    $.get('/Mbiz/Rank/?partial=1&tagId=' + tagId + '&DateCode=' + dateCode + '&page=' + page, function (result) {
			//        $('#tbRankList').append(result);
			//        lock = false;
			//    });
			//});
			$("div.popularArticleList a[rel=tooltip]").tooltip();
			$('div.popularTab li[data-tagId]').click(function () {
				$('div.popularTab li[data-tagId]').removeClass('current');
				$(this).addClass('current');
				tagId = $(this).attr('data-tagId');
				reloadRank();
			});
			$('li.timerSelectorList>a').click(function () {
				$('li.timerSelectorList').addClass('open');
			});
			$('li.timerSelectorList li').click(function () {
				dateCode = $(this).attr('data-dateCode');
				dataCodeIndex = $(this).attr('data-index')*1;
				$('li.timerSelectorList').removeClass('open');
				$('li.timerSelectorList>a').html($(this).find('a').html() + ' <b class="caret"></b>');
				reloadRank();
			});
			$('a.timerBtnsPre').click(function () {
				$('li.timerSelectorList li[data-index=' + (dataCodeIndex + 1) + ']').click();
			});
			$('a.timerBtnsNext').click(function () {
				$('li.timerSelectorList li[data-index=' + (dataCodeIndex - 1) + ']').click();
			});
		});
		function reloadRank() {
			page = 1;
			showLoading();
			$('#tbRankList').load('/Mbiz/Rank/?partial=1&tagId=' + tagId + '&DateCode=' + dateCode + '&page=' + page, function () {
				hideLoading();
			});
		}
		function followBizSuccessed(bizId) {
			$('td.bizFollowButton[data-bizId=' + bizId + ']').html('<a class="btn btn-default disabled">已关注</a>');
		}
		$("#remoteModal").on("hidden", function () {
			$(this).removeData("modal");
			$("#remoteModal div.modal-content").html('');
		});
		$("#remoteModal").on("hidden.bs.modal", function () {
			$(this).removeData("bs.modal");
			$("#remoteModal div.modal-content").html('');
		});
	</script>