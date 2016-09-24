module ChannelsHelper
  def number_list
    1.upto(50).collect{|n| [n,n]}
  end
end
