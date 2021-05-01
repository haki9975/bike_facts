class ChangeServiceRecords < ActiveRecord::Migration[6.1]
  def change
    change_column :service_records, :date, :date 
  end
end
