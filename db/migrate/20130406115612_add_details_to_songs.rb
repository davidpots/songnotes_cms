class AddDetailsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :artist_id, :integer
    add_column :songs, :album_id, :integer
    add_column :songs, :lyrics_raw, :text
    add_column :songs, :lyrics_signature, :text
    add_column :songs, :key, :string
    add_column :songs, :url_wikipedia, :string
    add_column :songs, :url_youtube_official, :string
    add_column :songs, :url_rdio, :string
  end
end
