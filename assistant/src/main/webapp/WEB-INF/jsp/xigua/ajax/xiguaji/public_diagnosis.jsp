<div class="diagnose">
	<ul class="diagnoseNav list-unstyled">
		<li><a class="current">公众号诊断</a></li>
		<li><a href="#/Diagnosis/History">诊断历史</a></li>
	</ul>
	<div class="diagnoseSearch">
		<input id="diagnoseSearchKey" type="text" placeholder="请输入需要诊断的公众号名称/微信ID/文章链接地址" class="form-control">
		<button class="diagnoseSearchBtn" id="diagnoseSearchBtn"><i class="fa fa-fw fa-lg fa-search"></i></button>
	</div>
	<div class="diagnoseWelcome clearfix">
		<h3>为您提供最专业的公众号运营质量分析</h3>
		<dl>
			<dt><i class="fa fa-users"></i></dt>
			<dd><strong>活跃粉丝预估</strong>快速了解公众号活跃粉丝数</dd>
		</dl>
		<dl>
			<dt><i class="fa fa-clock-o"></i></dt>
			<dd><strong>发文习惯分析</strong>掌握公众号发文内容偏好和习惯</dd>
		</dl>
		<dl>
			<dt><i class="fa fa-bug"></i></dt>
			<dd><strong>违规文章检测</strong>检测近期文章违规情况，让公众号运营更安全</dd>
		</dl>
		<dl>
			<dt><i class="fa fa-diamond"></i></dt>
			<dd><strong>流量收益预估</strong>了解流量主最佳收入，提供流量主收入优化建议</dd>
		</dl>
	</div>
	<div id="mBizSearchResult"></div>
</div>

	<div class="modal fade" id="remoteModal">
		<div class="modal-dialog">
			<div class="modal-content">
			</div>
		</div>
	</div>

	<script type="text/javascript">
		pageSetUp();

		$("#remoteModal").on("hidden", function () {
			$(this).removeData("modal");
			$("#remoteModal div.modal-content").html('');
		});
		$("#remoteModal").on("hidden.bs.modal", function () {
			$(this).removeData("bs.modal");
			$("#remoteModal div.modal-content").html('');
		});

		$('#diagnoseSearchBtn').click(function () {
			showLoading();
			var key = $("#diagnoseSearchKey").val();
			var url = '/Diagnosis/Search/?key=' + encodeURIComponent(key);
			$('#mBizSearchResult').load(url, function () {
				$('.diagnoseWelcome').hide();
				hideLoading();
			});
			return false;
		});

		$('#diagnoseSearchKey').keyup(function (evt) {
			if (evt.keyCode == 13) {
				$('#diagnoseSearchBtn').click();
			}
		});

	</script>
