class SettlementDetail < ActiveRecord::Base
  self.table_name = "settlement_details"
  belongs_to :settlement, foreign_key: "settlement_id"

  validates_presence_of :settlement_id

  scope :person_statistics,-> {
    select("insurance_person,sum(actual_money) total_money,sum(handling_charge_ratio) total_handling_ratio")
    .group("insurance_person")
  }
end
