class Settlement < ActiveRecord::Base
  self.table_name = "settlements"

  def self.import_data file
    # 事务锁 必须全部完成 否则回回滚
    begin
      ActiveRecord::Base.transaction do
        spreadsheet = open_spreadsheet(file)
        if spreadsheet.nil?
          return "error"
        end
        # 分割符号
        head = spreadsheet.row(spreadsheet.first_row)[0]
        # 第一列的值为下列或者为nil或者列为head 忽略
        exclude = ["合计:","代扣税金:","扣税后合计:","经理：","业务号","手续费联动级别："]
        #清单内容
        list1 = {agent_name: "代理人/经纪人名称：",list_code: "清单编号：",agent_code: "代理人/经纪人代码：",agent_certif_code: "代理证号：",pay_bank: "收款银行：",money_type: "收款账号：",account_name: "账号名称：",money_type: "支付币种："}
        list2 = {print_date: "打印日期：",contract: "保单数量：",cost_tax: "代扣税金：",after_cost_tax_fee: "扣税后手续费金额："}
        list = list1.merge(list2)
        (spreadsheet.first_row..spreadsheet.last_row).each do |i|
          row = spreadsheet.row(i)
          unless (exclude.include?(row[0]) || (row.compact!).size == 0)
            if row[0].eql?(head)
              #开始一次详情
              settlement = Settlement.create();
              next
            end
            #全数字则为详细 否则则是总清单内容
            if row[0].to_i.to_s == row[0]
              #详细
              # 车牌号可能会没有 导致row[11]往后跳了一列
              # 如果不是车牌号的模式 则插入一个空的填充11
              unless row[11] =~ /^\p{Han}\w+$/u
                row[11,0] = [" "]
              end

              # 业务号是唯一的 如果检测到一个业务号相同就代表该文件已经被导入过了
              is_exist = SettlementDetail.where("service_code = '#{row[0]}'")
              if is_exist.present?
                raise "this templet is imported"
              end
              SettlementDetail.create(:settlement_id => self.last.id,:service_code => row[0],:insurance_name => row[1],
                                      :insurance_person => row[2],:insuranced_person => row[3],:money_type => row[4],
                                      :circle_time => row[5],:insurance_money => row[6],:actual_money => row[7],:handling_charge => row[8],
                                      :handling_charge_ratio => row[9],:start_date => row[10],:car_number => row[11],:service_department => row[12],
                                      :comment => row[13])
            elsif !row[0].eql?(head)
              #清单
              settlement = self.last
              list.each do |key,value|
                if row[0].index(value) || row[1].index(value)
                  if row[0].index(value)
                    settlement.send("#{key}=",row[0].delete(value))
                  else
                    settlement.send("#{key}=",row[1].delete(value))
                  end
                end
              end
              settlement.save
            end
          end
        end
      end
    rescue => e
        puts e.message, "\n"
    ensure
      return "error"
    end
  end

  private
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".xls" then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
    end
  end
end
