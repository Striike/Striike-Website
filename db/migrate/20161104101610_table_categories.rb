class TableCategories < ActiveRecord::Migration
  def change
    create_table :categories
    add_column :categories, :name, :string
    add_column :categories, :sub_id, :integer
  end
end
