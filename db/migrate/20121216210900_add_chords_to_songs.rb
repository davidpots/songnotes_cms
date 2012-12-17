class AddChordsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :chords, :text
  end
end
