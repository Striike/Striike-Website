class AddCategoryToSites < ActiveRecord::Migration
  def change
    add_column :sites, :category_id, :integer
    add_index :sites, :category_id
  end
end
