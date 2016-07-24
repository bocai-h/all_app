$(function(){
    mask_ajax();
});

//在每次ajax执行时为页面加上遮照层
function mask_ajax(){
    var message = '<span><img src="/assets/ajax_flash.gif" />&nbsp;&nbsp;&nbsp;处理中...</span>';
    var ajax_style_setting = {
        message: message,
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
    };
    var block_dom = "";
    //event: 包含event对象,xhr: 包含XMLHttpRequest对象,ajax_options: 包含AJAX请求中使用的选项
    $(document).ajaxSend(function(event,xhr,ajax_options){
        var dom_id = get_dom_id(ajax_options);
        if(dom_id != 'undefined' && dom_id != null && dom_id.length > 0){
            block_dom = "#" + dom_id;
        }else{
            block_dom = "body";
        }
        console.log($(block_dom));
        $(block_dom).block(ajax_style_setting);
    });
    $(document).ajaxComplete(function(){
        $(block_dom).unblock();
    });
}

//从ajax选项中获取dom_id
function get_dom_id(ajax_options){
    return getAjaxParams(ajax_options,"_dom_id");
}

//从ajax选项获取相应的参数名
function getAjaxParams(ajax_options,param_name){
   // 会从url和data中去找到param_name的值
   var url = ajax_options.url || "";
   var data = ajax_options.data || "";

    if(url.indexOf("?") > -1){
        url = url.substring(url.indexOf("?") + 1,url.length)
    }else{
        url = ""
    }
    //提取param_name数据
   return $.extend({},$.deserialize(url),$.deserialize(data))[param_name]
}