class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :category

      t.timestamps
    end
  end
end
