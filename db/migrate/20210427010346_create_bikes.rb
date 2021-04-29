class CreateBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :model
      t.string :type
      t.string :description
      t.timestamps
    end
  end
end
