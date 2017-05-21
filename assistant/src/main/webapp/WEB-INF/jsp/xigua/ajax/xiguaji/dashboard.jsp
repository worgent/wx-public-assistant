<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/xigua/common/taglib.jsp"%>

<div class="row dashboardInfo">
	<section class="col col-md-3">
		<dl>
			<dd class="dashboardInfoIcon"><i class="glyphicon glyphicon-user"></i></dd>
			<dt class="userInfo">
                        <span>${wpwxUser.phone}
							<%--[试用版] <a rel="tooltip" data-placement="top" data-original-title="查看各版本功能区别"--%>
												   <%--href="http://www.xiguaji.com/About/Pricing" target="_blank"><i--%>
								<%--class="fa fa-exclamation-circle"></i></a>--%>
						</span>
                        <%--<span id="memberEndTimeFor">到期时间: ${wpwxUser.expiredTime} <a--%>
								<%--href="http://www.xiguaji.com/Member#/Home/MemberInfo">[用户中心]</a></span>--%>
			</dt>
		</dl>
	</section>
	<section class="col col-md-3">
		<dl>
			<dd class="dashboardInfoIcon"><i class="glyphicon glyphicon-bookmark"></i></dd>
			<dt><a href="#/user/my_material.do">${myMaterialCount}</a>
				<span>素材库文章
					<%--<a--%>
					<%--rel="tooltip" data-placement="top" data-original-title="点击查看如何挑选热门素材"--%>
					<%--href="http://www.xiguaji.com/Knowledge/ShowView/?knowledgeId=7" target="_blank"><i--%>
					<%--class="fa fa-exclamation-circle"></i></a>--%>
				</span></dt>
			<dd></dd>
		</dl>
	</section>
	<section class="col col-md-3">
		<dl>
			<dd class="dashboardInfoIcon"><i class="glyphicon glyphicon-book"></i></dd>
			<dt><a href="">${articleUpdateCount}</a><span>最新收录文章</span>
			</dt>
			<dd></dd>
		</dl>
	</section>
	<section class="col col-md-3">
		<dl>
			<dd class="dashboardInfoIcon"><i class="glyphicon glyphicon-cloud"></i></dd>
			<dt>
				<a href="">${wpwxPublicsUpdateCount}</a>
				<span>最新收录公众号</span>
			</dt>
			<dd></dd>
		</dl>
	</section>
</div>
<%--<div class="dashboardBanner onceinfo" id="valuedBanner10" data-localstorage="CloseValuedBanner10"--%>
	 <%--style="display:none;">--%>
	<%--<a class="dashboardBannerClose onceinfo-close" id="btnCloseValuedBanner10"><i class="fa fa-times"></i></a>--%>
	<%--<ul class="list-unstyled">--%>
		<%--<li class="purchaseBanner" style=" background:#FC3343;"><a href="http://www.xiguaji.com/Activity/1212"--%>
																   <%--target="_blank"><img--%>
				<%--src="./工作台_files/banner_1212.jpg"></a></li>--%>
	<%--</ul>--%>
