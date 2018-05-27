$(function() {
    $('.form').submit(function(e) {
        e.preventDefault();
        var form = $(this);
        $.ajax({
            type: "post",
            url: form.attr('action'),
            data: form.serialize(),
            dataType: "json",
            success: function (response) {
                
            }
        });
    });
});