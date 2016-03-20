module Fwk::CustomId
  def self.included(base)
    base.class_eval do
      before_create :setup_custom_id

      private
      def setup_custom_id
        binding.pry
        id_column = self.class.columns.detect{|i| i.primary}
        if id_column&&id_column.type.eql?(:string)&&id_column.limit> 35
          self.id = UUID.new.generate
        end
      end
    end
  end
end
