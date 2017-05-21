<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp"%>

<div class="appmsgListFilter">
	<ul class="mpList list-unstyled">
		<%--<li><a data-id="0"><span class="mpListCover all"><i class="fa fa-cloud"></i></span>全部群发日志</a></li>--%>
		<li>
			<a class="userBizList selectedMp"
			   data-id="${wpwxPublic.id}"
			   data-img="${wpwxPublic.headImg}" data-name="经济晨读">
				<img src="${wpwxPublic.headImg}" class="mpListCover">
				${wpwxPublic.name}
			</a>
			<i class="iconVerify"></i>
		</li>
	</ul>
</div>
	<div class="sendRecords" id="massLogList">

		<table width="100%" cellpadding="0" cellspacing="0" class="table">
			<colgroup>
				<col>
				<col width="150">
				<col width="150">
				<col width="150">
			</colgroup>
			<thead>
			<tr>
				<th>内容</th>
				<th>群发时间</th>
				<th>公众号</th>
				<th>状态</th>
			</tr>
			</thead>
			<tbody id="massListBody">
			<c:forEach items="${wpwxMaterialSyncAssociations}" var="wpwxMaterialSyncAssociation">
				<tr>
					<td>
						<dl class="sendRecordContent">
							<dt><img class="WechatImage" data-src="${wpwxMaterialSyncAssociation.wpwxMaterials.get(0).thumbnail}"
									 src="${wpwxMaterialSyncAssociation.wpwxMaterials.get(0).thumbnail}"></dt>
							<dd>
								<c:forEach items="${wpwxMaterialSyncAssociation.wpwxMaterials}" var="wpwxMaterial">
									<div class="sendRecordContentItem"><a href="/Material/MaterialDetailView/?materialDetailId=2203634" target="_blank">
										${wpwxMaterial.title}</a></div>

								</c:forEach>
							</dd>
						</dl>
					</td>
					<td><i class="fa fa-clock-o"></i> ${wpwxMaterialSyncAssociation.scheduleTime}
						<%--<div class="sendDate">2016年01月03日</div>--%>
					</td>
					<td class="bizName" data-id="${wpwxMaterialSyncAssociation.wpwxPublic.id}">
					${wpwxMaterialSyncAssociation.wpwxPublic.name}</td>
					<c:choose>
						<c:when test="${wpwxMaterialSyncAssociation.sendTime != null}">
							<td>
								<span class="sendStatus successed ">
                            		<i class="fa fa-calendar-o"> 群发完毕</i>
                        		</span>
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<span class="sendStatus waiting ">
                            		<i class="fa fa-calendar-o"> 等待群发</i>
                        		</span>
								<a class="btn btn-default"
								   href="modal/mass_schedule.do?materialSyncId=${wpwxMaterialSyncAssociation.id}"
								   data-id="${wpwxMaterialSyncAssociation.id}" data-toggle="modal" data-target="#remoteModal"><i class="fa fa-cog"></i> 重新设置</a>
							</td>
						</c:otherwise>
					</c:choose>

				</tr>

			</c:forEach>
			</tbody>
		</table>
		<div class="text-center">


		</div>
		<script type="text/javascript">
			//更新名称
			$('td.bizName').each(function () {
				var $this = $(this);
				var $biz = $('ul.mpList a[data-id=' + $this.attr('data-id') + ']');
				$this.html($biz.text());
			});
			BindLazyImage($('#massListBody'));

			$('ul.pagination a').click(function () {
				showLoading();
				var url = $(this).attr('href');
				$('#massLogList').load(url, function (result) {
					var $result = $(result);
					hideLoading();
					//BindArticleListEvent($result);
					BindLazyImage($result);

				});
				return false;
			});
		</script>
	</div>
	<!-- Dynamic Modal -->
	<div class="modal fade" id="remoteModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

			</div>
		</div>
	</div>
	<script type="text/javascript">

		//公众号切换
		$('ul.mpList a').click(function () {
			$('ul.mpList a.selectedMp').removeClass('selectedMp');
			$(this).addClass('selectedMp');
			loadMassLogList();
		});
		function loadMassLogList() {
			showLoading();
			$('#massLogList').load(getPath(), function () {
				hideLoading();
				BindLazyImage($('#massLogList'));
			});
		}
		function getPath() {
			var bizId = $('ul.mpList a.selectedMp').attr('data-id');
			return '/Mass/MassLogList/?partial=1&bizId=' + bizId;
		}
		$("#remoteModal").on("hidden", function () {
			$(this).removeData("modal");
		});
		$("#remoteModal").on("hidden.bs.modal", function () {
			$(this).removeData("bs.modal");
		});
	</script>

