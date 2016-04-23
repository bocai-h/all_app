class AddColumnSettlements < ActiveRecord::Migration
  def change
    add_column :settlements,:pay_account,:string,:limit => 100,:after => :pay_bank
  end
end
