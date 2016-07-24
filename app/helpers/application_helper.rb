module ApplicationHelper
  def full_title page_title
    base_title = "All app"
    if page_title.blank?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def link_modal(text, options={},html_options={:modal_title=> "The missing modal title."})
    link_to text, options, html_options.merge({:rel => "modal"})
  end

  def show_infomation
   # 全局消息显示
    if flash[:warning].present?
       style = "alert-danger"
       info_header = "Warning"
       status = "show"
       notice = flash[:warning]
    end

    if flash[:success].present?
      style = "alert-success"
      info_header = "Success"
      status = "show"
      notice = flash[:success]
    end

    if status == "show"
      info = %Q(<div class="alert #{style} alert-dismissible" role="alert">
               <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
               <strong>#{info_header}!</strong>#{notice}.
               </div>)
      info.html_safe
    else
      ""
    end
  end
end