<%--</div>--%>
<div class="row">
	<div class="col col-md-6 col-dashboard-6">
		<div class="dashboardColTitle"><i class="fa fa-rocket"></i> 快速引导
			<%--<a class="colMore" target="_blank"--%>
																		   <%--href="http://www.xiguaji.com/Knowledge/">帮助中心--%>
			<%--<i class="fa fa-angle-double-right"></i></a>--%>
		</div>
		<div class="dashboardGuide">
			<div class="guideline">使用微普公众号助手能够节省50%以上的素材查找编辑时间，95%的用户使用一个月后，平均阅读提升160%，增粉速度增加20%，流量主收入增加60%。
			</div>
			<div class="entry">
				<section class="step1">
					<i class="icon">1</i>

					<h3><i class="fa fa-file-text-o"></i> 素材收集</h3>
					<ul class="btns list-unstyled">
						<li><a href="/user/material_global.do">全网素材</a></li>
						<%--<li><a href="http://www.xiguaji.com/Member#/MArticleCollect/MyArticleExplore">我关注的</a>--%>
						<%--</li>--%>
						<%--<li><a href="http://www.xiguaji.com/Member#/MArticleCollect/PopularArticle">黑马爆文</a>--%>
						<%--</li>--%>
						<%--<li><a href="http://www.xiguaji.com/Member#/UserBiz/List">专享素材</a></li>--%>
					</ul>
				</section>
				<section class="step2">
					<i class="icon">2</i>

					<h3><i class="fa fa-clock-o"></i> 图文同步</h3>
					<ul class="btns list-unstyled">
						<li>
							<a target="_blank" href="">自动签名</a>
						</li>
						<li><a rel="tooltip" data-placement="top" data-original-title="同一图文列表可生成复制给多个的公众号，高效快捷"
							   target="_blank">多号复制</a></li>
						<li><a target="_blank" href="">一键同步<span
								class="verify" rel="tooltip" data-placement="top"
								data-original-title="微信官方授权许可">官</span></a></li>
						<li>
							<a target="_blank" href="">定时群发<span
								class="verify" rel="tooltip" data-placement="top"
								data-original-title="微信官方授权许可，暂时只支持已认证公众号">官</span></a></li>
					</ul>
				</section>
				<%--<section class="step3">--%>
					<%--<i class="icon">3</i>--%>

					<%--<h3><i class="fa fa-align-left"></i> 数据分析</h3>--%>
					<%--<ul class="btns list-unstyled">--%>
						<%--<li><a href="http://www.xiguaji.com/Member#/MBiz/Detail/19acb8/334" rel="tooltip"--%>
							   <%--data-placement="top"--%>
							   <%--data-original-title="通过微普公众号助手，可以直观的查看每天的发文情况及相关数据，及时了解传播效果">数据汇总</a></li>--%>
						<%--<li><a href="http://www.xiguaji.com/Analyse/ArticleDetail/?articleId=22210012"--%>
							   <%--data-toggle="modal" data-target="#remoteModal" rel="tooltip" data-placement="top"--%>
							   <%--data-original-title="可以对比相同文章在其它公众号的传播情况，了解粉丝喜好及竞争对手动向">横向对比</a></li>--%>
					<%--</ul>--%>
				<%--</section>--%>
			</div>
		</div>
	</div>
	<div class="col col-md-6 col-dashboard-6">
		<h3 class="dashboardColTitle"><i class="fa fa-trophy"></i> 更新及公告</h3>

		<div class="dashboardHistory">
			<section class="historyReview">
				<p class="historyReviewTime"><i class="fa fa-circle"></i>3月3日</p>

				<div class="historyReviewConent">
					<div class="historyReviewEntry">
						<i class="fa fa-square"></i>
						修正webp文章无法正常导入问题；
						修正webp文章图片无法正常显示问题；
						立即群发增加loading；
					</div>
				</div>
			</section>
			<section class="historyReview">
				<p class="historyReviewTime"><i class="fa fa-circle"></i>3月2日</p>

				<div class="historyReviewConent">
					<div class="historyReviewEntry">
						<i class="fa fa-square"></i>
						素材编辑页面增加快速到达底部和快速返回顶部按钮（lixue）；
						修正爬虫程序处理emoji问题，以及缩略图处理问题（tianbc）；
						修正导入文章部分图片不显示问题（lixue）。
						如果发现其他问题请与418251346 联系。
					</div>
				</div>
			</section>
			<section class="historyReview">
				<p class="historyReviewTime"><i class="fa fa-circle"></i>2月26日</p>

				<div class="historyReviewConent">
					<div class="historyReviewEntry">
						<i class="fa fa-square"></i>
						图文编辑增加新建素材，并支持通过微信文章链接导入（zhangyb）；
						公众号绑定体验优化（zhangyb）；
						外部链接优化（sunyinglong）。
						如果发现其他问题请与418251346 联系。
					</div>
				</div>
			</section>
			<section class="historyReview">
				<p class="historyReviewTime"><i class="fa fa-circle"></i>2月24日</p>

				<div class="historyReviewConent">
					<div class="historyReviewEntry">
						<i class="fa fa-square"></i>
						修改模板图片bug；静态资源添加md5后缀；图文可多次同步（lixue）；增加用户操作log；
					</div>
				</div>
			</section>
			<section class="historyReview">
				<p class="historyReviewTime"><i class="fa fa-circle"></i>1月15日</p>

				<div class="historyReviewConent">
					<div class="historyReviewEntry">
						<i class="fa fa-square"></i>
						<a class="historyReviewTitle">
							<i class="fa fa-lg fa-angle-down pull-right"></i>
							内测版上线，只有邀请才可注册。
						</a>

						<div class="historyReviewDetail" style="display:none">
							微普公众号助手早期只在小范围朋友圈中流转，切实有效的解决了公众号运营过程中存在的素材难找，推文质量良莠不齐等问题。为运营者节省了大量的时间精力，显著提高了粉丝的粘度和流量主收入。
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<!-- Dynamic Modal -->
<div class="modal fade in dynamicModel" style="display:none;" id="remoteModal" tabindex="-1" role="dialog"
	 aria-labelledby="remoteModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">激活账号</h4>
			</div>
			<div class="modal-body no-padding">
				<div class="row no-margin activeBox">
					<div class="col col-md-3">
						<img src="./工作台_files/qrcode(1).png" class="activeBoxQrcode">
					</div>
					<div class="col col-md-9">
						<section>请扫描左侧二维码关注公众号微普君，即可免费获得激活码，激活码仅限自己使用。</section>
						<section>
							<input type="text" placeholder="激活码" class="form-control" name="activeCode">
							<input type="button" name="activeUserAccount" class="btn btn-primary" value="激活">
						</section>
					</div>
				</div>
				<div class="activeSuccess" style="display:none;">
					<i class="fa fa-check-circle"></i> 激活成功 [到期时间延长至：<span id="memberEndTime">2015-09-01</span>]
					<a class="btn btn-primary return">返回</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.modal -->
