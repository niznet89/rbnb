class AddColumnsToCommissions < ActiveRecord::Migration[6.1]
  def change
    add_reference :commissions, :users, null: false, foreign_key: true
    add_column :commissions, :art_description, :string
    add_column :commissions, :art_price, :integer
    add_reference :commissions, :services, null: false, foreign_key: true
  end
end
