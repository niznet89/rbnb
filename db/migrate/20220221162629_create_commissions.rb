class CreateCommissions < ActiveRecord::Migration[6.1]
  def change
    create_table :commissions do |t|

      t.timestamps
    end
  end
end
