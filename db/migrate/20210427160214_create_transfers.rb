class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|

      t.timestamps
    end
  end
end
