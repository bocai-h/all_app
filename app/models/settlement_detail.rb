class SettlementDetail < ActiveRecord::Base
  self.table_name = "settlement_details"

  validates_presence_of :settlement_id
end
