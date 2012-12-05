class AddRawTextColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_txt, :text
  end
end
