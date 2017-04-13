/* 
 * =====================================================
 * PlugName: Tab
 * =====================================================
 */
;(function($, window, document, undefined) {
	'use strict';
	//默认参数
	var defaults = {
		effect: '',
	};
	
	function Tab($ele, options) {
		this.$ele       = $ele;
		this.options    = options = $.extend(defaults, options || {});
		this.$btn       = $ele.find('.tab-btn');
		this.$highlight = null;
		this.recordBtnData();
		this.init();
		this.bindEvent();
	};
	
	Tab.prototype.init = function() {
		if (this.options.effect === 'slide') {
			this.$ele.find('.tab-text').css({
				'border-bottom': 'none'
			});
			var offsetInfo  = this.$ele.find('.tab-btn.tab-btn_active').data('offsetInfo');
			this.$ele.find('.tab-nav').append("<div class='tab-highlight' style='transform: translate3d(" 
							+ offsetInfo.positionLeft + "px, 0, 0); -webkit-transform: translate3d("
							+ offsetInfo.positionLeft + "px, 0, 0); width: "
							+ offsetInfo.innerWidth + "px;'></div>");
			this.$highlight = this.$ele.find('.tab-highlight');
		}
	}
	
	Tab.prototype.bindEvent = function() {
		var self = this;
		$(document).on('click', '.tab-btn', function(e) {
			e.preventDefault();
			var $this = $(this),
				$target = $($(this).attr('href'));
			if ($this.hasClass('tab-btn_active')) {
				return;
			}
			$this.siblings().removeClass('tab-btn_active');
			$target.siblings().removeClass('tab-panel_active');
			$(this).addClass('tab-btn_active');
			$target.addClass('tab-panel_active');
			if (self.options.effect === 'slide') {
				self.highlightChange($(this).data('offsetInfo'));
			}
		});
	}
	
	Tab.prototype.recordBtnData = function() {
		this.$btn.each(function() {
			var data          = {};
			data.positionLeft = $(this).find('.tab-text').position().left;
			data.innerWidth   = $(this).find('.tab-text').width();
			$(this).data('offsetInfo', data);
		});
	};
	
	Tab.prototype.highlightChange = function(data) {
		this.$highlight.css({
			'transform': 'translate3d(' + data.positionLeft + 'px, 0, 0)',
			'-webkit-transform': 'translate3d(' + data.positionLeft + 'px, 0, 0)',
			'width': data.innerWidth + 'px'
		});
	}
	
	$.fn.tab = function(options) {
		var options = $.extend(defaults, options || {});
		
		return new Tab($(this), options);
	};
	
})(jQuery, window, document, undefined);
