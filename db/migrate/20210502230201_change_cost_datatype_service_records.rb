class ChangeCostDatatypeServiceRecords < ActiveRecord::Migration[6.1]
  def change
    change_column :service_records, :cost, :decimal, precision: 5, scale: 2
  end
end
