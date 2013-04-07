class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :artist_id
      t.string :label
      t.integer :year
      t.string :image_url
      t.string :url_wikipedia
      t.string :url_rdio

      t.timestamps
    end
  end
end
