class RemoveDescriptionFromBikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :bikes, :description
  end
end
