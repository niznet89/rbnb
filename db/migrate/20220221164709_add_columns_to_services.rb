class AddColumnsToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :name, :string
    add_column :services, :category, :string
    add_column :services, :price, :integer
    add_reference :services, :users, null: false, foreign_key: true
  end
end
