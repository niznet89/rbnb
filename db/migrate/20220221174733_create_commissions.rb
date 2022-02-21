class CreateCommissions < ActiveRecord::Migration[6.1]
  def change
    create_table :commissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :art_description
      t.integer :art_price

      t.timestamps
    end
  end
end
