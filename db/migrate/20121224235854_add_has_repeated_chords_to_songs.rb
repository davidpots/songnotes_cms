class AddHasRepeatedChordsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :repeated_chords, :boolean, default: false
  end
end
