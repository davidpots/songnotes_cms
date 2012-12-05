class RemoveLyricsFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :lyrics
  end

  def down
    add_column :songs, :lyrics, :text
  end
end
