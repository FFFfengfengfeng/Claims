/* 
 * =====================================================
 * PlugName: Tab
 * =====================================================
 */
;(function($, window, document, undefined) {
    'use strict';
    
    //默认参数
    var defaults = {
        
    }
    
    /*
     * 构造函数
     * @param $element
     */
    function Tab(element, options) {
        this.$element = $(element);
        this.options = $.extend(defaults, options || {});
        this.init();
    }
    
    Tab.prototype.init = function() {
        var _this = this;
        
        _this.getElement();
        _this.event();
    }
    
    Tab.prototype.getElement = function() {
        var _this = this;
        
        _this.$tabNavElement = _this.$element.children('.tab-nav');
        _this.$tabNavItem = _this.$tabNavElement.find('.tab-nav-item');
        
        _this.$tabContentElement = _this.$element.children('.tab-content');
        _this.$tabContentItem = _this.$element.find('.tab-content-item');
    }
    
    Tab.prototype.event = function() {
        var _this = this;
        
        _this.$tabNavItem.on('click', function(e) {
            if (!$(this).hasClass('z-active')) {
                $(this).addClass('z-active').siblings().removeClass('z-active');
                
                var index = $(this).index();
                
                _this.changeContent(index);
            } else {
                return;
            }
        });
    }
    
    Tab.prototype.changeContent = function(index) {
        var _this = this;
        
        _this.$tabContentItem.eq(index).addClass('z-active').siblings().removeClass('z-active');
    }
    
    $.fn.tab = function(options) {
        var options = $.extend(defaults, options || {});
        
        return new Tab(this, options);
    }
    
})(jQuery, window, document, undefined);
