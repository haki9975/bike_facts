class CreateServiceRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :service_records do |t|
      t.string :name
      t.string :date
      t.integer :cost
      t.string :notes
      t.timestamps
    end
  end
end
