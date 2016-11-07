class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :image
      t.integer :min_price
      t.integer :max_price
      t.string :time
      t.text :def

      t.timestamps null: false
    end
  end
end
