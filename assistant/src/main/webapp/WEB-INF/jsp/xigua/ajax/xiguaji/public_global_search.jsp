<div class="mpAccountWellcome">
	<div class="mpAccountSearch">
		<input type="text" placeholder="请输入公众号名称" class="form-control search">
		<button class="mpAccountSearchBtn"><i class="fa fa-fw fa-lg fa-search"></i></button>
	</div>
	<div class="mpAccountRec">
		<div class="mpAccountRecTitle"><i class="fa fa-random"></i> <span style="color:red">推荐！点击下方标签直接看看大家都在关注的哪些公众号</span></div>
		<div class="mpTagsSelector">
			<a data-realid="35">情感励志</a>
			<a data-realid="33">女人时尚</a>
			<a data-realid="27">搞笑趣闻</a>
			<a data-realid="26">资讯</a>
			<a data-realid="1443">财经</a>
			<a data-realid="1500">运动</a>
			<a data-realid="97">旅游</a>
			<a data-realid="28">汽车</a>
			<a data-realid="29">健康</a>
			<a data-realid="32">餐饮美食</a>
			<a data-realid="34">职场教育</a>
			<a data-realid="30">数码科技</a>
			<a data-realid="31">影音娱乐</a>
			<a data-realid="36">母婴</a>
			<a data-realid="1434">生活</a>
			<a data-realid="128">房产家居</a>
			<a data-realid="37">地方</a>
			<a data-realid="38">其它</a>
		</div>
	</div>
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
		loadScript(__uri("/xigua/js/xiguaji/jquery.masonry.min.js"), function () {
			$('div.masonryContainer section.col-md-6').each(function () {
				$(this).css('width', $(this).width() + 'px');
			});
			//瀑布流布局列表
			$('div.masonryContainer').masonry(
					{
						itemSelector: 'section.col-md-6',
						animate: true,
						gutterWidth: 5
					});
		});
		$('input.search').keyup(function (evt) {
			if (evt.keyCode == 13) {
				$(this).next('button').click();
			}
		});
		//搜索公众号
		$('button.mpAccountSearchBtn').click(function () {
			var keyword = $(this).prev('input').val();
			if (keyword == '')
				return;
			var urlParttern = '/MyMBiz/MBizSearch/?partial=0&keyword=' + encodeURIComponent(keyword) + '&rnd=' + Math.random()*1000;
			window.location.hash = urlParttern;
		});

		//选择标签
		$('div.mpTagsSelector a').click(function () {
			var urlParttern = '/MyMBiz/MBizSearch/?partial=0&tagId=' + $(this).attr('data-realid') + '&tagName=' + encodeURIComponent($(this).text());
			window.location.hash = urlParttern;
		});
		$("#remoteModal").on("hidden", function () {
			$(this).removeData("modal");
		});
		$("#remoteModal").on("hidden.bs.modal", function () {
			$(this).removeData("bs.modal");
		});
		//已收藏的按钮添加取消收藏事件
		$('div.mpAccountListFull a.btnAdd').click(function () {
			var $this = $(this);
			var bizId = $this.attr('data-id');
			if ($this.hasClass('active')) {
				$.getJSON('/MyMBiz/Delete/?mBizId=' + bizId, function (result) {
					if (result.Status) {
						$this.removeClass("active").html('<i class="fa fa-plus"></i>关注');
					}
					else {
						$.smallBox({
							title: "取消关注失败",
							content: "<i class='fa fa-clock-o'></i> <i>取消关注失败</i>",
							color: "#C46A69",
							iconSmall: "fa fa-times fa-2x fadeInRight animated",
							timeout: 3000
						});
					}
				});
				return false;
			}
		});
		$('#btnShowMoreTag').click(function () {
			if ($(this).hasClass('active')){
				$(this).removeClass('active');
				$('#divMoreTags').slideUp(300);
			}
			else{
				$(this).addClass('active');
				$('#divMoreTags').slideDown(300);
			}
		});
		var page = 0;
		var retryNumber = 0;
		$('#btnLoadMore').click(function () {
			showLoading();
			page++;
			if (page > 10) {
				$('#btnLoadMore').html('只显示匹配到的前10页公众号，请调整您的关键字进行精确匹配');
				hideLoading();
				return false;
			}
			var url = '/MyMBiz/MBizAsyncSearch/?page=' + page + '&keyword=' + encodeURIComponent($('input.search').val());
			$.get(url, function (result) {
				if (result == 'error') {
					page--;
					setTimeout(function () {
						retryNumber++;
						if (retryNumber <= 10) {
							$('#btnLoadMore').click();  //重试
						}
						else {
							$('#divBizList').html('<div class="text-center">搜索超时！ 矮油，老鼠又啃到服务器网线了，请重新发起搜索。</div>');
							hideLoading();
						}

					}, 3000);
				}
				else if (result == '') {
					$('#btnLoadMore').html('<div class="text-center"><a href="http://weixin.sogou.com/" target="_blank" rel="noreferrer">未搜索到相关公众号，请到搜狗微信搜索中检索公众号。</a></div>').unbind('click').attr('disabled', 'disabled');
					hideLoading();
					$('div.mpAccountResultHead').show();
					$('#btnLoadMore').show();
				}
				else {
					$('#divBizList').append(result);
					hideLoading();
					$('div.mpAccountResultHead').show();
					$('#btnLoadMore').show();
				}
			});
		});
		if ($('input.search').val() != '') {
			$('#btnLoadMore').click();
		}
	</script>