<div class="modal fade" id="remoteModal" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel"
	 aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- content will be filled here from "ajax/modal-content/model-content-1.html" -->
		</div>
	</div>
</div>
<script type="text/javascript">
	if ($("div [rel=tooltip]").length) {
		$("div [rel=tooltip]").tooltip();
	}
	var tagData = JSON.parse('[]');
	var data = [];
	for (var i = 0; i < tagData.length; i++) {
		data.push([tagData[i].TagName, tagData[i].BizCount]);
	}
	loadScript(__uri("/xigua/js/xiguaji/highcharts.js"), function () {
		loadScript(__uri("/xigua/js/xiguaji/highcharts-3d.js"), function () {
			$('#hotbiz').highcharts({
				chart: {
					type: 'pie',
					options3d: {
						enabled: true,
						alpha: 45
					}
				},
				title: {
					text: '热门文章类型分布'
				},
				plotOptions: {
					pie: {
						innerSize: 100,
						depth: 45
					}
				},
				series: [{
					name: '热门文章公众号个数',
					data: data
				}]
			});
		});
	});

	$('a.historyReviewTitle').click(function () {
		var $detail = $(this).next('.historyReviewDetail');
		var $i = $(this).find('i');
		if ($i.hasClass('fa-angle-down')) {
			$detail.slideDown(200);
			$i.removeClass('fa-angle-down').addClass('fa-angle-up');
		}
		else {
			$detail.slideUp(200);
			$i.removeClass('fa-angle-up').addClass('fa-angle-down');
		}
	});
	$('a.activeAccount').click(function () {
		$('div.dynamicModel').show();
	});
	//激活用户
	$('input[name=activeUserAccount]').click(function () {
		var activeCode = $('input[name=activeCode]').val();
		if (activeCode == "") {
			$.smallBox({
				title: "提示",
				content: "<i class='fa fa-clock-o'></i> <i>请输入邀请码</i>",
				color: "#C46A69",
				iconSmall: "fa fa-times fa-2x fadeInRight animated",
				timeout: 3000
			});
			return;
		}
		$.getJSON('/Home/ActiveUser/?inviteCode=' + activeCode, function (result) {
			if (result.Status) {
				$('div.activeSuccess').show();
				$('div.activeBox').hide();
				$('div.activeBox').hide();
				$('div.activeWarning').hide();
				$('#memberEndTime').html(result.MemberEndTime);
				$('#memberEndTimeFor').html("到期时间：" + result.MemberEndTime);
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
	$('a.return').click(function () {
		$('#remoteModal').hide();
	});
	$('button.close').click(function () {
		$('#remoteModal').hide();
	});
	$("#remoteModal").on("hidden", function () {
		$(this).removeData("modal");
		$("#remoteModal div.modal-content").html('');
	});
	$("#remoteModal").on("hidden.bs.modal", function () {
		$(this).removeData("bs.modal");
		$("#remoteModal div.modal-content").html('');
	});
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
	BindOnceInfo();
</script>