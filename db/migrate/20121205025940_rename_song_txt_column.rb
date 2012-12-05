class RenameSongTxtColumn < ActiveRecord::Migration
  def change
    rename_column :songs, :song_txt, :lyrics_text
  end
end
