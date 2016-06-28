function openModal(href){
    modalDialog = $("#linkModal");
    if(modalDialog.length == 0){
        modalDialog = buildModal();
        $('body').append(modalDialog);
    }
    modalDialog.modal({
        show: true,
        keyboard: true
    });
    if(href.indexOf('#') == 0){
        $(href).modal({
            show: true,
            keyboard: true,
            backdrop: 'static'
        });
    }else{
        //href += href.indexOf("?") > 0 ? "&_dom_id=null" : "?_dom_id=null"
        modalDialog.load(href, function(){
            //$('form', modalDialog).each(function(){
            //    var $form = $(this),
            //        $action = $form.attr("action");
            //    $action += $action.indexOf("?") > 0 ? "&_dom_id=linkModal" : "?_dom_id=linkModal";
            //    $form.data("remote", true);
            //    $form.attr("action", $action);
            //});
        });
        //$.ajax({
        //    type: "get",
        //    url: href,
        //    contentType: "text/html",
        //    async:false,
        //    success: function(data){
        //        modalDialog.html(data);
        //    }
        //})
    }
}

function buildModal(){
   var frame = '<div class="modal fade" id="linkModal" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="my_modal_label">' +
                  '<div class="modal-dialog" aria-hidden="true">' +
                    '<div class="modal-content">' +
                      '<div class="modal-header">' +
                          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h3></h3></div><div class="modal-body">' +
                      '</div>' +
                      '<div class="modal-footer">' +
                      '</div>' +
                     '</div>' +
                    '</div>' +
                  '</div>'
   return $(frame);
}

$(document).ready(function(){
    $("a[rel=modal]").on("click",function(e){
        e.preventDefault();
        var href = $(this).attr('href');

        openModal(href);
    });
});
