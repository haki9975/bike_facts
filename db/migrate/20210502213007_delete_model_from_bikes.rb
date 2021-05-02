class DeleteModelFromBikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :bikes, :model
  end
end
