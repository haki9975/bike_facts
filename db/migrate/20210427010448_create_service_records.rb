class CreateServiceRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :service_records do |t|
      t.string :name
      t.string :date
      t.integer :cost
      t.string :notes
      t.belongs_to :userbike, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
