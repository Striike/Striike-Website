class TableForm < ActiveRecord::Migration
  def change
    create_table :infos
    add_column :infos, :prenom, :string
    add_column :infos, :nom, :string
    add_column :infos, :mail, :string
    add_column :infos, :tel, :string
    add_column :infos, :addresse, :string
    add_column :infos, :code_p, :string
    add_column :infos, :inter_digi, :string
    add_column :infos, :code_promo, :string
    add_column :infos, :promo, :integer
  end
end
