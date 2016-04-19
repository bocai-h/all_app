class CreateSettlementDetails < ActiveRecord::Migration
  def change
    create_table :settlement_details do |t|
      t.string :settlement_id,:limit => 36, :null => false              #结算清单
      t.string :service_code,:limit => 100                               #业务号
      t.string :car_number,:limit => 50,:collate => "utf8_bin"         #车牌号码
      t.string :insurance_name,:limit => 50                             #险种名称
      t.string :insurance_person, :limit => 50                          #投保人
      t.string :insuranced_person, :limit => 50                        #被保险人
      t.string :money_type,:limit => 10                                 #保单币种
      t.string :circle_time,:limit => 5                                 #缴费期数
      t.string :insurance_money,:limit => 20                            #签单保费
      t.string :actual_money,:limit => 20                              #实收保费
      t.string :handling_charge,:limit => 20                           #手续费
      t.string :handling_charge_ratio,:limit => 5                     #手续费比例
      t.string :start_date,:limit => 20                                #起保日期
      t.string :service_department,:limit => 200                      #业务部门
      t.string :comment, :limit => 500                                 #备注
      t.timestamps null: false
    end
    change_column :settlement_details,:id,:string,:limit => 36,:collate => "utf8_bin"
  end
end
