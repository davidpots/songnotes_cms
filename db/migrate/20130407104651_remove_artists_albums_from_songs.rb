class RemoveArtistsAlbumsFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :album
    remove_column :songs, :artist
  end

  def down
    add_column :songs, :album, :string
    add_column :songs, :artist, :string
  end
end
