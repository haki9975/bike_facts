class CreateUserbikes < ActiveRecord::Migration[6.1]
  def change
    create_table :userbikes do |t|
      t.string :name
      t.string :serial_number
      t.string :notes
      t.belongs_to :user, null: false, foreign_key: true 
      t.belongs_to :bike, null: false, foreign_key: true
      t.timestamps
    end
  end
end
