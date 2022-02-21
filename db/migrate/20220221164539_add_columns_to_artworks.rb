class AddColumnsToArtworks < ActiveRecord::Migration[6.1]
  def change
    add_reference :artworks, :users, null: false, foreign_key: true
    add_column :artworks, :title, :string
    add_column :artworks, :category, :string
  end
end
