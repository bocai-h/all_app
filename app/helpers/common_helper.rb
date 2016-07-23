module CommonHelper
  # 激活header中导航条的位置
  def active_header_nav
    href = url_for({:controller => params[:controller],:action => params[:action]})
    exec_js = %Q(<script>
               $(function(){
                  $(".navbar-nav .active").removeClass("active");
                  $("a[href='#{href}']").parent().addClass("active");
               })
              </script>)

     # 由于内容都是系统中解析出来的路由 所有不必要考虑安全性问题
     exec_js.html_safe
  end
end
