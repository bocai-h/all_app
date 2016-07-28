require 'rails_helper'
module Helpers
  # def full_title page_title
  #   base_title = "All app"
  #   if page_title.blank?
  #     base_title
  #   else
  #     "#{base_title} | #{page_title}"
  #   end
  # end
  # 由于在rails_helper中加载了整个rails环境 所以可以直接使用ApplicationHelper
  include ApplicationHelper
end
