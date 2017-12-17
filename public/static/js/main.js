
/*
 * ================================================================
 * toast提示框
 * @param {type}     String 提示类型 'success' || 'error'
 * @param {message}  String 提示信息
 * @param {duration} Number 停留时长
 * ================================================================
 */
+ function (window, $) {
    'use strict';

    /*
     * 默认参数
     */
    var defaults = {
        type: 'success',
        message: '打开了',
        duration: 1000,
    };

    /*
     * 构造函数
     * @param options
     */
    function Toast(options) {
        this.options = $.extend(defaults, options || {});
        this.init();
    }

    Toast.prototype.init = function () {
        var _this = this;

        _this.$body = $('body');
        _this.createDOM();
    }

    Toast.prototype.createDOM = function () {
        var _this   = this,
            options = _this.options,
            type    = options.type,
            message = options.message,
            $body   = $('body');

        _this.$toast = $('<div class="toast ' + type + ' clearfix"><p >' + message + '</p><a href="javascript:;" class="fa fa-close"></a></div>');

        _this.$body.append(_this.$toast);
    }

    Toast.prototype.show = function () {
        var _this = this;

        _this.$toast.addClass('show in');
    }

    Toast.prototype.hide = function () {
        var _this    = this,
            options  = _this.options,
            duration = options.duration;

        _this.$toast.removeClass('show in');

        setTimeout(function () {
            _this.remove();
        }, duration);
    }

    Toast.prototype.remove = function () {
        var _this = this;

        _this.$toast.remove();
    }
    $.extend({
        toast: function (options) {
            var toast = new Toast(options);

            toast.show();

            var duration = options.duration || 1000;

            setTimeout(function () {
                toast.hide();
            }, duration);
        }
    });
}(window, jQuery);