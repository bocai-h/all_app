module ApplicationHelper
  def link_modal(text, options={},html_options={:modal_title=> "The missing modal title."})
    link_to text, options, html_options.merge({:rel => "modal"})
  end
end
