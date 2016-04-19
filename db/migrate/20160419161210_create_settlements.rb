class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.string :agent_name,:limit => 30                    #经纪人/代理人名称
      t.string :agent_code,:limit => 100                   #经纪人代码
      t.string :list_code,:limit => 100                    #清单编号
      t.string :agent_certif_code,:limit => 100           #代理证件号
      t.string :account_name,:limit => 50                  #帐号名称
      t.string :money_type, :limit => 20                   #支付币种
      t.string :print_date, :limit => 30                   #打印日期
      t.string :contract, :limit => 3                      #保单数量
      t.string :cost_tax, :limit => 20                     #代扣税金
      t.string :after_cost_tax_fee, :limit => 20          #扣税后手续费金额
      t.timestamps null: false
    end
    change_column :settlements, :id, :string, :limit => 36, :collate => "utf8_bin"
  end
end
