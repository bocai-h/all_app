class SettlementDetail < ActiveRecord::Base
  self.table_name = "settlement_details"
  belongs_to :settlement, foreign_key: "settlement_id"

  validates_presence_of :settlement_id
end
