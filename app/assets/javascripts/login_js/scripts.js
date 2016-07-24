
jQuery(document).ready(function() {
    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form,.sign-up-form').on('submit', function(e) {
    	
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    //验证邮箱是否已经被注册过了
    $(".sign-up-form #form-username").change(function(){
        $.ajax({
            url: "email_validate",
            type: "GET",
            data: { email: this.value,_dom_id: "form-container" },
            dataType: "json",
            success: function(result){
                if(!result){
                   $(".sign-up-form #form-username").addClass('input-error');
                   $("#notice").html(alert_msg());
                }else{
                   $(".sign-up-form #form-username").removeClass('input-error');
                }
            }
        });
    });
});

function alert_msg(){
    var info = "<div class='alert alert-warning alert-dismissible' role='alert'>" +
               "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>" +
               "<strong>Warning!</strong>邮箱已被注册</div>";

    return info;
}
