class AddNotesToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :notes, :text
  end
end
