class CreateArtwork < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
        t.string :title, null: false
        t.string :image_url, null: false
        t.integer :artist_id, null: false
        t.timestamps
    end
    add_index :artworks, [:artist_id, :title], unique: true
    add_index :artworks, :artist_id
    add_index :artworks, :image_url, unique: true

    create_table :artwork_shares do |t|
        t.integer :artwork_id, null: false
        t.integer :viewer_id, null: false
        t.timestamps
    end
    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :viewer_id
  end
end
