$(function(){
    mask_ajax();
});

//在每次ajax执行时为页面加上遮照层
function mask_ajax(){
    var message = '<span><img src="/assets/ajax_flash.gif" />&nbsp;&nbsp;&nbsp;处理中...</span>';
    //event: 包含event对象,xhr: 包含XMLHttpRequest对象,ajax_options: 包含AJAX请求中使用的选项
    $(document).ajaxSend(function(event,xhr,ajax_options){
        $("body").block({ message: message,
                        css: {
                           backgroundColor: '#ffffff',
                           color: '#000000',
                           padding:	'15px',
                           'margin-top': '-80px',
                           left: "43%",
                           width:	'200px',
                           opacity:	0.9,
                           '-webkit-border-radius':'10px',
                           '-moz-border-radius':	'10px',
                           'border-radius':		'10px'
                        }
                       });
    });

    $(document).ajaxComplete(function(){
        $("body").unblock();
    });
}