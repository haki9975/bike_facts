class DeleteTypeFromBikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :bikes, :type 
  end
end
