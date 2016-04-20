class AddColumnSettlement < ActiveRecord::Migration
  def change
    add_column :settlements,:pay_bank,:string,:limit => 80,:after => :agent_certif_code
  end
end
